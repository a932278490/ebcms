<?php
namespace Link\Controller;
class LinkController extends ProjectController {

	public function add(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$this -> form(M('Link') -> find(I('id','','intval')));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

}