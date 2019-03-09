<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<body style="min-width: 100px;">
	<script>
		function add() {
			if (name1.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			$.post("users/insert_json1", $(".f1").serialize(), function(json) {
				/*找到f1这个类 form表单 $(selector).post(URL,data,function(data,status,xhr),dataType);
				 *serialize()序列化表单值
				 */
				 alert("添加成功");
				 alert(json.status);
				if (json.status >= 0) {
					if(json.status>=1){
						parent.getIds(json.status);
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					}else{
						alert("已存在该用户/"+json.text);
					}	
				} else
					
					if (json.status = -1) {
					parent.getIds(json.text);
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				}else {
					alert(json.text);
				}
			}, "json");
		}
		function edit() {
			if (name2.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			
			$.post("users/update_json", $(".f2").serialize(), function(json) {
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

		function changer(o) {
			$(o).nextAll().remove();
			$
					.getJSON(
							"colleges/getBySchool_id",
							{
								schoolid : (o.value ? o.value : 1)
							},
							function(json) {
								if (json.length > 0) {
									var label = $("<label id='cid' class='inputtext' style='width:80px;'>学院:</label>");
									var select = $("<select name='college_id' ></select>"); //生成一个select		
									for (var i = 0; i < json.length; i++) {
										select
												.append($("<option value='"+json[i].id+"'>"
														+ json[i].name
														+ "</option>"));
									}
									$(o).after(label);
									$("#cid").after(select); //追加	
								}
							});
		}
	</script>

	<c:if test="${requestScope.info==null}">

		<form class="f1">
			<div class="inputview">
			<input type="hidden" name="a_id" value="${requestScope.a_id}">
				<span class="inputspan"> <label class="inputtext ">昵称:
				</label> <input type="hidden" name="operator_id" value="1"> <input class="inputinput"
					id="name1" name="niki" />
					<label class="inputtext ">名字:
				</label> <input class="inputinput" id="name1" name="name" />
				</span> <span class="inputspan"> <label class="inputtext "
					style="width: 80px;">性别: </label> <select name="sex">
						<c:forEach items="${requestScope.sexstatus}" var="r" varStatus="v">
							<option class="op" value="${v.index}">${r}</option>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">类型: </label> <select
					name="type">
						<c:forEach items="${requestScope.typestatus}" var="r"
							varStatus="v">
							<option class="op" value="${v.index}">${r}</option>
						</c:forEach>
				</select>
				</span> <span class="inputspan"> <label class="inputtext "
					style="width: 80px;">未来意向: </label> <select name="ylevel">
						<c:forEach items="${requestScope.ylevelstatus}" var="r"
							varStatus="v">
							<option class="op" value="${v.index}">${r}</option>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">关注意向: </label> <select
					name="glevel">
						<c:forEach items="${requestScope.glevelstatus}" var="r"
							varStatus="v">
							<option class="op" value="${v.index}">${r}</option>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">状态等级: </label> <select
					name="slevel">
						<c:forEach items="${requestScope.slevelstatus}" var="r"
							varStatus="v">
							<option class="op" value="${v.index}">${r}</option>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">账号状态: </label> <select
					name="status">
						<c:forEach items="${requestScope.statusstatus}" var="r"
							varStatus="v">
							<option class="op" value="${v.index}">${r}</option>
						</c:forEach>
				</select>
				</span> <span class="inputspan"> <label class="inputtext ">电话:
				</label> <input class="inputinput" type="tel" name="tel" /> <label
					class="inputtext ">qq: </label> <input class="inputinput"
					type="text" name="qq" />
				</span> <span class="inputspan"> <label class="inputtext ">专业班级:
				</label> <input class="inputinput" type="text" name="classinfo" />
				</span> </span> <span class="inputspan"> <label class="inputtext "
					style="width: 80px;">学校: </label> <select onchange="changer(this);"
					name="school_id">
						<c:forEach items="${requestScope.schoollist}" var="r"
							varStatus="v">
							<option class="op" value="${r.id}">${r.name}</option>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">学院: </label> <select
					name="college_id">
						<c:forEach items="${requestScope.collegelist}" var="r"
							varStatus="v">
							<option class="op" value="${r.id}">${r.name}</option>
						</c:forEach>
				</select>
				</span> <span class="inputspan"> <label class="inputtext ">了解相关信息:
				</label> <input class="inputinput" type="text" name="info" />
				</span> <span class="inputspan"> <label class="inputtext ">备注:
				</label> <input class="inputinput" type="text" name="comments" />
				</span>
				<div class="inputbtpanel">
					<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
					<button class="seachbt1" type="button" onclick="add();">保存</button>
				</div>
			</div>
		</form>
	</c:if>
	<c:if test="${requestScope.info!=null}">

		<form class="f2">
			<div class="inputview">
				
				<span class="inputspan"> <label class="inputtext ">昵称:
				</label> <input type="hidden" name="id" value="${requestScope.info.id}">
				
					<input type="hidden" name="update" /> <input class="inputinput"
					id="name2" name="niki" value="${requestScope.info.niki}" />
				</span> <span class="inputspan"> <label class="inputtext ">名字:
				</label> <input class="inputinput" id="name2" name="name"
					value="${requestScope.info.name}" />
				</span> <span class="inputspan"> <label class="inputtext "
					style="width: 80px;">性别: </label> <select name="sex">
						<c:forEach items="${requestScope.sexstatus}" var="r" varStatus="v">

							<option class="op" value="${v.index}">${r}</option>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">类型: </label> <select
					name="type">
						<c:forEach items="${requestScope.typestatus}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.type!=v.index}">
								<option value="${v.index}">${r}</option>
							</c:if>
							<c:if test="${requestScope.info.type==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
							</c:if>
						</c:forEach>
				</select>
				</span> <span class="inputspan"> <label class="inputtext "
					style="width: 80px;">未来意向: </label> <select name="ylevel">
						<c:forEach items="${requestScope.ylevelstatus}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.ylevel!=v.index}">
								<option value="${v.index}">${r}</option>
							</c:if>
							<c:if test="${requestScope.info.ylevel==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
							</c:if>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">关注意向: </label> <select
					name="glevel">
						<c:forEach items="${requestScope.glevelstatus}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.glevel!=v.index}">
								<option value="${v.index}">${r}</option>
							</c:if>
							<c:if test="${requestScope.info.glevel==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
							</c:if>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">状态等级: </label> <select
					name="slevel">
						<c:forEach items="${requestScope.slevelstatus}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.slevel!=v.index}">
								<option value="${v.index}">${r}</option>
							</c:if>
							<c:if test="${requestScope.info.slevel==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
							</c:if>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">账号状态: </label> <select
					name="status">
						<c:forEach items="${requestScope.statusstatus}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.status!=v.index}">
								<option value="${v.index}">${r}</option>
							</c:if>
							<c:if test="${requestScope.info.status==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
							</c:if>
						</c:forEach>
				</select>
				</span> <span class="inputspan"> <label class="inputtext ">电话:
				</label> <input class="inputinput" type="tel" name="tel"
					value="${requestScope.info.tel}" /> <label class="inputtext ">qq:
				</label> <input class="inputinput" type="text" name="qq"
					value="${requestScope.info.qq}" />
				</span> <span class="inputspan"> <label class="inputtext ">专业班级:
				</label> <input class="inputinput" type="text" name="classinfo"
					value="${requestScope.info.classinfo}" />
				</span> </span> <span class="inputspan"> <label class="inputtext "
					style="width: 80px;">学校: </label> <select onchange="changer(this);"
					name="school_id">
						<c:forEach items="${requestScope.schoollist}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.school_id!=r.id}">
								<option value="${r.id}">${r.name}</option>
							</c:if>
							<c:if test="${requestScope.info.school_id==r.id}">
								<option selected="selected" value="${r.id}">${r.name}</option>
							</c:if>
						</c:forEach>
				</select> <label class="inputtext " style="width: 80px;">学院: </label> <select
					name="college_id">
						<c:forEach items="${requestScope.collegelist}" var="r"
							varStatus="v">
							<c:if test="${requestScope.info.college_id!=r.id}">
								<option value="${r.id}">${r.name}</option>
							</c:if>
							<c:if test="${requestScope.info.college_id==r.id}">
								<option selected="selected" value="${info.college_id}">${info.college_Name}</option>
							</c:if>
						</c:forEach>
				</select>
				</span> <span class="inputspan"> <label class="inputtext ">了解相关信息:
				</label> <input class="inputinput" type="text" name="info"
					value="${requestScope.info.info}" />
				</span> <span class="inputspan"> <label class="inputtext ">备注:
				</label> <input class="inputinput" type="text" name="comments"
					value="${requestScope.info.comments}" />
				</span>
				<div class="inputbtpanel">
					<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
			</div>
		</form>
	</c:if>
	<c:import url="/Model/form_footer.jsp"></c:import>