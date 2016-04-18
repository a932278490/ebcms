<?php
namespace Article\Controller;
class ArticleController extends ProjectController {

	public function add(){
		if (IS_GET) {
			$model = M('Article_category') -> where('id='.I('category_id')) -> getField('model'); 
			$this -> form('',array('ext_id'=>$model));
		}elseif (IS_POST) {
			$p = array(
				'relation' => array('article_body'),
				);
			$this -> ebAdd($p);
		}
	}

	// 更新关键字
	public function _after_add(){
		if (IS_POST) {
			if ($keywords = I('keywords')) {
				$keywords = str_replace(' ', ',', $keywords);
				$keywords = explode(',', $keywords);
				$keywords = array_unique($keywords);
				// 写入新的tag标签
				$m = D('Admin/Tag','Model');
				$keywordsid = array();
				foreach ($keywords as $key => $value) {
					if (!$data = $m -> where(array('tag'=>array('eq',$value))) -> find()) {
						$m -> token(false) -> create(array('tag'=>$value));
						$m -> add();
						$keywordsid[] = array(
							'c_id' => $GLOBALS['LastInsID'],
							'tag_id' => $m -> getLastInsID(),
							'type' => 'article',
							);
					}else{
						$keywordsid[] = array(
							'c_id' => $GLOBALS['LastInsID'],
							'tag_id' => $data['id'],
							'type' => 'article',
							);
					}
				}
				// 插入新的额tag关联
				$m = M('Tags');
				$m -> addAll($keywordsid);
			}
		}
	}

	public function save(){
		if (IS_GET) {
			$data = D('Article') -> relation(true) -> find(I('id','','intval'));
			$this -> form($data,array('ext_id'=>$data['article_category']['model']));
		}elseif (IS_POST) {
			$p = array(
				'relation' => array('article_body'),
				);
			$this -> ebSave($p);
		}
	}

	// 更新关键字
	public function _after_save(){
		if (IS_POST) {
			$id = I('id',0,'intval');
			if ($keywords = I('keywords')) {
				$keywords = str_replace(' ', ',', $keywords);
				$keywords = explode(',', $keywords);
				$keywords = array_unique($keywords);
				// 写入新的tag标签
				$m = D('Admin/Tag','Model');
				$keywordsid = array();
				foreach ($keywords as $key => $value) {
					if (!$data = $m -> where(array('tag'=>array('eq',$value))) -> find()) {
						$m -> token(false) -> create(array('tag'=>$value));
						$m -> add();
						$keywordsid[] = array(
							'c_id' => $id,
							'tag_id' => $m -> getLastInsID(),
							'type' => 'article',
							);
					}else{
						$keywordsid[] = array(
							'c_id' => $id,
							'tag_id' => $data['id'],
							'type' => 'article',
							);
					}
				}
				// 删除旧得tag关联
				$m = M('Tags');
				$_where = array(
					'c_id' => array('eq',$id),
					'type' => 'article',
					);
				$m -> where($_where) -> delete();
				// 插入新的额tag关联
				$m -> addAll($keywordsid);
			}else{
				// 删除旧得tag关联
				$m = M('Tags');
				$_where = array(
					'c_id' => array('eq',$id),
					'type' => 'article',
					);
				$m -> where($_where) -> delete();
			}
		}
	}

}