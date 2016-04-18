<?php 
//初始安装配置文档！请勿手动修改
return array (
	'ERROR_PAGE'  =>  'http://'.$_SERVER['HTTP_HOST'].__ROOT__.'/index.php/Install/Index/index',
	'DEFAULT_MODULE' => 'Install',
	'MODULE_ALLOW_LIST' => 
	array (
		0 => 'Install',
	),
	'TMPL_PARSE_STRING' => 
	array (
		'__THIRD__' => __ROOT__.__GROUP__.'/Public/Third',
		'__CSS__' => __ROOT__.__GROUP__.'/Public/Css',
		'__JS__' => __ROOT__.__GROUP__.'/Public/Js',
		'__IMAGE__' => __ROOT__.__GROUP__.'/Public/Image',
	),
);