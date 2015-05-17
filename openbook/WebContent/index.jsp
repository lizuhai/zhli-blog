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

    <title>zhli</title>

    <!-- Bootstrap core CSS -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/flexslider.css"/>
    <link href="assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link href="assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />

    <link rel="stylesheet" href="assets/revolution_slider/css/rs-style.css" media="screen">
    <link rel="stylesheet" href="assets/revolution_slider/rs-plugin/css/settings.css" media="screen">

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
					<a class="navbar-brand" href="index.jsp"><span>zhli</span></a>
				</div>
				<div class="navbar-collapse collapse" style="margin-right:50px">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">首页</a></li>
						<li><a href="BlogAction_toBlogPage">博客</a></li>
						<li><a href="contact.jsp">留言</a></li>
						<li><a href="price.jsp">赞助</a></li>
						<li><a href="about.jsp">关于</a></li>
						<s:if test="#session['user'] != null">
							<li class="dropdown ">
	                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">欢迎 , <s:property value="#session['user'].name"/>&nbsp;&nbsp;<b class="icon-angle-down"></b></a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">个人信息</a></li>
	                                <li><a href="LoginAction_safeExit">安全注销</a></li>
	                                <s:if test="#session['user'].id == 1">
	                                	<li><a href="writeBlog.jsp">创建博客</a></li>
	                                </s:if>
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

      <!-- revolution slider start -->
     <div class="fullwidthbanner-container main-slider" style="margin-top: 102px">
         <div class="fullwidthabnner">
             <ul id="revolutionul" style="display:none;">
                 <!-- 1st slide -->
                 <li data-transition="fade" data-masterspeed="200" data-delay="4000" data-thumb="">                     
					 <img src="img/banner/ban2.png" alt=""/>
				 </li>
                 <!-- 2nd slide  -->
                 <li data-transition="fade" data-masterspeed="200" data-delay="4000" data-thumb="">
                     <!-- THE MAIN IMAGE IN THE FIRST SLIDE -->
                     <img src="img/banner/banner_bg.jpg" alt="">
                 </li>
                 <!-- 3rd slide  -->
                 <li data-transition="fade" data-masterspeed="200" data-delay="4000" data-thumb="">
                     <img src="img/banner/red-bg.jpg" alt="">  
                 </li>
             </ul>
         </div>
     </div>
     <!-- revolution slider end -->
	 
	 
  

     <div class="container">  
        <!--recent work start-->
        <div class="row">
            <div class="col-lg-12">
				<div class="text-center feature-head">
					<h1>最近的工作</h1>
				</div>
                
                <ul class="bxslider">
                    <li>
                        <div class="element item view view-tenth" data-zlname="reverse-effect">
                            <img src="img/works/img1.jpg" alt="" />
                            <div class="mask">                                
                                <a data-zl-popup="link2" class="fancybox" rel="group" href="img/works/img1.jpg">
                                    <i class="icon-search"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="element item view view-tenth" data-zlname="reverse-effect">
                            <img src="img/works/img2.jpg" alt="" />
                            <div class="mask">                               
                                <a data-zl-popup="link2" class="fancybox" rel="group" href="img/works/img2.jpg">
                                    <i class="icon-search"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="element item view view-tenth" data-zlname="reverse-effect">
                            <img src="img/works/img3.jpg" alt="" />
                            <div class="mask">                                
                                <a data-zl-popup="link2" class="fancybox" rel="group" href="img/works/img3.jpg">
                                    <i class="icon-search"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="element item view view-tenth" data-zlname="reverse-effect">
                            <img src="img/works/img4.jpg" alt="" />
                            <div class="mask">
                                <a data-zl-popup="link2" class="fancybox" rel="group" href="img/works/img4.jpg">
                                    <i class="icon-search"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="element item view view-tenth" data-zlname="reverse-effect">
                            <img src="img/works/img5.jpg" alt="" />
                            <div class="mask">
                                <a data-zl-popup="link2" class="fancybox" rel="group" href="img/works/img5.jpg">
                                    <i class="icon-search"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="element item view view-tenth" data-zlname="reverse-effect">
                            <img src="img/works/img6.jpg" alt="" />
                            <div class="mask">
                                <a data-zl-popup="link2" class="fancybox" rel="group" href="img/works/img6.jpg">
                                    <i class="icon-search"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="element item view view-tenth" data-zlname="reverse-effect">
                            <img src="img/works/img7.jpg" alt="" />
                            <div class="mask">
                                <a data-zl-popup="link2" class="fancybox" rel="group" href="img/works/img7.jpg">
                                    <i class="icon-search"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="element item view view-tenth" data-zlname="reverse-effect">
                            <img src="img/works/img1.jpg" alt="" />
                            <div class="mask">
                                <a data-zl-popup="link2" class="fancybox" rel="group" href="img/works/img1.jpg">
                                    <i class="icon-search"></i>
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!--recent work end-->

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
	

	
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/hover-dropdown.js"></script>
    <script defer src="js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="assets/bxslider/jquery.bxslider.js"></script>

    <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>

    <script src="js/jquery.easing.min.js"></script>
    <script src="js/link-hover.js"></script>

    <script src="assets/fancybox/source/jquery.fancybox.pack.js"></script>

    <script type="text/javascript" src="assets/revolution_slider/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="assets/revolution_slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

    <script src="js/revulation-slide.js"></script>


  <script>

      RevSlide.initRevolutionSlider();

      $(window).load(function() {
          $('[data-zlname = reverse-effect]').mateHover({
              position: 'y-reverse',
              overlayStyle: 'rolling',
              overlayBg: '#fff',
              overlayOpacity: 0.7,
              overlayEasing: 'easeOutCirc',
              rollingPosition: 'top',
              popupEasing: 'easeOutBack',
              popup2Easing: 'easeOutBack'
          });
      });

      $(window).load(function() {
          $('.flexslider').flexslider({
              animation: "slide",
              start: function(slider) {
                  $('body').removeClass('loading');
              }
          });
      });

      //    fancybox
      jQuery(".fancybox").fancybox();



  </script>
  </body>
</html>
