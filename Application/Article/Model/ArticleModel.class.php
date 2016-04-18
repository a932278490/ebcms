<?php
namespace Article\Model;
use Think\Model\RelationModel;
class ArticleModel extends RelationModel{

	protected $tableName = 'article';

	/* 自动验证规则 */
	protected $_validate = array(
		array('id', 'number', '非法提交', self::MUST_VALIDATE, 'regex', self::MODEL_UPDATE),
		array('title', '1,40', '标题字数介于0-40字', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
		array('mark', 'unique', '标识不能重复', self::VALUE_VALIDATE, 'unique', self::MODEL_BOTH),
		array('keywords', '1,100', '关键字字数介于0-100字', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
		array('description', '0,250', '文章描述不得超过250个字', self::VALUE_VALIDATE , 'length', self::MODEL_BOTH),
		array('sort', 'number', '排序必须为数字', self::VALUE_VALIDATE , 'regex', self::MODEL_BOTH),
		array('status', array('0','1'), '状态错误', self::VALUE_VALIDATE , 'in', self::MODEL_BOTH),
	);

	// 自动完成规则
	protected $_auto = array (
		array('ext','json_encode',3,'function'),
		array('description','getDescription',3,'callback'),
		array('create_time','time',1,'function'),
		array('update_time','time',3,'function'),
	);

	// 关联模型
	protected $_link = array(
		'article_category'=> array(
			'mapping_type'=> self::BELONGS_TO,
			'foreign_key'=>'category_id',
			'class_name'=>'article_category',
			'mapping_name'=>'article_category'
		),
		'article_body'=> array(
			'mapping_type'=> self::HAS_ONE,
			'foreign_key'=>'id',
			'class_name'=>'article_body',
			'mapping_name'=>'article_body'
		),
		'recommendcate'=> array(
			'mapping_type'=> self::MANY_TO_MANY,
			'class_name'=>'recommendcate',
			'mapping_name'=>'recommendcate',
			'mapping_limit'=>'5',
			'mapping_fields'=>'title,iconcls',
			'condition'=>'module = "article"',
			'foreign_key'=>'content_id',
			'relation_foreign_key'=>'category_id',
			'relation_table'=>'__RECOMMEND__',
		),
	);

	// 自动获取文章简介
	protected function getDescription(){
		$d = I('article_body');
		if (!I('description')) {
			$d = I('article_body');
			return mb_substr(strip_tags(htmlspecialchars_decode($d['body'])), 0,250,'utf-8');
		}else{
			return I('description');
		}
	}
}