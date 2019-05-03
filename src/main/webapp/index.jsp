<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<head>
<!-- Latest compiled and minified CSS -->
<script type="text/javascript" src="fullcalendar/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/font_icon.css">
<link rel="stylesheet"  type="text/css"href="font_icon/iconfont.css">
<!-- Optional theme -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link href='fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<!-- Avivo CSS -->
<link rel="stylesheet" href="assets/css/theme.css" />
<link rel="stylesheet" href="assets/css/avivo.css" />
<link rel="stylesheet" id="theme" href="assets/css/themes/start.css" />
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<script type="text/javascript" src="fullcalendar/jquery-ui.custom.min.js"></script>
<script src='fullcalendar/fullcalendar.min.js'></script>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<link rel="stylesheet" type="text/css" href="js/layer/skin/layer.css" />
<style type="text/css">

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
</head>
<script type="text/javascript">

var power = "${sessionScope.power}";
var userid = "${sessionScope.id}";
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
	layer_show("学校","schools/index1",600,400);
	}
	
function openwin1(){
	layer_show("人员","operators/index1",940,560);
	}
function openwin2(){
	layer_show("学生","users/index1",1262,630);
	}
function openwin3(){
	layer_show("学院","colleges/index1",600,400);
	}
function openwin4(){
	if(power=='3'||power=='4'){
		layer_show("活动详情","activities/index1",1223,644);
	    }
	if(power=='1'||power=='2'){
		layer_show("活动详情","activities/index1?user_id="+userid,1223,644);
		}
	}
function openwin5(){
	layer_show("活动时间","times/index1",1223,644);
	}
function openwin6(){
	layer_show("反馈详情","feedback/index1",1200,600);
	}
function openwin7(){
	layer_show("分组详情","groups/index1",1223,644);
	}
function openwin8(){
	layer_show("考勤详情","checkwork/index1",1223,644);
	}

function openwin9(){
	layer_show("测评详情","evaluations/index1",1223,644)
}
function openwin10(){
	layer_show("活动总结","summarys/index1",1223,644)
}

function openwin11(){
	layer_show("更改密码","toChangePass",400,300)
}

function openwin12(){
	var user_id = ""+${sessionScope.id};
	layer_show("考勤详情","checkwork/studentindex?user_id="+user_id,1223,644)
}

function openwin13(){
	var user_id = ""+${sessionScope.id};
	layer_show("反馈详情","feedbacks/studentindex?user_id="+user_id,1223,644)
}

function openCal(){
	layer_show("活动日历","toCalendar",1223,644)
}
</script>
</head>
<body>
	<header class="htmleaf-header">
		<div class="htmleaf-links"></div>
		<div class="htmleaf-demo center"></div>
	</header>
    ${sessionScope.power}
	<div class="nav-bar">
		<div class="start">
			<a  class="start-menu" id="full"><i class="fa fa-bars"></i></a>
		</div>
		<div class="nav-apps"></div>
		<div class="clock" onclick="javascript:openCal();">
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
				<ul>
				<li><a  onclick="javascript:openwin11();"><i class="fa fa-cogs"></i></a></li>
		
			</ul>
			</ul>
		</div>
	</div>

	<div class="content">
		<div class="col-desktop">
		<c:if test="${sessionScope.power==4}">
			<div class="app-icon blue">
				<a 
					href="javascript:openwin();">
					<i class="fa fa-university"></i>学校
				</a>
			</div>
			<div class="app-icon red">
				<a 
					href="javascript:openwin1();">   
					<i class="fa fa-user-secret"></i>操作员
				</a>
			</div>
			</c:if>
			<div class="app-icon blue">
				<a 
					href="javascript:openwin4();">
					<i class="fa fa-star"></i>实训活动
				</a>
			</div>
			<div class="app-icon red">
				<a 
					href="javascript:openwin7();">
					<i class="fa fa-users"></i>活动分组
				</a>
			</div>
			<div class="app-icon red">
			  <c:if test="${sessionScope.power==4}">
				<a 
					href="javascript:openwin8();">
					<i class="fa fa-clock-o"></i>学生考勤
				</a>
		        </c:if>
		        <c:if test="${sessionScope.power==3}">
				<a 
					href="javascript:openwin8();">
					<i class="fa fa-clock-o"></i>学生考勤
				</a>
		        </c:if>
		        <c:if test="${sessionScope.power==1||sessionScope.power==2}">
				<a 
					href="javascript:openwin12();">
					<i class="iconfont  icon-gerenxiangmu background_blue color_blue size_50"></i>学生考勤
				</a>
		        </c:if>
			</div>
			<div class="app-icon green">
				<a 
					href="javascript:openwin13();">
					<i class="fa fa-bar-chart"></i>学生反馈
				</a>
			</div>
		</div>
		<div class="col-desktop">
		<c:if test="${sessionScope.power==4}">
			<div class="app-icon green">
				<a 
					href="javascript:openwin2();">
					<i class="fa fa-user"></i>用户
				</a>
			</div>
			
			<div class="app-icon green">
				<a 
					href="javascript:openwin3();">
					<i class="fa fa-building"></i>学院
				</a>
			</div>
			</c:if>
			<c:if test="${sessionScope.power==3}">
			<div class="app-icon green">
				<a 
					href="javascript:openwin2();">
					<i class="fa fa-user"></i>用户
				</a>
			</div>
			
			<div class="app-icon green">
				<a 
					href="javascript:openwin3();">
					<i class="fa fa-building"></i>学院
				</a>
			</div>
			</c:if>
			<div class="app-icon green">
				<a 
					href="javascript:openwin5();">
					<i class="fa fa-calendar"></i>实训时间
				</a>
			</div>
			
		</div>
	</div>


	<!-- Latest compiled and minified JavaScript -->

	<script src="http://cdn.bootcss.com/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.cookie.js"></script>
	<script src="assets/js/jquery.fullscreen.js"></script>
	<script src="assets/js/clock.js"></script>
	<script src="assets/js/desktop.js"></script>
</body>
</html>