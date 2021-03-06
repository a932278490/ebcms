<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN" class="bg">
<head>
	<base href="http://<?php echo ($_SERVER['HTTP_HOST']); ?>/ebcms<?php echo (__GROUP__); ?>/" />
	<title><?php echo ($SEO["title"]); ?></title>
	<meta name="keywords" content="<?php echo ($SEO["keywords"]); ?>">
	<meta name="description" content="<?php echo ($SEO["description"]); ?>">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
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
	<script type="text/javascript" src="/ebcms/Public/Js/admin.js"></script>
	<link rel="stylesheet" type="text/css" href="/ebcms/Public/Css/admin.css">
	<script>
		function change_verify(selecter) {
			$("#" + selecter).attr("src", "<?php echo U('Api/verify');?>#" + Math.random());
			return false;
		};
		function login(){
			$.ajax({
				url: '<?php echo U('login');?>',
				type: 'POST',
				dataType: 'json',
				data: $('#loginform').serialize(),
				success:function(data){
					if (data.status) {
						window.location.href=data.url; 
					}else{
						change_verify('verifyimage');
						switch(data.info){
							case 'password':
								alert('邮箱或者密码错误！');
								$('#loginform')[0].reset();
								break;
							case 'verify':
								alert('验证码错误！');
								$('#verify').val('');
								break;
							case 'forbidden':
								alert('账户暂时不可用！');
								$('#loginform')[0].reset();
								break;
							default:
								alert(data.info);
								$('#loginform')[0].reset();
						}
					};
				}
			});
			return false;
		};
	</script>
</head>
<body style="margin:0;padding:0;height:100%;background:#022948;">
<div style="width:400px;position:absolute;top:50%;left:50%;margin-left:-200px;margin-top:-250px;overflow:auto;">
	<div class="well well-lg" style="width:100%;margin-bottom:0px;">
		<div class="text-center"><img src="/ebcms/Public/Image/logo.png" ></div>
		<br>
		<form id="loginform">
			<div class="form-group form-group-lg">
				<div class="input-group">
					<div class="input-group-addon">邮 <span style="color:#eee;">一</span> 箱:</div>
					<input type="text" name="email" class="form-control" id="email" placeholder="">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<div class="input-group">
					<div class="input-group-addon">密 <span style="color:#eee;">一</span> 码:</div>
					<input type="password" name="password" class="form-control" id="password" placeholder="">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<div class="input-group">
					<div class="input-group-addon">验 证 码:</div>
					<input type="text" name="verify" class="form-control" id="verify" placeholder="">
					<div class="input-group-addon" style="width:100px;padding:0px;"><img class="img-rounded" id="verifyimage" onclick="change_verify('verifyimage');" src="<?php echo U('Api/verify');?>" alt="验证码" style="width:100px;height:44px;"></div>
				</div>
			</div>
			<hr>
			<button type="submit" class="btn btn-danger btn-lg btn-block" onclick="return login();">登陆</button>
		</form>
		<br>
		<p class="text-muted" style="border: 1px #D0D0D0 dotted;padding: 10px;background: #FFF;">XXX内容管理系统是由xxx网络科技公司开发，提供免费使用！</p>
	</div>
</div>
</body>
</html>