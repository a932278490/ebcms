<?php
namespace Admin\Controller;
class TemplateController extends CommonController{

	// 所有模板显示
	public function index(){
		if (IS_POST) {
			$res = array(
				'rows' => file_id_dir(iconv('UTF-8','gb2312',dir_decrypt(I('dir')))),
				);
			$this -> success($res);
		}elseif(IS_GET) {
			$this -> success($this ->fetch());
		}
	}

	// 添加一个该目录下的新模板
	public function add(){
		$title = dir_decrypt(I('path'));
		if (IS_GET) {
			$this -> form(array('title'=>iconv('GBK', 'UTF-8',$title)));
		}elseif (IS_POST) {
			if (I('title') != iconv('GBK', 'UTF-8',$title)) {
				$this -> error('非法操作！');
			}
			$name = I('name');
			$filename = iconv('GBK','UTF-8',  $title).'/'.$name;
			if (!in_array(pathinfo($filename,PATHINFO_EXTENSION), C('EDITFILE_EXT'))) {
				$this -> error('对不起，不允许添加该类型的文件');
			}
			if (is_file(iconv('UTF-8','GBK',$filename))) {
				$this -> error('对不起，文件已经存在!');
			}
			$content = I('content','','');
			if (file_put_contents(iconv('UTF-8','GBK',$filename), $content)) {
				$this -> success('保存成功',U('index'),true);
			}else{
				$this -> error('保存失败','',true);
			}
		}
	}

	// 更新一个模板
	public function save(){
		$title = dir_decrypt(I('filename'));
		if (IS_GET) {
			$result = array(
				'title' => iconv('GBK', 'UTF-8', $title),
				'content' => htmlspecialchars(file_get_contents($title)),
				);
			$this -> assign($result);
			$this -> form($result);
		}elseif (IS_POST) {
			if (I('title') != iconv('GBK', 'UTF-8', $title)) {
				$this -> error('非法操作！'.I('title'));
			}
			if (!in_array(pathinfo($title,PATHINFO_EXTENSION), C('EDITFILE_EXT'))) {
				$this -> error('对不起，不允许添加该类型的文件');
			}
			if (!is_file($title)) {
				$this -> error('对不起，文件不存在!');
			}
			$content = I('content','','');
			if (file_put_contents($title, $content)) {
				$this -> success('保存成功','',true);
			}else{
				$this -> error('保存失败','',true);
			}
		}
	}

	// 删除一个模板
	public function delete(){
		if (IS_POST) {
			// 取得目标文件的详细地址
			$filename = dir_decrypt(I('filename'));
			if (!in_array(pathinfo($filename,PATHINFO_EXTENSION), C('EDITFILE_EXT'))) {
				$this -> error('对不起，不允许删除该类型的文件');
			}
			if (unlink($filename)) {
				$this -> success('删除成功:'.$filename);
			}else{
				$this -> error('删除失败:'.$filename);
			}
		}
	}
}