<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class AttachmentModel extends RelationModel{

	protected $tableName = 'attachment';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('title', '1,20', '图片标题字数介于1-20字', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
		array('instruction', '0,250', '图片说明字数限制在250以内', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
		array('ext', '1,20', '文件后缀错误', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
		array('savepath', '1,255', '存储路径长度介于1-255个字符', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
		array('savename', '1,255', '图片名称字数介于1-255字符', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
		array('name', '1,255', '原图片名称字数超过255字符，建议修改名称后上传', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
		array('size', 'number', '图片大小必须为数字', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
		array('sort', 'number', '排序必须为数字', self::EXISTS_VALIDATE, 'regex', self::MODEL_UPDATE),
	);

	// 自动完成规则
	protected $_auto = array (
		array('create_time','time',1,'function'), // 新增时赋值当前时间戳
		array('update_time','time',3,'function'), // 更新候赋值当前时间戳
		array('sort',99,1), // 新增时赋值99
		array('locked',0,1), // 新增时赋值0
	);

	// 关联模型
	protected $_link = array(
		// 'user'=> array(
		// 	'mapping_type'=> self::BELONGS_TO,
		// 	'class_name'=>'User',
		// 	'mapping_name'=>'user',
		// 	'foreign_key'=>'user_id',
		// 	'mapping_fields' => 'nickname',
		// 	'as_fields'=>'nickname:nickname',
		// )
	);
}