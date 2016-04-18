<?php
namespace Home\Taglib;
use Think\Template\TagLib;
class Qy extends TagLib{

	// 标签定义
	protected $tags =  array(
		// 基本
		'print'					=>	array('attr'=>'name','close'=>0),
		'fn'					=>	array('attr'=>'name,fn,param,return','close'=>0),
		'navlist'				=>	array('attr'=>'mark,tree,pid,limit,return','close'=>0),
		'linklist'				=>	array('attr'=>'limit,return','close'=>0),
		'guestbooklist'			=>	array('attr'=>'limit,return','close'=>0),
		'recommendlist'			=>	array('attr'=>'mark,limit,return','close'=>0),
		// 文章
		'articlecategory'		=>	array('attr'=>'id,pid,tree,return','close'=>0),
		'articlelist'			=>	array('attr'=>'category_id,category_mark,level,moreinfo,order,limit,return','close'=>0),
		'articlerelation'		=>	array('attr'=>'id,moreinfo,limit,return','close'=>0),
		'articlecontent'		=>	array('attr'=>'id,mark,return','close'=>0),
		);

	// 文章分类
	public function _articlecategory($tag,$content){
		if (empty($tag['return'])) {//return为空 返回空
			$tag['return'] = '_data';
		}
		$str = '';
		$str .="<?php ";
		$str .="unset(\${$tag['return']});";
		if (isset($tag['id'])) {
			if ('$' == substr($tag['id'],0,1)) {
				$tag['id']   = $this->autoBuildVar(substr($tag['id'], 1));
				$str .="\${$tag['return']} = get_article_category({$tag['id']});";
			}else{
				$str .="\${$tag['return']} = get_article_category('{$tag['id']}');";
			}
		}elseif(isset($tag['pid'])){
			$str .="\$_categorys = get_article_category();";
			if ('$' == substr($tag['pid'],0,1)) {
				$tag['pid']   = $this->autoBuildVar(substr($tag['pid'], 1));
				if (isset($tag['tree']) && $tag['tree'] == 1) {
					$str .="\${$tag['return']} = data2subtree(\$_categorys,{$tag['pid']});";
				}else{
					$str .="\${$tag['return']} = data2sub(\$_categorys,{$tag['pid']});";
				}
			}else{
				if (isset($tag['tree']) && $tag['tree'] == 1) {
					$str .="\${$tag['return']} = data2subtree(\$_categorys,'{$tag['pid']}');";
				}else{
					$str .="\${$tag['return']} = data2sub(\$_categorys,'{$tag['pid']}');";
				}
			}
		}else{
			$str .="\$_categorys = get_article_category();";
			if (isset($tag['tree']) && $tag['tree'] == 1) {
				$str .="\${$tag['return']} = \$_categorys;";
			}else{
				$str .="\${$tag['return']} = data2tree(\$_categorys);";
			}
		}
		$str .=" ?>";
		return $str;
	}

