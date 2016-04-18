<?php 
namespace Home\Behavior;
use Think\Behavior;
class MobileBehavior extends Behavior{
	public function run(&$params){
		// 判断是否开启手机访问
		if (!C('CHECK_MOBILE')) {
			return;
		};
		if (I('force_theme')!='') {
			$theme = C('DEFAULT_THEME');
			if (I('force_theme') == 1) {
				C('DEFAULT_THEME',$theme.'_mobile');
				session('force_theme',$theme.'_mobile');
			}else{
				session('force_theme',$theme);
			}
			return;
		}elseif (session('?force_theme')) {
			C('DEFAULT_THEME',session('force_theme'));
			return;
		}else{
			$theme = C('DEFAULT_THEME');
			if ($this -> checkmobile()) {
				C('DEFAULT_THEME',$theme.'_mobile');
				session('force_theme',$theme.'_mobile');
			}else{
				session('force_theme',$theme);
			}
			return;
		}
	}

	/**
	* 检查是否是以手机浏览器进入(IN_MOBILE)
	*/
	protected function checkmobile() {
		if (isset($_SERVER['HTTP_VIA'])) return true;
		if (isset($_SERVER['HTTP_X_NOKIA_CONNECTION_MODE'])) return true;
		if (isset($_SERVER['HTTP_X_UP_CALLING_LINE_ID'])) return true;
		if (strpos(strtoupper($_SERVER['HTTP_ACCEPT']),"VND.WAP.WML") > 0) {
			$br = "WML";
		} else {
			$browser = isset($_SERVER['HTTP_USER_AGENT']) ? trim($_SERVER['HTTP_USER_AGENT']) : '';
			if(empty($browser)) return true;
			$mobile_os_list=array('Google Wireless Transcoder','Windows CE','WindowsCE','Symbian','Android','armv6l','armv5','Mobile','CentOS','mowser','AvantGo','Opera Mobi','J2ME/MIDP','Smartphone','Go.Web','Palm','iPAQ');
			$mobile_token_list=array('Profile/MIDP','Configuration/CLDC-','160×160','176×220','240×240','240×320','320×240','UP.Browser','UP.Link','SymbianOS','PalmOS','PocketPC','SonyEricsson','Nokia','BlackBerry','Vodafone','BenQ','Novarra-Vision','Iris','NetFront','HTC_','Xda_','SAMSUNG-SGH','Wapaka','DoCoMo','iPhone','iPod');
			$found_mobile=$this -> checkSubstrs($mobile_os_list,$browser) || $this -> checkSubstrs($mobile_token_list,$browser); 
		if($found_mobile)
			$br ="WML";
		else $br = "WWW";
		}
		if($br == "WML") {
			return true;
		} else {
			return false;
		}
	}

	protected function checkSubstrs($list,$str){
		$flag = false;
		for($i=0;$i<count($list);$i++){
			if(strpos($str,$list[$i]) > 0){
				$flag = true;
				break;
			}
		}
		return $flag;
	}

}