<?php
namespace Admin\Controller;
class ConfigController extends CommonController {

	// public function add(){
	// 	if (IS_GET) {
	// 		$this -> form();
	// 	}elseif (IS_POST) {
	// 		$this -> ebAdd();
	// 	}
	// }

	public function save(){
		if (IS_GET) {
			if (I('category_id')) {
				$_where = array(
					'status' => array('eq',1),
					'form' => array('neq','hidden'),
					'locked' => array('eq',0),
					'category_id' => array('eq',I('category_id')),
					);
			}elseif (I('ids')) {
				$_where = array(
					'status' => array('eq',1),
					'form' => array('neq','hidden'),
					'locked' => array('eq',0),
					'id' => array('in',I('ids')),
					);
			}elseif(I('pid')){
				$_where = array(
					'status' => array('eq',1),
					'form' => array('neq','hidden'),
					'locked' => array('eq',0),
					'pid' => array('eq',I('pid')),
					);
			}else{
				$this -> error('参数错误！');
			}
			if ($configs = M('Config') -> where($_where) -> order('sort desc,id asc') -> select()) {
				$_groups = array();
				foreach ($configs as $key => $config) {
					$config['config'] = json_decode($config['config'],true);
					$config['_field'] = 'data['.$config['id'].']';
					$config['_value'] = $config['value'];
					$config['_type'] = $config['form'];
					$_groups['配置列表'][$config['id']] = $config;
				}
				$_form = array(
					'action' => U('save'),
					'group' => '系统配置',
					'title' => '修改配置',
					);
				$this -> _form = $_form;
				$this -> _groups = $_groups;
				
				if (I('__modal') == 1) {
					$this -> __modal = 1;
				}
				$this -> success($this -> fetch('Common/form'));
			}else{
				$this -> error('没有配置项');
			}
		}elseif (IS_POST) {
			$data = I('data');
			foreach ($data as $key => $value) {
				M('Config') -> where(array('id'=>array('eq',$key))) -> setField('value',$value);
			}
			$this -> success('修改成功');
		}
	}

	public function build(){
		if (IS_POST) {
			$config = read_config();
			// 生成配置文件
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
			}
			deldir(RUNTIME_PATH);
			$this -> success('成功更新核心配置！','',true);
		}
	}
}