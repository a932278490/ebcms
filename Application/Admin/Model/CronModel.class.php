<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class CronModel extends RelationModel{
	
	protected $tableName = 'cron';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('cron', 'require', '任务不能为空', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
		array('cron', 'unique', '任务不能重复', self::VALUE_VALIDATE, 'unique', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		array('config','json_encode',3,'function'),
		array('config',null,3,'ignore'),
		array('create_time','time',1,'function'), 
		array('update_time','time',3,'function'), 
		array('locked',0,1),
	);

	// 关联模型
	protected $_link = array(
	);
}