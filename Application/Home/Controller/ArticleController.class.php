<?php
namespace Home\Controller;
use Think\Controller;
class ArticleController extends CommonController {

	public function index(){
		if (IS_GET) {
			$this -> SEO = array(
				'title' =>  C('article.title'),
				'keywords'  =>  C('article.keywords'),
				'description'   =>  C('article.description'),
				);
			if (C('article.pageable')) {
				$m = D('Article','ViewModel');
				$_where = array(
					'status' => array('eq',1),
					);
				$count = $m -> where($_where) -> count();
				$Page = new \Common\Vendor\Page($count,C('article.pagenum'));
				$this -> lists = $m -> where($_where) -> order(C('article.order')) -> limit($Page->firstRow.','.$Page->listRows) -> select();
				$this -> pages = $Page->show();
				$this -> display('index_page');
			}else{
				$this -> display();
			}
		}
	}

	// 栏目
	public function category(){
		if (IS_GET) {
			$id = I('id');
			$category = get_article_category($id);
			if ($category && $category['status']) {
				$this -> category = $category;
				if ($category['datatype']) {
					$m = D('Article','ViewModel');
					switch ($category['datatype']) {
						case '1'://当前栏目
							$_where = array(
								'category_id' => array('eq',$id),
								'status' => array('eq',1),
								);
							break;
						case '2'://子栏目
							$ids = get_subid(get_article_category(),$id,false);
							if ($ids) {
								$_where = array(
									'category_id' => array('in',$ids),
									'status' => array('eq',1),
									);
							}else{
								$_where = array(
									'category_id' => array('eq',-1),
									'status' => array('eq',1),
									);
							}
							break;
						case '3'://子级栏目
							$ids = get_subid(get_article_category(),$id,true);
							if ($ids) {
								$_where = array(
									'category_id' => array('in',$ids),
									'status' => array('eq',1),
									);
							}else{
								$_where = array(
									'category_id' => array('eq',-1),
									'status' => array('eq',1),
									);
							}
							break;
						case '4'://所有栏目
							$_where = array(
								'status' => array('eq',1),
								);
							break;
					}
					if ($category['pagenum']) {
						$count = $m -> where($_where) -> count();
						$Page = new \Common\Vendor\Page($count,$category['pagenum']);
						$this -> lists = $m -> where($_where) -> order($category['order']) -> limit($Page->firstRow.','.$Page->listRows) -> select();
						$this -> pages = $Page->show();
					}else{
						$this -> lists = $m -> where($_where) -> order($category['order']) -> select();
					}
					$this -> SEO = array(
						'title' =>  $category['title']?:$category['title'],
						'keywords'  =>  $category['keywords'],
						'description'   =>  $category['description'],
						);
				}
				$this -> display($category['tpl']);
			}else{
				$this -> error('栏目不存在!');
			}
		}
	}

	// 内容详细页面
	public function detail(){
		if (!$article = D('Article','ViewModel') -> find(I('id',0,'intval'))) {
			$this -> error('对不起，你所访问的内容不存在！');
		}
		$category = get_article_category($article['category_id']);
		if ($category['status']!=1) {
			$this -> error('对不起，你所访问的内容不存在！');
		}
		$article['ext'] = json_decode($data['ext'],true);
		$this -> article = $article;
		$this -> category = $category;
		$this -> SEO = array(
			'title' =>  $article['title'],
			'keywords'  =>  $article['keywords'],
			'description'   =>  $article['description'],
			);
		$this -> display($article['tpl']?:$category['tpl_detail']);
	}
}