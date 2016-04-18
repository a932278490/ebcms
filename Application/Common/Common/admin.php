<?php

function ns($module,$controller){
	return strtolower($module.'_'.$controller);
}

// 检查是否被百度收录
function check_baidu($url) {
	$geturl = 'http://www.baidu.com/s?wd=' . $url;
	if (C('BAIDU_TYPE',null,1)) {
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $geturl);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		$rs = curl_exec($curl);
		curl_close($curl);
	}else{
		$rs = file_get_contents($geturl);
	}
	$kws = $url.'&key=surl';
	if (C('BAIDU_KEYWORDS')) {
		$kws = str_replace('{url}', $url, C('BAIDU_KEYWORDS'));
	}
	if (!strpos($rs,$kws)) {
		return 1;
	}
	return 0;
}

function group($data){
	$res = array();
	foreach ($data as $k => $v) {
		$res[$v['group']][] = $v;
	}
	return $res;
}

// 获取指定模块的某项配置
function get_module_config($module,$field){
	$config = array();
    // 读取应用模式
    $mode = include is_file(CONF_PATH . 'core.php') ? CONF_PATH . 'core.php' : MODE_PATH . APP_MODE . '.php';
    // 加载应用模式配置文件
    foreach ($mode['config'] as $key => $file) {
    	if (is_numeric($key)) {
    		$config = array_merge($config,load_config($file));
    	}else{
    		$config[$key] = load_config($file);
    	}
    }

    // 读取当前应用模式对应的配置文件
    if ('common' != APP_MODE && is_file(CONF_PATH . 'config_' . APP_MODE . CONF_EXT)) {
        $config = array_merge($config,load_config(CONF_PATH . 'config_' . APP_MODE . CONF_EXT));
    }
    if (APP_DEBUG) {
        // 调试模式加载系统默认的配置文件
        $config = array_merge($config,load_config(THINK_PATH . 'Conf/debug.php'));
        // 读取应用调试配置文件
        if (is_file(CONF_PATH . 'debug' . CONF_EXT)) {
        	$config = array_merge($config,load_config(CONF_PATH . 'debug' . CONF_EXT));
        }
    }

	// 读取当前应用状态对应的配置文件
	if (APP_STATUS && is_file(CONF_PATH . APP_STATUS . CONF_EXT)) {
		$config = array_merge($config,load_config(CONF_PATH . APP_STATUS . CONF_EXT));
	}

	// 加载模块配置文件
	if (is_file(APP_PATH . $module . '/Conf/config' . CONF_EXT)) {
		$config = array_merge($config,load_config(APP_PATH . $module . '/Conf/config' . CONF_EXT));
	}

	// 加载应用模式对应的配置文件
	if ('common' != APP_MODE && is_file(APP_PATH . $module . '/Conf/config_' . APP_MODE . CONF_EXT)) {
		$config = array_merge($config,load_config(APP_PATH . $module . '/Conf/config_' . APP_MODE . CONF_EXT));
	}

	// 当前应用状态对应的配置文件
	if (APP_STATUS && is_file(APP_PATH . $module . '/Conf/' . APP_STATUS . CONF_EXT)) {
		$config = array_merge($config,load_config(APP_PATH . $module . '/Conf/' . APP_STATUS . CONF_EXT));
	}
	return $field?$config[$field]:$config;
}

// 对数据按照pid归类排序 返回的不是递归数组
function subtree($data,$pid=0){
	$res = array();
	foreach ($data as $key => $value) {
		if ($value['pid'] == $pid) {
			array_push($res, (array)$value);
			$tmp = (array)subtree($data,$value['id']);
			if (count($tmp)) {
				foreach ($tmp as $key => $value) {
					array_push($res, (array)$value);
				}
			}
		}
	}
	return $res;
}

// 获取数组中标记的项
function array_getmarked($arr = array(),$data='',$eq='id'){

	$arr = is_array($arr)?$arr:redirect('', 2, '不是数组');
	$tmp = array();

	if (is_array($data)) {
		foreach ($arr as $v) {
			if (in_array($v[$eq], $data)) $tmp[] = $v;
		}
	}else{
		foreach ($arr as $v) {
			if ($v[$eq]=$data) $tmp[] = $v;
		}
	}
	return $tmp;
}

// 将数组中选中的项做标记
function array_mark($arr = array(),$data='',$eq='id',$additem = '_mark',$mark = 'checked',$checkp=true){
	if ($checkp) {
		$pid = array();
		foreach ($arr as $key => $value) {
			$pid[$value['pid']] = 1;
		}
	}
	$arr = is_array($arr)?$arr:false;
	$tmp = array();
	
	foreach ($arr as $v) {
		if (!$checkp || ($checkp && !$pid[$v['id']])) {
			$v[$additem] = in_array($v[$eq], (array)$data) ? $mark : '';
		}
		$tmp[] = $v;
	}
	return $tmp;
}

