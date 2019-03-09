<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>>">
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<script>
var p=${requestScope.search.page};
function fresh(){
location.href="schools/index1?pageno="+p;
}
function show(url,w,h){
	layer.open({
		type:2,
	    area:[w+'px',h+'px'],
	    fixed:false, //不固定
	    maxmin:true,
	    content:url,
	});
}
function openwin1(){
	show("schools/add1",300,200);
	}
function openedit1(id){
	show("schools/edit1?id="+id,300,200);
	}
function returnobject(o){
	
	}
function openwin(){
	layer_show("学校信息","schools/add1",350,180);
	}
	
	function openedit(id){
	layer_show("学校信息","schools/edit1?id="+id,350,180);
	}
</script>

</head>


<body  style="min-width:600px;">
   <span class="printtitle"></span>
     
     <form action="schools/index1" method="post">
       <div class="searchview">
       <label class="searchtext"><b>学校名称：</b></label>
       	<input type="text" name="name" class="inputinput" placeholder="请输入学校名称.."/>
        <button class="seachbt" type="submit">查询</button>
         <button class="seachbt" onclick="openwin1();" type="button">新增</button>
       </div>
        </form>
        
    <table class="tablelist">
    	<thead>
    	<tr>
        <th >名称</th>
        <th >操作</th>     
        </tr>
        </thead>
        
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="row" >
 <tr>
        <td>${row.name}</td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink" >修改</a></td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


<c:import url="/Model/list_footer.jsp" ></c:import>

