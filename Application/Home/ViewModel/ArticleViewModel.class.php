<?php
namespace Home\ViewModel;
use Think\Model\ViewModel;
class ArticleViewModel extends ViewModel {
	public $viewFields = array(
		'Article'=>array(
			'_type'=>'LEFT',
			'id',
			'category_id',
			'title',
			'keywords',
			'description',
			'thumb',
			'tpl',
			'ext',
			'click',
			'sort',
			'status',
			'user_id',
			'update_time',
			'create_time',
			'locked',
			),
		'Article_body'=>array(
			'_type'=>'LEFT',
			'_on'=>'Article_body.id=Article.id',
			'body'=>'body',
			),
		'User'=>array(
			'_on'=>'Article.user_id=User.id',
			'nickname',
			'avatar',
			),
	);
}