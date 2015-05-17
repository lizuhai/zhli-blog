<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>zhli's blog</title>

    <!-- Bootstrap core CSS -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">

      <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

  </head>

  <body>
    <!--header start-->
    <header class="header-frontend">			
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header" style="margin-left:50px">
					<a class="navbar-brand" href="index.html"><span>zhli</span></a>
				</div>
				<div class="navbar-collapse collapse" style="margin-right:50px">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp">首页</a></li>
						<li  class="active"><a href="BlogAction_toBlogPage">博客</a></li>
						<li><a href="contact.html">留言</a></li>
						<li><a href="price.html">赞助</a></li>
						<li><a href="about.html">关于</a></li>
						<s:if test="#session['user'] != null">
							<li class="dropdown ">
	                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">欢迎 , <s:property value="#session['user'].name"/>&nbsp;&nbsp;<b class="icon-angle-down"></b></a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">个人信息</a></li>
	                                <li><a href="LoginAction_safeExit">安全注销</a></li>
	                            </ul>
	                        </li>
						</s:if>
						<s:else>
							<li><a href="LoginAction_toLoginPage">登陆</a></li>
						</s:else> 
					</ul>
				</div>			  
			</nav><!-- /navbar -->    
        </div>
    </header>
    <!--header end-->

    
    <div class="post-comment" style="margin-top:102px;margin-left: 70px;margin-right: 70px">
	    <h3><strong>创建博客</strong></h3>
	    	<form class="form-horizontal" role="form" action="BlogAction_saveBlog" method="post">
	         <div class="form-group">
	             <div class="col-lg-6">
	                  	<h5>博文标题：</h5><input type="text" name="b.title" placeholder="标题" class="col-lg-12 form-control">
	              </div>
	              <div class="col-lg-6">
	                  	<h5>博文所属目录：</h5><input type="text" placeholder="所属目录" name="b.category" class="col-lg-12 form-control">
	              </div>
	         </div>
	         <div class="form-group">
	             <div class="col-lg-12">
	                 <textarea name="b.content" placeholder="you can you bb!" rows="11" class=" form-control"></textarea>
	             </div>
	         </div>
	         <div class="form-group">
	             <div class="col-lg-12">
	                  <h5>博文所标签：</h5><input type="text" placeholder="多个标签用逗号分隔" name="b.tag" class="col-lg-12 form-control">
	                  <br>
                  	   推荐标签：
                  	   <button class="btn btn-danger">java</button>&nbsp;&nbsp;
                  	   <button class="btn btn-danger">Pyton</button>&nbsp;&nbsp;
                  	   <button class="btn btn-danger">life</button>&nbsp;&nbsp;
                  	   <button class="btn btn-danger">php</button>&nbsp;&nbsp;
                  	   <button class="btn btn-danger">sql</button>&nbsp;&nbsp;
                  	   <button class="btn btn-danger">datamining</button>&nbsp;&nbsp;
                  	   <button class="btn btn-danger">javascript</button>&nbsp;&nbsp;
                  	   <button class="btn btn-danger">inteligence</button>&nbsp;&nbsp;
	              </div>
	         </div>
	         <p>
	             <button type="submit" class="btn btn-danger pull-right">发表博客</button>
	         </p>
	     </form>
	    
	</div>

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

  </body>
</html>
