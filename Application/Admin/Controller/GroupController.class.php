<?php
namespace Admin\Controller;
class GroupController extends CommonController {

	public function add(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$this -> form(M('Auth_group') -> find(I('id','','intval')));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

	public function rule(){
		if (IS_GET) {
			$this -> success($this -> fetch());
		}elseif (IS_POST) {
			$group_id = I('group_id',0,'intval');
			if (I('__type') == 'rule') {
				// 获取该分组下的规则
				$checked = M('Auth_group') -> where(array('id'=>array('eq',$group_id))) -> getField('rules');
				$checked = explode(',', $checked);
				$rules = M('Auth_rule') -> where('status=1') -> select();
				$res = array(
					'rows' => array_mark($rules,$checked,'id','checked',true,false),
					);
				$this -> success($res);
			}else{
				$rule_ids = I('rule_ids');
				if (false !== M('Auth_group') -> where(array('id'=>array('eq',$group_id))) -> setField('rules',implode(',',$rule_ids))) {
					$this -> success('权限分配成功！');
				}else{
					$this -> error(M('Auth_group') -> getDbError());
				}
			}
		}
	}

	// 功能菜单分配
	public function menu(){
		if (IS_GET) {
			$this -> success($this -> fetch());
		}elseif (IS_POST) {
			$group_id = I('group_id',0,'intval');
			if (I('__type') == 'menu') {
				// 获取该分组下的规则
				$checked = M('Auth_group') -> where(array('id'=>array('eq',$group_id))) -> getField('menus');
				$checked = explode(',', $checked);
				$menus = M('Menu') -> where('status=1') -> select();
				$res = array(
					'rows' => array_mark($menus,$checked,'id','checked',true,false),
					);
				$this -> success($res);
			}else{
				$menu_ids = I('menu_ids');
				if (false !== M('Auth_group') -> where(array('id'=>array('eq',$group_id))) -> setField('menus',implode(',',$menu_ids))) {
					$this -> success('功能分配成功！');
				}else{
					$this -> error(M('Auth_group') -> getDbError());
				}
			}
		}
	}
}