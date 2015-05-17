<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>联系我</title>

    <!-- Bootstrap core CSS -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

	<!-- baidu map -->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=kPc90Sg83zClG5PFdZBQoizf"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	
  </head>

  <body>
   <!--header start-->
    <header class="header-frontend">			
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header" style="margin-left:50px">
					<a class="navbar-brand" href="index.jsp"><span>zhli</span></a>
				</div>
				<div class="navbar-collapse collapse" style="margin-right:50px">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="BlogAction_toBlogPage">博客</a></li>
						<li class="active"><a href="contact.jsp">留言</a></li>
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


 	 <!--baidu map start-->
     <div class="contact-map"  style="margin-top:102px;">
	     <div id="allmap" style="width: 100%; height: 400px"></div> 
     </div>
     <!--baidu map end-->

     <!--container start-->
    <div class="container">


        <div class="row">
            <div class="col-lg-5 col-sm-5 address">
                <h4>西安市</h4>
                <p>李祖海<br/>西安电子科技大学南校区<br/>西安市长安区兴隆段266号 </p>
                <br><br><br>
                <p>电话 <br/>
                	<span class="muted">(+86) 15691865709</span>
                	<br/>
                   	 电子邮件
                   	 <br/>
                    <span class="muted">zhli_2014@163.com</span>
                </p>
            </div>
            <div class="col-lg-7 col-sm-7 address">
                <h4>留言</h4>
                <div class="contact-form">
                    <form action="MessageAction_saveMessage" method="post">
                        <p><strong>姓名</strong></p>
                        <input type="text" placeholder="姓名" name="m.name" class="form-control">
                    	<s:if test="#session['user'] == null">
	                         <p><strong>电子邮件</strong></p>
	                         <input type="text" placeholder="电子邮件" name="m.email" class="form-control">
                    	 </s:if>
	                     <s:else>
	                     	<s:hidden name="email" value="#session['user'].eamil"></s:hidden>
	                     </s:else>
                        <p><strong>电话号码</strong></p>
                        <input type="text" placeholder="电话号码" name="m.telephone" class="form-control">
                        <p><strong>信息</strong></p>
                        <textarea placeholder="请输入您的宝贵建议或意见" rows="5" name="m.content" class="form-control"></textarea>
                        <br>
                        <button class="btn btn-danger" type="submit">确认留言</button>
                    </form>

                </div>
            </div>
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

<script type="text/javascript">
	// 百度地图API功能	
	map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(108.844916,34.13425), 15);
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	
  	// 信息窗口
	var data_info = [[108.844916,34.13425,"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>OpenBookOfKnowledge</h4>"
						+ "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>电话：15691865709</p>" 
						+ "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>邮箱：zhli_2014@163.com</p>" 
						]
					];
	var opts = {
				width : 300,     // 信息窗口宽度
				height: 100,     // 信息窗口高度
				title : "zhli" , // 信息窗口标题
				enableMessage:true//设置允许信息窗发送短息
			   };
	for(var i=0;i<data_info.length;i++){
		var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
		var content = data_info[i][2];
		map.addOverlay(marker);               // 将标注添加到地图中
		addClickHandler(content,marker);
	}
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
	
	
	// 设置地图默认指标，滚轮缩放
	map.setDefaultCursor("url('bird.cur')");   //设置地图默认的鼠标指针样式
	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	
	// 添加缩略图
	var overViewOpen = new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT});
	map.addControl(overViewOpen);      //右下角，添加缩略图
	
</script>