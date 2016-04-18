<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class ModelModel extends RelationModel{

	protected $tableName = 'model';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('title', '1,20', '标题字数介于1-20字', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
		// array('title', 'unique', '标题不能重复', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
		// array('name', 'unique', '配置项不能重复', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		array('update_time','time',3,'function'),
		array('create_time','time',1,'function'),
		array('status',1,1),
	);

	protected $_link = array(
		'modelfield'=> array(
			'mapping_type'=> self::HAS_MANY,
			'class_name'=>'modelfield',
			'mapping_name'=>'modelfield',
			'foreign_key'=>'category_id'
		)
	);

}