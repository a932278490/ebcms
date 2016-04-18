<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends CommonController {
	public function index(){
		$this -> SEO = array(
			'title' =>  C('site.title'),
			'keywords'  =>  C('site.keywords'),
			'description'   =>  C('site.description'),
			);
		$this -> display();
	}
}