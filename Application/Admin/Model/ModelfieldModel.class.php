<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class ModelfieldModel extends RelationModel{

	protected $tableName = 'modelfield';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		// array('type', array('string','ini','json','array'), '类型错误', self::MUST_VALIDATE, 'in', self::MODEL_BOTH),
		array('title', '1,40', '标题字数介于0-40字', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
		array('name', 'require', '配置项不能为空', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
		// array('name', 'unique', '配置项不能重复', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
		array('instruction', '0,250', '说明不得超过250个字', self::VALUE_VALIDATE , 'length', self::MODEL_BOTH),
		array('sort', 'number', '排序必须为数字', self::VALUE_VALIDATE , 'regex', self::MODEL_BOTH),
		array('status', array('0','1'), '状态错误', self::VALUE_VALIDATE , 'in', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array ( 
		array('config','json_encode',3,'function'),
		array('config',null,3,'ignore'),
		array('create_time','time',1,'function'), 
		array('update_time','time',3,'function'), 
		array('locked',0,1), // 对lock字段在新增的时候赋值0
	);
}