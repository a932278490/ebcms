<?php
namespace Admin\Controller;
class AttachmentController extends CommonController {

	public function save(){
		if (IS_GET) {
			$this -> form(M('Attachment') -> find(I('id','','intval')));
		}elseif(IS_POST){
			$this -> ebSave();
		}
	}
	public function delete(){
		if (IS_POST) {
			$model = CONTROLLER_NAME;
			$ids = I('ids','');
			if (empty($ids)) {
				$this -> error('请选择要删除的数据！','',true);
			}
			if (!SESSION(C('ADMIN_AUTH_KEY'))) {
				$map['locked'] = array('eq',0);
			}
			if (is_array($ids)) {
				$map['id'] = array('in',$ids);
			} elseif (is_numeric($ids)) {
				$map['id'] = array('eq',$ids);
			}

			$m = M($model);
			$result = $m -> where($map) -> getField('id,savename,savepath');
			if (empty($result)) $this -> error('未删除任何可删除的数据',U('index'),true);
			$m -> where($map) -> delete();
			foreach ($result as $key => $val) {
				$file = '.'.__GROUP__.'/Uploads'.$val['savepath'].$val['savename'];
				$pathinfo = pathinfo($file);
				$fs=glob($pathinfo['dirname'].'/thumb_*_*_'.$pathinfo['filename'].'.'.$pathinfo['extension']);
				foreach ($fs as $k => $v) {
					@unlink($v);
				}
				@unlink($file);
			}
			$this -> success('删除了权限范围内的 '.count($ids).' 条数据');
		}
	}
}