	// 文章列表
	public function _articlelist($tag,$content) {
		if (empty($tag['return'])) {//return为空 返回空
			$tag['return'] = '_data';
		}
		$str = '';
		$str .="<?php ";
		$str .="unset(\${$tag['return']});";
		if (isset($tag['moreinfo']) && $tag['moreinfo']==1) {
			$str .="\$_m = D('Article','ViewModel');";
		}else{
			$str .="\$_m = M('Article');";
		}
		
		if (isset($tag['order'])) {
			$str .="\$_m -> order('{$tag['order']}');";
		}else{
			$str .="\$_m -> order('id desc');";
		}
		$str .="\$_where = array();";
		// 解析 category_id/category_mark 限制
		if (isset($tag['category_id']) || isset($tag['category_mark'])) {
			if (isset($tag['category_id'])) {
				if ('$' == substr($tag['category_id'],0,1)) {
					$tag['category_id']   = $this->autoBuildVar(substr($tag['category_id'], 1));
					$str .="\$_category_id = {$tag['category_id']};";
				}else{
					$str .="\$_category_id = '{$tag['category_id']}';";
				}
			}elseif(isset($tag['category_mark'])){
				if ('$' == substr($tag['category_mark'],0,1)) {
					$tag['category_mark']   = $this->autoBuildVar(substr($tag['category_mark'], 1));
					$str .="\$_category_id = M('Article_category') -> where(array('mark'=>array('eq',{$tag['category_mark']}))) -> limit(1) -> getField('id');";
				}else{
					$str .="\$_category_id = M('Article_category') -> where(array('mark'=>array('eq','{$tag['category_mark']}'))) -> limit(1) -> getField('id');";
				}
			}
			if (isset($tag['level']) && $tag['level'] == 1) {
				$str .="\$_ids = get_subid(get_article_category(),\$_category_id,true);";
				$str .="\$_where['category_id'] = array('in',array_merge(\$_ids,(array)\$_category_id));";
			}else{
				$str .="\$_where['category_id'] = array('eq',\$_category_id);";
			}
		}
		$str .="\$_where['status'] = array('eq',1);";
		$str .="\$_m -> where(\$_where);";
		// 解析limit限制属性
		if (isset($tag['limit'])) {
			if ('$' == substr($tag['limit'],0,1)) {
				$tag['limit']   = $this->autoBuildVar(substr($tag['limit'], 1));
				$str .="\$_m -> limit({$tag['limit']});";
			}else{
				$str .="\$_m -> limit('{$tag['limit']}');";
			}
		}
		$str .="\${$tag['return']} = \$_m -> select();";
		$str .=" ?>";
		return $str;
	}

	// 关联文章列表 id,moreinfo,limit,return
	public function _articlerelation($tag,$content) {
		if (empty($tag['return'])) {//return为空 返回空
			$tag['return'] = '_data';
		}
		$str = '';
		$str .="<?php ";
		$str .="unset(\${$tag['return']});";
		$str .="\$_where = array();";
		// id 
		if (isset($tag['id'])) {
			if ('$' == substr($tag['id'],0,1)) {
				$tag['id'] = $this->autoBuildVar(substr($tag['id'], 1));
				$str .="\$_where['c_id'] = array('eq',{$tag['id']});";
			}else{
				$str .="\$_where['c_id'] = array('eq','{$tag['id']}');";
			}
		}else{
			$str .="\$_where['c_id'] = array('eq',I('id',0,'intval'));";
		}
		$str .="\$_tag_ids = M('Tags') -> where(\$_where) -> getField('tag_id',true);";
		$str .="if(\$_tag_ids) :";
		$str .="\$_where = array();";
		$str .="\$_where['tag_id'] = array('in',array_unique(\$_tag_ids));";
		if (isset($tag['id'])) {
			if ('$' == substr($tag['id'],0,1)) {
				$tag['id'] = $this->autoBuildVar(substr($tag['id'], 1));
				$str .="\$_where['c_id'] = array('neq',{$tag['id']});";
			}else{
				$str .="\$_where['c_id'] = array('neq','{$tag['id']}');";
			}
		}else{
			$str .="\$_where['c_id'] = array('neq',I('id',0,'intval'));";
		}
		$str .="\$_where['type'] = array('eq','article');";
		$str .="\$_c_ids = M('Tags') -> where(\$_where) -> group('c_id') -> order('c_id desc') -> limit('200') -> getField('c_id',true);";
		$str .="if(\$_c_ids) :";
		if (isset($tag['moreinfo']) && $tag['moreinfo']==1) {
			$str .="\$_m = D('Article','ViewModel');";
		}else{
			$str .="\$_m = M('Article');";
		}
		// 解析limit限制属性
		if (isset($tag['limit'])) {
			if ('$' == substr($tag['limit'],0,1)) {
				$tag['limit']   = $this->autoBuildVar(substr($tag['limit'], 1));
				$str .="\$_m -> limit({$tag['limit']});";
			}else{
				$str .="\$_m -> limit('{$tag['limit']}');";
			}
		}
		$str .="\$_where=array();";
		$str .="\$_where['id']=array('in',\$_c_ids);";
		$str .="\$_where['status']=array('eq',1);";
		$str .="\${$tag['return']} = \$_m -> where(\$_where) -> order('id desc') -> select();";
		$str .="endif;";
		$str .="endif;";
		$str .=" ?>";
		return $str;
	}

