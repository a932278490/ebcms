<?php
namespace Admin\Controller;
class DatabaseController extends CommonController {

	public function showsql(){
		if (IS_GET) {
			$filename = I('filename');
			$filename  = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . $filename;
			if (!is_file($filename)) {
				$this -> error('文件不存在！');
			}
			$ext = pathinfo($filename, PATHINFO_EXTENSION);
			if($ext == 'gz'){
				$gz   = gzopen($filename, 'r');
			} else {
				$gz   = fopen($filename, 'r');
			}
			$sql  = '';
			for($i = 0; $i < 70; $i++){
				$sql .= ($ext == 'gz') ? gzgets($gz) : fgets($gz); 
				if (($ext == 'gz') ? gzeof($gz) : feof($gz)) {
					break;
				}
			}
			if (($ext == 'gz') ? !gzeof($gz) : !feof($gz)) {
				$sql .="\r\n<p class='text-danger'>后面还有更多内容，若需要请下载到本地查看</p>";
			}
			$this -> sql = $sql;
			$this -> filename = str_replace(array('./','//'), array('/','/'), __ROOT__.C('DATA_BACKUP_PATH').'/'.basename($filename));
			$this -> success($this -> fetch(I('tpl')));
		}
	}

	// 还原数据库
	public function imports(){
		$backup_config = array(
			'path'     => realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR,
			'part'     => C('DATA_BACKUP_PART_SIZE'),
			'compress' => C('DATA_BACKUP_COMPRESS'),
			'level'    => C('DATA_BACKUP_COMPRESS_LEVEL'),
		);
		$lock = $backup_config['path'].'backup.lock';
		if (IS_GET) {
			$filename  = $backup_config['path'] . I('filetime').'-*.sql*';
			$files = glob($filename);
			$list = array();
			foreach($files as $name){
				$basename = basename($name);
				$match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
				$list[$match[6]] = $basename;
			}
			ksort($list);
			$count = count($list);
			end($list);
			session('backup_list',$list);
			$this -> backup_list = $list;
			$this ->success($this -> fetch());
		}elseif (IS_POST) {
			$input = I();
			if (C('AUTH_CONFIG.AUTH_TYPE') != 2) {
				unlink($lock);
				$this -> error('对不起，此操作只允许在认证类型为2的情况下操作！');
			}
			if ($input['init']) {
				if (!is_file($lock)) {
					file_put_contents($lock, NOW_TIME);
				}else{
					$this -> error("检测到有一个还原进程正在执行，请稍后再试！若有必要，可手动删除锁定文件：{$lock}");
				}
				$filename  = $backup_config['path'] . I('filetime').'-*.sql*';
				$files = glob($filename);
				$list = array();
				foreach($files as $name){
					$basename = basename($name);
					$match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
					$list[$match[6]] = $basename;
				}
				ksort($list);
				$count = count($list);
				end($list);
				if (!$count || $count != key($list)) {
					unlink($lock);
					session('backup_list',null);
					$this -> error('备份文件可能已经损坏，请检查！');
				}
				if ($list != session('backup_list')) {
					unlink($lock);
					session('backup_list',null);
					$this -> error('文件可能有改动！请稍后再试');
				}
				session('backup_list', $list);
				$this -> success(array('part'=>1,'start'=>0,'initend'=>1));
			}else{
				if (!is_file($lock)) {
					$this -> error('操作错误：还原锁定文件丢失！');
				}
				$list  = session('backup_list');
				if (!$list) {
					unlink($lock);
					$this->error('没有检测到需要还原的数据！请从新提交！');
				}
				$part = I('part');
				$start = I('start');
				$backup_config['compress'] = (pathinfo($list[$part], PATHINFO_EXTENSION)=='sql')?0:1;
				$db = new \Common\Vendor\Database($list[$part], $backup_config);
				$start = $db->import($start);
				if(false === $start){
					unlink($lock);
					$this->error('还原数据出错！');
				} elseif(0 === $start) { //下一卷
					$part = $part+1;
					if(isset($list[$part])){
						$data = array('part' => $part, 'start' => 0, 'rate'=>0);
						$this->success($data);
					} else {
						unlink($lock);
						session('backup_list', null);
						$data = array('part' => $part, 'start' => -1, 'rate'=>0);
						$this->success($data);
					}
				} else {
					if($start[1]){
						$data = array('part' => $part, 'start' => $start[0],'rate'=>floor(100 * ($start[0] / $start[1])));
						$this->success($data);
					} else {
						$data = array('part' => $part, 'start' => $start[0],'rate'=>0);
						$this->success($data);
					}
				}
			}
		}
	}

	// 删除备份数据
	public function delete(){
		if (IS_POST) {
			$pattern = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . I('time') . '-*.'.I('ext');
			$list = glob($pattern);
			if (count($list) != I('parts')) {
				$this -> error('数据校验失败！');
			}
			foreach ($list as $key => $value) {
				@unlink($value);
			}
			$this -> success('删除成功！');
		}
	}

	// 优化表
	public function optimize(){
		if (IS_POST) {
			$tables = I('table');
			if($tables) {
				$Db   = \Think\Db::getInstance();
				if(is_array($tables)){
					$tables = implode('`,`', $tables);
					$list = $Db->query('OPTIMIZE TABLE `'.$tables.'`');
					if($list){
						$this->success('数据表优化完成！');
					} else {
						$this->error('数据表优化出错请重试！');
					}
				} else {
					$list = $Db->query('OPTIMIZE TABLE '.$tables);
					if($list){
						$this->success('数据表'.$tables.'优化完成！');
					} else {
						$this->error('数据表'.$tables.'优化出错请重试！');
					}
				}
			} else {
				$this->error('请指定要优化的表！');
			}
		}
	}

