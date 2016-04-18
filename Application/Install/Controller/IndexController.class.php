<?php
namespace Install\Controller;
use Think\Controller;
use Think\Db;
class IndexController extends Controller {

	public function _initialize(){
		if(\Think\Storage::has(APP_PATH.'Common/Conf/install.lock')){
			$this -> error('请不要重复安装！');
		}
		$this -> namespace = MODULE_NAME.CONTROLLER_NAME;
	}

	public function index(){
		$step = I('step');
		if (is_numeric($step)) {
			$this -> steps = array('安装协议','环境检查','站点配置','系统安装','安装成功');
			$this -> step = $step;
			$step = 'step'.$step;
			$this -> tpl = $step;
			$this -> success($this -> $step());
		}else{
			$this -> display();
		}
	}

	protected function step0(){
		if (IS_GET) {
			return $this -> fetch($this -> tpl);
		}
	}

	protected function step1(){
		if (IS_GET) {
			$this -> check_env = check_env();
			$this -> check_dirfile = check_dirfile();
			$this -> check_func = check_func();
			$this -> huanjing = session('error')?0:1;
			return $this -> fetch($this -> tpl);
		}
	}

	protected function step2(){
		if (IS_GET) {
			return $this -> fetch($this -> tpl);
		}elseif (IS_POST) {
			$password = I('password');
			if ($password != I('password2')) {
				$this -> error('两次密码输入不一样！请确认！');
			}
			if (strlen($password) > 10 || strlen($password) < 5) {
				$this -> error('密码长度不符合要求！');
			}
			$dbconfig = array(
				'DB_TYPE'       =>  'mysql',
				'DB_HOST'       =>  I('DB_HOST'),
				'DB_NAME'       =>  I('DB_NAME'),
				'DB_USER'       =>  I('DB_USER'),
				'DB_PWD'        =>  I('DB_PWD'),
				'DB_PREFIX'     =>  I('DB_PREFIX'),
				);
			if (I('createdatabase') == 1) {
				$rootconfig = array(
					'DB_TYPE'       =>  'mysql',
					'DB_HOST'       =>  I('DB_HOST'),
					'DB_USER'       =>  I('DB_USER_ROOT'),
					'DB_PWD'        =>  I('DB_PWD_ROOT'),
					'DB_PREFIX'     =>  I('DB_PREFIX'),
					);
				$db  = Db::getInstance($rootconfig);
				$sql = 'CREATE DATABASE IF NOT EXISTS `'.$dbconfig['DB_NAME'].'` DEFAULT CHARACTER SET utf8';
				$db->execute($sql) || $this->error('ROOT账户配置错误！'.$db->getError());
			}
			$db  = Db::getInstance($dbconfig);
			$sql = "CREATE TABLE IF NOT EXISTS `".$dbconfig['DB_PREFIX'].md5(serialize($dbconfig))."` (id int NOT NULL AUTO_INCREMENT, PRIMARY KEY(id),ebcmstest varchar(15));DROP TABLE IF EXISTS `".$dbconfig['DB_PREFIX'].md5(serialize($dbconfig))."`;";
			if ($db->execute($sql) === false) {
				$this -> error('数据库配置错误！');
			}
			$dbdemo = I('demodatabase',1,'intval');
			session('dbdemo',$dbdemo);
			session('dbconfig',$dbconfig);
			session('password',I('password'));
			session('email',I('email','1540837821@qq.com'));
			$this -> success('配置成功！');
		}
	}

