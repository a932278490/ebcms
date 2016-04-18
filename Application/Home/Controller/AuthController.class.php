<?php
namespace Home\Controller;
use Think\Controller;
class AuthController extends Controller {

	public function _initialize(){
		$this -> namespace = strtolower(MODULE_NAME.'_'.CONTROLLER_NAME);
		tag('home_init');
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
			if (C('VERIFY_LOGIN')) {
				$verify = new \Think\Verify(FC('HOME_VERIFY'));
				if(!$verify->check(I('verify'))){
					$this -> error('验证码错误!');
				}
			}

			// 清空session
			session(null);
			// 读取该账户
			$email = I('email');
			$where = array(
				'email' => $email,
				'password' => crypt_pwd(I('password'))
				);
			if ($res = M('User') -> where($where) -> find()) {
				// 判断账户状态
				if ($res['status'] != 1) {
					$this -> error('账户暂时不可用');
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
				session('__avatar',$res['avatar']);
				session('__nickname',$res['nickname']);
				// 超级管理员识别
				if ($res['email'] == C('SUPERADMIN')) {
					session(C('ADMIN_AUTH_KEY'),true);
				}
				$this -> success('登陆成功!',U('Home/Index/index'));
			} else {
				$this -> error('密码错误');
			}
		}
	}

	// 退出
	public function logout(){
		if (IS_GET) {
			session(null);
			$this -> redirect('Home/Index/index');
		}
	}

	// 注册
	public function reg(){
		if (IS_GET) {
			if ($code = I('code')) {
				$recode = I('recode');
				$email = \Think\Crypt::decrypt($code,get_hash_str());
				$r = \Think\Crypt::decrypt($recode,get_hash_str());
				if (md5($email) !== $r) {
					$this -> error('非法操作！');
				}else{

					$m = D('User','RelationModel');
					$password = substr(md5(rand(10000,99999)), 0,8);
					$nickname = substr(md5($email), 0,8);
					$data = array(
						'nickname' => $nickname,
						'email' => $email,
						'password' => $password,
						);
					if (!$data = $m -> create($data)) {
						$this -> error($m -> getError());
					}
					$data['group'] = array();
					if (C('USER_REG_ROLE')) {
						$data['group'][0] = array('id'=>C('USER_REG_ROLE'));
					}
					if (false === $id = $m -> relation('group') -> add($data)) {
						$this -> error($m -> getDbError());
					}
					$tpldata = array(
						'email'=>$email,
						'password'=>$password,
						);
					$str = str_preg_parse(htmlspecialchars_decode(FC('MSG_TPL.reg_success')),$tpldata);
					if (!sendmail($email,'尊敬的用户','会员信息',$str)) {
						sendmail($email,'尊敬的用户','会员信息',$str);
					}

					// 写入新session
					session(C('USER_AUTH_KEY'),$id);
					session('__email',$email);
					session('__avatar','');
					session('__nickname',$nickname);
					// 超级管理员识别
					// if ($email == C('SUPERADMIN')) {
					// 	session(C('ADMIN_AUTH_KEY'),true);
					// }

					$this -> email = $email;
					$this -> password = $password;
					$this -> display('reg_success');
				}
			}else{
				$this -> display();
			}
		}elseif (IS_POST) {

			// 验证验证码
			if (C('VERIFY_REG')) {
				$verify = new \Think\Verify(FC('HOME_VERIFY'));
				if(!$verify->check(I('verify'))){
					$this -> error('验证码错误!');
				}
			}

			$email = I('email');
			// 判断是否是邮箱
			// 判断是否已经注册
			$_where = array(
				'email' => array('eq',$email),
				);
			if (M('User') -> where($_where) -> find()) {
				$this -> error('该邮箱已经注册，请登录！');
			}

			// 发送连接到邮箱
			$pars = array(
				'code' => \Think\Crypt::encrypt($email,get_hash_str(),3600*24),
				'recode' => \Think\Crypt::encrypt(md5($email),get_hash_str(),3600*24),
				);
			$url = 'http://'.I('server.HTTP_HOST').U('reg',$pars);
			$str = str_preg_parse(htmlspecialchars_decode(FC('MSG_TPL.reg_url')),array('url'=>$url));
			if (sendmail($email,'尊敬的用户','注册连接',$str)) {
				$this -> success('你好，注册连接已经发送到您的邮箱，请登录邮箱完成注册！','',5);
			}else{
				$this -> error('邮件发送失败！请联系管理员！');
			}
		}
	}

	// 找回密码
	public function password(){
		if (IS_GET) {
			if ($code = I('code')) {
				$email = \Think\Crypt::decrypt($code,get_hash_str());
				// 获取安全码
				$_where = array(
					'email' => array('eq',$email),
					);
				if (!$member = M('User') -> where($_where) -> find()) {
					$this -> error('非法操作！');
				}
				if (!$member['safe_code']) {
					$this -> error('非法操作！');
				}
				$recode = \Think\Crypt::decrypt(I('recode'),get_hash_str($member['safe_code']));
				if (md5($email) !== $recode) {
					$this -> error('非法操作！'.$email.$recode);
				}else{
					session('re_password',true);
					session('re_id',$member['id']);
					$this -> display('password_success');
				}
			}else{
				$this -> display();
			}
		}elseif (IS_POST) {

			// 验证验证码
			if (C('VERIFY_PASSWORD')) {
				$verify = new \Think\Verify(FC('HOME_VERIFY'));
				if(!$verify->check(I('verify'))){
					$this -> error('验证码错误!');
				}
			}

			if (session('?re_password') && $password = I('password')) {
				$_where = array(
					'id' => array('eq',session('re_id')),
					);

				if (M('User') -> where($_where) -> setField('password',crypt_pwd($password))) {
					// 清除session
					session('re_password',null);
					session('re_id',null);
					// 清除安全操作码
					M('User') -> where($_where) -> setField('safe_code','');
					$this -> success('密码修改成功！',U('Home/Index/index'));
				}else{
					$this -> error('密码修改失败！');
				}
			}else{
				
				// 发送连接
				$email = I('email');
				$_where = array(
					'email' => array('eq',$email),
					);
				if (!$data = M('User') -> where($_where) -> find()) {
					$this -> error('你的邮箱输入有误，请确认是否正确！');
				}

				// 更新safe_code
				$safe_code = md5(rand());
				M('User') -> where($_where) -> setField('safe_code',$safe_code);

				// 发送连接到邮箱
				$pars = array(
					'code' => \Think\Crypt::encrypt($email,get_hash_str(),3600*24),
					'recode' => \Think\Crypt::encrypt(md5($email),get_hash_str($safe_code),3600*24),
					);
				$url = 'http://'.I('server.HTTP_HOST').U('password',$pars);
				$str = str_preg_parse(htmlspecialchars_decode(FC('MSG_TPL.password_url')),array('url'=>$url));
				if (sendmail($email,'尊敬的用户','找回密码',$str)) {
					$this -> success('你好，更改密码连接已经发送到您的邮箱，请登录邮箱完成操作！','',5);
				}else{
					$this -> error('邮件发送失败！请联系管理员！');
				}
			}
		}
	}

}