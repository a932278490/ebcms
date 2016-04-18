<?php
namespace Admin\Controller;
class ModelController extends CommonController {

	public function add(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$this -> form(M('Model') -> find(I('id','','intval')));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

	public function delete(){
		if (IS_POST) {
			$p = array(
				'relation' => array('modelfield'),
				);
			$this -> ebDelete($p);
		}
	}}