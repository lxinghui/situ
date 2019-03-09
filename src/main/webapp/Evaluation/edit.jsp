<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>

<body style="min-width:100px;">
	<script>
	
		function edit() {
			var data = $(".f2").serializeArray();
			var activity_id=${requestScope.info.activity_id};
			$.ajax({
				url : "evaluations/update_json",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				//event.srcElement.disabled=false;
					if (json.status > 0) {
						parent.fresh(activity_id);
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
				<span class="inputspan">
						<input type="hidden" name="update" />
						<input type="hidden" name="id" value="${requestScope.info.id}" />
						
				 <label class="inputtext">评语:</label>
					 <select  class="inputinput" style="width:60px;" name="status">
	             
	              <c:forEach items="${requestScope.status}" var="r" varStatus="v">
	              <c:if test="${requestScope.info.status!=v.index}">
	           <option value="${v.index}">${r}</option>
	        </c:if>
	       <c:if test="${requestScope.info.status==v.index}">
	           <option selected="selected" value="${v.index}">${r}</option>
	        </c:if>
                  </c:forEach>
					 </select>
							&nbsp;&nbsp;&nbsp;<label class="inputtext">分数:</label>
					 <input class="inputinput" name="point" value="${requestScope.info.point}" />
						</span>
						
							 <span class="inputspan1 "> <label class="inputtext" style="">备注:</label>
				<textarea class="inputarea" name="comments" style="margin:0px;width: 308px;height:108px;"
					value="${requestScope.info.comments}">${requestScope.info.comments}</textarea>
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