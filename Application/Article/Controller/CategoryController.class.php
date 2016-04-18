<?php
namespace Article\Controller;
class CategoryController extends ProjectController {

	public function add(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$this -> form(D('Category') -> find(I('id','','intval')));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

	public function delete(){
		$p = array(
			'relation' => array('article'),
			);
		$this -> ebDelete($p);
	}



}