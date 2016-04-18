<?php
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {

	public function _initialize(){
		if (C('SITE_CLOSED')) {
			$this -> error(C('SITE_CLOSED_REASON'),'',3000);
		}
		tag('home_init');
	}
}