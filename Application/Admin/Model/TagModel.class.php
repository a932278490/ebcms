<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class TagModel extends RelationModel{

	protected $tableName = 'tag';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('tag', '1,40', '标题字数介于0-40字', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		array('sort', 'number', '排序必须为数字', self::VALUE_VALIDATE , 'regex', self::MODEL_BOTH),
		array('status', array('0','1'), '状态错误', self::VALUE_VALIDATE , 'in', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		array('create_time','time',1,'function'),
		array('update_time','time',3,'function'),
	);

	// 关联模型
	protected $_link = array(
		'tags'=> array(
			'mapping_type'=> self::HAS_MANY,
			'class_name'=>'tags',
			'mapping_name'=>'tags',
			'foreign_key'=>'tag_id'
		)
	);
}