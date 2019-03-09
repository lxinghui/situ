<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/Model/list_head.jsp" ></c:import>
<head>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>
var pageno = ${requestScope.search.page}
function fresh() {
		location.href = "ques/index1?pageno="+pageno;
	}
	function returnobject(o) {

	}
		
function openwin(){
	layer_show("实训问卷","ques/add1",920,500);
	}
	function openedit(id){
	layer_show("问卷编辑","ques/edit1?id="+id,920,500);
	}
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="ques/index1" method="post">
     <label class="searchtext">名称:</label>
     	<input type="hidden" name="table" value="Entrance_Company"/>
       	<input type="hidden" name="col" value="name"/>
       	<input type="hidden" name="ex" value="like"/>
         <input class="searchinput" name="value"/>        
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt1  " type="button" onclick="allseach('Company_seach','Entrance_Company/index');">自定义查询</button>
        <button class="seachbt" type="button" onclick="openwin();">新增</button>
         
        </form>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th width="7%" style="line-height: 22px;">实训名称</th>
        <th>问题一</th>
        <th>问题二</th>
        <th>问题三</th>
        <th>问题四</th>
        <th>问题五</th>
        <th>问题六</th>
        <th>问题七</th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
        <tr>
        <td class="bigtext">${row.a_name}</td>
        <td class="bigtext">问题：${row.ques1}/文本：${row.text1}/选项：${row.option1}</td>
        <td class="bigtext">问题：${row.ques2}/文本：${row.text2}/选项：${row.option2}</td>
        <td class="bigtext">问题：${row.ques3}/文本：${row.text3}/选项：{row.option3}</td>
        <td class="bigtext">问题：${row.ques4}/文本：${row.text4}/选项：${row.option4}</td>
        <td class="bigtext">问题：${row.ques5}/文本：${row.text5}/选项：${row.option5}</td>
        <td class="bigtext">问题：${row.ques6}/文本：${row.text6}/选项：${row.option6}</td>
        <td class="bigtext">问题：${row.ques7}/文本：${row.text7}/选项：${row.option7}</td>
        <td><a href="javascript:openedit(${row.id});" class="layui-icon layui-icon-edit" ></a>
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
				<li class="paginItem"><a
					href="ques/index?pageno=${1}">首页</a>
				</li>
				<li class="paginItem"><a
					href="ques/index?pageno=${requestScope.search.prev}">上一页</a>
				</li>
				<li class="paginItem"><a
					href="ques/index?pageno=${requestScope.search.next}">下一页</a>
				</li>
				<li class="paginItem"><a
					href="ques/index?pageno=${requestScope.search.last_pageno}">末页</a>
				</li>
			</ul>
		</div>
  <c:import url="/Model/list_footer.jsp" ></c:import>