// 
function eb_where(&$value){
	if(preg_match('/^(EXP|EQ|NEQ|GT|EGT|LT|ELT|OR|XOR|LIKE|NOTLIKE|NOT BETWEEN|NOTBETWEEN|BETWEEN|NOTIN|NOT IN|IN) $/i',$value)){
		$value = substr($value, 0, -1);
	}else{
		$value = str_replace(' ', '', $value);
	}
}

// 获取easyui传来的排序字段
function getorder(){
	$eusort = explode(',', I('sort','id'));
	$euorder = explode(',', I('order','desc'));
	$order = '';
	$idsort = 0;
	foreach ($eusort as $key => $value) {
		if ($value == 'id') {
			$idsort = 1;
		}
		$order .= $value.' '.$euorder[$key].',';
	}
	if (!$idsort) {
		$order .='id desc,';
	}
	return substr($order, 0,strlen($order)-1);
}

function getpage(){
	$rows = I('rows',0,'intval');
	$page = I('page',1,'');
	if ($rows) {
		return abs($page) . ',' . abs($rows);
	}
	return '';
}

// 读取所有配置文件
function read_config(){
	$cate = M('Configcate') -> where(array('module'=>array('neq',''),'status'=>array('eq',1))) -> order('sort desc') -> getField('id,module',true);
	foreach ($cate as $key => $value) {
		$cate[$key] = explode('|', $value);
	}
	$tmp = M('Config') -> where(array('status'=>array('eq',1))) -> order('update_time desc') -> getField('id,category_id,pid,name,value,render',true);
	foreach ($tmp as $key => $value) {
		$configs[$value['category_id']][] = $value;
	}
	foreach ($cate as $key => $value) {
		foreach ($value as $k => $v) {
			$data[$v] = array_merge((array)$data[$v],(array)config_level_merge(0,$configs[$key]));
		}
	}
	return $data;
}

// 获取目录下文档 返回数组
function file_in_dir($path){
	$tmp = scandir($path);
	$files = array();
	foreach ($tmp as $value) {
		if ($value != '.' && $value != '..') {
			$files[] = $value;
		}
	}
	return $files;
}

// 删除目录
function deldir($dir) {
	//删除当前文件夹下得文件：
	$dh=opendir($dir);
	while ($file=readdir($dh)) {
		if($file!="." && $file!="..") {
			$fullpath=$dir."/".$file;
			if(!is_dir($fullpath)) {
				unlink($fullpath);
			} else {
				deldir($fullpath);
			}
		}
	}

	closedir($dh);
	//删除当前文件夹：
	if(rmdir($dir)) {
		return true;
	} else {
		return false;
	}
}

// 判断是否为关联数组
function is_assoc($arr) {
	return array_keys($arr) !== range(0, count($arr) - 1);
}

function str2value($value){
	if (is_numeric($value)) {
		return (int)$value;
	}elseif (strtolower($value) == 'true') {
		return true;
	}elseif (strtolower($value) == 'false') {
		return false;
	}elseif (strpos($value, '(s)') === 0){
		return (string)substr($value, 3);
	}else{
		return $value;
	}
}

function value2str($value){
	if (is_bool($value)) {
		if ($value) {
			return 'true';
		}else{
			return 'false';
		}
	}elseif(is_string($value)){
		if (is_numeric($value) || strtolower($value) == 'true' || strtolower($value) == 'false') {
			return '(s)'.$value;
		}else{
			return $value;
		}
	}else{
		return $value;
	}
}

function str2arr($str){
	if (!$str) {
		return '';
	}
	$arr = explode("\r\n", $str);
	$array = array();
	foreach ($arr as $key => $value) {
		if ($value) {
			if (strpos($value, ':')) {
				$tmp = explode(':', $value);
				if (strpos($tmp[1],'|')) {
					$temp = explode('|', $tmp[1]);
					foreach ($temp as $k => $v) {
						$temp[$k] = str2value($v);
					}
					$tmp[1] = $temp;
				}else{
					$tmp[1] = str2value($tmp[1]);
				}
				$array[$tmp[0]] = $tmp[1];
			}else{
				if (strpos($value,'|')) {
					$temp = explode('|', $value);
					foreach ($temp as $k => $v) {
						$temp[$k] = str2value($v);
					}
					$array[] = $temp;
				}else{
					$array[] = str2value($value);
				}
			}
		}
	}
	return $array;
}

function arr2str($arr){
	$str = '';
	foreach ($arr as $key => $value) {
		$str .= is_numeric($key)?'':$key.':';
		if (is_array($value)) {
			foreach ($value as $k => $v) {
				$value[$k] = value2str($v);
			}
			$str .= implode('|', $value)."\r\n";
		}else{
			$str .= value2str($value)."\r\n";
		}
	}
	return substr($str, 0,-2);
}

function str2json($str){
	$array = str2arr($str);
	return json_encode($array);
}

function json2str($json){
	if (!$json) {
		return '';
	}
	$arr = json_decode($json,true);
	return arr2str($arr);
}

function str2ser($str){
	$array = str2arr($str);
	return serialize($array);
}

function ser2str($ser){
	if (!$ser) {
		return '';
	}
	$arr = unserialize($ser);
	return arr2str($arr);
}