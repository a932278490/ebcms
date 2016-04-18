<?php
namespace Admin\Controller;
class ModelfieldController extends CommonController {

	public function add(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$field = M('Modelfield') -> find(I('id','','intval'));
			if (I('__type') == 'config') {
				$this -> form($field,array('formname'=>$field['type']));
			}else{
				$this -> form($field);
			}
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

}