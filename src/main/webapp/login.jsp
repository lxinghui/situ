<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>思途实训</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 
 
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="css/font.css">
	<link rel="stylesheet" href="css/xadmin.css">
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
<script type="text/javascript">
var a=0;
function changed(o){
	o.src="imgCode?a="+(a++);
}
$(document).ready(function(){
    $(".student").click(function(){
 	  $(this).addClass("layui-form");
 	 $(this).addClass("action");
 	  $(".teacher").removeClass("action");
 	  $(".studentlogin").removeClass("action1");
 	  $(".studentlogin").addClass("validate");
 	  $(".teacherlogin").addClass("action1");
 	  $(".teacherlogin").removeClass("validate");
 		$(".studentlogin").addClass("layui-form");
 		 $(".teacherlogin").removeClass("layui-form"); 
    }); 
    $(".teacher").click(function(){
 	  $(this).addClass("action");
 	
  	  $(".student").removeClass("action");
  	  $(".student").removeClass("validate");
  	  $(".teacherlogin").removeClass("action1");
  	  $(".teacherlogin").addClass("validate");
  	$(".teacherlogin").addClass("layui-form");
	      $(".studentlogin").addClass("action1");
	      $(".studentlogin").removeClass("validate");
	      $(".studentlogin").removeClass("layui-form"); 
    });
 });
 
</script>
</head>
<style>
   .formheader div{
      display:inline-block;
      width:100px;
      height:30px;
      text-align: center;
      margin: 0 0 0 40px;
   }
   .formheader div:hover{
      cursor:pointer;
   }
   .action{
      border-bottom: 2px solid black ; 
   }
   .action1{
      display:none;
 
   }
</style>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">思途实训</div>
        <div id="darkbannerwrap"></div>
         <div class="formheader">
                     <div class="student action">用户登录</div><div class="teacher">教师登录</div>
                </div>
              <form class="studentlogin validate">
                    <input type="hidden" value="student" name="type"/>
                    <input type="text" name="niki" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="pass" class="form-control pword m-b" placeholder="密码" />
                    <input type="text"  name="code" class="form-control" style="width:180px;height:30px;display: inline;" placeholder="验证码" />
                    <img src="imgCode" onclick="changed(this);" style="height: 30px;">
                <button class="btn btn-success btn-block studentbtn" type="button" style="width: 200px;height:50px;margin-left: 70px">学生登录</button>
                 </form>
                 <form class="teacherlogin action1">
                    <input type="hidden" value="teacher" name="type"/>
                    <input type="text" name="niki" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="pass" class="form-control pword m-b" placeholder="密码" />
                    <input type="text"  name="code" class="form-control" style="width:180px;height:30px;display: inline;" placeholder="验证码" />
                    <img src="imgCode" onclick="changed(this);" style="height: 30px;">
                <button class="btn btn-success btn-block teacherbtn" type="button" style="width: 200px;height:50px;margin-left: 70px">教师登录</button>
                 </form>
    </div>
<script type="text/javascript">
var a=0;
$(document).ready(function(){
	  $(".teacherbtn").click(function(){
		  $.ajax({
			url : "login" ,
			type : "POST",
			dataType : "json",
			data : $(".teacherlogin").serialize(),
			success : function(json) {
				if(json==-1){
					alert("账号密码错误");
					window.location.reload();
				}else if(json==-2){
					alert("验证码错误，请重新登录");
					window.location.reload();
				}else if(json==-3){
					alert("该账号被禁用");
					window.location.reload();
				}else if(json==-4){
					alert("该账号已过期");
					window.location.reload();
				}else{
					window.location.href="index.jsp";
				}
			}
		 }); 
	  });
	  
	  $(".studentbtn").click(function(){
		  $.ajax({
			url : "login" ,
			type : "POST",
			dataType : "json",
			data : $(".studentlogin").serialize(),
			success : function(json) {
				if(json==-1){
					alert("账号密码错误");
					window.location.reload();
				}else if(json==-2){
					alert("验证码错误，请重新登录");
					window.location.reload();
				}else if(json==-3){
					alert("该账号被禁用");
					window.location.reload();
				}else if(json==-4){
					alert("该账号已过期");
					window.location.reload();
				}else{
					window.location.href="toindex";
				}
			}
		 }); 
	  });
});
</script>
 
</body>
</html>