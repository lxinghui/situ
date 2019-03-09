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
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script>
	var p = ${requestScope.search.page};
	var activity_id = ${requestScope.activity_id};
	var today = "${requestScope.today}";
	$(function(){
		$(".selectall").on("click", function() {
			if ($(this).prop("checked")) { //全选
				$(".chk").prop("checked", "checked"); //checked = "checked"
			} else {
				$(".chk").prop("checked", "");
			}
		});
	});
	function getid(){
		var aid;
		var str;
		var data = [];
		$(".chk").each(function() {
			if ($(this).prop("checked")) {
				 aid = $(this).attr("myid");
				 data.push(aid);
			}
		});
		str = data.join(",");
		return str;
	}
	

	function fresh(activity_id,date) {
		location.href = "checkwork/index1?pageno=" + p+"&&activity_id="+activity_id+"&&date="+date;
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
		show("checkwork/add1", 550, 350);
	}
	function openedit1(id) {
		show("checkwork/edit1?id=" + id, 550, 350);
	}
	function returnobject(o) {

	}
	function openwin() {
		layer_show("信息", "checkwork/add1", 550, 350);
	}
	function b_edit(date) {
		ids = getid();
		if(ids==""||ids==null){
			alert("请先选择");
		}else{
		layer_show("批量考勤", "checkwork/b_add?activity_id="+activity_id+"&&ids=" + ids+"&&date="+date, 500, 300);
		}
	}
	
	function openedit(id,activity_id,date) {
		
		layer_show("修改考勤", "checkwork/edit1?id=" + id+"&&activity_id="+activity_id+"&&date="+date, 500, 300);
		
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

	<form action="checkwork/index1" method="post">
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
	<c:if test="${sessionScope.power==3}">
<button class="seachbt" type="button" onclick="b_edit('${requestScope.date}');">批量考勤</button></c:if>
	<c:if test="${sessionScope.power==4}">
<button class="seachbt" type="button" onclick="b_edit('${requestScope.date}');">批量考勤</button></c:if></div>
	<table class="tablelist">
		<thead>
			<tr>
	<!-- 			<th>活动名</th> -->
	   <th><input type="checkbox" class="selectall"></th>
				<th>参与人</th>
	<!-- 			<th>时间</th> -->
				<th>上午</th>
				<th>下午</th>
				<th>晚上</th>
	<!-- 			<th>最后时间</th>
				<th>最后人</th> -->
				<th>备注</th>
				<c:if test="${sessionScope.power==3}">
				<th>操作</th>
				</c:if>
				<c:if test="${sessionScope.power==4}">
				<th>操作</th>
				</c:if>
			</tr>
		</thead>

		<tbody>


			<c:forEach items="${requestScope.list}" var="row">
				<tr>
		<%-- 			<td>${row.a_name}</td> --%>
		  <td><input class="chk" type="checkbox" myid="${row.id}"></td>
					<td>${row.u_name}</td>
<%-- 					<td>${row.date}</td> --%>
					<td>${row.check1_Name}</td>
					<td>${row.check2_Name}</td>
					<td>${row.check3_Name}</td>
				<%-- 	<td>${row.lastdate}</td>
					<td>${row.o_name}</td> --%>
					<td class="bigtext">${row.comments}</td>
					<c:if test="${sessionScope.power==3}">
					<td><a href="javascript:openedit(${row.id},${requestScope.activity_id},'${requestScope.date}');"
						class="tablelink">修改</a></td></c:if>
						<c:if test="${sessionScope.power==4}">
					<td><a href="javascript:openedit(${row.id},${requestScope.activity_id},'${requestScope.date}');"
						class="tablelink">修改</a></td></c:if>
				</tr>
			</c:forEach>


		</tbody>
	</table>




	<c:import url="/Model/list_footer.jsp"></c:import>