<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class GuestbookModel extends RelationModel{

	protected $tableName = 'guestbook';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('sort', 'number', '排序必须为数字', self::VALUE_VALIDATE , 'regex', self::MODEL_BOTH),
		array('status', array('0','1'), '状态错误', self::VALUE_VALIDATE , 'in', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		// array('update_time','time',3,'function'),
	);

	// 关联模型
	protected $_link = array(
		'recommendcate'=> array(
			'mapping_type'=> self::MANY_TO_MANY,
			'class_name'=>'recommendcate',
			'mapping_name'=>'recommendcate',
			'mapping_limit'=>'5',
			'mapping_fields'=>'title,iconcls',
			'condition'=>'module = "guestbook"',
			'foreign_key'=>'content_id',
			'relation_foreign_key'=>'category_id',
			'relation_table'=>'__RECOMMEND__',
		),
	);
}