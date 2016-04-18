<?php 
//配置文件由系统自动生成，如非必要请在后台修改！
return array (
  'DATA_BACKUP_COMPRESS' => false,
  'DATA_BACKUP_COMPRESS_LEVEL' => 4,
  'DATA_BACKUP_PART_SIZE' => 2048000,
  'DATA_BACKUP_PATH' => '.'.__GROUP__.'/Backup',
  'DEVLOG' => false,
  'EDITFILE_EXT' => 
  array (
    0 => 'html',
    1 => 'css',
    2 => 'js',
    3 => 'txt',
  ),
  'OPLOG' => true,
  'TAGLIB_BUILD_IN' => 'Cx,Common\\Taglib\\Core',
  'TMPL_PARSE_STRING' => 
  array (
    '__THIRD__' => __ROOT__.__GROUP__.'/Public/Third',
    '__CSS__' => __ROOT__.__GROUP__.'/Public/Css',
    '__JS__' => __ROOT__.__GROUP__.'/Public/Js',
    '__IMAGE__' => __ROOT__.__GROUP__.'/Public/Image',
  ),
  'TOKEN_NAME' => '__hash__',
  'TOKEN_ON' => true,
  'TOKEN_RESET' => false,
  'TOKEN_TYPE' => 'md5',
  'URL_MODEL' => false,
);