<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>注册 | zhli</title>

    <!-- Bootstrap core CSS -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
	
	<!-- Application styles-->
	<link rel="stylesheet" href="css/lrtk.css">
	
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	
</head>
<body id="register" class="unloaded">
	<div class="wrapper">
		<!--header start-->
		<header class="header-frontend">			
			<div class="container">
				<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
					<div class="navbar-header" style="margin-left:50px">
						<a class="navbar-brand" href="index.html"><span>李祖海</span>的个人网站</a>
					</div>
					<div class="navbar-collapse collapse" style="margin-right:50px">
						<ul class="nav navbar-nav">
							<li><a href="index.jsp">首页</a></li>
							<li><a href="BlogAction_toBlogPage">博客</a></li>
							<li><a href="contact.jsp">留言</a></li>
							<li><a href="price.jsp">赞助</a></li>
							<li><a href="about.jsp">关于</a></li>
							<li  class="active"><a href="LoginAction_toLoginPage">登陆</a></li>     
						</ul>
					</div>			  
				</nav><!-- /navbar -->    
			</div>
		</header>
		<!--header end-->
		
		<!--register start-->
		<div class="login" style="margin-top:102px;">
			<div id="signup-background">
				<div class="container books">
					<div class="row">
						<div class="col-lg-6 col-lg-offset-1 col-md-7 col-sm-8 col-xs-12">
							<div id="form-parent">
							<div id="form-slider">
								
								<!-- register form start -->
								
								<form id="signup-main" action="RegAction_doReg" method="post" class="container offset1 loginform form-horizontal">
									<div style="min-height: 377px;" class="pad">
										<h2>注册</h2>
										<div class="form-group">
											<label for="name" class="control-label col-sm-4">
												<div class="glyphicon glyphicon-user"></div>
												<span>&nbsp;&nbsp;用户名</span>
											</label>
											<div class="controls col-sm-8">
												<input id="name" name="name" placeholder="zhli" tabindex="1" autofocus="autofocus" data-step="1" class="form-control" type="text">
											</div>
										</div>
										<div class="form-group">
											<label for="email" class="control-label col-sm-4">
												<div class="glyphicon glyphicon-envelope"></div>
												<span>&nbsp;&nbsp;电子邮件</span>
											</label>
											<div class="controls col-sm-8">
												<input id="email" name="email" placeholder="zhli_2014@163.com" tabindex="2" data-step="2" class="form-control" type="text">
											</div>
										</div>
										<div class="form-group">
											<label for="password" class="control-label col-sm-4">
												<div class="glyphicon glyphicon-asterisk"></div>
												<span>&nbsp;&nbsp;密码</span>
											</label>
											<div class="controls col-sm-8">
												<input id="password" name="password" placeholder="*******" tabindex="3" autocomplete="false" data-step="3" class="form-control" type="password">
											</div>
										</div>
										
										<!-- 显示错误信息 -->
										<div class="controls col-sm-12"><center style="font-size:17px"><s:fielderror></s:fielderror></center></div>
									
									</div>
									<div class="form-actions">
										<a href="LoginAction_toLoginPage" tabindex="6" class="btn btn-link show-login text-muted">登陆</a>
										<button type="submit" tabindex="5" class="btn btn-primary">注册</button>
									</div>
								</form>
								<!-- register form end -->
							</div>
							</div>
						</div>
						
						<div class="col-lg-4 col-md-5 col-sm-4 hidden-xs">
							<div class="signup-text">
								<h3>欢迎注册<span>李祖海</span>的个人网站</h3>
								<p>在这里注册，您将可以评论我的博客...</p>
							</div>
						</div>
					</div>
					
					<div class="owl-signup">
						<div class="owl-body">
							<div class="owl-eye"></div>
							<div class="owl-eye right"></div>
						</div>
						<div class="owl-arm"></div>
						<div class="owl-feet"></div>
					</div>
				</div>
			</div>
		</div>
	
	</div>
	
	
	<script src="js/reg-bundle-home.js"></script>
	
	<!--register stop-->
	
	<!--footer start-->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-sm-3">
                    <h1>联系我</h1>
                    <address>
                        <p>地址: 西安电子科技大学南校区</p>
                        <p>陕西省西安市长安区兴隆段266号</p>
						<p>QQ : 1135900017</p>
						<p>电话 : (+86) 156 9186 5709</p>
                        <p>电子邮件 : zhli_2014@163.com</p>
                    </address>
                </div>				
                <div class="col-lg-3 col-sm-3 col-lg-offset-2">
                    <h1>微信</h1>
					<img src="./img/zhli_wechat.png" width="140px" height="140px"></img>                    
                </div>				
                <div class="col-lg-3 col-sm-3 col-lg-offset-1">
                    <h1>保持联系</h1>
                    <ul class="social-link-footer list-unstyled">
						<!--
                        <li><a href="#"><i class="icon-facebook"></i></a></li>
                        <li><a href="#"><i class="icon-google-plus"></i></a></li>
                        <li><a href="#"><i class="icon-dribbble"></i></a></li>
                        <li><a href="#"><i class="icon-linkedin"></i></a></li>
                        <li><a href="#"><i class="icon-twitter"></i></a></li>
                        <li><a href="#"><i class="icon-skype"></i></a></li>
                        <li><a href="#"><i class="icon-github"></i></a></li>
                        <li><a href="#"><i class="icon-youtube"></i></a></li>
						-->
						<li><a href="#"><img src="img/wechat.png"></img></a></li>
						<li><a href="#"><img src="img/qq.png"></img></a></li>
						<li><a href="#"><img src="img/cof.png"></img></a></li>
						<li><a href="#"><img src="img/qzone.png"></img></a></li>
						<li><a href="#"><img src="img/weibo.png"></img></a></li>
						<li><a href="#"><img src="img/weibo_qq.png"></img></a></li>
						<li><a href="#"><img src="img/zhihu.png"></img></a></li>
						<li><a href="#"><img src="img/renren.png"></img></a></li>					
						
                    </ul>
                </div>
            </div>
        </div>
		<div>
			<center>©2015 zhli All Rights Reserved</center>
		</div>
    </footer>
    <!--footer end-->
</body></html>