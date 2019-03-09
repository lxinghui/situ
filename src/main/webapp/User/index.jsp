<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/Model/list_head.jsp"></c:import>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>>">
<head>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>

<script>
	var p = ${requestScope.search.page};
	var type = "${requestScope.type}";
	function fresh() {
		location.href = "users/index1?pageno=" + p;
	}
	function show(url, w, h) {
		layer.open({
			type : 2,
			area : [ w + 'px', h + 'px' ],
			fixed : false, //不固定
			maxmin : true,
			content : url,
		});
	}
	function openwin1() {
		show("users/add1", 823, 534);
	}
	function openedit1(id) {
		show("users/edit1?id=" + id, 823, 534);
	}
	function returnobject(o) {

	}
	function openwin() {
		layer_show("用户信息", "users/add1", 860,500);
	}

	function openedit(id,type) {
		if(type==1){
			layer_show("辅导员信息", "users/edit2?id=" + id, 860,500);
		}else{
		layer_show("用户信息", "users/edit1?id=" + id, 860,500);
		}
	}
	function showdetails(id){
		layer_show("用户详情","users/details?id="+id,400,280);
	}

	function changer(o){
		$(o).nextAll().remove(); 
		$.getJSON("colleges/getBySchool_id",{schoolid:(o.value?o.value:1)},function(json){
			if(json.length>0){
				var label = $("<label id='cid' class='inputtext' style='width:40px;'>学院:</label>");
				var select = $("<select name='college_id' ></select>");	//生成一个select		
				for(var i=0;i<json.length;i++){
					select.append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
			
				}
	    		$(o).after(label);
				$("#cid").after(select);			//追加	
				
			}
				
		});
	}
	$(function(){
		  if(type!=""){
	             $(".type").val(type);
	             }
		$(".sinput").css("display","none").attr("disabled","disabled");
        $(".sinput").children().css("display","none").attr("disabled","disabled");
		$(".sinput:eq(0)").css("display","inline").removeAttr("disabled");
		$(".sinput:eq(0)").children().css("display","inline").removeAttr("disabled");
	
		$(".sselect").on("change",function(){
			$(".sinput").css("display","none").attr("disabled","disabled");
             $(".sinput").children().css("display","none").attr("disabled","disabled");
			$(".sinput:eq("+$(".sselect").val()+")").css("display","inline").removeAttr("disabled");
			$(".sinput:eq("+$(".sselect").val()+")").children().css("display","inline").removeAttr("disabled");
		});
		
		$(".sselect").val("${requestScope.select}");
		$(".sinput").css("display","none").attr("disabled","disabled");
		$(".sinput").children().css("display","none").attr("disabled","disabled");
		$($(".sinput")["${requestScope.select}"]).css("display","inline").removeAttr("disabled").val("${requestScope.txt}");
		$($(".sinput")["${requestScope.select}"]).children().css("display","inline").removeAttr("disabled").val("${requestScope.txt}");
	});
</script>

</head>


