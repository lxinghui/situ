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
			$.post("schools/insert_json", $(".f1").serialize(), function(json) {
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
		function edit() {
			if (name2.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			$.post("schools/update_json", $(".f2").serialize(), function(json) {
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

		function pageParam(obj) {

		}
	</script>

	<c:if test="${requestScope.info==null}">

		<form class="f1">
			<div class="inputview">
				<span class="inputspan">
				<label class="inputtext ">学校名称:
						</label> 
						<input type="hidden" name="insert" />
						 <input class="inputinput"
							id="name1" name="name"/>
						</span>
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
				<label class="inputtext ">学校名称:
							</label> <input type="hidden" name="update" />
							 <input type="hidden"
								name="id" value="${requestScope.info.id}" /> <input
								class="inputinput" id="name2" name="name"
								value="${requestScope.info.name}"
								 />
							</span>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				</div>
		</form>
	</c:if>
  <c:import url="/Model/form_footer.jsp" ></c:import>