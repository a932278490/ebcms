<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<title><?php echo ($SEO["title"]); ?> - Powered by EBCMS</title>
	<meta name="keywords" content="<?php echo ($SEO["keywords"]); ?>">
	<meta name="description" content="<?php echo ($SEO["description"]); ?>">
	<!-- Bootstrap -->
	<link href="/ebcms/Public/Third/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- HTML5 Shim and Respond.js IE8 flowers of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

	<script src="/ebcms/Public/Js/jquery.min.js"></script>
	<script src="/ebcms/Public/Third/bootstrap/js/bootstrap.min.js"></script>
	<script src="/ebcms/Public/Js/docs.min.js"></script>
	<!-- 引入iconfont -->
	<link href="/ebcms/Public/Third/iconfont/iconfont.css" rel="stylesheet">
	<!-- 前端公共样式 -->
	<script src="/ebcms/Public/Js/home.js"></script>
	<link href="/ebcms/Public/Css/home.css" rel="stylesheet">
	<script>
		$(function(){
			EBCMS.CONFIG.verify_URL = '<?php echo U('Home/Api/verify');?>';
		});
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div style="padding:10px;width: 250px;">
					<img src="/ebcms/Public/Image/logo.png">
				</div>
			</div>
			<div class="col-md-8">
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="<?php echo U('Index/index');?>">EBCMS</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
						<?php unset($navs);$_m = M('Nav');$_m -> order('sort desc,id desc');$_where = array();$_category_id = M('Navcate') -> where(array('mark'=>array('eq','main'),'status'=>array('eq',1))) -> limit(1) -> getField('id');$_where['category_id'] = array('eq',$_category_id);$_where['status'] = array('eq',1);$navs_tmp = $_m -> where($_where) -> select();$navs = data2tree($navs_tmp); ?>
						<?php if(is_array($navs)): foreach($navs as $key=>$nav): if(empty($nav["rows"])): ?><li><a href="<?php echo U(htmlspecialchars_decode($nav['url']));?>"><?php echo ($nav["title"]); ?></a></li>
							<?php else: ?>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo ($nav["title"]); ?> <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<?php if(is_array($nav["rows"])): foreach($nav["rows"] as $key=>$children): ?><li><a href="<?php echo U(htmlspecialchars_decode($children['url']));?>"><?php echo ($children["title"]); ?></a></li><?php endforeach; endif; ?>
									</ul>
								</li><?php endif; endforeach; endif; ?>
						</ul>
						<form class="navbar-form navbar-right" action="<?php echo U('Home/Search/index');?>" method="get" role="search">
							<div class="input-group" id="searchgroup">
								<input type="text" name="q" class="form-control" aria-label="..." required>
								<input type="hidden" name="m" value="Home">
								<input type="hidden" name="c" value="Search">
								<input type="hidden" name="a" value="index">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-danger">搜索</button>
								</span>
							</div>
						</form>
					</div>
				</nav>
			</div>
		</div>
		<?php unset($recommend);$_category_id = M('Recommendcate') -> where(array('mark'=>array('eq','slide'),'status'=>array('eq',1))) -> getField('id');$_m = M('Recommend');$_m -> order('sort desc,id desc');$_where = array();$_where['category_id'] = array('eq',$_category_id);$_where['status'] = array('eq','1');$_m -> where($_where);$recommend = $_m -> select(); ?>
<?php if(!empty($recommend)): ?><div class="row">
		<div class="col-md-12">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

				<ol class="carousel-indicators">
					<?php if(is_array($recommend)): foreach($recommend as $key=>$vo): ?><li data-target="#carousel-example-generic" data-slide-to="<?php echo ($key); ?>" <?php if(($key) == "0"): ?>class="active"><?php endif; ?></li><?php endforeach; endif; ?>
				</ol>

				<div class="carousel-inner" role="listbox">
					<?php if(is_array($recommend)): foreach($recommend as $key=>$vo): ?><div class="item <?php if(($key) == "0"): ?>active<?php endif; ?>">
							<a href="<?php echo ($vo["url"]); ?>"><img src="<?php echo (thumb($vo["thumb"],1200,300)); ?>" alt="<?php echo ($vo["title"]); ?>"></a>
							<div class="carousel-caption">
								<a href="<?php echo ($vo["url"]); ?>"><?php echo ($vo["title"]); ?></a>
							</div>
						</div><?php endforeach; endif; ?>
				</div>

				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<br><?php endif; ?>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					当前位置：
					<?php $_result=position();if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U($vo['url']);?>"><?php echo ($vo["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
				</ol>
			</div>
		</div>
