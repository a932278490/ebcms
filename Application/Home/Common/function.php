<?php 
// 获取网站位置
function position($home = '首页'){
	$pos = array();
	array_push($pos, array(
		'title' => $home,
		'url' => 'Index/index',
		));
	$tmp = FC(strtolower('SEO.site_'.CONTROLLER_NAME));
	switch (strtolower(CONTROLLER_NAME)) {
		case 'article':
			switch (strtolower(ACTION_NAME)) {
				case 'index':
					array_push($pos, array(
						'title' => '新闻中心',
						'url' => CONTROLLER_NAME.'/index',
						));
					break;
				case 'category':
					if ($pdata = get_p_data(I('id'),get_article_category())) {
						foreach ($pdata as $value) {
							array_push($pos, array(
								'title' => $value['title']?:$value['title'],
								'url' => CONTROLLER_NAME.'/category?id='.$value['id'],
								));
						}
					}
					break;

				case 'detail':
					if (I('id')) {
						$_where = array('id'=>array('eq',I('id')));
					}
					$data = M('Article') -> where($_where) -> find();
					if ($data) {
						$category = get_article_category($data['category_id']);
						if ($pdata = get_p_data($data['category_id'],get_article_category())) {
							foreach ($pdata as $value) {
								array_push($pos, array(
									'title' => $value['title']?:$value['title'],
									'url' => CONTROLLER_NAME.'/category?id='.$value['id'],
									));
							}
						}
					}
					break;
				
				default:
					break;
			}
			break;

		case 'guestbook':
			array_push($pos, array(
				'title' => '留言板',
				'url' => CONTROLLER_NAME.'/index',
				));
			break;

		case 'member':
			array_push($pos, array(
				'title' => '会员中心',
				'url' => CONTROLLER_NAME.'/index',
				));
			break;

		default:
			# code...
			break;
	}
	return $pos;
}

function mycfg($k){
	return FC('CUSTOM_CONFIG.'.$k);
}

// 获取子栏目id
function get_subid($data,$pid,$level){
	$ids = array();
	foreach ($data as $value) {
		if ($value['pid'] == $pid) {
			$ids[] = $value['id'];
			if ($level) {
				$ids = array_merge($ids,get_subid($data,$value['id'],$level));
			}
		}
	}
	return $ids;
}

// 获取父id
function get_p_data($id,$data){
	if ($data[$id]) {
		$tmp = array($data[$id]);
		if (isset($data[$data[$id]['pid']])) {
			$tmp = array_merge(get_p_data($data[$id]['pid'],$data),$tmp);
		}
		return $tmp;
	}
	return;
}

// 改变数组的键值对
function array_key_value($data,$keyfield='id',$valuefield=''){
	$res = array();
	if ($valuefield) {
		foreach ($data as $value) {
			$res[$value[$keyfield]] = $value[$valuefield];
		}
	}else{
		foreach ($data as $value) {
			$res[$value[$keyfield]] = $value;
		}
	}
	return $res;
}

// 获取所有的子类
function data2sub($data,$pid,$pidfield='pid'){
	$res = array();
	foreach ($data as $value) {
		if ($value[$pidfield] == $pid) {
			$res[] = $value;
		}
	}
	return $res;
}

// 获取文章栏目
function get_article_category($id){
	static $categorys;
	if (!$categorys) {
		$_where = array(
			'status'=>array('eq',1),
			);
		$categorys = M('Article_category') -> where($_where) -> order('sort desc,id desc') -> select();
		$categorys = array_key_value($categorys);
	}
	return $id?$categorys[$id]:$categorys;
}