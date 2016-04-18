<?php
namespace Admin\Model;
use Think\Model\RelationModel;
class UserModel extends RelationModel{

	protected $tableName='user';

	/* 自动验证规则 */
	protected $_validate = array(
		array('nickname', '2,8', '昵称长度介于2-8字符', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		array('nickname', 'unique', '昵称已被注册，请更换', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
		array('email', 'unique', '邮箱已经注册，请更换', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
		array('password', '5,12', '密码长度介于5-12字', self::MUST_VALIDATE, 'length', self::MODEL_INSERT),
	);

	// 自动完成规则
	protected $_auto = array ( 
		array('password','',2,'ignore'),
		array('password','crypt_pwd',1,'function'),
		array('create_time','time',1,'function'),
		array('update_time','time',3,'function'),
	);

	protected $_link = array(
		'group'=> array(
			'mapping_type'	=> self::MANY_TO_MANY,
			'class_name'=>'auth_group',
			'mapping_name'=>'group',
			'foreign_key'=>'uid',
			'relation_foreign_key'=>'group_id',
			'relation_table'=>'__AUTH_GROUP_ACCESS__',
		),
	);
}