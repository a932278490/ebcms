<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class NavModel extends RelationModel{

	protected $tableName = 'nav';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('pid', 'number', '未指定分组', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
		array('title', '1,20', '标题字数介于1-20字', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		array('sort', 'number', '排序必须为数字', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
		array('status', array('0','1'), '状态错误', self::VALUE_VALIDATE, 'in', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		array('ext','json_encode',3,'function'),
		array('create_time','time',1,'function'),
		array('update_time','time',3,'function'),
	);

	// 关联模型
	protected $_link = array(
		'navcate'=> array(
			'mapping_type'=> self::BELONGS_TO,
			'foreign_key'=>'category_id',
			'class_name'=>'navcate',
			'mapping_name'=>'navcate'
		),
	);
}