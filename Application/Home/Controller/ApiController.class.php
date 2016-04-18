<?php
namespace Home\Controller;
use Think\Controller;
class ApiController extends Controller {
	//验证码
	public function verify(){
		$verify = new \Think\Verify(FC('HOME_VERIFY'));
		$verify -> entry();
	}
}