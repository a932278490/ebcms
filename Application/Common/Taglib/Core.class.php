<?php
namespace Common\Taglib;
use Think\Template\TagLib;
class Core extends TagLib{

	// 标签定义
	protected $tags = array(
		'lists'		=>	array('attr'=>'module,relation,tree,group,return','close'=>0),
		'content'	=>	array('attr'=>'id,module,relation,return','close'=>0),
		'print'		=>	array('attr'=>'name','close'=>0),
		);
	public function _lists($tag,$content) {
		if (empty($tag['module'])) {
			return;
		}
		$str = '';
		$str .="<?php ";
		$str .="\$_m = D('{$tag['module']}');\r\n";
		if (isset($tag['relation'])) {
			if ('$' == substr($tag['relation'],0,1)) {
				$tag['relation']   = $this->autoBuildVar(substr($tag['relation'], 1));
				$str .="\$_m -> relation({$tag['mark']});\r\n";
			}else{
				$str .="\$_m -> relation('{$tag['mark']}');\r\n";
			}
		}
		$str .="\${$tag['return']} = \$_m -> select();\r\n";
		if (isset($tag['tree']) && $tag['tree'] == 1) {
			$str .="\${$tag['return']} = data2tree(\${$tag['return']});\r\n";
		}elseif (isset($tag['group']) && $tag['group'] == 1) {
			$str .="\${$tag['return']} = group(\${$tag['return']});\r\n";
		}
		$str .="?>";
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
		$str .= "?>";
		return $str;
	}

}