	// 解析内容标签 mark,id,return
	public function _articlecontent($tag,$content,$module='Article'){
		if (empty($tag['id']) && empty($tag['mark'])) {//module或者return为空 返回空
			return;
		}
		if (empty($tag['return'])) {//return为空 返回空
			$tag['return'] = '_data';
		}
		$str = '';
		$str .="<?php ";
		$str .="unset(\${$tag['return']});";
		$str .="\$_m = D('{$module}','ViewModel');";
		$str .="\$_where = array();";
		// id限制
		if (isset($tag['id'])) {
			if ('$' == substr($tag['id'],0,1)) {
				$tag['id'] = $this->autoBuildVar(substr($tag['id'], 1));
				$str .="\$_where['id'] = array('eq',{$tag['id']});";
			}else{
				$str .="\$_where['id'] = array('eq','{$tag['id']}');";
			}
		}else{
			if ('$' == substr($tag['mark'],0,1)) {
				$tag['mark'] = $this->autoBuildVar(substr($tag['mark'], 1));
				$str .="\$_where['mark'] = array('eq',{$tag['mark']});";
			}else{
				$str .="\$_where['mark'] = array('eq','{$tag['mark']}');";
			}
		}
		$str .="\$_where['status'] = array('eq',1);";
		$str .="\$_m -> where(\$_where);";
		$str .="\${$tag['return']} = \$_m -> find();";
		$str .=" ?>";
		return $str;
	}

	// 
	public function _navlist($tag,$content) {
		if (empty($tag['mark'])) {//mark为空 返回空
			return;
		}
		if (empty($tag['return'])) {//return为空 返回空
			$tag['return'] = '_data';
		}
		$str = '';
		$str .="<?php ";
		$str .="unset(\${$tag['return']});";
		$str .="\$_m = M('Nav');";
		$str .="\$_m -> order('sort desc,id desc');";
		$str .="\$_where = array();";
		// 解析 mark 限制
		if ('$' == substr($tag['mark'],0,1)) {
			$tag['mark']   = $this->autoBuildVar(substr($tag['mark'], 1));
			$str .="\$_category_id = M('Navcate') -> where(array('mark'=>array('eq',{$tag['mark']}),'status'=>array('eq',1))) -> limit(1) -> getField('id');";
		}else{
			$str .="\$_category_id = M('Navcate') -> where(array('mark'=>array('eq','{$tag['mark']}'),'status'=>array('eq',1))) -> limit(1) -> getField('id');";
		}
		$str .="\$_where['category_id'] = array('eq',\$_category_id);";
		$str .="\$_where['status'] = array('eq',1);";
		// 解析 tree 限制
		if (isset($tag['tree']) && $tag['tree'] == 1) {
			$str .="\${$tag['return']}_tmp = \$_m -> where(\$_where) -> select();";
			// pid限制
			if (isset($tag['pid'])) {
				if ('$' == substr($tag['pid'],0,1)) {
					$tag['pid']   = $this->autoBuildVar(substr($tag['pid'], 1));
					$str .="\${$tag['return']} = data2subtree(\${$tag['return']}_tmp,{$tag['pid']});";
				}else{
					$str .="\${$tag['return']} = data2subtree(\${$tag['return']}_tmp,'{$tag['pid']}');";
				}
			}else{
				$str .="\${$tag['return']} = data2tree(\${$tag['return']}_tmp);";
			}
		}else{
			// 解析limit限制属性
			if (isset($tag['limit'])) {
				if ('$' == substr($tag['limit'],0,1)) {
					$tag['limit']   = $this->autoBuildVar(substr($tag['limit'], 1));
					$str .="\$_m -> limit({$tag['limit']});";
				}else{
					$str .="\$_m -> limit('{$tag['limit']}');";
				}
			}
			// pid限制
			if (isset($tag['pid'])) {
				if ('$' == substr($tag['pid'],0,1)) {
					$tag['pid']   = $this->autoBuildVar(substr($tag['pid'], 1));
					$str .="\$_where['pid'] = array('eq',{$tag['pid']});";
				}else{
					$str .="\$_where['pid'] = array('eq','{$tag['pid']}');";
				}
			}
			$str .="\$_m -> where(\$_where);";
			$str .="\${$tag['return']} = \$_m -> select();";
		}
		$str .=" ?>";
		return $str;
	}