<div class="row">
	<div class="col-md-3">
		<?php echo htmlspecialchars_decode(mycfg('guestbook_tips'));?>
		<?php unset($lxwm);$_m = D('Article','ViewModel');$_where = array();$_where['mark'] = array('eq','lxwm');$_where['status'] = array('eq',1);$_m -> where($_where);$lxwm = $_m -> find(); ?>
<div class="panel panel-default">
	<div class="panel-heading">
		<?php echo ($lxwm["title"]); ?>
	</div>
	<div class="panel-body">
		<?php echo (htmlspecialchars_decode($lxwm["body"])); ?>
	</div>
</div>
	</div>
	<div class="col-md-9">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>留言列表</h3>
				<hr>
				<?php unset($guestbook);$_m = M('Guestbook');$_m -> order('sort desc,id desc');$_where = array();$_where['status'] = array('eq',1);$_m -> where($_where);$guestbook = $_m -> select(); ?>
				<?php if(is_array($guestbook)): foreach($guestbook as $key=>$vo): ?><div class="media">
						<div class="media-left">
							<div style="width:60px;">
								<img src="/ebcms/Public/Image/avatar.gif" alt="">
							</div>
						</div>
						<div class="media-body">
							<p class="alert alert-info"><?php echo ($vo["content"]); ?></p>
						</div>
						<div class="media-right">
							<div style="width:60px;"></div>
						</div>
					</div>
					<?php if(!empty($vo["reply"])): ?><div class="media">
						<div class="media-left">
							<div style="width:60px;"></div>
						</div>
						<div class="media-body">
							<p class="alert alert-danger"><?php echo ($vo["reply"]); ?></p>
						</div>
						<div class="media-right">
							<div style="width:60px;">
								<img src="/ebcms/Public/Image/nb.jpg" alt="">
							</div>
						</div>
					</div><?php endif; ?>
					<hr><?php endforeach; endif; ?>
				<h3>我要留言</h3>
				<form class="form-horizontal well" method="post" action="<?php echo U('add');?>">
					<div class="form-group">
						<label for="inputnickname3" class="col-sm-2 control-label">昵称</label>
						<div class="col-sm-10">
							<input name="nickname" type="text" class="form-control" id="inputnickname3">
						</div>
					</div>
					<div class="form-group">
						<label for="inputcontent3" class="col-sm-2 control-label">内容</label>
						<div class="col-sm-10">
							<textarea name="content" id="inputcontent3" class="form-control" rows="6"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="inputmobile3" class="col-sm-2 control-label">电话</label>
						<div class="col-sm-10">
							<input type="text" name="mobile" class="form-control" id="inputmobile3">
						</div>
					</div>
					<?php if(C('GUESTBOOK.verify')==1): ?><div class="form-group form-group-lg">
							<label for="verify" class="col-sm-2 control-label">
								验证码
							</label>
							<div class="col-sm-10">
								<div class="input-group">
									<input type="text" name="verify" class="form-control" id="verify" placeholder="请输入验证码">
									<div class="input-group-addon img-verify"><img class="img-rounded" id="verifyimage" onclick="EBCMS.FN.change_verify('verifyimage');" src="<?php echo U('Api/verify');?>" alt="验证码"></div>
								</div>
							</div>
						</div><?php endif; ?>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<p class="pull-right"><a href="#">Back to top</a></p>
				<p>
					&copy; 2014 EBtech, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">EB Terms</a>
					<?php unset($navs);$_m = M('Nav');$_m -> order('sort desc,id desc');$_where = array();$_category_id = M('Navcate') -> where(array('mark'=>array('eq','footer'),'status'=>array('eq',1))) -> limit(1) -> getField('id');$_where['category_id'] = array('eq',$_category_id);$_where['status'] = array('eq',1);$_m -> where($_where);$navs = $_m -> select(); ?>
					<?php if(is_array($navs)): foreach($navs as $key=>$nav): ?>&nbsp;&nbsp;<a href="<?php echo U(htmlspecialchars_decode($nav['url']));?>"><?php echo ($nav["title"]); ?></a>&nbsp;&nbsp;<?php endforeach; endif; ?>
				</p>
			</div>
		</div>
	</div>
<?php echo htmlspecialchars_decode(mycfg('baidu_tongji'));?>
</body>
</html>