<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>>">
<meta charset="UTF-8">
<title></title>

<!-- Latest compiled and minified CSS -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/default.css">
<!-- Optional theme -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- Avivo CSS -->
<link rel="stylesheet" href="assets/css/theme.css" />
<link rel="stylesheet" href="assets/css/avivo.css" />
<link rel="stylesheet" id="theme" href="assets/css/themes/start.css" />
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<script type="text/javascript">
function show(url,w,h){
	layer.open({
		type:2,
	    area:[w+'px',h+'px'],
	    fixed:false, //不固定
	    maxmin:true,
	    content:url,
	});
}
function openwin(){
	show("schools/index1",940,560);
	}
	
function openwin1(){
	show("operators/index1",940,560);
	}
function openwin2(){
	show("users/index1",1262,630);
	}
function openwin3(){
	show("colleges/index1",940,560);
	}
function openwin4(){
	show("activities/index1",1200,600);
	}
function openwin5(){
	show("times/index1",1200,600);
	}
function openwin6(){
	show("ques/index1",1200,600);
	}
</script>
</head>
<body>
	<header class="htmleaf-header">
		<div class="htmleaf-links"></div>
		<div class="htmleaf-demo center"></div>
	</header>

	<div class="nav-bar">
		<div class="start">
			<a href="#" class="start-menu" id="full"><i class="fa fa-bars"></i></a>
		</div>
		<div class="nav-apps"></div>
		<div class="clock">
			<ul>
				<li id="hours"></li>
				<li id="point">:</li>
				<li id="min"></li>
				<li id="point">:</li>
				<li id="sec"></li>
			</ul>
			<div id="Date"></div>
		</div>
	</div>
	<div class="menu">
		<div class="submenu">
			<ul>
				
			</ul>
		</div>
	</div>

	<div class="content">
		<div class="col-desktop">
			<div class="app-icon red">
				<a 
					href="javascript:openwin4();">
					<i class="fa fa-cogs"></i>实训活动
				</a>
			</div>
		</div>
		<div class="col-desktop">
			<div class="app-icon green">
				<a 
					href="javascript:openwin2();">
					<i class="fa fa-cogs"></i>用户
				</a>
			</div>
		
				<div class="app-icon green">
				<a 
					href="javascript:openwin6();">
					<i class="fa fa-cogs"></i>问卷反馈
				</a>
			</div>
		</div>
	</div>


	<!-- Latest compiled and minified JavaScript -->
	<script src="js/jquery-2.1.0.min.js"></script>
	<script src="http://cdn.bootcss.com/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.cookie.js"></script>
	<script src="assets/js/jquery.fullscreen.js"></script>
	<script src="assets/js/clock.js"></script>
	<script src="assets/js/desktop.js"></script>
</body>
</html>