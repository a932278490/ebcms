<?php
namespace Admin\Controller;
use Think\Controller;
class CommonController extends Controller {

	public function _initialize(){
		if (!session('?'.C('USER_AUTH_KEY'))) {
			$this->redirect('Admin/Auth/login');
		}
		if (!session(C('ADMIN_AUTH_KEY'))) {
			$AUTH = new \Think\Auth();
			if(!$AUTH->check(MODULE_NAME.'_'.CONTROLLER_NAME.'_'.ACTION_NAME, session(C('USER_AUTH_KEY')))){
				$this->error('没有权限！');
			}
		}
		tag('auth_after');
		define('EBCMS_VERSION', '1.6.0');
		$this -> namespace = ns(MODULE_NAME,CONTROLLER_NAME);
	}

	protected function form($data,$config){
		$config['formname'] = $config['formname']?:MODULE_NAME.'_'.CONTROLLER_NAME.'_'.ACTION_NAME;
		$config['action'] = $config['action']?:MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
		$_where = array(
			'status' => array('eq',1),
			'name' => array('eq',$config['formname']),
			);
		if ($form = M('Form') -> where($_where) -> find()) {
			$_where = array(
				'status' => array('eq',1),
				'category_id' => array('eq',$form['id']),
				);
			$_fields = M('Formfield') -> where($_where) -> order('sort desc,id desc') -> select();
			$groups = array();
			foreach ($_fields as $key => $value) {
				// 字段配置
				$value['config'] = json_decode($value['config'],true);
				// 字段名称
				if ($value['subtable'] && $value['extfield']) {
					$value['_field'] = $value['subtable'].'['.$value['extfield'].']'.'['.$value['name'].']';
				}elseif ($value['extfield']) {
					$value['_field'] = $value['extfield'].'['.$value['name'].']';
				}elseif ($value['subtable']) {
					$value['_field'] = $value['subtable'].'['.$value['name'].']';
				}else{
					$value['_field'] = $value['name'];
				}
				// 字段类型
				$value['_type'] = $value['type'];
				// 字段值
				switch ($value['defaultvaluetype']) {
					case '0':
						$value['_value'] = $value['defaultvalue'];
						break;

					case '1':
						$value['_value'] = I($value['defaultvalue']);
						break;

					case '2':
						$value['_value'] = C($value['defaultvalue']);
						break;

					case '3':
						if ($value['subtable'] && $value['extfield']) {
							$_value = json_decode($data[$value['subtable']][$value['extfield']],true);
						}elseif ($value['extfield']) {
							$_value = json_decode($data[$value['extfield']],true);
						}elseif ($value['subtable']) {
							$_value = $data[$value['subtable']];
						}else{
							$_value = $data;
						}

						$_tmp = explode('.', $value['defaultvalue']);
						$_count = count($_tmp);
						switch ($_count) {
							case '1':
								$value['_value'] = $_value[$_tmp[0]];
								break;
							case '2':
								$value['_value'] = $_value[$_tmp[0]][$_tmp[1]];
								break;
							case '3':
								$value['_value'] = $_value[$_tmp[0]][$_tmp[1]][$_tmp[2]];
								break;
							case '4':
								$value['_value'] = $_value[$_tmp[0]][$_tmp[1]][$_tmp[2]][$_tmp[3]];
								break;
						}
						break;
					
					default:
						$value['_value'] = $value['defaultvalue'];
						break;
				}
				$groups[$value['group']][$value['name']] = $value;
			}
			$form['action'] = U($config['action']);
			$form['formtime'] = time();
			$this -> _form = $form;
			$this -> _groups = $groups;

			// 扩展字段
			if ($config['ext_id']) {
				$_where = array(
					'category_id' => array('eq',$config['ext_id']),
					'status' => array('eq',1),
					);
				if ($extfields = M('Modelfield') -> where($_where) -> select()) {
					$extgroups = array();
					foreach ($extfields as $key => $extfield) {
						// 字段配置
						$extfield['config'] = json_decode($extfield['config'],true);
						// 字段类型
						$extfield['_type'] = $extfield['type'];
						// 字段名称
						if ($config['ext_table']) {
							$extfield['_field'] = $config['ext_table'].'[ext]'.'['.$extfield['name'].']';
						}else{
							$extfield['_field'] = 'ext['.$extfield['name'].']';
						}
						// 字段值
						if ($config['ext_table']) {
							$_value = json_decode($data[$config['ext_table']]['ext'],true);
						}else{
							$_value = json_decode($data['ext'],true);
						}
						$extfield['_value'] = is_null($_value[$extfield['name']])?$extfield['value']:$_value[$extfield['name']];
						$extgroups[$extfield['group']][$extfield['name']] = $extfield;
					}
					$this -> _extgroups = $extgroups;
				}
			}

			if (I('__modal') == 1) {
				$this -> __modal = 1;
			}
			$this -> success($this -> fetch('Admin@Common/form'));
		}else{
			$this -> error('表单配置错误！');
			die;
		}
	}

