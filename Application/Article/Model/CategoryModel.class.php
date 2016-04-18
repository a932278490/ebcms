<?php
namespace Article\Model;
use Think\Model\RelationModel;
class CategoryModel extends RelationModel{

	protected $tableName = 'article_category';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('title', '1,20', '标题字数介于1-20字', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		array('mark', 'unique', '标识不能重复', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
		array('keywords', '1,80', '关键字字数介于1-80字', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
		array('description', '1,255', '描述字数介于1-255字', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		array('update_time','time',3,'function'),
		array('create_time','time',1,'function'),
		array('ext','json_encode',3,'function'),
		array('status',1,1),
	);

	protected $_link = array(
		'article'=> array(
			'mapping_type'=> self::HAS_MANY,
			'class_name'=>'article',
			'mapping_name'=>'article',
			'foreign_key'=>'category_id'
		)
	);

}