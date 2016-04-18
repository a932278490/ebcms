<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class RecommendModel extends RelationModel{

	protected $tableName = 'recommend';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('title', '1,40', '标题字数介于0-40字', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		array('description', '0,250', '文章描述不得超过250个字', self::VALUE_VALIDATE , 'length', self::MODEL_BOTH),
		array('sort', 'number', '排序必须为数字', self::VALUE_VALIDATE , 'regex', self::MODEL_BOTH),
		array('status', array('0','1'), '状态错误', self::VALUE_VALIDATE , 'in', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		array('ext','json_encode',3,'function'),
		array('create_time','time',1,'function'), 
		array('update_time','time',3,'function'), 
	);

	// 关联模型
	protected $_link = array(
		'recommendcate'=> array(
			'mapping_type'=> self::BELONGS_TO,
			'foreign_key'=>'category_id',
			'class_name'=>'recommendcate',
			'mapping_name'=>'recommendcate'
		),
	);
}