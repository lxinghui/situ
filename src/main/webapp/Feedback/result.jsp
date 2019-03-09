<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>
<body style="min-width:400px;">
	<script>
	
		function edit() {
			var data = $(".f2").serializeArray();
			var activity_id=${requestScope.info.activity_id};
			var date="${requestScope.info.date}";
			$.ajax({
				url : "Feedback/updateResult",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				//event.srcElement.disabled=false;
					if (json.status > 0) {
						parent.fresh(activity_id,date);
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					}
				}
			});
		}
		function pageParam(obj) {
		}
	</script>

	
	
	
		<form class="f2">
			<div class="inputview">
						<input type="hidden" name="update" />
						<input type="hidden" name="id" value="${requestScope.info.id}" />

						<span class="inputspan1 "> <label class="inputtext" style="">回应:</label>
				<textarea class="inputarea" name="result" style="margin-left:40px;margin-top:0px;"
					value="${requestScope.info.result}">${requestScope.info.result}</textarea>
			</span>
				<br>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();"
						>保存</button>
				</div>
			</div>
		</form>
	
		
	
  <c:import url="/Model/form_footer.jsp" ></c:import>