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
    <meta name="keyword" content="zhi, openbook, tianxian">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>zhli | blog</title>

    <!-- Bootstrap core CSS -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->


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
				<s:iterator value="blogs">
					<s:set value="id" var="id"></s:set>
					<div class="blog-item">
						<div class="row">
							<div class="col-lg-2 col-sm-2">
								<div class="date-wrap">
									<span class="date"><s:date name="writingDate" format="hh:mm" /></span>
									<span class="month"><s:date name="writingDate" format="yyyy-MM" /></span>
								</div>
								<div class="comnt-wrap">
									<span class="comnt-ico"> <i class="glyphicon glyphicon-thumbs-up">&nbsp;<s:property value="praisedNumber" /></i>
									</span>
								</div>
								<div class="comnt-wrap">
									<span class="comnt-ico"> <i class="glyphicon glyphicon-comment">&nbsp;<s:property value="comments.size()" /></i>
									</span>
								</div>
								<div class="comnt-wrap">
									<span class="comnt-ico"> <i class="glyphicon glyphicon-eye-open">&nbsp;<s:property value="viewedTimes" /></i>
									</span>
								</div>
							</div>
							<div class="col-lg-10 col-sm-10">
								<div class="blog-img">
									<img src="img/blog/img1.jpg" alt="" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-2 col-sm-2 text-right">
								<div class="author">
									<h3>
										By <a href="#"><s:property value="author.name"/></a>
									</h3>
								</div>
								<div class="tags">
									<h3>标签：</h3>
									<ul class="list-unstyled tag">
										<%-- <li><a href="#"><s:property value="tag" /></a></li> --%>
									    <s:generator separator="," val="tag">  
									        <s:iterator>  
									           <li><a href="#"><s:property/></a></li>
									        </s:iterator> 
									     </s:generator>  
										
									</ul>
								</div>
							</div>
							<div class="col-lg-10 col-sm-10">
								<h1>
									<a href="blog_detail.html"><s:property value="title" escape="false"/></a>
								</h1>
								<p>
									<s:if test="content.length() > 150">
										<s:property value="content.substring(0, 200)" escape="false"/>......
									</s:if>
									
								</p>
								<!-- <a href="blog_detail.jsp" class="btn btn-danger">继续阅读</a> -->
								<span class="btn btn-danger">
									<s:a href="BlogAction_toDetailPage?blogId=%{#id}">继续阅读</s:a>
								</span>
							</div>
						</div>
					</div>
				</s:iterator>



				<s:set value="categories[0]" var="categories"></s:set>
				<%-- <s:property value="categories"/> --%>
				<!-- split page start -->
				<s:if test="page.getTotalPageNumber() == 0"><center><h3>没有您要找的博客</h3></center></s:if>
				<s:else>
					<div class="text-center">
						<ul class="pagination">
							<%-- <s:property value="page.getPageNo()"/>
	                    	<s:property value="page.getPageSize()"/> --%>
							<s:set value="page.getPageNo()" var="pageNo" />
							<s:if test="pageNo == 1">
								<li><s:a href="">上一页</s:a></li>
							</s:if>
							<s:else>
								<li><s:a href="BlogAction_toBlogPage?pageNo=%{#pageNo - 1}&category=%{categories}">«</s:a></li>
							</s:else>
	
							<!-- 总页数不大于于 10 页的最后一页按照总页数来显示 -->
							<s:if test="page.getTotalPageNumber() <= '10'">
								<s:iterator begin="1" end="page.getTotalPageNumber()" step="1"
									id="i">
									<s:if test="page.getPageNo() == #i">
										<li class="active disable"><s:a href="">
												<s:property value="#i" />
											</s:a></li>
									</s:if>
									<s:else>
										<li><s:a href="BlogAction_toBlogPage?pageNo=%{#i}&category=%{categories}">
												<s:property value="#i" />
											</s:a></li>
									</s:else>
								</s:iterator>
							</s:if>
	
							<!-- 总页数大于 10 页，并且当前页小于 6，按照从 1 到 10 页来显示页码 -->
							<s:elseif test="page.getPageNo() <= 5">
								<s:property value="page.getPageNo()" />
								<s:iterator begin="1" end="10" step="1" id="i">
									<s:if test="page.getPageNo() == #i">
										<li class="active"><s:a href="">
												<s:property value="#i" />
											</s:a></li>
									</s:if>
									<s:else>
										<li><s:a href="BlogAction_toBlogPage?pageNo=%{#i}&category=%{categories}">
												<s:property value="#i" />
											</s:a></li>
									</s:else>
								</s:iterator>
							</s:elseif>
	
							<!-- 总页数大于 10 页，并且当前页大于 5，按照从 当前页 - 5 到 当前页 + 5 页来显示页码 -->
							<s:else>
								<s:iterator begin="page.getPageNo() - 4"
									end="page.getPageNo() + 5" step="1" id="i">
									<s:if test="page.getPageNo() == #i">
										<li class="active"><s:a href="">
												<s:property value="#i" />
											</s:a></li>
									</s:if>
									<s:else>
										<li><s:a href="BlogAction_toBlogPage?pageNo=%{#i}&category=%{categories}">
												<s:property value="#i" />
											</s:a></li>
									</s:else>
								</s:iterator>
							</s:else>
	
							<s:if test="pageNo >= page.getTotalPageNumber() - 1">
								<li><s:a href="">下一页</s:a></li>
							</s:if>
							<s:else>
								<li><s:a href="BlogAction_toBlogPage?pageNo=%{#pageNo + 1}&category=%{categories}">»</s:a></li>
							</s:else>
						</ul>
					</div>
					<!-- split page end -->
				</s:else>
				
				
				<!-- 广告位1 -->

			</div>

			<div class="col-lg-3">
				<div class="blog-side-item">
					<div class="search-row">
						<form action="" method="post">
							<table>
								<tr>
									<td><input type="text" class="form-control"
										style="width: 210px" placeholder="查询博客"></td>
									<td><input type="submit" class="btn btn-danger" value="确认">
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div class="category">
						<h3>博客分类</h3>
						<ul class="list-unstyled">
							<li><a href="BlogAction_toBlogPage?category=java"><i class="icon-angle-right"></i>
									Java</a></li>
							<li><a href="BlogAction_toBlogPage?category=intelligence"><i class="icon-angle-right"></i>
									智力</a></li>
							<li><a href="BlogAction_toBlogPage?category=life"><i class="icon-angle-right"></i>
									生活</a></li>
							<li><a href="BlogAction_toBlogPage?category=python"><i class="icon-angle-right"></i>
									Python</a></li>
							<li><a href="BlogAction_toBlogPage?category=android"><i class="icon-angle-right"></i>
									Android</a></li>
							<li><a href="BlogAction_toBlogPage?category=php"><i class="icon-angle-right"></i>
									PHP</a></li>
							<li><a href="BlogAction_toBlogPage?category=datamining"><i class="icon-angle-right"></i>
									数据挖掘</a></li>
							<li><a href="BlogAction_category?category=javascript"><i class="icon-angle-right"></i>
									JavaScript</a></li>
						</ul>
					</div>

					<!-- the lastest blog start -->
					<div class="blog-post">
						<h3>最近更新的博客</h3>
						<s:iterator value="lastestBlogs">
							<div class="media">
								<a class="pull-left" href="javascript:;"><img src="img/blog/blog-thumb-1.jpg" /></a>
								<div class="media-body">
									<h5 class="media-heading">
										<a href="javascript:;"><s:date name="lastModifiedTime" format="yyyy-MM-dd hh:mm"/></a>
									</h5>
									<p><s:property value="title"/></p>
								</div>
							</div>
						</s:iterator>
					</div>
					<!-- the lastest blog end -->

					<!-- 广告位 2 -->

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
