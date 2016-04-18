<?php
namespace Admin\Controller;
class CronController extends CommonController {

	public function index(){
		if (IS_POST) {
			$data = $this -> getData();
			$crons	=	include RUNTIME_PATH.'~crons.php';
			if ($crons) {
				foreach ($crons as $key => $value) {
					foreach ($data as $k => &$v) {
						if ($v['cron'] == $key) {
							$v['nextruntime'] = date('Y-m-d H:i:s',$value[2]);
						}
					}
				}
			}
			$res = array(
				'rows' => $data,
				);
			$this -> success($res);
		}elseif (IS_GET) {
			$this -> success($this -> fetch());
		}
	}

	public function add(){
		if (IS_GET) {
			$this -> form();
		}elseif (IS_POST) {
			$this -> ebAdd();
		}
	}

	public function save(){
		if (IS_GET) {
			$data = M('Cron') -> find(I('id','','intval'));
			if (I('__type') == 'config') {
				$_where = array(
					'group' => array('eq','定时任务'),
					'title' => array('eq',$data['cron']),
					'status' => array('eq',1),
					);
				$model = M('Model') -> where($_where) -> find();
				$_where = array(
					'category_id' => array('eq',$model['id']),
					'status' => array('eq',1),
					);
				if ($extfields = M('Modelfield') -> where($_where) -> select()) {
					$value = json_decode($data['config'],true);
					$extgroups = array();
					foreach ($extfields as $key => $extfield) {
						// 字段配置
						$extfield['config'] = json_decode($extfield['config'],true);
						// 字段类型
						$extfield['_type'] = $extfield['type'];
						// 字段名称
						$extfield['_field'] = 'config['.$extfield['name'].']';
						// 字段值
						$extfield['_value'] = $value[$extfield['name']];
						$extgroups[$extfield['group']][$extfield['name']] = $extfield;
					}
					$extgroups[$extfield['group']]['id'] = array(
						'_field' => 'id',
						'_value' => $data['id'],
						'_type' => 'form_hidden',
						);
					$_form = array(
						'action' => U('Admin/Cron/save'),
						'group' => '定时任务',
						'title' => '设置参数',
						);
					$this -> _form = $_form;
					$this -> _extgroups = $extgroups;

					if (I('__modal') == 1) {
						$this -> __modal = 1;
					}

					$this -> success($this -> fetch('Admin@Common/form'));
				}else{
					$this -> error('暂无配置项！');
				}
			}else{
				$this -> form($data);
			}
		}elseif (IS_POST) {
			$this -> ebSave();
		}
	}


	// 生成
	public function build(){
		if (IS_POST) {
			$_where = array(
				'status' => array('eq',1),
				);
			$data = M('Cron') -> where($_where) -> order('sort desc') -> getField('cron,intervals,initruntime,config',true);
			$crons = array();
			foreach ($data as $key => $value) {
				$crons[$key][0] = $value['cron'];
				$crons[$key][1] = $value['intervals'];
				$crons[$key][2] = strtotime($value['initruntime']);
				$crons[$key][3] = json_decode($value['config'],true);
			}
			$str = "<?php ";
			$str .= "\n\r//定时任务文件由系统自动生成，如非必要请在后台修改！";
			$str .= "\n\r//定时任务需要行为配置定时任务行为扩展";
			$str .= "\n\rreturn ".var_export($crons,true).';';
			\Think\Storage::put(COMMON_PATH.'Conf/crons.php',$str);
			@unlink(RUNTIME_PATH.'~crons.php');
			$this -> success('更新成功');
		}
	}
}