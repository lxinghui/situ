<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
 <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<style type="text/css">
body {
	font: 18px "宋体";
	text-align: center;
}

.viewlist input{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist select{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist label{
	height: 30px;
}

a:link {
	color: #00F;
	text-decoration: none;
}

a:visited {
	color: #00F;
	text-decoration: none;
}

a:hover {
	color: #c00;
	text-decoration: underline;
}

ul {
	list-style: none;
}

.main {
	clear: both;
	padding: 8px;
	text-align: center;
}



.menu0 {
	width: 600px;
}

.menu0 li {
	display: block;
	float: left;
	padding: 4px 0;
	height:30px;
	line-height:30px;
	width: 150px;
	text-align: center;
	cursor: pointer;
	background: #FFFFff;
}

.menu0 li.hover {
	background: #54f2e4;
}
.viewlist input{
	height: 30px;
}
.viewlist select{
	height: 30px;
}
.viewlist label{
	height: 30px;
}

#main0 ul {
	display: none;
}

#main0 ul.block {
	display: block;
}
.inputtext{
  float:left;
}
.inputinput{
position:absolute;
left:120px;
}

.edit{
 float:left;
}
</style>

<script>


	function setTab(m, n) {
		var tli = document.getElementById("menu" + m)
				.getElementsByTagName("li");
		var mli = document.getElementById("main" + m)
				.getElementsByTagName("ul");
		for (i = 0; i < tli.length; i++) {

			tli[i].className = i == n ? "hover" : "";

			mli[i].style.display = i == n ? "block" : "none";
		}
	}

	   var ss = "${requestScope.info.id}";
	   var ids ="${requestScope.ids}";

	
		  
		$(function(){
			if(ss!=""){
				load();
			}
			var sss = "${requestScope.ids}";
			if (sss != "") {
				$(".ids").val(sss);
			}
		});
		function getIds(id){
			$(".ids").val(id);
		}
		function fresh1(ids) {
			location.href = "activities/add1?ids="+ids;
		}
		function fresh(ids) {
			 var s = "${id}";
			 if(s!=""){
			location.href = "activities/edit1?ids="+ids+"&&id="+s;
			 }
		}
		function openuser() {
			if(ss==""){
			layer_show("添加学生", "users/add1", 650, 440);
			}else if(ss!=""){
				layer_show("添加学生", "users/add1?a_id="+ss, 650, 440);
			}
		}
	 
		function load(){
			var info =" ${requestScope.info.option}";
			var str = info+"";
			var data = [];
		    data = str.split("");
			for(var i=0;i<data.length;i++){
				if(data[i]=="1") $(".chk:eq("+(i-1)+")").prop("checked","checked");
			}
			
		}
		function save() {
		
			if (name1.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			var aid="";
     	$(".chk").each(function() {
     		if ($(this).prop("checked")) {
     			aid=aid+"1";
     		}else{
     			aid=aid+"0";
     		}
     	});
     	$(".opt").val(aid);
			if($(".cmd").prop("name")=="insert"){
			$.post("activities/insert_json1", $(".f1").serialize(), function(json) {
				/*找到f1这个类 form表单 $(selector).post(URL,data,function(data,status,xhr),dataType);
				 *serialize()序列化表单值
				 */
				if (json.status > 0) {
					parent.fresh();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				} else {
					alert(json.text);
				}
			}, "json");
		
			}else{
			$.post("activities/update_json1", $(".f1").serialize(), function(json) {
				/*找到f1这个类 form表单 $(selector).post(URL,data,function(data,status,xhr),dataType);
				 *serialize()序列化表单值
				 */
				if (json.status > 0) {
					parent.fresh();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				} else {
					alert(json.text);
				}
			}, "json");
			}
		}

		  function getid(){
	        	var aid="";
	        	$(".chk").each(function() {
	        		if ($(this).prop("checked")) {
	        			aid=aid+"1";
	        		}else{
	        			aid+aid+"0";
	        		}
	        	});
	        	return aid;
	        }
		laydate.render({
			  elem: '#test6'
			  ,range: true
			});
</script>
</head>
<script type="text/javascript">
	function edit() {
		if (name1.value == "") {
			MsgDialog("必须录入名称！", "录入错误");
			return;
		}
		event.srcElement.disabled=true;
		var data = $(".f1").serializeArray();
		$.ajax({
			url : "Entrance_Company/index",
			type : "post",
			data : data,
			dataType : "json",
			success : function(json) {
			event.srcElement.disabled=false;
				if (json.status > 0) {
					parent.fresh();
					layer_close();

				}
			}
		});
	}
	
	function pageParam(obj) {

	}
</script>
<body style="min-width:200px;">
		<form class="f1">
				<ul class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">活动信息</li>
					<li onclick="setTab(0,1)">课程信息</li>
					<li onclick="setTab(0,2)">其他信息</li>
				</ul>
				
				<div class="main" id="main0">
				<c:if test="${requestScope.info==null}">
							<input type="hidden"  class="cmd" name="insert" /> 
							<input type="hidden" class="opt"  name="option"  value="${requestScope.info.option}"/>
							</c:if>
							<c:if test="${requestScope.info!=null}">
								<input type="hidden"  class="cmd" name="update" /> 
								<input type="hidden" name="id" value="${requestScope.info.id}">
								<input type="hidden" class="opt" name="option"  value="${requestScope.info.option}"/> 
							</c:if>
					<ul class="block">
						<li>
						<div class="inputview1">
						<span class="inputspan"> 
								<label class="inputtext" style="">名称: </label>
								<input class="inputinput" style="width:400px;" type="text" id="name1" name="name" value="${requestScope.info.name}" > 
								</span>
									<span class="inputspan">
				<label class="inputtext ">添加学生:
						</label> 
						<div style=float:right;margin-right:550px;">
						
						<input type="hidden" name="ids" class="ids">
						<i class="fa fa-plus-square  " onclick="openuser();"></i>
						</div>
						</span>
						<div style="height:90px;width:100%">
						<label class="inputtext ">课程信息:</label>
							<div style="float:left">
				<textarea
				style="width: 400px; height: 90px;border: 1px solid #BABABA;" name="courseinfo"
				> ${requestScope.info.courseinfo} </textarea>
				</div>
						</div><br>
								<div style="height:90px;width:100%">
				<label class="inputtext ">计划安排信息:
						</label> 
						<div style="float:left">
						 	<textarea
				style="width: 400px; height: 90px;border: 1px solid #BABABA;" name="planinfo"
				> ${requestScope.info.planinfo} </textarea>
				</div>
						</div><br>
								<span class="inputspan">
						 <label class="inputtext">时间信息:</label>
        <input type="text" class="layui-input  inputinput" id="test6"  name="dateinfo" placeholder=" - " value="${requestScope.info.dateinfo}">

	</span>
							</div>
					</li>
					</ul>
				<ul>
					<li><div class="inputview1">
							<span class="inputspan"> <label class="inputtext ">学校:</label>
				<input class="inputinput" style="width:150px;" name="school"
				value="${requestScope.info.school}" /> 
				
			</span> <span class="inputspan"><label class="inputtext ">学院: </label>
				 <input class="inputinput"  style="width:150px;" name="college"
				value="${requestScope.info.college}" /> 
				</span>
					<span class="inputspan">
				<label class="inputtext ">人数:
						</label> 
						 <input class="inputinput" name="count" style="width:150px;" value="${requestScope.info.count}"/>
						</span>
						<span class="inputspan">
				<label class="inputtext ">班级数:
						</label> 
						 <input class="inputinput" name="classcount" style="width:150px;" value="${requestScope.info.classcount}"/>
						</span>
						<br>
						<span class="inputspan">
							<div class="edit">
						<label class="inputtext " style="width:80px;">辅导员:
						</label> 
<select  name="instructor_user_id">
        <c:forEach items="${requestScope.userlist}" var="r" varStatus="v">
     <c:if test="${requestScope.info.instructor_user_id!=r.id}">
							<option value="${r.id}">${r.name}</option>
						</c:if>
	<c:if test="${requestScope.info.instructor_user_id==r.id}">
							<option selected="selected" value="${r.id}">${r.name}</option>
						</c:if>
        </c:forEach>
        </select>
        </div>>
				</span>
				<span class="inputspan">
							<div class="edit">
        <label class="inputtext " style="width:80px;">来源人:
						</label> 
<select  name="source_operator_id">
        <c:forEach items="${requestScope.operatorlist}" var="r" varStatus="v">
     <c:if test="${requestScope.info.source_operator_id!=r.id}">
							<option value="${r.id}">${r.name}</option>
						</c:if>
	<c:if test="${requestScope.info.source_operator_id==r.id}">
							<option selected="selected" value="${r.id}">${r.name}</option>
						</c:if>
        </c:forEach>
        </select>
        </div>
				</span>
							<span class="inputspan">
							<div class="edit">
				<label class="inputtext " style="width:80px;">负责人:
						</label> 
<select name="charge_operator_id">
        <c:forEach items="${requestScope.operatorlist}" var="r" varStatus="v">
        <c:if test="${requestScope.info.charge_operator_id!=r.id}">
							<option value="${r.id}">${r.name}</option>
						</c:if>
	<c:if test="${requestScope.info.charge_operator_id==r.id}">
							<option selected="selected" value="${r.id}">${r.name}</option>
						</c:if>
        </c:forEach>
        </select>
        </div>
				</span>
						</div>
					</li>
				</ul>
				<ul>
					<li><div class="inputview1">
						<span class="inputspan">
						<div class="edit">
							 <label class="inputtext " >类型:
						</label>
         <select name="type">
        <c:forEach items="${requestScope.typestatus}" var="r" varStatus="v">
      <c:if test="${requestScope.info.type!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
	<c:if test="${requestScope.info.type==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
        </c:forEach>
        </select></div><div class="edit">
						   <label  class="inputtext " >状态:
						</label>
         <select name="status">
        <c:forEach items="${requestScope.statusstatus}" var="r" varStatus="v">
      <c:if test="${requestScope.info.status!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
	<c:if test="${requestScope.info.status==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
        </c:forEach>
        </select>
        </div>
        </span>
           <span class="inputspan">
           <div class="edit">
           <label class="inputtext ">投影
						</label>
						<input class="chk"  myid="${r.id}" type="checkbox">
						</div><div class="edit">
		   <label class="inputtext ">话筒
			             </label> 
			             <input class="chk"  myid="${r.id}" type="checkbox">
			             </div><div class="edit">
		   <label class="inputtext ">插排
						</label>  
						<input class="chk"  myid="${r.id}" type="checkbox">
						</div>
           </span>
        <div style="height:90px;width:100%">
				<label class="inputtext ">注意事项:
						</label> 
						<div style="float:left">
						 	<textarea
				style="width: 400px; height: 90px;border: 1px solid #BABABA;" name="attention"
				> ${requestScope.info.attention} </textarea>
				</div>
						</div><br>
						<div style="height:90px;width:100%">
				<label class="inputtext ">备注:
						</label> 
						<div style="float:left">
						 	<textarea
				style="width: 400px; height: 90px;border: 1px solid #BABABA;" name="comments"
				>${requestScope.info.comments}</textarea>
				</div>
						</div>
						<br>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="save();"
						>保存</button>
				</div>
						</div>
					</li>
				</ul>
			</div>
		
	</form>

