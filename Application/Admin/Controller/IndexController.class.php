<?php
namespace Admin\Controller;
class IndexController extends CommonController {

	public function index(){
		if (IS_POST) {
			if ($api = I('__api')) {
				$this -> $api();
			}
		}elseif (IS_GET) {
			$this -> nickname = session('__nickname');
			switch (I('tpl')) {
				case 'main':
					$this -> success($this -> fetch('main'));
					break;

				case 'config':
					$this -> success($this -> fetch('config'));
					break;
				
				default:
					$this -> display();
					break;
			}
		}
	}

	// 修改自己的密码
	public function password(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$oldpassword = I('oldpassword');
			$password = I('password');
			$passwordtwo = I('passwordtwo');
			if ($passwordtwo != $password) {
				$this -> error('两次密码输入不一致','',true);
			}
			$id = session(C('USER_AUTH_KEY'));
			$m = M('User');
			if (crypt_pwd($oldpassword) == $m -> where('id='.$id) -> getField('password')) {
				if (false !== $m -> where('id='.$id) -> setField('password',crypt_pwd($password))) {
					$this -> success('密码修改成功','',true);
				}else{
					$this -> error($m -> getDbError(),'',true);
				}
			}else{
				$this -> error('密码错误','',true);
			}
		}
	}
	
	public function runtime(){
		if (IS_POST) {
			deldir(RUNTIME_PATH);
			$this -> success('成功清理系统缓存！');
		}
	}

	public function ueditor(){
		$ueditor = new \Common\Vendor\Ueditor();
		echo $ueditor->output();
	}

	public function upload(){
		C('SHOW_PAGE_TRACE',false);
		C('TOKEN_ON',false);
		// 上传动作
		$config = FC('UPLOAD_CONFIG');
		$upload = new \Think\Upload($config);// 实例化上传类
		$info   =   $upload->upload();
		if (!$info) {
			$this -> error($upload->getError(),'',true);
		}else{
			// 上传信息插入到数据库
			$m = D('Attachment');
			if (false === $data = $m -> create($info['file'])) {
				$this -> error($m -> getError(),'',true);
			}else{
				$m -> add();
				$data['id'] = $m -> getLastInsID();
				$this -> success($data,'',true);
			}
		}
	}

	protected function getconfig(){
		$uploadconfig = FC('UPLOAD_CONFIG');
		$data = array(
			'WebUploader_swf' => C('TMPL_PARSE_STRING.__THIRD__').'/webuploader/Uploader.swf',
			'WebUploader_server' => U('Admin/Index/upload'),
			);
		return $data;
	}

	// 数据字典缓存
	protected function asyncdata(){
		$res = array();
		// 超级管理员标识
		$res['__SUPERADMIN'] = session('?'.C('ADMIN_AUTH_KEY'));
		// 普通管理员权限
		$res['__ACCESSLIST'] = get_access();
		$res['__URL_API'] = U('Admin/Index/index');
		$res['__URL_RECOMMEND'] = U('Admin/Recommend/push');
		$res['__CONF'] = $this -> getconfig();
		$res['__GROUP'] = __GROUP__;
		$res['__ROOT'] = __ROOT__;
		$this -> success($res);
	}

	// 我的菜单
	protected function mymenu(){
		$pid = I('pid',0,'intval');
		if (defined('APP_DEVELOP') && APP_DEVELOP === TRUE) {
			$_where = array(
				'status' => array('in',array(1,2)),
				'type' => array('eq','admin'),
				);
		}else{
			$_where = array(
				'status' => array('eq',1),
				'type' => array('eq','admin'),
				);
		}
		$menus = M('Menu') -> where($_where) -> order('sort desc') -> select();
		foreach ($menus as $key => $value) {
			$menus[$key]['url'] = empty($value['url'])?'':U($value['url']);
		}
		if (session(C('ADMIN_AUTH_KEY'))) {//是超级管理员
			$menus = data2subtree($menus,$pid);
		}else{//不是超级管理员
			// 根据用户id获取导航id集
			$groupids = M('Auth_group_access') -> where(array('uid'=>array('eq',session(C('USER_AUTH_KEY'))))) -> getField('group_id',true);
			$menu_ids = array();
			if ($groupids) {
				$menu_ids = M('Auth_group') -> where(array('id'=>array('in',$groupids))) -> getField('menus',true);
				$menu_ids = implode($menu_ids, ',');
				$menu_ids = explode(',', $menu_ids);
				$menu_ids = array_unique($menu_ids);
			}
			$menus = array_getmarked($menus,$menu_ids);// 获取有权限的导航
			$menus = data2subtree($menus,$pid);
		}
		$res = array(
			'rows' => $menus,
			);
		$this -> success($res);
	}

	// 系统数据
	protected function moduledata(){
		$p = array(
			'input' => I(),
			);
		if (!$p['input']['__model']) {
			$this -> error('参数错误！');
		}
		$this -> success($this -> getData($p));
	}

	// 字典数据
	protected function datadict(){
		if ($datadict = I('datadict')) {
			$_where = array(
				'status' => array('eq',1),
				'field' => array('eq',$datadict),
				);
			if ($cate = M('Datadictcate') -> where($_where) -> find()) {
				$_where = array(
					'status' => array('eq',1),
					'category_id' => array('eq',$cate['id']),
					);
				$order = getorder();
				$m = M('Datadict');
				if (str_replace(' ', '', $order)){
					$m -> order($order);
				}

				$data = $m -> where($_where) -> getField('id,title,pid,value,category_id,instruction,sort,status');
				foreach ($data as $k => $v) {
					$data[$k]['value'] = render_str($v['value']);
				};
				$res = array();
				foreach ($data as $key => $value) {
					$d = array();
					$d['id'] = (string)$value['value'];
					$d['pid'] = isset($data[$value['pid']])?(string)$data[$value['pid']]['value']:'';
					$d['title'] = $value['title'];
					$d['instruction'] = $value['instruction'];
					$res[$value['value']] = $d;
				}
				$this -> success(array('rows'=>$res));
			}else{
				$this -> error('数据不存在！');
			}
		}else{
			$this -> error('数据不存在！');
		}
	}

	// 返回数据库中的表
	protected function datatables(){
		$Db = \Think\Db::getInstance();
		// $list  = $Db->query('SHOW TABLE STATUS');
		$list  = $Db->query("SHOW TABLE STATUS from `".C('DB_NAME')."` LIKE '".C('DB_PREFIX')."%'");
		$list  = array_map('array_change_key_case', $list);
		$count = count($list);
		for ($i=0; $i < $count; $i++) { 
			$list[$i]['id'] = $i+1;
		}
		$result = array(
			'rows'  =>  $list,
			'total' =>  $count,
			);
		$this -> success($result);
	}

	// 返回备份的数据包
	protected function databackups(){
		// 返回备份的数据包
		$path  = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . '201*-*-*.sql*';
		$files = glob($path);
		$list = array();
		foreach($files as $name){
			$basename = basename($name);
			$size = filesize($name);
			$ext = pathinfo($basename, PATHINFO_EXTENSION);
			$match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
			$filetime = $match[0].$match[1].$match[2].'-'.$match[3].$match[4].$match[5];
			$list[$filetime]['time'] = $filetime;
			$list[$filetime]['parts'] += 1;
			$list[$filetime]['size'] += $size;
			$list[$filetime]['ext'] = $ext;
			$list[$filetime]['files'][$match[6]] = array('file' => $basename,'size' => intval($size/1024)?intval($size/1024):1);
		}
		$count = count($list);
		$rows = array();
		for ($i=0; $i < $count; $i++) { 
			$rows[$i] = array_shift($list);
			$rows[$i]['id'] = $i+1;
			$rows[$i]['size'] = intval($rows[$i]['size']/1024)?intval($rows[$i]['size']/1024):1;
		}
		$rows = array_reverse($rows);
		$result = array(
			'rows'  =>  $rows,
			'total' =>  $count,
			);
		$this -> success($result);
	}

	// 检查是否被百度收录
	protected function check_baidu(){
		// 加载应用模式对应的配置文件
		C('URL_MODEL',get_module_config('Home','URL_MODEL'));
		$safe = array(
			'article' => array('category'=>'栏目','detail'=>'内容'),
			'forum' => array('category'=>'栏目','detail'=>'内容'),
			);
		$controller = I('controller');
		$action = I('action');
		if (isset($safe[strtolower($controller)][strtolower($action)])) {
			$id = I('id');
			$url = 'http://'.$_SERVER['HTTP_HOST'].U('Home/'.$controller.'/'.$action,array('id'=>$id));
			$baidu = check_baidu($url);
			if (strtolower($action)== 'category') {
				$m = M($controller.'_category');
			}else{
				$m = M($controller);
			}
			$m -> where(array('id'=>array('eq',$id))) -> setField('baidu',$baidu);
			$this -> success('更新成功！');
		}
		$this -> success('参数错误！');
	}
}