<?php
namespace Home\Controller;
use Think\Controller;
class GuestbookController extends CommonController {

	// 首页
	public function index(){
		if (IS_GET) {
			$m = M('Guestbook');
			$_where = array(
				'status' => array('eq',1),
				);
			$count = $m -> where($_where) -> count();
			$Page = new \Common\Vendor\Page($count,C('GUESTBOOK.GUESTBOOK_PAGENUM')?:20);
			$this -> lists = $m -> where($_where) -> order('id desc') -> limit($Page->firstRow.','.$Page->listRows) -> select();
			$this -> pages = $Page->show();
			$this -> SEO = array(
				'title' =>  C('guestbook.title'),
				'keywords'  =>  C('guestbook.keywords'),
				'description'   =>  C('guestbook.description'),
				);
			$this -> display();
		}
	}

	// 添加留言
	public function add(){
		if (IS_POST) {
			// 验证验证码
			if (C('GUESTBOOK.verify')) {
				$verify = new \Think\Verify(FC('HOME_VERIFY'));
				if(!$verify->check(I('verify'))){
					$this -> error('验证码错误!');
				}
			}

			$nickname = I('nickname','游客');
			$mobile = I('mobile','');
			$content = I('content','');
			if (!ismobile($mobile)) {
				$this -> error('手机号码填写错误！');
			}
			$data = array(
				'nickname'		=>	$nickname,
				'mobile'		=>	$mobile,
				'content'		=>	mb_substr($content, 0,255),
				'update_time'	=>	time(),
				'status'		=>	0,
				);
			$m = M('Guestbook');
			if ($m -> create($data)) {
				if ($m -> add()) {
					$this -> success('留言成功！');
				}else{
					$this -> error('留言失败！');
				}
			}else{
				$this -> error('留言失败！');
			}
		}
	}
}