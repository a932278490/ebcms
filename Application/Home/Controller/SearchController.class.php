<?php
namespace Home\Controller;
use Think\Controller;
class SearchController extends CommonController {
	public function index(){
		if ($q = I('q')) {
			$this -> SEO = array(
				'title' =>  C('SEARCH.title'),
				'keywords'  =>  C('SEARCH.keywords'),
				'description'   =>  C('SEARCH.description'),
				);
			$_where = array(
				'title|description|keywords' => array('like','%'.$q.'%'),
				'status' => array('eq',1),
				);
			$m = M('Article');
			$count = $m -> where($_where) -> count();
			$Page = new \Common\Vendor\Page($count,C('SEARCH.pagenum'));
			$this -> lists = $m -> where($_where) -> limit($Page->firstRow.','.$Page->listRows) -> order('id desc') -> select();
			if ($count > C('SEARCH.pagenum')) {
				$this -> pages = $Page->show();
			}
			$this -> q = $q;
		}
		$this->display('index');
	}
}