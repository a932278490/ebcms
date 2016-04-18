<?php
namespace Admin\Controller;
class RecommendController extends CommonController {

	public function add(){
		if (IS_GET) {
			$model = M('Recommendcate') -> where('id='.I('category_id')) -> getField('model');
			$this -> form('',array('ext_id'=>$model));
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$data = D('Recommend') -> relation(true) -> find(I('id','','intval'));
			$this -> form($data,array('ext_id'=>$data['recommendcate']['model']));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

	public function push(){
		if (IS_GET) {
			$data = M(I('moduletype')) -> find(I('id'));
			C('URL_MODEL',get_module_config('Home','URL_MODEL'));
			if ($moduletype = I('moduletype')) {
				switch (strtolower($moduletype)) {
					case 'guestbook':
						$data['title'] = $data['content'];
						$data['description'] = $data['reply'];
						$data['url'] = U('Home/'.ucfirst(I('moduletype')).'/index#id='.$data['id']);
						break;
					
					default:
						$data['url'] = U('Home/'.ucfirst(I('moduletype')).'/detail?id='.$data['id']);
						break;
				}
			}
			$this -> assign($data);
			$this -> success($this -> fetch(I('tpl')));
		}elseif (IS_POST) {
			if (I('__type') == 'getrecommendtype') {
				$_where = array(
					'status' => array('eq',1),
					);
				$recommendcate = M('Recommendcate') -> where($_where) -> order('sort desc,id desc') -> select();
				$recommeded = M('Recommend') -> where(array('module'=>array('eq',I('moduletype')),'content_id'=>array('eq',I('content_id')))) -> getField('category_id',true);
				$result = array(
					'rows' => array_mark($recommendcate,$recommeded,'id','checked',true),
					);
				$this -> success($result);
			}else{
				$content_id = I('content_id');
				$moduletype = I('moduletype');
				$category_ids = I('category_ids');
				$title = I('title');
				$thumb = I('thumb');
				$description = I('description');
				$sort = I('sort');
				$url = I('url');
				// 删除旧数据
				M('Recommend') -> where(array('content_id'=>array('eq',$content_id),'module'=>array('eq',$moduletype))) -> delete();
				$data = array();
				foreach ($category_ids as $k => $category_id) {
					$data[] = array(
						'content_id' => $content_id,
						'module' => $moduletype,
						'category_id' => $category_id,
						'title' => $title,
						'thumb' => $thumb,
						'description' => $description,
						'sort' => $sort,
						'url' => $url,
						);
				}
				if (empty($data) || false !== M('Recommend') -> addAll($data)) {
					$this -> success('推荐位更新成功');
				}else{
					$this -> error(M('Recommend') -> getDbError());
				}
			}
		}
	}
}