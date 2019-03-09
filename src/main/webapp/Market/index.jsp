<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>>">
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<script>
var p=${requestScope.search.page};
var activity_id = "${requestScope.activity_id}";
var date = "${requestScope.date}";

function fresh(activity_id,date) {
	location.href = "market/index1?pageno=" + p+"&&activity_id="+activity_id+"&&date="+date;
}

function returnobject(o){
	
	}
	function openuser(){
		layer_show("学生信息","market/add1?activity_id="+activity_id+"&&date="+date,550,350);
	}

	function openedit(id){
	layer_show("讲师日报信息","Market/edit?id="+id,550,250);
	}
	function del(id){
		location.href="Market/delete?id="+id;
		}
	$(".del").on(
			"click",
			function() {
				var msg = "确认删除？";
				if (confirm(msg) == true) {

					$(event.target).parent().parent().remove();
					del();
					
				}
			});
	$(function(){

		if(${requestScope.list}!=null){
			var a = ${requestScope.list};
			$(".id").val(a.id);
			$("#my1").val(a.info);
			$("#my2").val(a.comments);
			$(".json").val(a.json);
			if(a.json!=null&&a.json!=""){
			j = JSON.parse(a.json);
			for(var i=0;i<j.length;i++){
				$(".ta").append("<tr class='tr' name="+j[i].name+" level="+j[i].level+" info="+j[i].info+"><td>"+j[i].name+"</td><td>"+j[i].level+"</td><td>"+j[i].info+"</td><td><button  class='del' onclick='del(this);' style='display: inline;' >删除</button></td></tr>");
			}
			}
		}
				$(".select").change(function(){
			
			$("#date").find("option").remove();
			$.getJSON("times/getDate",{id:$(this).children('option:selected').val()},function(json) {
			    if (json.length > 0) {
					for (var i = 0; i < json.length; i++) {
						$("#date").append($("<option value='"+json[i].date+"'>"+ json[i].date+ "</option>"));
					}
				} 
	        });
		});
		
	});

	function del(o){
		var msg = "确认删除？";
		if (confirm(msg) == true) {
			$(o).parents(".tr").remove();
		var id;
		if(${requestScope.list}!=null){
			var a = ${requestScope.list};
			id= a.id;
		}
		var data=[];
		$(".tr").each(function(){
			var row ={
				name: $(this).attr("name"),
				level: $(this).attr("level"),
				info: $(this).attr("info"),
			};
			data.push(row);
		});
		j=JSON.stringify(data);
		
		if(j="[]"){
			j="";
		}
		$(".json").val(j);
		$.ajax({
			type : "POST",
			url : "market/updateStus",
			//contentType : "application/json; charset=utf-8",
			data :{"json":j,"id":id},
			datatype:'json',
			success : function() {
				alert("删除成功");

				}
		});
		}
	}
function save() {

		$.post("market/update_json", $(".f1").serialize(), function(json) {
			/*找到f1这个类 form表单 $(selector).post(URL,data,function(data,status,xhr),dataType);
			 *serialize()序列化表单值
			 */
			if (json.status > 0) {
				alert("保存成功");
			} else {               
				  
			}
		}, "json");
		
	}

</script>

</head>


<body style="min-width: 300px">
	<span class="printtitle"></span>

	<form action="market/index1" method="post" style="margin-left: 30px;">
		<div>
			<label class="searchtext"><b>活动：</b></label> <select
				name="activity_id" class="select inputinput">

				<c:forEach items="${requestScope.activitylist}" var="r"
					varStatus="v">
					<c:if test="${r.id!=requestScope.activity_id}">
						<option class="op" value="${r.id}">${r.name}</option>
					</c:if>
					<c:if test="${r.id==requestScope.activity_id}">
						<option selected="selected" class="op" value="${r.id}">${r.name}</option>
					</c:if>
				</c:forEach>
			</select> <label class="searchtext"><b>时间：</b></label> <select name="date"
				id="date" class="date inputinput">

				<c:forEach items="${requestScope.datelist}" var="r" varStatus="v">
					<c:if test="${r.date!=requestScope.date}">
						<option class="op" value="${r.date}">${r.date}</option>
					</c:if>
					<c:if test="${r.date==requestScope.date}">
						<option selected="selected" class="op" value="${r.date}">${r.date}</option>
					</c:if>

				</c:forEach>
			</select>
			<button class="seachbt" type="submit">查询</button>
		</div>
	</form>
	<form class="f1">
		<input type="hidden" name="id" class="id"> <input
			type="hidden" name="json" class="json">
		<c:if test="${requestScope.list eq 'null'}">
			<label style="margin-left: 30px;" class="searchtext"><b>计划：</b></label>
			<textarea
				style="width: 400px; height: 90px; margin-top: 5px; margin-left: 22px; border: 1px solid #BABABA;"
				value="">  </textarea>
			<br>
			<label style="margin-left: 30px;" class="searchtext"><b>总结：</b></label>
			<textarea
				style="width: 400px; height: 90px; margin-top: 5px; margin-left: 22px; border: 1px solid #BABABA;"
				value=""> </textarea>

		</c:if>

		<c:if test="${ requestScope.list != 'null'}">
			<label style="margin-left: 30px;" class="searchtext"><b>计划：</b></label>
			<textarea id="my1" type="text" name="info"
				style="width: 400px; height: 90px; margin-top: 5px; margin-left: 22px; border: 1px solid #BABABA;">
			</textarea>
			<br>
			<label style="margin-left: 30px;" class="searchtext"><b>总结：</b></label>
			<textarea id="my2" type="text" name="comments"
				style="width: 400px; height: 90px; margin-top: 5px; margin-left: 22px; border: 1px solid #BABABA;">
</textarea>
		</c:if>

	</form>
	<div>
		<table class="tablelist"
			style="width: 500px; margin-top: 10px; margin-left: 30px;">
			<thead>
				<tr>
					<th style="width: 80%; text-align: center;">学生信息</th>
					<th style=""><i class="fa fa-plus-square"
						onclick="openuser();"></i></th>
				</tr>
			</thead>
		</table>
	</div>
	<table class="tablelist ta" style="width: 500px; margin-left: 30px;">
		<thead>
			<tr>
				<th style="width: 20%; text-align: center;">学生姓名</th>
				<th style="width: 15%; text-align: center;">学生等级</th>
				<th style="width: 35%; text-align: center;">具体情况</th>
				<th style="width: 30%; text-align: center;">操作</th>
			</tr>
		</thead>


	</table>

	<div class="inputbtpanel" style="margin-top: 10px;">
		<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
		<button class="seachbt1" type="button" onclick="save();">保存</button>
	</div>



</body>