	// 修复表
	public function repair(){
		if (IS_POST) {
			$tables = I('table');
			if($tables) {
				$Db   = \Think\Db::getInstance();
				if(is_array($tables)){
					$tables = implode('`,`', $tables);
					$list = $Db->query('REPAIR TABLE `'.$tables.'`');
					if($list){
						$this->success('数据表修复完成！');
					} else {
						$this->error('数据表修复出错请重试！');
					}
				} else {
					$list = $Db->query('REPAIR TABLE '.$tables);
					if($list){
						$this->success('数据表'.$tables.'修复完成！');
					} else {
						$this->error('数据表'.$tables.'修复出错请重试！');
					}
				}
			} else {
				$this->error('请指定要修复的表！');
			}
		}
	}

	// 查看创建信息
	public function showcreate(){
		if (IS_POST) {
			$table = I('table');
			$Db   = \Think\Db::getInstance();
			$data = $Db->query("SHOW CREATE TABLE `{$table}`");
			$result = array(
				'table'=>$data[0]['Table'],
				'tableinfo'=>$data[0]['Create Table'],
				);
			$this -> success($result);
		}
	}

	// 备份数据库
	public function exports(){
		$backup_config = array(
			'path'     => realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR,
			'part'     => C('DATA_BACKUP_PART_SIZE'),
			'compress' => C('DATA_BACKUP_COMPRESS'),
			'level'    => C('DATA_BACKUP_COMPRESS_LEVEL'),
		);
		$lock = $backup_config['path'].'backup.lock';
		if (IS_GET) {
			$tables = I('tables');
			if(!is_dir($backup_config['path'])){
				mkdir($backup_config['path'], 0755, true);
			}
			if (!is_writeable($backup_config['path'])) {
				echo '备份目录不存在或不可写，请检查后重试！';die();
			}
			if (is_array($tables)) {
				$this -> tables = $tables;
				session('backup_tables',$tables);
				$this -> success($this -> fetch(I('tpl')));
			}else{
				echo '参数错误！';die();
			}
		}elseif (IS_POST) {
			$step = I('step',0,'intval');
			// if (C('USER_AUTH_TYPE') != 1) {
			// 	unlink($lock);
			// 	$this -> error('对不起，此操作只允许在认证类型为1的情况下操作！');
			// }
			switch ($step) {
				//检查是否有正在执行的备份任务
				case 0:
					if (!session('backup_tables')) {
						$this->error('没有检测到需要备份的数据库表！请从新提交！');
					}
					if(is_file($lock)){
						$this->error("检测到有一个备份任务正在执行，请稍后再试！若有必要，可手动删除锁定文件：{$lock}");
					} else {
						//创建锁文件
						file_put_contents($lock, NOW_TIME);
						session('backup_step',$step+1);
						$this -> success(array('step'=>$step+1));
					}
					break;

				// 创建备份文件
				case 1:
					if(!is_file($lock)){
						$this->error('操作错误：备份锁定文件丢失！');
					}
					if (session('backup_step') != $step) {
						unlink($lock);
						session('backup_step',null);
						$this->error('步骤错误！');
					}
					//生成备份文件信息
					$file = array(
						'name' => date('Ymd-His', NOW_TIME),
						'part' => 1,
					);
					session('backup_file', $file);

					//创建备份文件
					$Database = new \Common\Vendor\Database($file, $backup_config);
					if(false !== $Database->create()){
						session('backup_step',$step+1);
						$tables = session('backup_tables');
						$table = array_shift($tables);
						session('backup_tables',$tables);
						$this->success(array('step'=>$step+1,'table'=>$table,'start'=>0,'rate'=>0));
					} else {
						unlink($lock);
						$this->error('初始化失败，备份文件创建失败！');
					}
					break;

				case 2:
					if(!is_file($lock)){
						$this->error('操作错误：备份锁定文件丢失！');
					}
					if (session('backup_step') != $step) {
						unlink($lock);
						session('backup_step',null);
						$this->error('步骤错误！');
					}
					$table = I('table');
					$start = I('start');
					$Database = new \Common\Vendor\Database(session('backup_file'), $backup_config);
					$start  = $Database->backup($table, $start);
					if(false === $start){ //出错
						unlink($lock);
						$this->error('备份出错！');
					} elseif (0 === $start) { //下一表
						if(session('backup_tables')){
							$tables = session('backup_tables');
							$pretable = $table;
							$table = array_shift($tables);
							session('backup_tables',$tables);
							$data = array(
								'step'=>$step,
								'pretable' => $pretable,
								'table'=>$table,
								'start'=>0,
								'rate'=>0,
								);
							$this->success($data);
						} else { //备份完成，清空缓存
							unlink($lock);
							session('backup_tables', null);
							session('backup_step', null);
							session('backup_file', null);
							session('backup_config', null);
							$this->success(array('step'=>$step+1,'table'=>$table,'rate'=>100));
						}
					} else {
						$data = array(
							'step'=>$step,
							'table'=>$table,
							'start'=>$start[0],
							'rate'=>floor(100 * ($start[0] / $start[1])),
							);
						$this->success($data);
					}

					break;
				
				default:
					# code...
					break;
			}
		}
	}
}