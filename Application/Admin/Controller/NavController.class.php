<?php
namespace Admin\Controller;
class NavController extends CommonController {

	public function add(){
		if (IS_GET) {
			$model = M('Navcate') -> where('id='.I('category_id')) -> getField('model');
			$this -> form('',array('ext_id'=>$model));
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$data = D('Nav') -> relation(true) -> find(I('id','','intval'));
			$this -> form($data,array('ext_id'=>$data['navcate']['model']));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}


}