<?php
namespace Admin\Controller;
class NavcateController extends CommonController {

	public function add(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$this -> form(M('Navcate') -> find(I('id','','intval')));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

	public function delete(){
		$p = array(
			'relation' => array('nav'),
			);
		$this -> ebDelete($p);
	}



}