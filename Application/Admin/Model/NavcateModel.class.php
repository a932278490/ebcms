<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class NavcateModel extends RelationModel{

	protected $tableName = 'Navcate';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('title', '1,20', '标题字数介于1-20字', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		array('mark', 'unique', '标识不能重复', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		array('update_time','time',3,'function'),
		array('create_time','time',1,'function'),
		array('status',1,1),
	);

	protected $_link = array(
		'nav'=> array(
			'mapping_type'=> self::HAS_MANY,
			'class_name'=>'nav',
			'mapping_name'=>'nav',
			'foreign_key'=>'category_id'
		)
	);

}