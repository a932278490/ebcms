<?php
namespace Admin\Controller;
class ConfController extends CommonController {

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
				die;
			}
			if ($configs = M('Conf') -> where($_where) -> order('sort desc,id asc') -> select()) {
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
				die;
			}
		}elseif (IS_POST) {
			$data = I('data');
			foreach ($data as $key => $value) {
				M('Conf') -> where(array('id'=>array('eq',$key))) -> setField('value',$value);
			}
			$this -> success('修改成功');
		}
	}

	// 添加自定义配置
	public function addcustom(){
		if (IS_GET) {
			$this -> namespace = 'admin_index';
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	// 修改自定义配置
	public function savecustom(){
		if (IS_GET) {
			$this -> namespace = 'admin_index';
			$this -> form(D('Conf') -> find(I('id','','intval')));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}
}