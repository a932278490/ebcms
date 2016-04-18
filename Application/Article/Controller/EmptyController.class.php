<?php 
namespace Article\Controller;
use Think\Controller;
class EmptyController extends Controller{

	public function _initialize(){
		if (IS_POST) {
			$this -> error('控制器不存在','',true);
		}elseif (IS_GET) {
			die('<script type="text/javascript">$(function(){EBCMS.MSG.alert("控制器不存在！");})</script>');
		}
	}
}