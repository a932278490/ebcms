<?php 
namespace Home\Behavior;
use Think\Behavior;
class ClickBehavior extends Behavior{
	public function run(&$params){
		// 判断是否开启点击数量记录
		if (!C('ARTICLE.RECORD_CLICK')) {
			return;
		};
		$nodes = array(
			'article_detail' => 'Article',
			);
		$node = strtolower(CONTROLLER_NAME.'_'.ACTION_NAME);
		if (isset($nodes[$node])) {
			$_where = array();
			if (I('mark')) {
				$_where['mark'] = array('eq',I('mark'));
			}else{
				$_where['id'] = array('eq',I('id'));
			};
			M($nodes[$node]) -> where($_where)->setInc('click');
		}
	}
}