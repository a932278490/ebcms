<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用入口文件

// 检测PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
// define('APP_DEBUG',true);

// 开启开发者模式
// define('APP_DEVELOP',true);

// 开启多站点模式
define('MULT_SITE',false);

// 定义网站目录
if (defined('MULT_SITE') && MULT_SITE == true) {
	if (strpos($_SERVER['HTTP_HOST'], 'www.')===0) {
		define('__GROUP__','/'.strtolower(substr($_SERVER['HTTP_HOST'], 4)));
	}else{
		define('__GROUP__','/'.strtolower($_SERVER['HTTP_HOST']));
	}
}else{
	define('__GROUP__','');
}

// 定义应用目录
define('APP_PATH','.'.__GROUP__.'/Application/');

// 定义运行时目录
define('RUNTIME_PATH','.'.__GROUP__.'/Runtime/');

// 引入ThinkPHP入口文件
require '.'.__GROUP__.'/ThinkPHP/ThinkPHP.php';

// 亲^_^ 后面不需要任何代码了 就是如此简单