<body>
	<span class="printtitle"></span>

	<form action="users/index1" method="post">
		<div class="searchview" style="width:100%;">
		 <select class="sselect" name="select">
             <option value="0">学院查询</option>
             <option value="1">姓名查询</option>
             <option value="2">电话查询</option>
             <option value="3">意向查询</option>
             <option value="4">关注查询</option>
             <option value="5">状态查询</option>
         </select>
      
		  <div style="width:450px;height: 35px;display: inline-block;"  class="sinput">
				<label class="inputtext " style="width:40px;">学校:</label> 
				<select onchange="changer(this);" name="school_id">
		
                <c:forEach items="${requestScope.schoollist}" var="r" varStatus="v">             
	            <option class="op" value="${r.id}">${r.name}</option>	  
                </c:forEach>
                </select>
                <label class="inputtext " style="width:40px;">学院:</label> 
				<select class="op"name="college_id">
                <c:forEach items="${requestScope.collegelist}" var="r" varStatus="v">             
	            <option class="op" value="${r.id}">${r.name}</option>	  
                </c:forEach>
                </select>     
                </div>
                     <div style="width:450px;height: 35px;display: inline-block;display: none;"  class="sinput">
                  
                   <input name="txt"  style="width: 300px;height: 30px;border: 1px solid black ;border-radius: 10px">
                  </div>
                     <div style="width:450px;height: 35px;display: inline-block;display: none;"  class="sinput">
                  
                   <input name="txt"  style="width: 300px;height: 30px;border: 1px solid black ;border-radius: 10px">
                  </div>
                  
                 <div style="width:450px;height: 35px;display: inline-block;display: none" class="sinput">
                 <label class="inputtext " style="width:40px;">意向:</label>
                <select class="op"name="txt">
             
                <c:forEach items="${requestScope.ylevelstatus}" var="r" varStatus="v">             
	            <option class="op" value="${v.index}">${r}</option>	  
                </c:forEach>
                </select>
                </div>
                 <div style="width:450px;height: 35px;display: inline-block;display: none" class="sinput">
                <label class="inputtext " style="width:40px;">关注:</label>
                <select class="op"name="txt">
         
                <c:forEach items="${requestScope.glevelstatus}" var="r" varStatus="v">             
	            <option class="op" value="${v.index}">${r}</option>	  
                </c:forEach>
                </select>
                </div>
                 <div style="width:450px;height: 35px;display: inline-block;display: none" class="sinput">
                <label class="inputtext " style="width:40px;">状态:</label>
                <select class="op"name="txt">
        
                <c:forEach items="${requestScope.slevelstatus}" var="r" varStatus="v">             
	            <option class="op" value="${v.index}">${r}</option>	  
                </c:forEach>
                </select>
                 
                 
                 </div>
                
                <div style="width:300px;display: inline-block;" >
                <label class="inputtext " style="width:40px;">类型:</label>
                <select class="type" name="type">
                <c:forEach items="${requestScope.typestatus}" var="r" varStatus="v">             
	            <option class="op" value="${v.index}">${r}</option>	  
                </c:forEach>
                </select>
			<button class="seachbt" type="submit">查询</button>		
			</div>
		</div>
	</form>

	<table class="tablelist">
		<thead>
			<tr>
				<th>昵称</th>
				<th>姓名</th>
				<th>性别</th>
				<th>类型</th>
				<th>电话</th>
				<th>qq</th>
				<th>班级信息</th>
				<th>未来意向</th>
				<th>关注程度</th>
				<th>状态等级</th>
				<th>账户状态</th>
				<th width="10%">操作</th>
			</tr>
		</thead>

		<tbody>


			<c:forEach items="${requestScope.list}" var="row">
				<tr>
					<td class="bigtext">${row.niki}</td>
					<td>${row.name}</td>
					<td>${row.sex_Name}</td>
					<td>${row.type_Name}</td>
					<td class="bigtext">${row.tel}</td>
					<td class="bigtext">${row.qq}</td>
					<td>${row.classinfo}</td>
					<td>${row.ylevel_Name}</td>
					<td>${row.glevel_Name}</td>
					<td>${row.slevel_Name}</td>
					<td>${row.status_Name}</td>
					<td><a style="color:black;background:white;"  href="javascript:openedit(${row.id},${row.type});" class="layui-icon layui-icon-edit"></a>
					<a style="color:black;background:white;"  href="javascript:showdetails(${row.id});" class="layui-icon layui-icon-list"></a></td>
				</tr>
			</c:forEach>


		</tbody>
	</table>





	<div class="pagin">
		<div class="message">
			共<i class="blue">${requestScope.search.size}</i>条记录，共${requestScope.search.last_pageno}页，当前显示第&nbsp;
			<i class="blue">${requestScope.search.page}&nbsp;</i>页
		</div>
		<ul class="paginList">
			<li class="paginItem"><a href="users/index1?pageno=${1}&&select=${select}&&txt=${txt}">首页</a></li>
			<li class="paginItem"><a
				href="users/index1?pageno=${requestScope.search.prev}&&select=${select}&&txt=${txt}">上一页</a></li>
			<li class="paginItem"><a
				href="users/index1?pageno=${requestScope.search.next}&&select=${select}&&txt=${txt}">下一页</a></li>
			<li class="paginItem"><a
				href="users/index1?pageno=${requestScope.search.last_pageno}&&select=${select}&&txt=${txt}">末页</a></li>
		</ul>
	</div>
	<c:import url="/Model/list_footer.jsp"></c:import>