<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/page/taglibs.jsp" %>

<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Wow</title>		
		
		<!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' href='http://fonts.useso.com/css?family=Open+Sans:400,700|Droid+Sans:400,700' />
        <!--[if lt IE 9]>
		<link href="http://fonts.useso.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
		<link href="http://fonts.useso.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
		<link href="http://fonts.useso.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
		<link href="http://fonts.useso.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
		<![endif]-->

	    <!-- Css files -->
	    <link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">		
		<link href="${ctx}/resources/css/font-awesome.min.css" rel="stylesheet">
		<link href="${ctx}/resources/css/climacons-font.css" rel="stylesheet">
	    <link href="${ctx}/resources/css/style.min.css" rel="stylesheet">
		<link href="${ctx}/resources/css/add-ons.min.css" rel="stylesheet">		

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    
	    <!-- start: JavaScript-->
		<script src="${ctx}/resources/js/jquery-2.1.1.min.js"></script>
		<script src="${ctx}/resources/js/core.min.js"></script>
		<script src="${ctx}/resources/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
			$(function(){
				$("#modular").load(function() {
					$(this).height(0); //用于每次刷新时控制IFRAME高度初始化 
					var height = $(this).contents().height() + 10;
					$(this).height(height < 650 ? 650 : height);
				});
			});
		
			function openFrame(src) {
				var frame = document.getElementById("modular");
				frame.src = "${ctx}/" + src;
			}
			
			function adapter(height) {
				$("#modular").height(height < 650 ? 650 : height);
			}
		</script>
	</head>
</head>

<body>
	<!-- start: Header -->
	<div class="navbar" role="navigation">
	
		<div class="container-fluid">		
			
			<ul class="nav navbar-nav navbar-actions navbar-left">
				<li class="visible-md visible-lg"><a href="javascript:void(0)" id="main-menu-toggle"><i class="fa fa-th-large"></i></a></li>
				<li class="visible-xs visible-sm"><a href="javascript:void(0)" id="sidebar-menu"><i class="fa fa-navicon"></i></a></li>			
			</ul>
			
	        <ul class="nav navbar-nav navbar-right">
				<li class="dropdown visible-md visible-lg">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown">${currentUser.nickName}</a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Account</strong>
						</li>						
						<li><a href="page-profile.html"><i class="fa fa-user"></i> Profile</a></li>
						<li><a href="page-login.html"><i class="fa fa-wrench"></i> Settings</a></li>
						<li><a href="page-invoice.html"><i class="fa fa-usd"></i> Payments <span class="label label-default">10</span></a></li>
						<li><a href="gallery.html"><i class="fa fa-file"></i> File <span class="label label-primary">27</span></a></li>
						<li class="divider"></li>						
						<li><a href=""><i class="fa fa-sign-out"></i>Logout</a></li>	
	        		</ul>
	      		</li>
				<li><a href="${ctx}/loginout"><i class="fa fa-power-off"></i></a></li>
			</ul>
		</div>
		
	</div>
	<!-- end: Header -->
	
	<div class="container-fluid content">
	
		<div class="row">
				
			<!-- start: Main Menu -->
			<div class="sidebar ">
								
				<div class="sidebar-collapse">
					<div class="sidebar-header t-center">
                        <span style="font-size:20px;font-weight:bold;color:white;">后台管理系统</span>
                    </div>										
					<div class="sidebar-menu">
						<ul class="nav nav-sidebar">
							<li>
								<a href="javascript:void(0)"><i class="fa fa-bolt"></i><span class="text"> 首页管理</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">滚动图片管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">友情链接管理</span></a></li>
								</ul>
							</li>

							<li>
								<a href="javascript:void(0)"><i class="fa fa-bolt"></i><span class="text"> 协会管理</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">协会简介管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">组织架构管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">协会章程管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">大事记管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">声像图片管理</span></a></li>
								</ul>
							</li>
						
							<li>
								<a href="javascript:void(0)"><i class="fa fa-bolt"></i><span class="text"> 新闻中心管理</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">新闻类型管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">新闻管理</span></a></li>
								</ul>
							</li>
						
							<li>
								<a href="javascript:void(0)"><i class="fa fa-bolt"></i><span class="text"> 政策法规管理</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">最新政策管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">法律法规管理</span></a></li>
								</ul>
							</li>
						
							<li>
								<a href="javascript:void(0)"><i class="fa fa-bolt"></i><span class="text"> 教育培训管理</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">培训内容管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">网络调查表管理</span></a></li>
								</ul>
							</li>
						
							<li>
								<a href="javascript:void(0)"><i class="fa fa-bolt"></i><span class="text"> 会员服务管理</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">入会须知管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">入会程序管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">会员权利与义务管理</span></a></li>
								</ul>
							</li>
						
							<li>
								<a href="javascript:void(0)"><i class="fa fa-bolt"></i><span class="text"> 会员管理</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">会员用户组管理</span></a></li>
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">会员信息管理</span></a></li>
								</ul>
							</li>
						
							<li><a href="index.html"><i class="fa fa-laptop"></i><span class="text"> 协会活动管理</span></a></li>
						
							<li><a href="index.html"><i class="fa fa-laptop"></i><span class="text"> 联系方式管理</span></a></li>
											
							<li>
								<a href="javascript:void(0)"><i class="fa fa-bolt"></i><span class="text"> 系统管理</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">									
									<li><a href="javascript:void(0)" onclick="openFrame('accountController/list')"><i class="fa fa-meh-o"></i><span class="text">用户管理</span></a></li>
								</ul>
							</li>
						</ul>
					</div>					
				</div>
			</div>
			<!-- end: Main Menu -->
		
		<!-- start: Content -->
		<div class="main">
			<iframe id="modular" name="modular" width="100%" frameborder=0 height="100%" src="" marginheight="0" marginwidth="0"  scrolling="no">
		</div>
		<!-- end: Content -->
		
	</div><!--/container-->
	
	<div class="clearfix"></div>
	
		

	
</body>
</html>