	// 获取数据
	protected function getData($p = array()){
		$p['input'] = isset($p['input'])?$p['input']:I();
		if (!isset($p['module'])) {
			$p['module'] = isset($p['input']['__module'])?ucfirst(strtolower($p['input']['__module'])):MODULE_NAME;
		}
		if (!isset($p['model'])) {
			$p['model'] = isset($p['input']['__model'])?ucfirst(strtolower($p['input']['__model'])):CONTROLLER_NAME;
		}
		$p['layer'] = isset($p['layer'])?$p['layer']:'Model';
		$m = D($p['module'].'/'.$p['model'],$p['layer']);
		if (isset($p['input']['__where'])) {
			array_walk_recursive($p['input']['__where'], 'eb_where');
			$m -> where($p['input']['__where']);
		}
		if ($p['layer']=='Model') {
			if ($p['relation']) {
				$m -> where($p['relation']);
			}elseif (isset($p['input']['__relation'])) {
				array_walk_recursive($p['input']['__relation'], 'eb_where');
				$m -> relation($p['input']['__relation']);
			}
		}
		$order = getorder();
		if (str_replace(' ', '', $order)) $m -> order($order);
		switch ($p['input']['__type']) {
			case 'alldata':
				$result = $m -> select();
				break;
			
			default:
				$page = getpage();
				if ($page) {
					$result['rows'] = $m -> page(getpage()) -> select()?:array();
				}else{
					$result['rows'] = $m -> select()?:array();
				}
				if (isset($p['input']['__where'])) {
					$result['total'] = $m -> where($p['input']['__where']) -> count();
				}else{
					$result['total'] = $m -> count();
				};
				$result['total'] = is_null($result['total'])?0:$result['total'];
				break;
		}
		return empty($result)?array():$result;
	}

	protected function ebAdd($p=array()){
		$p['input'] = isset($p['input'])?$p['input']:I();
		$p['model'] = isset($p['model'])?$p['model']:CONTROLLER_NAME;
		$p['layer'] = isset($p['layer'])?$p['layer']:'Model';
		$m = D(ucfirst(strtolower($p['model'])),$p['layer']);
		if (false === $m -> create()) { //创建数据
			$this -> error('验证失败：'.$m -> getError(),'',true);
		}
		if ($p['relation']) {
			if (is_array($p['relation'])) {
				foreach ($p['relation'] as $k => $r) {
					$m -> $r = $p['input'][$r];
				}
			}elseif (is_string($p['relation'])) {
				$m -> $p['relation'] = $p['input'][$p['relation']];
			}
			$m -> relation($p['relation']);
		}
		if (false !== $num = $m -> add()) {
			$GLOBALS['LastInsID'] = $m -> getLastInsID();
			$result = $m -> find($num);
			header('Content-Type:text/plain; charset=utf-8');
			echo json_encode(array('info'=>$result,'status'=>1),0);
			return $result;
		}else{
			$this -> error('添加失败：'.$m -> getDbError(),'',true);
		}
	}

