<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="img/favicon.png">

<title>messages | zhli</title>

<!-- Bootstrap core CSS -->
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap-reset.css" rel="stylesheet">


<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />

</head>

<body>
	<!--header start-->
	<header class="header-frontend">
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header" style="margin-left: 50px">
					<a class="navbar-brand" href="index.html"><span>zhli</span></a>
				</div>
				<div class="navbar-collapse collapse" style="margin-right: 50px">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp">首页</a></li>
						<li class="active"><a href="BlogAction_toBlogPage">博客</a></li>
						<li><a href="contact.jsp">留言</a></li>
						<li><a href="price.jsp">赞助</a></li>
						<li><a href="about.jsp">关于</a></li>
						<li><a href="LoginAction_toLoginPage">登陆</a></li>
					</ul>
				</div>
			</nav>
			<!-- /navbar -->
		</div>
	</header>
	<!--header end-->


	<!--container start-->
	<div class="container" style="margin-top: 102px">
		<div class="row">
			<!--blog start-->

			<div class="col-lg-9 ">
				<table style="width: 100%" border="1">
					<s:if test="messages != null">
						<tr>
							<th>日期</th><th>邮箱</th><th>姓名</th><th>电话</th><th>内容</th><th>删除</th>
						</tr>
						<s:iterator value="messages">
							<s:set value="id" var="mid"></s:set>
							<tr>
								<td width="15%"><s:date name="date" format="yyyy-MM-dd HH:mm"/></td>
								<td width="10%"><s:property value="email"/></td>
								<td width="10%"><s:property value="name"/></td>
								<td width="10%"><s:property value="telephone"/></td>
								<td width="50%"><s:property value="content"/></td>
								<td width="5%" align="center">
									<s:a href="MessageAction_delete?messageId=%{#mid}">
										<span class="glyphicon glyphicon-remove" style="cursor:pointer"></span>
									</s:a>
								</td>
							</tr>
						</s:iterator>
					</s:if>
					<s:else>
						<h3>没有任何留言</h3>
					</s:else>
				</table>
			</div>

			<div class="col-lg-3">
				<div class="blog-side-item">
					<div class="search-row">
						<form action="" method="post">
							<table>
								<tr>
									<td><input type="text" class="form-control"	style="width: 210px" placeholder="查询博客"></td>
									<td><input type="submit" class="btn btn-danger" value="确认"></td>
								</tr>
							</table>
						</form>
					</div>

				</div>
			</div>

			<!--blog end-->
		</div>

	</div>
	<!--container end-->

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
