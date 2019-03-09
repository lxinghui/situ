<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>

<body style="min-width:100px;">
	<script>
		function add() {
			if (name1.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			
			var data = $(".f1").serializeArray();
			$.ajax({
				url : "colleges/insert_json",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				
					if (json.status > 0) {
						parent.fresh();
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);

					}
				}
			});
		}
		function edit() {
			if (name2.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
		
			var data = $(".f2").serializeArray();
			$.ajax({
				url : "colleges/update_json",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
		
					if (json.status > 0) {
						parent.fresh();
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);

					}
				}
			});
		}

		function pageParam(obj) {

		}
	</script>

	<c:if test="${requestScope.info==null}">

		<form class="f1">
			<div class="inputview">
				<span class="inputspan">
				<label class="inputtext ">学院名称:</label> 
						<input type="hidden" name="insert" />
						<input type="hidden" name="school_id" value="${requestScope.school_id}" /> 
						 <input class="inputinput" id="name1" name="name"/>
						</span>
				<br>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="add();"
						>保存</button>
				</div>
			</div>
		</form>
	</c:if>
	
	<c:if test="${requestScope.info!=null}">

		<form class="f2">
			<div class="inputview">
				<span class="inputspan">
				<label class="inputtext ">学院名称:</label> 
				<input type="hidden" name="update" />
				<input type="hidden" name="school_id"  value="${requestScope.info.school_id}" /> 
				<input type="hidden" name="id"  value="${requestScope.info.id}" /> 
				<input class="inputinput" id="name2"  name="name" value="${requestScope.info.name}"/>
				</span>
				<br>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				</div>
		</form>
	</c:if>
  <c:import url="/Model/form_footer.jsp" ></c:import>