	protected function ebSave($p=array()){
		$p['input'] = isset($p['input'])?$p['input']:I();
		$p['model'] = isset($p['model'])?$p['model']:CONTROLLER_NAME;
		$p['layer'] = isset($p['layer'])?$p['layer']:'Model';
		$m = D(ucfirst(strtolower($p['model'])),$p['layer']);
		// 判断是否存在
		$oldData = $m -> find($p['input']['id']);
		if (!$oldData) {
			$this -> error('对不起，数据不存在！','',true);
		}
		// 判断是否锁定
		if ($oldData['locked'] && !session(C('ADMIN_AUTH_KEY'))) {
			$this -> error('解锁后方可修改！','',true);
		}

		if (false === $data = $m -> create()) { //创建数据
			$this -> error('验证失败：'.$m -> getError(),'',true);
		}
		if ($p['relation']) {
			if (is_array($p['relation'])) {
				foreach ($p['relation'] as $k => $r) {
					$m -> $r = $p['input'][$r];
				}
			}elseif (is_string($p['relation'])) {
				$m -> $p['relation'] = $p['input'][$p['relation']];
			}
			$m -> relation($p['relation']);
		}
		if (false !== $m -> save()) { //保存数据
			$result = $m -> find($data['id']);
			header('Content-Type:text/plain; charset=utf-8');
			echo json_encode(array('info'=>$result,'status'=>1),0);
			return $result;
		}else{
			$this -> error('修改失败：'.$m -> getDbError(),'',true);
		}
	}

	protected function ebStatus($p=array()){
		$p['input'] = isset($p['input'])?$p['input']:I();
		$p['model'] = isset($p['model'])?$p['model']:CONTROLLER_NAME;
		$p['field'] = isset($p['field'])?$p['field']:'status';
		$ids = $p['input']['ids'];
		$value = is_numeric($p['input']['value'])?$p['input']['value']:0;
		if (empty($ids)) {
			$this -> error('请选择要修改的数据！','',true);
		}
		if (is_array($ids)) {
			$map['id'] = array('in',$ids);
		} elseif (is_numeric($ids)) {
			$map['id'] = array('eq',$ids);
		}
		// 排除锁定项
		if (!session(C('ADMIN_AUTH_KEY'))) {
			$map['locked'] = array('eq',0);
		}
		$m = D(ucfirst(strtolower($p['model'])));
		$num = $m -> where($map) -> setField($p['field'],$value);
		if (false === $num) {
			$this -> error('状态修改失败：'.$m->getDbError(),'',true);
		}elseif(is_numeric($num)){
			if ($num === 0) {
				$this -> error('未改动任何数据！<br/><span style="color:red;">锁定的数据可解锁后修改！</span>','',true);
			}else{
				if (is_array($ids)) {
					header('Content-Type:text/plain; charset=utf-8');
					echo json_encode(array('info'=>'修改了权限范围内 '.$num.' 条数据的状态！','status'=>1),0);
				}elseif(is_numeric($ids)){
					header('Content-Type:text/plain; charset=utf-8');
					echo json_encode(array('info'=>$m -> find($ids),'status'=>1),0);
				}
			}
		}
	}

