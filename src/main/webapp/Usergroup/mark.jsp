<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
<head>
 <style>
    .opt{
    float:right;
    padding-right:100px;
    }
 </style>
</head>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<body style="min-width:100px;">
	<script>
		function save() {
			$.post("groups/update_point", $(".f1").serialize(), function(json) {
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
	</script>
		<form class="f1">
			<c:if test="${requestScope.info!=null}">
						  <input type="hidden" value="${info.id}" name="id">
						  </c:if>
		<span class="inputspan">
						  <label class="inputtext ">分数一:
						</label> 
						  <input  type="text" class="inputinput"  name="point1" value="${info.point1}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数二:
						</label> 
						  <input  type="text" class="inputinput" name="point2" value="${info.point2}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数三:
						</label> 
						  <input  type="text" class="inputinput" name="point3" value="${info.point3}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数四:
						</label> 
						  <input  type="text" class="inputinput" name="point4" value="${info.point4}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数五:
						</label> 
						  <input  type="text" class="inputinput" name="point5" value="${info.point5}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数六:
						</label> 
						  <input  type="text" class="inputinput" name="point6" value="${info.point6}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数七:
						</label> 
						  <input  type="text" class="inputinput" name="point7" value="${info.point7}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数八:
						</label> 
						  <input  type="text" class="inputinput" name="point8" value="${info.point8}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数九:
						</label> 
						  <input  type="text" class="inputinput" name="point9" value="${info.point9}">
						</span>
						<span class="inputspan">
						  <label class="inputtext ">分数十:
						</label> 
						  <input  type="text" class="inputinput" name="point10" value="${info.point10}">
						</span>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="save();"
						>保存</button>
				</div>
			</div>
		</form>
  <c:import url="/Model/form_footer.jsp" ></c:import>