	protected function step3(){
		if (IS_GET) {
			return $this -> fetch($this -> tpl);
		}elseif (IS_POST) {
			$process = I('process');
			$dbconfig = session('dbconfig');
			switch ($process) {
				case 'createdatabase':
					if (!$dbconfig) {
						$this -> error('数据库配置错误！');
					}
					$tables = '安装数据...<br>';
					if (session('dbdemo')) {
						$tables .= '载入演示数据库...<br>';
						$sql = file_get_contents(MODULE_PATH.'Data/install_demo.sql');
					} else {
						$tables .= '载入数据库...<br>';
						$sql = file_get_contents(MODULE_PATH.'Data/install.sql');
					}
					$sql = str_replace('ebcms_', $dbconfig['DB_PREFIX'], $sql);
					$ret = array();
					$num = 0;
					foreach(explode(";\r\n", trim($sql)) as $query) {
						$ret[$num] = '';
						$queries = explode("\r\n", trim($query));
						foreach($queries as $query) {
							$ret[$num] .= (isset($query[0]) && $query[0] == '#') || (isset($query[1]) && isset($query[1]) && $query[0].$query[1] == '--') ? '' : $query;
						}
						$num++;
					}
					$tables .= '创建数据表...<br>';
					$db  = Db::getInstance($dbconfig);
					foreach ($ret as $key => $value) {
						if ($value) {
							$db -> execute($value);
							if(substr($value, 0, 12) == 'CREATE TABLE') {
								$tables .= '创建数据表...'.preg_replace("/CREATE TABLE `?([a-z0-9_]+)`? .*/is", "\\1", $value).'<br>';
							}
						}
					}
					$tables .='创建数据库...完成!';
					$result = array(
						'info'=>$tables,
						'process'=>'updatedbconfig',
						);
					$this -> success($result);
					break;
				
				case 'updatedbconfig':
					if (!$dbconfig) {
						$this -> error('数据库配置错误！');
					}
					$info = '更新系统配置...<br>';
					$password = session('password');
					$email = session('email');
					$sql = 'update `'.$dbconfig['DB_PREFIX'].'config` set `value` = "'.$dbconfig['DB_HOST'].'" where `name`="DB_HOST" and `category_id`=12;';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'config` set `value` = "'.$dbconfig['DB_NAME'].'" where name="DB_NAME" and `category_id`=12;';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'config` set `value` = "'.$dbconfig['DB_USER'].'" where `name`="DB_USER" and `category_id`=12;';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'config` set `value` = "'.$dbconfig['DB_PWD'].'" where `name`="DB_PWD" and `category_id`=12;';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'config` set `value` = "'.$dbconfig['DB_PREFIX'].'" where `name`="DB_PREFIX" and `category_id`=12;';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'config` set `value` = "'.$dbconfig['DB_TYPE'].'" where `name`="DB_TYPE" and `category_id`=12;';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'config` set `value` = "'.$email.'" where `name`="SUPERADMIN";';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'config` set `value` = "'.md5(rand()).'" where `name`="SAFE_CODE";';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'user` set `email` = "'.$email.'" where `id`=1;';
					$sql .= 'update `'.$dbconfig['DB_PREFIX'].'user` set `password` = "'.crypt_pwd($password).'" where `id`=1;';
					$db  = Db::getInstance($dbconfig);
					$db -> execute($sql);
					$info .= '更新系统配置...完成！';
					$result = array(
						'info'=>$info,
						'process'=>'updatebehaviour',
						);
					$this -> success($result);
					break;
				
				case 'updatebehaviour':
					if (!$dbconfig) {
						$this -> error('数据库配置错误！');
					}
					$info = '删除行为配置文件...<br>';
					$dir = APP_PATH;
					if (is_dir($dir)){
						if ($dh = opendir($dir)){
							while (($file = readdir($dh))!= false){
								if (!in_array(strtolower($file), array('.','..','runtime','install'))) {
									//文件名的全路径 包含文件名
									$filePath = $dir.$file;
									@unlink($filePath.'/Conf/tags.php');
								}
							}
							closedir($dh);
						}
					}
					$info .= '删除行为配置文件...完成！<br>';
					$info .= '创建行为配置文件...<br>';
					$_where = array(
						'status' => array('eq',1),
						);
					C($dbconfig);
					$data = M('Behavior') -> where($_where) -> order('sort desc') -> getField('behavior,hook,module',true);
					$tags = array();
					foreach ($data as $key => $value) {
						$modules = explode('|', $value['module']);
						foreach ($modules as $k => $m) {
							if ($m) {
								$tags[$m][$value['hook']][]=$value['behavior'];
							}
						}
					}
					foreach ($tags as $module => $tag) {
						$str = "<?php ";
						$str .= "\n\r//行为绑定文件由系统自动生成，如非必要请在后台修改！";
						$str .= "\n\rreturn ".var_export($tag,true).';';
						$str = str_replace('\\\\', '\\', $str);
						$filename = APP_PATH.ucfirst(strtolower($module)).'/Conf/tags.php';
						\Think\Storage::put($filename,$str);
						$info .= '创建行为配置文件：'.$filename.'...完成！<br>';
					}
					$info .= '创建行为配置文件...完成！';
					$result = array(
						'info'=>$info,
						'process'=>'updatecron',
						);
					$this -> success($result);
					break;

				case 'updatecron':
					if (!$dbconfig) {
						$this -> error('数据库配置错误！');
					}
					$info = '创建定时任务文件...<br>';
					$_where = array(
						'status' => array('eq',1),
						);
					C($dbconfig);
					$data = M('Cron') -> where($_where) -> order('sort desc') -> getField('cron,intervals,initruntime',true);
					$crons = array();
					foreach ($data as $key => $value) {
						$crons[$key][0] = $value['cron'];
						$crons[$key][1] = $value['intervals'];
						$crons[$key][2] = strtotime($value['initruntime']);
					}
					$str = "<?php ";
					$str .= "\n\r//定时任务文件由系统自动生成，如非必要请在后台修改！";
					$str .= "\n\r//定时任务需要行为配置定时任务行为扩展";
					$str .= "\n\rreturn ".var_export($crons,true).';';
					$filename = COMMON_PATH.'Conf/crons.php';
					\Think\Storage::put($filename,$str);
					$info .= '创建定时任务文件...'.$filename.'...完成！<br>';
					@unlink(RUNTIME_PATH.'~crons.php');
					$info .= '创建定时任务文件...完成<br>';
					$result = array(
						'info'=>$info,
						'process'=>'updateconfig',
						);
					$this -> success($result);
					break;

				case 'updateconfig':
					if (!$dbconfig) {
						$this -> error('数据库配置错误！');
					}
					$info = '创建配置文件...<br>';
					C($dbconfig);
					$config = read_config();
					foreach ($config as $key => $value) {
						ksort($value);
						$str = "<?php \n\r//配置文件由系统自动生成，如非必要请在后台修改！\n\rreturn ".var_export($value,true).';';
						$str = htmlspecialchars_decode($str);
						$patterns  = array(
							'/(\{\{)(.*)(\}\})/U',
							'/(=> \'\'\.)/U',
							'/(\.\'\',)(\r|\n)/U',
							'/(\.\'\'\.)/U',
							);
						$replace  = array(
							'\'.\2.\'',
							'=> ',
							',\2',
							'.',
							);
						$str = preg_replace($patterns, $replace, $str);
						$str = str_replace(array('[\\\'','\\\']'), array('[\'','\']'), $str);
						\Think\Storage::put(APP_PATH.$key.'/Conf/config.php',$str);
						$info .= '创建配置文件...'.APP_PATH.$key.'/Conf/config.php 完成！<br>';
					}
					$info .= '创建配置文件...完成！';
					$result = array(
						'info'=>$info,
						'process'=>'runtime',
						);
					$this -> success($result);
					break;

				case 'runtime':
					deldir(RUNTIME_PATH);
					$info = '删除缓存！';
					$result = array(
						'info'=>$info,
						'process'=>'safefile',
						);
					$this -> success($result);
					break;

				case 'safefile':
					\Think\Storage::put(APP_PATH.'Common/Conf/install.lock','#'.date('Y-m-d H:i:s'));
					deldir(RUNTIME_PATH);
					$info = '生成安全文件！<br>';
					$info .= '安装成功！';
					$result = array(
						'info'=>$info,
						'process'=>'end',
						);
					session(null);
					$this -> success($result);
					break;
			}
		}
	}

}