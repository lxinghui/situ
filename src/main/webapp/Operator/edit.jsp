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
			$.post("operators/insert_json", $(".f1").serialize(), function(json) {
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
			$.post("operators/update_json", $(".f2").serialize(), function(json) {
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
				<label class="inputtext ">昵称:
						</label> 
						<input type="hidden" name="insert" />
						 <input class="inputinput"
							id="name1" name="niki"/>
						</span>				
						<span class="inputspan">
				<label class="inputtext ">名字:
						</label> 
						 <input class="inputinput"
							id="name1" name="name"/>
						</span>	
											<span class="inputspan">
				<label class="inputtext ">类型:
						</label> 
<select name="type">
        <c:forEach items="${requestScope.typestatus}" var="r" varStatus="v">
        <option class="op" value="${v.index}">${r}</option>
        </c:forEach>
        </select>
        	<label class="inputtext " >权限:
						</label> 
<select name="power">
        <c:forEach items="${requestScope.powerstatus}" var="r" varStatus="v">
        <option class="op" value="${v.index}">${r}</option>
        </c:forEach>
        </select>
						
						<label class="inputtext " style="width:40px;">状态:
						</label> 
<select name="status">
        <c:forEach items="${requestScope.statusstatus}" var="r" varStatus="v">
        <option class="op" value="${v.index}">${r}</option>
        </c:forEach>
        </select>
					
						</span>
							<span class="inputspan">
				<label class="inputtext ">电话:
						</label> 
						 <input class="inputinput" type="tel"
							 name="tel"/>
						</span>
					
							<span class="inputspan">
				<label class="inputtext ">备注:
						</label> 

						 <input class="inputinput" type="text"
							 name="comments"/>
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
				<label class="inputtext ">昵称:
						</label> 
						<input type="hidden" name="id" value="${requestScope.info.id}">
						<input type="hidden" name="update" />
						 <input class="inputinput" 	id="name2"
							type="text" name="niki" value="${requestScope.info.niki}"/>
						</span>
							<span class="inputspan">
				<label class="inputtext ">名字:
						</label> 
						 <input class="inputinput"
							id="name2" name="name" value="${requestScope.info.name}"/>
						</span>	
							<span class="inputspan" >
				<label class="inputtext " style="width:40px;">类型:
						</label> 
<select name="type">
        <c:forEach items="${requestScope.typestatus}" var="r" varStatus="v">
        <c:if test="${requestScope.info.type!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
	<c:if test="${requestScope.info.type==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
        </c:forEach>
        </select>
        <label class="inputtext">权限:
						</label> 
<select name="power">
        <c:forEach items="${requestScope.powerstatus}" var="r" varStatus="v">
        <c:if test="${requestScope.info.power!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
	<c:if test="${requestScope.info.power==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
        </c:forEach>
        </select>
        	<label class="inputtext " >状态:
						</label> 
<select name="status">
        <c:forEach items="${requestScope.statusstatus}" var="r" varStatus="v">
        <c:if test="${requestScope.info.status!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
	<c:if test="${requestScope.info.status==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
        </c:forEach>
        </select>
						</span>
							<span class="inputspan">
				<label class="inputtext ">电话:
						</label> 
						 <input class="inputinput" type="tel"
							 name="tel" value="${requestScope.info.tel}"/>
						</span>

							<span class="inputspan">
				<label class="inputtext ">备注:
						</label> 

						 <input class="inputinput" type="text"
							 name="comments" value="${requestScope.info.comments}"/>
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