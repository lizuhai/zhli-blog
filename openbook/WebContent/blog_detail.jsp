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
    <meta name="keyword" content="zhi, openbook, tianxian">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>zhli | blog</title>

    <!-- Bootstrap core CSS -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">

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
						<li><a href="contact.jsp">留言</a></li>
						<li><a href="price.jsp">赞助</a></li>
						<li><a href="about.jsp">关于</a></li>
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

    <!--container start-->
    <div class="container" style="margin-top:102px;">
    <%-- <s:property value="blogDetail"/> --%>
    <%-- <s:property value="detailComments"/> --%>
    <%--  <s:property value="lastestBlogs"/> --%>
    <%-- <s:debug></s:debug> --%>
        <div class="row">
            <!--blog start-->
            <div class="col-lg-9">
                <div class="blog-item">
                    <div class="row">
                        <div class="col-lg-2 col-sm-2">
                            <div class="date-wrap">
                                <span class="date"><s:date name="blogDetail.writingDate" format="hh:mm" /></span>
								<span class="month"><s:date name="blogDetail.writingDate" format="yyyy-MM" /></span>
                            </div>
                            <div class="comnt-wrap">
								<span class="comnt-ico"> <i class="glyphicon glyphicon-thumbs-up">&nbsp;<s:property value="blogDetail.praisedNumber" /></i>
								</span>
							</div>
							<div class="comnt-wrap">
								<span class="comnt-ico"> <i class="glyphicon glyphicon-eye-open">&nbsp;<s:property value="blogDetail.viewedTimes" /></i>
								</span>
							</div>
							<div class="comnt-wrap">
								<span class="comnt-ico"> <i class="glyphicon glyphicon-comment">&nbsp;<s:property value="detailComments.size()" /></i>
								</span>
							</div>
                        </div>
                        <div class="col-lg-10 col-sm-10">
                            <div class="blog-img">
                                <img src="img/blog/img1.jpg" alt=""/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2 col-sm-2 text-right">
                            <div class="author">
                                <h3>By <a href="#"><s:property value="blogDetail.author.name"/></a></h3>
                            </div>
                            <div class="tags">
								<h3>标签：</h3>
								<ul class="list-unstyled tag">
									<%-- <li><a href="#"><s:property value="blogDetail.tag" /></a></li> --%>
									<s:generator separator="," val="tag">  
								        <s:iterator>  
								           <li><a href="#"><s:property/></a></li>
								        </s:iterator>
								     </s:generator> 
								</ul>
							</div>
                        </div>
                        
                        <div class="col-lg-10 col-sm-10">
                            <h1><s:property value="blogDetail.title" escape="false"/></h1>
                            <p><s:property value="blogDetail.content" escape="false"/></p>
                            <s:set value="blogDetail.id" var="id"/>
                            <div class="comnt-wrap" align="center">
								<s:a href="BlogAction_updatePraisedNum?blogId=%{#id}"><span class="comnt-ico" style="cursor:pointer"><i class="glyphicon glyphicon-thumbs-up"></i></span></s:a>
							</div>
							<div>
								<s:if test="#session['user'].id == 1">
									<span class="btn btn-danger">
										<s:a href="BlogAction_toEditBlogPage?blogId=%{#id}">修改博客</s:a>
									</span>
								</s:if>
                            </div>
                            
                            
                            
                            <div class="media">
                                <h3>评论</h3>
                                <s:iterator value="detailComments">
	                                <hr>
	                                <!-- <a class="pull-left" href="">
	                                    <img class="media-object" src="img/avatar1.jpg" alt="">
	                                </a> -->
	                                <div class="media">
	                                	<div class="media-body">
		                                    <h4 class="media-heading">
		                                        <s:property value="user.name"/> <span>|</span>
		                                        <span><s:date format="yyyy-MM-dd HH:mm:ss" name="commentTime" /></span>
		                                    </h4>
		                                    <p><s:property value="commentContent" /></p>
		                                    <!-- <a href="#">回复</a> -->
		                                </div>
		                            </div>
                                </s:iterator>
                            </div>
                            <br>
                            <br>
                            <br>
                            <hr>
                            
                            
                            
                            
                            
                            <!-- start comment! -->
                            <div class="post-comment">
                                <h3 class="skills">快速评论</h3>
                                <s:if test="#session['user'] == null">
                                	请先 <a href="LoginAction_toLoginPage" class="btn btn-danger">登录</a> 后再评论
                                </s:if>
                                <s:else>
                                	<form class="form-horizontal" role="form" action="BlogAction_saveComment" method="post">
	                                    <s:set value="blogDetail.id" var="id"></s:set>
	                                    <s:hidden name="blogId" value="%{#id}"></s:hidden>
	                                    <div class="form-group">
	                                        <div class="col-lg-12">
	                                            <textarea name="comment.commentContent" placeholder="请在这里输入您想说 de 话（you can you bb）" rows="8" class=" form-control"></textarea>
	                                        </div>
	                                    </div>
	                                    <p>
	                                        <button type="submit" class="btn btn-danger pull-right">发表评论</button>
	                                    </p>
	                                </form>
                                </s:else>
                                
                            </div>

                        </div>
                    </div>
                </div>

            </div>

            <div class="col-lg-3">
                <div class="blog-side-item">
                    <div class="search-row">
                        <input type="text" class="form-control" placeholder="Search here">
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
										<a href=""><s:date name="lastModifiedTime" format="yyyy-MM-dd hh:mm"/></a>
									</h5>
									<p><s:property value="title"/></p>
								</div>
							</div>
						</s:iterator>
					</div>
					<!-- the lastest blog end -->

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
