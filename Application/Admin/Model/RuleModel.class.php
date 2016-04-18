<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class RuleModel extends RelationModel{

	protected $tableName = 'auth_rule';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('name', 'unique', '规则不能重复', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
		// array('title', '1,40', '标题字数介于0-40字', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		// array('url', '1,100', '网址字数介于0-100字', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		// array('description', '0,250', '文章描述不得超过250个字', self::VALUE_VALIDATE , 'length', self::MODEL_BOTH),
		// array('sort', 'number', '排序必须为数字', self::VALUE_VALIDATE , 'regex', self::MODEL_BOTH),
		// array('status', array('0','1'), '状态错误', self::VALUE_VALIDATE , 'in', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array ( 
		// array('create_time','time',1,'function'), 
		// array('update_time','time',3,'function'), 
	);

	// 关联模型
	protected $_link = array(
		// 'article_body'=> array(
		// 	'mapping_type'=> self::HAS_ONE,
		// 	'foreign_key'=>'id',
		// 	'class_name'=>'article_body',
		// 	'mapping_name'=>'article_body'
		// )
	);
}