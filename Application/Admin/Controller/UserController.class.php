<?php
namespace Admin\Controller;
class UserController extends CommonController {

	public function add(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$id = I('id','','intval');
			$this -> form(M('User') -> find($id));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

	// 分配用户组
	public function group(){
		$user_id = I('user_id');
		if (IS_GET) {
			$this -> success($this -> fetch());
		}elseif (IS_POST) {
			if (I('__type') == 'group') {
				// 获取该memeber下的用户组
				$checked = M('Auth_group_access') -> where('uid='.$user_id) -> getField('group_id',true);
				$groups = M('Auth_group') -> where('status=1') -> select();
				$res = array(
					'rows' => array_mark($groups,$checked,'id','checked',true,false),
					);
				$this -> success($res);
			}else{
				// 重新分配用户组
				// 移除老分组
				M('Auth_group_access') -> where(array('uid' => array('eq',$user_id))) -> delete();
				// 重组新分组
				$group_ids = I('group_ids');
				if ($group_ids) {
					$data = array();
					foreach ($group_ids as $key => $value) {
					$data[] = array(
						'uid'=>$user_id,
						'group_id'=>$value,
						);
					}
					if (false !== M('Auth_group_access') -> addAll($data)) {
						$this -> success('用户组分配成功！');
					}else{
						$this -> error(M('Auth_group_access') -> getDbError());
					}
				}else{
					$this -> success('用户组分配成功！');
				}
			}
		}
	}

	// 重置密码
	// public function password(){
	// 	if (IS_GET) {
	// 		$this -> display();
	// 	}elseif (IS_POST) {
	// 		$id = I('id','','intval');
	// 		$m = M('User');
	// 		// 判断并获取账户
	// 		$id = I('id','','intval');
	// 		$_where = array(
	// 			'id' => array('eq',$id),
	// 			);
	// 		if (!$data = $m -> find($id)) {
	// 			$this -> error('你的邮箱输入有误，请确认是否正确！');
	// 		}
	// 		// 更新safe_code
	// 		$safe_code = md5(rand());
	// 		$m -> where($_where) -> setField('safe_code',$safe_code);

	// 		// 发送连接到邮箱
	// 		$pars = array(
	// 			'code' => \Think\Crypt::encrypt($data['email'],get_hash_str(),3600*24),
	// 			'recode' => \Think\Crypt::encrypt(md5($data['email']),get_hash_str($safe_code),3600*24),
	// 			);
	// 		$url = 'http://'.I('server.HTTP_HOST').U('Home/Auth/password',$pars);
	// 		$str = str_preg_parse(htmlspecialchars_decode(FC('MSG_TPL.password_url')),array('url'=>$url));
	// 		if (sendmail($data['email'],'尊敬的用户','找回密码',$str)) {
	// 			$this -> success('你好，更改密码连接已经发送到您的邮箱，请登录邮箱完成操作！','',5);
	// 		}else{
	// 			$this -> error('邮件发送失败！请联系管理员！');
	// 		}
	// 	}
	// }
	public function password(){
		if (IS_GET) {
			$id = I('id','','intval');
			$this -> form(M('User') -> find($id));
		}elseif (IS_POST) {
			$id = I('id');
			$password = I('password');
			if (strlen($password) > 10 || strlen($password) < 5) {
				$this -> error('密码长度请控制在5-10位');
			}
			$_where = array(
				'id'=>array('eq',$id),
				);
			if (false !== M('User') -> where($_where) -> setField('password',crypt_pwd($password))) {
				$this -> success('修改成功！');
			}else{
				$this -> error(M('User') -> getDbError());
			}
		}
	}
}