<?php
namespace Admin\Controller;
class GuestbookController extends CommonController {
	
	public function save(){
		if (IS_GET) {
			$this -> form(M('Guestbook') -> find(I('id')));
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}

	// 回复
	public function reply(){
		if (IS_GET) {
			$this -> form(M('Guestbook') -> find(I('id','','intval')));
		}elseif (IS_POST) {
			$id = I('id','','intval');
			$m = M('Guestbook');
			$data = array(
				'id'			=>	$id,
				'reply'			=>	I('reply'),
				'reply_time'	=>	date('Y-m-d H:i:s'),
				);
			if (false !== $m -> save($data)) {
				$this -> success($m -> find($id),'',true);
			}else{
				$this -> error($m -> getDbError(),'',true);
			}
		}
	}

}