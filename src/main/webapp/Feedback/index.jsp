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
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<script>
	var p = ${requestScope.search.page};

	function fresh(activity_id,date) {
		location.href = "Feedback/index1?activity_id="+activity_id+"&&date="+date ;
	}
	
	function openresult(id,activity_id,date){
		layer_show("讲师回应","Feedback/openresult?id="+id+"&&activity_id="+activity_id+"&&date="+date,500,250);
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
    function member_stop(obj,id){
        layer.confirm('确认要改变吗？',function(index){

            if($(obj).attr('title')=='隐藏'){
              //发异步把用户状态进行更改

		$.ajax
		({
			url:'Feedback/updateStatus',
			type:'post',
			data:{"status":0,"id":id},
			success:function(result){
				if(result=="success"){
              $("#"+id).html("可见");
              $(obj).attr('title','可见');
              $(obj).find('i').html('&#xe601;');
              layer.msg('已可见!',{icon: 6,time:1000});
				}},
			error: function(){
				alert("Ajax请求失败")
			}
		})           
            }else{
                
        		$.ajax
        		({
        			url:'Feedback/updateStatus',
        			type:'post',
        			data:{"status":1,"id":id},
        			success:function(result){
        				if(result=="success"){
        					$("#"+id).html("隐藏");
        					$(obj).attr('title','隐藏');
        	                $(obj).find('i').html('&#xe62f;');
        					layer.msg('隐藏!',{icon: 5,time:1000});
        				}},
        			error: function(){
        				alert("Ajax请求失败")
        			}
        		})
            }
        })
    } 
	$(function(){

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
              
</script>

</head>


<body style="min-width:920px;">
	<span class="printtitle"></span>

		<form action="Feedback/index1" method="post">
		<div class="searchview">
		<label class="searchtext"><b>活动：</b></label> 
				<select  name="activity_id" class="select inputinput">		
                <c:forEach items="${requestScope.activitylist}" var="r" varStatus="v"> 
                 <c:if test="${r.id!=requestScope.activity_id}">          
	            <option class="op" value="${r.id}">${r.name}</option>
	            </c:if>	
	             <c:if test="${r.id==requestScope.activity_id}">          
	            <option selected="selected" class="op" value="${r.id}">${r.name}</option>
	            </c:if>	  
                </c:forEach>
                </select>	  
                  <label class="searchtext"><b>时间：</b></label> 
				<select  name="date" id="date" class="date inputinput">
		
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

	<table class="tablelist">
		<thead>
			<tr>
				<th>姓名</th>			
				<th>学习状态</th>
				<th>讲师进度</th>
				<th>课堂氛围</th>
				<th>薄弱环节</th>
				<th>完成作业</th>
				<th>进步程度</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>

		<tbody>


			<c:forEach items="${requestScope.list}" var="row">
				<tr>
					<td>${row.u_name}</td>
					<td>${row.opt1}</td>
					<td>${row.opt2}</td>
					<td>${row.opt3}</td>
					<td class="bigtext">${row.text1}</td>
					<td class="bigtext">${row.text2}</td>
					<td class="bigtext">${row.text3}</td>		
					<td id="${row.id}">${row.status_Name}</td>
					
					<td><a onclick="member_stop(this,${row.id})"
							title="${row.status_Name}" href="javascript:;"> 
							<c:if test="${row.status==0}"><i class="layui-icon">&#xe601;</i></c:if>
							<c:if test="${row.status==1}"><i class="layui-icon">&#xe62f;</i></c:if>
						</a>&nbsp;
						<a href="javascript:openresult(${row.id},${row.activity_id},'${row.date}');">回答</a>
						</td>
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
			<li class="paginItem"><a href="Feedback/index1?pageno=${1}">首页</a></li>
			<li class="paginItem"><a
				href="Feedback/index1?pageno=${requestScope.search.prev}">上一页</a></li>
			<li class="paginItem"><a
				href="Feedback/index1?pageno=${requestScope.search.next}">下一页</a></li>
			<li class="paginItem"><a
				href="Feedback/index1?pageno=${requestScope.search.last_pageno}">末页</a></li>
		</ul>
	</div>
	<c:import url="/Model/list_footer.jsp"></c:import>