	// 
	public function _linklist($tag,$content,$module='Link') {
		if (empty($tag['return'])) {//return为空 返回空
			$tag['return'] = '_data';
		}
		$str = '';
		$str .="<?php ";
		$str .="unset(\${$tag['return']});";
		$str .="\$_m = M('{$module}');";
		$str .="\$_m -> order('sort desc,id desc');";
		$str .="\$_where = array();";
		$str .="\$_where['status'] = array('eq',1);";
		$str .="\$_m -> where(\$_where);";
		// 解析limit限制属性
		if (isset($tag['limit'])) {
			if ('$' == substr($tag['limit'],0,1)) {
				$tag['limit']   = $this->autoBuildVar(substr($tag['limit'], 1));
				$str .="\$_m -> limit({$tag['limit']});";
			}else{
				$str .="\$_m -> limit('{$tag['limit']}');";
			}
		}
		$str .="\${$tag['return']} = \$_m -> select();";
		$str .=" ?>";
		return $str;
	}

	public function _guestbooklist($tag,$content){
		return $this -> _linklist($tag,$content,'Guestbook');
	}

	// categoryid,limit,return
	public function _recommendlist($tag,$content) {
		if (empty($tag['mark'])) {
			return;
		}
		if (empty($tag['return'])) {//return为空 返回空
			$tag['return'] = '_data';
		}
		$str = '';
		$str .="<?php ";
		$str .="unset(\${$tag['return']});";
		$str .="\$_category_id = M('Recommendcate') -> where(array('mark'=>array('eq','{$tag['mark']}'),'status'=>array('eq',1))) -> getField('id');";
		$str .="\$_m = M('Recommend');";
		$str .="\$_m -> order('sort desc,id desc');";
		$str .="\$_where = array();";
		$str .="\$_where['category_id'] = array('eq',\$_category_id);";
		$str .="\$_where['status'] = array('eq','1');";
		$str .="\$_m -> where(\$_where);";
		if (isset($tag['limit'])) {
			if ('$' == substr($tag['limit'],0,1)) {
				$tag['limit']   = $this->autoBuildVar(substr($tag['limit'], 1));
				$str .="\$_m -> limit({$tag['limit']});";
			}else{
				$str .="\$_m -> limit('{$tag['limit']}');";
			}
		}
		$str .="\${$tag['return']} = \$_m -> select();";
		$str .=" ?>";
		return $str;
	}

	// print调试标签
	public function _print($tag,$content) {
		if (empty($tag['name'])) {
			return;
		}
		if ('$' == substr($tag['name'],0,1)) {//当为变量的时候
			$name   = $this->autoBuildVar(substr($tag['name'], 1));
		}else{
			$name   = $this->autoBuildVar($tag['name']);
		}
		$str = "<?php ";
		$str .= "p({$name});";
		$str .= " ?>";
		return $str;
	}

	// fn函数
	public function _fn($tag,$content){
		if (empty($tag['name']) || empty($tag['fn'])) {
			return;
		}
		// 模板禁止使用函数
		$template_deny_funs = explode(',',C('TMPL_DENY_FUNC_LIST'));
		if(!in_array($tag['fn'],$template_deny_funs)){
			$tag['name'] = $this->autoBuildVar($tag['name']);
			$str = '';
			$str .= '<?php ';
			if (isset($tag['return'])) {
				$str .= "\${$tag['return']} = ";
			} else {
				$str .= "{$tag['name']} = ";
			}
			
			if(isset($tag['param'])){
				if(strstr($tag['param'],'###')){
					$tag['param'] = str_replace('###',$tag['name'],$tag['param']);
					$str .= "{$tag['fn']}({$tag['param']});";
				}else{
					$str .= "{$tag['fn']}({$tag['name']},{$tag['param']});";
				}
			}else{
				$str .= "{$tag['fn']}({$tag['name']});";
			}
			$str .= " ?>";
			return $str;
		}
	}

}