	protected function ebLock($p=array()){
		$p['input'] = isset($p['input'])?$p['input']:I();
		$p['model'] = isset($p['model'])?$p['model']:CONTROLLER_NAME;

		$ids = $p['input']['ids'];
		$value = $p['input']['value']?1:0;
		$str = $value?'锁定':'解锁';
		if (empty($ids)) {
			$this -> error('请选择要 '.$str.' 的数据！','',true);
		}
		$m = D(ucfirst(strtolower($p['model'])));
		if (is_array($ids)) {
			$map['id'] = array('in',$ids);
		} elseif (is_numeric($ids)) {
			$map['id'] = array('eq',$ids);
		}

		$num = $m -> where($map) -> setField('locked',$value);
		if (false === $num) {
			$this -> error($str.'失败：'.$m->getDbError(),U('index'),true);
		}elseif (is_numeric($num)) {
			if ($num === 0) {
				$this -> error('未改动任何数据！','',true);
			}else{
				if (is_array($ids)) {
					header('Content-Type:text/plain; charset=utf-8');
					echo json_encode(array('info'=>$str.'了权限范围内的 '.$num.' 条数据！','status'=>1),0);
				}elseif(is_numeric($ids)){
					header('Content-Type:text/plain; charset=utf-8');
					echo json_encode(array('info'=>$m -> find($ids),'status'=>1),0);
				}
			}
		}
	}

	protected function ebDelete($p = array()){
		$p['input'] = isset($p['input'])?$p['input']:I();
		$p['model'] = isset($p['model'])?$p['model']:CONTROLLER_NAME;
		$p['layer'] = isset($p['layer'])?$p['layer']:'Model';

		$p['input'] = isset($p['input'])?$p['input']:I();
		$m = D(ucfirst(strtolower($p['model'])),$p['layer']);
		if (is_array($p['relation'])) {
			$m -> relation($p['relation']);
		}
		$ids = $p['input']['ids'];
		if (empty($ids)) {
			$this -> error('请选择要删除的数据！','',true);
		}
		if (is_array($ids)) {
			$map['id'] = array('in',$ids);
		} elseif (is_numeric($ids)) {
			$map['id'] = array('eq',$ids);
		}
		// 排除锁定项
		if (!session(C('ADMIN_AUTH_KEY'))) {
			$map['locked'] = array('eq',0);
		}
		// thinkphp的bug 关联删除 在没有删除主表数据的情况下，会删除关联表的数据
		$tmp = $m -> where($map) -> find();
		if ($tmp) {
			$m -> where($map);
			if (is_array($p['relation'])) {
				$num = $m -> relation($p['relation']) -> delete();
			}else{
				$num = $m -> delete();
			}
		}else{
			$this -> error('没有可删除的数据！',U('index'),true);
		}
		if (false === $num) {
			$this -> error('删除失败：'.$m->getDbError(),U('index'),true);
		}elseif (is_numeric($num)) {
			if ($num === 0) {
				$this -> error('未删除任何可删除的数据！',U('index'),true);
			}else{
				if (is_array($ids)) {
					header('Content-Type:text/plain; charset=utf-8');
					echo json_encode(array('info'=>'删除了可删除的 '.$num.' 条数据!','status'=>1),0);
				}else{
					header('Content-Type:text/plain; charset=utf-8');
					echo json_encode(array('info'=>'删除成功！','status'=>1),0);
				}
			}
		}
	}

	public function _empty(){
		if (IS_POST) {
			switch (ACTION_NAME) {
				// 排序
				case 'resort':
					// 权限认证
					$_where = array(
						'id'=>array('eq',(Int)I('ids')),
						);
					if (false !== D(CONTROLLER_NAME) -> where($_where) -> setField('sort',I('value'))) {
						$this -> success(CONTROLLER_NAME,'',true);
					}else{
						$this -> error(D(CONTROLLER_NAME) -> getDbError());
					}
					break;

				// 添加
				case 'add':
					$this -> ebAdd();
					break;

				// 修改
				case 'save':
					$this -> ebSave();
					break;

				// 删除
				case 'delete':
					$this -> ebDelete();
					break;

				// 审核
				case 'status':
					$this -> ebStatus();
					break;

				// 锁定
				case 'lock':
					$this -> ebLock();
					break;
				
				default:
					$this -> error('访问不存在的动作！');
					break;
			}
		}elseif (IS_GET) {
			switch (ACTION_NAME) {
				case 'index':
					$this -> success($this -> fetch());
					break;
				
				default:
					$this -> error('访问不存在的动作！');
					break;
			}
			die('访问不存在的动作！');
		}
		die;
	}
}