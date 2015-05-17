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

    <title>登陆 | zhli</title>

    <!-- Bootstrap core CSS -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

	<link rel="stylesheet" href="css/lrtk.css">
	
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
  </head>

  <body>
    <!--header start-->
    <header class="header-frontend">			
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header" style="margin-left:50px">
					<a class="navbar-brand" href="index.jsp"><span>李祖海</span>的个人网站</a>
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
			</nav>
			<!-- /navbar -->    
        </div>
    </header>
    <!--header end-->

    <!-- 代码 开始 -->
	<div id="login" style="margin-top:102px;">
		<div class="wrapper">
			<div class="login">
				<form action="LoginAction_doLogin" method="post" class="container offset1 loginform">
					<div id="owl-login">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad">
						<div class="control-group">
							<div class="controls">
								<label for="email" class="glyphicon glyphicon-envelope"></label>
								<input id="email" type="email" name="email" placeholder="zhli_2014@163.com" tabindex="1" autofocus="autofocus" class="form-control input-medium">
								<center><s:fielderror fieldName="email"></s:fielderror></center>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<label for="password" class="glyphicon glyphicon-asterisk"></label>
								<input id="password" type="password" name="password" placeholder="******" tabindex="2" class="form-control input-medium">
								<center><s:fielderror fieldName="password"></s:fielderror></center>
							</div>
						</div>
					</div>
					<div class="form-actions">
						<a href="" tabindex="5" class="btn pull-left btn-link text-muted">忘记密码？</a>
						<a href="RegAction_toRegPage" tabindex="6" class="btn btn-link text-muted">注册</a>
						<button type="submit" tabindex="4" class="btn btn-primary">登陆</button>
					</div>
				</form>
			</div>
		</div>
		
		<script src="js/jquery.min.js"></script>
		
		<script>
		$(function() {

			$('#login #password').focus(function() {
				$('#owl-login').addClass('password');
			}).blur(function() {
				$('#owl-login').removeClass('password');
			});
		});
		</script>
	</div>
	<!-- 代码 结束 -->

    <!--footer start-->
    <footer class="footer" style="margin-top:200px">
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



  </body>
</html>