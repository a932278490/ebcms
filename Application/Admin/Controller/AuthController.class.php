<?php
namespace Admin\Controller;
use Think\Controller;
class AuthController extends Controller {

	public function _initialize(){
		$this -> namespace = strtolower(MODULE_NAME.'_'.CONTROLLER_NAME);
	}

	public function index(){
		$this -> login();
	}

	// 登录
	public function login(){
		// 登陆页面
		if (IS_GET) {
			$this -> display('login');
		}
		
		// 登录动作
		if (IS_POST) {
			// 验证验证码
			$verify = new \Think\Verify();
			if(!$verify->check(I('verify'))){
				$this -> error('verify');
			}

			// 清空session
			session(null);
			// 读取该账户
			$where = array(
				'email' => I('email'),
				'password' => crypt_pwd(I('password'))
				);
			if ($res = D('User') -> where($where) -> relation('group') -> find()) {
				// 判断账户状态
				if ($res['status'] != 1) {
					$this -> error('forbidden');
				}
				// 超级管理员识别
				if ($res['email'] == C('SUPERADMIN')) {
					session(C('ADMIN_AUTH_KEY'),true);
				}
				// 更新数据库
				$updata = array(
					'login_ip' => get_client_ip(1,true),
					'login_time' => time(),
					'login_times'=>$res['login_times']+1
					);
				M('User') -> where('id='.$res['id']) -> save($updata);
				// 写入新session
				session(C('USER_AUTH_KEY'),$res['id']);
				session('__email',$res['email']);
				session('__nickname',$res['nickname']);
				session('__avatar',$res['avatar']);
				$this -> success('登陆成功!',U('Admin/Index/index'),true);
			} else {
				$this -> error('password');
			}

		}
	}

	// 退出
	public function logout(){
		if (IS_GET) {
			session(null);
			$this -> success('退出成功',U('Admin/Index/index'));
		}
	}
}