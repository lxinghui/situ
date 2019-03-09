<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>


</head>

<body style="min-width: 100px;">
	<script>
	var activity_id=${requestScope.activity_id};
	var date = "${requestScope.date}";
	laydate.render({
		  elem: '#test1'
		});
	laydate.render({
		  elem: '#test2'
		});
	
	function save() {
		
		if($(".cmd").prop("name")=="insert"){
		$.post("checkwork/insert_json", $(".f1").serialize(), function(json) {
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
	
		}else{
		$.post("checkwork/update_json", $(".f1").serialize(), function(json) {
			/*找到f1这个类 form表单 $(selector).post(URL,data,function(data,status,xhr),dataType);
			 *serialize()序列化表单值
			 */
			if (json.status > 0) {
				parent.fresh(activity_id,date);
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			} else {               
				  
			}
		}, "json");
		}
	}
		function pageParam(obj) {

		}
	</script>
		<form class="f1">
		<c:if test="${requestScope.info==null}">
		<input type="hidden" class="cmd" name="insert" />
			</c:if>
		<c:if test="${requestScope.info!=null}">
		<input type="hidden" class="cmd" name="update" />
		<input type="hidden"  name="id"  value="${requestScope.info.id}"/>	
			</c:if>
			
			
			<div class="inputview">
			
		<c:if test="${requestScope.info!=null}">
			
			<span class="inputspan"> 
			    <label class="inputtext " style="width: 80px;">上午: </label> 
				<select name="check1">
						<c:forEach items="${requestScope.checkstatus}" var="r" varStatus="v">
							<c:if test="${requestScope.info.check1!=v.index}">
								<option value="${v.index}">${r}</option>
							</c:if>
							<c:if test="${requestScope.info.check1==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
							</c:if>
						</c:forEach>
				</select> 
			    <label class="inputtext " style="width: 80px;">下午: </label> 
				<select name="check2">
						<c:forEach items="${requestScope.checkstatus}" var="r" varStatus="v">
							<c:if test="${requestScope.info.check2!=v.index}">
								<option value="${v.index}">${r}</option>
							</c:if>
							<c:if test="${requestScope.info.check2==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
							</c:if>
						</c:forEach>
				</select> 
				<label class="inputtext " style="width: 80px;">晚上: </label> 
				<select name="check3">
						<c:forEach items="${requestScope.checkstatus}" var="r" varStatus="v">
							<c:if test="${requestScope.info.check3!=v.index}">
								<option value="${v.index}">${r}</option>
							</c:if>
							<c:if test="${requestScope.info.check3==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
							</c:if>
						</c:forEach>
				</select> 
				
				</span>
				</c:if>
				<span class="inputspan">
				<label class="inputtext ">备注:</label> 
	                     
						 <textarea class="inputarea" name="comments" style="margin:0px;width: 308px;height:108px;"
					value="${requestScope.info.comments}">${requestScope.info.comments}</textarea>
				</span>
			
				<div class="inputbtpanel" style="margin-top:100px;">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="save();"
						>保存</button>
				</div>
			</div>
           </form>
	
	
	<c:import url="/Model/form_footer.jsp"></c:import>