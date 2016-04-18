<?php
include COMMON_PATH.'Common/admin.php';

// 根据userid获取菜单id
function getmenuids($user_id){

	$user_id = is_numeric($user_id)?$user_id:0;
	// 获取角色id
	$role_ids = M('Role_user') -> where('user_id='.$user_id) -> getField('role_id',true);

	if (!$role_ids) {
		return;
	}
	// 获取所有菜单id
	$map['role_id']  = array('in',$role_ids);
	$menu_ids = M('Role_menu') -> where($map) -> getField('menu_id',true);
	return $menu_ids;
}

function file_id_dir ($dirname){
	if (!$Ld = @dir($dirname)) {
		return array();
	}
	while (false !== ($entry = $Ld->read())) {
		$checkdir=$dirname."/".$entry;
		$id = str_replace(array('/','.'),array('',''),$checkdir);
		if (is_dir($checkdir)&&!preg_match("[^\.]",$entry)){
			$result[] = array(
				'id' => dir_encrypt($id),
				'title' => iconv('gbk','UTF-8', $entry),
				'path' => dir_encrypt($checkdir),
				'state'=>'open',
				'isdir'=>true,
				'rows' => file_id_dir($checkdir)
			);
		}elseif ($entry!='.' && $entry!='..' && in_array(pathinfo($entry,PATHINFO_EXTENSION), C('EDITFILE_EXT'))) {
			$result[] = array(
				'id'=> dir_encrypt($id),
				'title'=> iconv('gbk','UTF-8', $entry),
				'filename' => dir_encrypt($checkdir),
				'isdir'=>false,
			);
		}
	}
	$Ld->close();
	return $result;
}

function dir_encrypt($dir){
	return \Think\Crypt::encrypt($dir,get_hash_str());
}

function dir_decrypt($str){
	return \Think\Crypt::decrypt($str,get_hash_str());
}

// 权限那啥
function get_access(){
	$AUTH = new \Think\Auth();
	return $AUTH -> getAuthLists(session(C('USER_AUTH_KEY')),1);
}