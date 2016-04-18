<?php

// 美观的数据结构显示
function p($var){
	echo '<pre>';
	print_r($var);
	echo '</pre>';
}

/**
 * 用户名密码加密
 * 
 */
function crypt_pwd($pwd,$salt){
	return md5($pwd.(isset($salt)?$salt:' love ebcms forever!'));
}

// 获取系统唯一标识字符串
function get_hash_str($salt){
	$salt = isset($salt)?$salt:' love ebcms forever!';
	$str = md5(C('SAFE_CODE').$salt);
	return $str;
}

// 获取管理者id
function get_user_id(){
	static $uid = null;
	if (is_null($uid)) {
		$uid = session(C('USER_AUTH_KEY'));
	}
	return $uid;
}

// 获取缓存配置
function FC($str){
	if (!$str) {
		return false;
	}
	if (strpos($str,'.')) {
		$str = explode('.', $str);
		$key = strtoupper($str[0]);
		$subkey = $str[1];
	}else{
		$key = $str;
	}
	if (APP_DEBUG || !$conf = F('_confs/'.crypt_pwd($key,get_hash_str(MODULE_NAME.CONTROLLER_NAME.ACTION_NAME)))) {
		$confs = get_conf();
		foreach ($confs as $k => $v) {
			F('_confs/'.crypt_pwd(strtoupper($k),get_hash_str(MODULE_NAME.CONTROLLER_NAME.ACTION_NAME)),$v);
		}
		$conf = F('_confs/'.crypt_pwd($key,get_hash_str(MODULE_NAME.CONTROLLER_NAME.ACTION_NAME)));
	}
	return $subkey?$conf[$subkey]:$conf;
}

function get_conf(){
	$confcates = M('Confcate') -> where('name !=""') -> getField('id,name',true);
	$tmp = M('Conf') -> where(array('status'=>array('eq',1))) -> order('sort desc') -> getField('id,category_id,pid,name,value,render',true);
	$confs = array();
	foreach ($tmp as $key => $value) {
		$value['value'] = render_str($value['value']);
		$confs[$value['category_id']][] = $value;
	}
	$data = array();
	foreach ($confcates as $k => $v) {
		$data[$v] = config_level_merge(0,$confs[$k]);
	}
	return $data;
}

function render_str($data){
	preg_match_all('/{{([\s\S]*?)}}/',$data,$mat);
	foreach ($mat[1] as $key => $value) {
		eval('$__m = '.$value.';');
		$data = str_replace($mat[0][$key], $__m, $data);
	}
	return $data;
}

// 配置文件递归
function config_level_merge($pid = 0,$config){
	$data = array();
	foreach ($config as $key => $value) {
		if ($value['pid'] == $pid) {
			unset($config[$key]);
			if ($tmp = config_level_merge($value['id'],$config)) {
				$data[$value['name']] = config_level_merge($value['id'],$config);
			}elseif ($value['value'] != '') {
				$data[$value['name']] = render_config($value['value'],$value['render']);
			}
			// $data[$value['name']] = config_level_merge($value['id'],$config);
			// if (!$data[$value['name']] && $value['value'] != '') {
			// 	$data[$value['name']] = render_config($value['value'],$value['render']);
			// }
		}
	}
	return $data?:'';
}
// 根据类型解析配置文档
function render_config($data,$render){
	switch ($render) {
		case 'string':
			$tmp = $data;
			break;
		case 'number':
			$tmp = (int)$data;
			break;
		case 'bool':
			$tmp = (boolean)$data;
			break;
		case 'float':
			$tmp = (float)$data;
			break;
		case 'item':
			$tmp = explode("\r\n", $data);
			break;
		case 'json':
			$tmp = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", htmlspecialchars_decode($data)),true);
			break;
		case 'ini':
			$tmp = parse_ini_string($data);
			break;
		case 'yaml':
			$tmp = yaml_parse($data);
			break;
		case 'xml':
			$tmp = (array)simplexml_load_string($data);
			break;
		
		default:
			$tmp = '';
			break;
	}
	return $tmp;
}

// /Uploads/pic/20140908/sad35kasu.jpg
function thumb($file,$width=200,$height=200,$type=3){
	$res = __ROOT__.__GROUP__.'/Uploads'.dirname($file).'/thumb_'.$width.'_'.$height.'_'.basename($file);
	$file = '.'.__GROUP__.'/Uploads'.$file;
	$thumbfile = dirname($file).'/thumb_'.$width.'_'.$height.'_'.basename($file);
	if (!is_file($thumbfile)) {
		if (!is_file($file)) {
			return __ROOT__.__GROUP__.'/Public/Image/nopic.gif" width="'.$width.'" height="'.$height;
		}else{
			$image = new \Think\Image();
			$image->open($file);
			$image->thumb($width, $height,$type)->save($thumbfile);
		}
	}
	return $res;
}

// 判断是否为手机号码
function ismobile($mobile){
	if (!preg_match("/1[3458]{1}\d{9}$/",$mobile)) {
		return false;
	}
	return true;
}

// 替换
function str_preg_parse($str,$data){
	return preg_replace_callback('|{\s*\w+}|', function($match) use($data) {
		return isset($data[substr($match[0], 1,-1)])?$data[substr($match[0], 1,-1)]:$match[0];
	}, $str);
}

// 生成树
function data2tree($data,$childrenfield='rows',$pidfield='pid',$idfield='id'){
	$temp = array();
	foreach ($data as $key => $value) {
		$temp[$value[$idfield]] = $value;
	}
	$topid = array();
	foreach ($data as $value) {
		if (!array_key_exists($value[$pidfield], $temp)) {
			$topid[] = $value[$idfield];
		}
	}
	$result = array();
	foreach ($topid as $key => $pid) {
		$result[$key] = $temp[$pid];
		if ($tmp = data2subtree($data,$pid,$childrenfield,$pidfield,$idfield)) {
			$result[$key][$childrenfield] = $tmp;
		}
	}
	return $result;
}

// 数组压制
function data2subtree($arr = array(),$pid = 0,$childrenfield = 'rows',$pidfield='pid',$idfield='id'){
	$temp = array();
	foreach ($arr as $key => $value) {
		if ($value[$pidfield] == $pid) {
			unset($arr[$key]);
			$tmp = data2subtree($arr,$value[$idfield],$childrenfield,$pidfield,$idfield);
			if ($tmp) {
				$value[$childrenfield] = $tmp;
			}
			$temp[] = $value;
		}
	}
	return $temp;
}

// 获取所有子id
function subtreeid($data,$pid=0){
	$res = array();
	foreach ($data as $key => $value) {
		if ($value['pid'] == $pid) {
			$res = array_merge($res, (array)$value['id']);
			$res = array_merge($res, (array)subtreeid($data,$value['id']));
		}
	}
	return $res;
}

// 当前时间
function datetime(){
	return date('Y-m-d H:i:s',$_SERVER['REQUEST_TIME']);
}

// 
function datetimelocal($str){
	return str_replace(' ', 'T', $str);
}