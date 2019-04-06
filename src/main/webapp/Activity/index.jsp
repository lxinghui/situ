<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/Model/list_head.jsp" ></c:import>
<head>

<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>
var pageno = ${requestScope.search.page};
var select = ${requestScope.select};
var txt = "${requestScope.txt}";

$(function() {
$(".sselect").on(
		"change",
		function() { //下拉的change事件
			$(".sinput").css("display", "none").prop("disabled",
					"disabled"); //disabled 不能更改  全部消失单独更改特定的
			$($(".sinput")[$(".sselect").val()]).css("display",
					"inline").removeAttr("disabled"); //sinput[] 数组  用sselect.val确定哪个sinput
		});

$(".sselect").val(select); //servlet回来的select
$(".sinput").css("display", "none").prop("disabled", "disabled");
$($(".sinput")[select]).css("display", "inline").removeAttr("disabled").val(txt);
});
function fresh() {  
		location.href = "activities/index1?pageno="+pageno;
	}
	function returnobject(o) {

	}

function openwin(){
	layer_show("实训活动","activities/add1",750,500);
	}
	function openedit(id){
	layer_show("实训编辑","activities/edit1?id="+id,750,500);
	}
	function showusers(id){
		layer_show("成员详情","activities/showusers?id="+id,600, 400);
	}
	function openfacility(id){
		layer_show("设备","activities/facility?id="+id,400, 260);
	}
	function showdetails(id){
		layer_show("活动详情","activities/details?id="+id,820,500);
	}
	function showtime(id){
		layer_show("时间安排","times/index1?a_id="+id,1020,550);
	}
	function showsummary(activity_id){
		layer_show("总结详情","summarys/edit1?activity_id="+activity_id,600,350);
	}
	function showevaluation(id){
		layer_show("测评信息","evaluations/index1?activity_id="+id,620,400);
	}
</script>

</head>


<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="activities/index1" method="post">
     <select class="sselect inputinput" style="height:30px;" name="select">
										<!-- $(".sselect").val() -->
										<option value="0">类型查询</option>
										<option value="1">来源人查询</option>
										<option value="2">负责人查询</option>
										<option value="3">学校名查询</option>
									</select> 
   
                                    <select name="txt" class="inputselect sinput"
										style="height: 30px; display: none;">
										<c:forEach items="${requestScope.typestatus}" var="r"
											varStatus="v">
											<option value="${v.index}">${r}</option>
										</c:forEach>
									</select> <select name="txt" class="inputselect sinput"
										style="height: 30px; display: none;">
										<c:forEach items="${requestScope.sourcelist}" var="r"
											varStatus="v">
											<option value="${r.id}">${r.name}</option>
										</c:forEach>
									</select> <select name="txt" class="inputselect sinput"
										style="height: 30px; display: none;">
										<c:forEach items="${requestScope.chargelist}" var="r"
											varStatus="v">
											<option value="${r.id}">${r.name}</option>
										</c:forEach>
									</select>
									
     <input name="txt" class="sinput" style="height:30px;display:inline-block;vertical-align:middle;border:1px;" > 
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt" type="button" onclick="openwin();">新增</button>
         
        </form>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th style="line-height: 22px;">实训名称</th>
        <th  style="line-height: 22px;">课程安排</th>
        <th  style="line-height: 22px;">时间信息</th>
        <th  style="line-height: 22px;">计划信息</th>
        <th style="line-height: 22px;">学校</th>
        <th  style="line-height: 22px;">学院</th>
        <th>人数</th>
        <th>班级数</th>
        <th  style="line-height: 22px;">注意事项</th>
        <th>类型</th>
        <th>负责人</th>
        <th>来源人</th>
        <th>状态</th>
        <th width="20%">操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
        <tr>
        <td class="bigtext">${row.name}</td>
        <td class="bigtext">${row.courseinfo}</td>
        <td class="bigtext">${row.dateinfo}</td>
        <td class="bigtext">${row.planinfo}</td>
        <td class="bigtext">${row.school}</td>
        <td class="bigtext">${row.college}</td>
        <td>${row.count}</td>
        <td>${row.classcount}</td>
        <td class="bigtext">${row.attention}</td>
        <td>${row.type_Name}</td>
        <td>${row.c_name}</td>
        <td>${row.s_name}</td>
        <td>${row.status_Name}</td>
        <td><a href="javascript:openfacility(${row.id});" >设施</a>
        <a href="javascript:showtime(${row.id});"  >时间</a>
        <c:if test="${sessionScope.power==4}">
        <a href="javascript:openedit(${row.id});" >修改</a>    
        </c:if>     
         <c:if test="${sessionScope.power==3}">
        <a href="javascript:openedit(${row.id});" >修改</a>    
        </c:if> 
        <a href="javascript:showusers(${row.id});" >成员</a>
        <a href="javascript:showsummary(${row.id});" >总结</a>
        <a href="javascript:showevaluation(${row.id});" >测评</a>
        </td>
        
        </tr>  
        </c:forEach>
        </tbody>
    </table>
       
   
  <c:import url="/Model/list_footer.jsp" ></c:import>