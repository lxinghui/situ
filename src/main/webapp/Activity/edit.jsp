<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<head>
<style type="text/css">
.textarea {
	width: 385px;
	height: 68px;
}
</style>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<body style="min-width: 100px;">


	<script>
		var ss = "${requestScope.info.id}";
		var ids = "${requestScope.ids}";
		$(function() {
			if (ss != "") {
				load();
			}
			var sss = "${requestScope.ids}";
			if (sss != "") {
				$(".ids").val(sss);
			}
		});
		function getIds(id){
			alert(id);
			$(".ids").val(id);
		}
		function fresh1(ids) {
			location.href = "activities/add1?ids=" + ids;
		}
		function fresh(ids) {
			var s = "${id}";
			if (s != "") {
				location.href = "activities/edit1?ids=" + ids + "&&id=" + s;
			}
		}
		function openuser() {
			if(ss==""){
			layer_show("添加学生", "users/add1", 700, 480);
			}else if(ss!=""){
				layer_show("添加学生", "users/add1?a_id="+ss, 700, 480);
			}
		//	if (ss != "") {
		//		layer_show("学生表", "users/show?cmd='update'&&ids=" + ids, 600,
			//			450);
		//	} else {
		//		layer_show("学生表", "users/show", 600, 450);
		//	}
		}

		function load() {
			var info = " ${requestScope.info.option}";
			var str = info + "";
			var data = [];
			data = str.split("");
			for (var i = 0; i < data.length; i++) {
				if (data[i] == "1")
					$(".chk:eq(" + (i - 1) + ")").prop("checked", "checked");
			}

		}
		function save() {
			
			if (name1.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			var aid = "";
			$(".chk").each(function() {
				if ($(this).prop("checked")) {
					aid = aid + "1";
				} else {
					aid = aid + "0";
				}
			});
			$(".opt").val(aid);
			if ($(".cmd").prop("name") == "insert") {
				$.post("activities/insert_json1", $(".f1").serialize(),
						function(json) {
							/*找到f1这个类 form表单 $(selector).post(URL,data,function(data,status,xhr),dataType);
							 *serialize()序列化表单值
							 */
							if (json.status > 0) {
								parent.fresh();
								var index = parent.layer
										.getFrameIndex(window.name);
								parent.layer.close(index);
							} else {
								alert(json.text);
							}
						}, "json");

			} else {
				$.post("activities/update_json1", $(".f1").serialize(),
						function(json) {
							/*找到f1这个类 form表单 $(selector).post(URL,data,function(data,status,xhr),dataType);
							 *serialize()序列化表单值
							 */
							if (json.status > 0) {
								parent.fresh();
								var index = parent.layer
										.getFrameIndex(window.name);
								parent.layer.close(index);
							} else {
								alert(json.text);
							}
						}, "json");
			}
		}

		function getid() {
			var aid = "";
			$(".chk").each(function() {
				if ($(this).prop("checked")) {
					aid = aid + "1";
				} else {
					aid + aid + "0";
				}
			});
			return aid;
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
									var label = $("<label id='cid' class='inputtext' style='width:40px;'>学院:</label>");
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
		laydate.render({
			elem : '#test6',
			range : true
		});
	</script>
	<form class="f1">
		<c:if test="${requestScope.info==null}">
			<input type="hidden" class="cmd" name="insert" />
			<input type="hidden" class="opt" name="option"
				value="${requestScope.info.option}" />
		</c:if>
		<c:if test="${requestScope.info!=null}">
			<input type="hidden" class="cmd" name="update" />
			<input type="hidden" name="id" value="${requestScope.info.id}" />
			<input type="hidden" class="opt" name="option"
				value="${requestScope.info.option}" />
		</c:if>
		<div class="inputview">
			<span class="inputspan"> <label class="inputtext ">名称:
			</label> <input class="inputinput" id="name1" name="name"
				value="${requestScope.info.name}" /> <label class="inputtext ">添加学生:
			</label>
				<div style="float: right; padding-right: 500px;">
					<input type="hidden" name="ids" class="ids"> <i
						class="fa fa-plus-square" onclick="openuser();"></i>
				</div>
			</span> <span class="inputspan"> <label class="inputtext ">课程信息:
			</label> <input class="inputinput" name="courseinfo"
				value="${requestScope.info.courseinfo}" /> <label class="inputtext ">计划安排信息:
			</label> <input class="inputinput" name="planinfo"
				value="${requestScope.info.planinfo}" />
			</span> <span class="inputspan"> <label class="inputtext">时间信息:</label>

				<input type="text" class="layui-input" id="test6" name="dateinfo"
				placeholder=" - " value="${requestScope.info.dateinfo}">

			</span> <span class="inputspan"> <label class="inputtext ">学校:</label>
				<input class="inputinput" name="school"
				value="${requestScope.info.school}" /> 
				 <label class="inputtext ">学院: </label>
				 <input class="inputinput" name="college"
				value="${requestScope.info.college}" /> 
			</span> <span class="inputspan"> <label class="inputtext ">人数:
			</label> <input class="inputinput" name="count"
				value="${requestScope.info.count}" /> <label class="inputtext ">班级数:
			</label> <input class="inputinput" name="classcount"
				value="${requestScope.info.classcount}" />
			</span> <span class="inputspan"> <label class="inputtext "
				style="width: 80px;">辅导员: </label> <select name="instructor_user_id">
					<option value="${0}">-</option>
					<c:forEach items="${requestScope.userlist}" var="r" varStatus="v">
						<c:if test="${requestScope.info.instructor_user_id!=r.id}">
							<option value="${r.id}">${r.name}</option>
						</c:if>
						<c:if test="${requestScope.info.instructor_user_id==r.id}">
							<option selected="selected" value="${r.id}">${r.name}</option>
						</c:if>
					</c:forEach>
			</select> <label class="inputtext " style="width: 80px;">来源人: </label> <select
				name="source_operator_id">
					<c:forEach items="${requestScope.operatorlist}" var="r"
						varStatus="v">
						<c:if test="${requestScope.info.source_operator_id!=r.id}">
							<option value="${r.id}">${r.name}</option>
						</c:if>
						<c:if test="${requestScope.info.source_operator_id==r.id}">
							<option selected="selected" value="${r.id}">${r.name}</option>
						</c:if>
					</c:forEach>
			</select> <label class="inputtext " style="width: 80px;">负责人: </label> <select
				name="charge_operator_id">
					<c:forEach items="${requestScope.operatorlist}" var="r"
						varStatus="v">
						<c:if test="${requestScope.info.charge_operator_id!=r.id}">
							<option value="${r.id}">${r.name}</option>
						</c:if>
						<c:if test="${requestScope.info.charge_operator_id==r.id}">
							<option selected="selected" value="${r.id}">${r.name}</option>
						</c:if>
					</c:forEach>
			</select>
			</span> <span class="inputspan"> <label class="inputtext "
				style="width: 80px;">类型: </label> <select name="type">
					<c:forEach items="${requestScope.typestatus}" var="r" varStatus="v">
						<c:if test="${requestScope.info.type!=v.index}">
							<option value="${v.index}">${r}</option>
						</c:if>
						<c:if test="${requestScope.info.type==v.index}">
							<option selected="selected" value="${v.index}">${r}</option>
						</c:if>
					</c:forEach>
			</select> <label class="inputtext " style="width: 80px;">状态: </label> <select
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
			</span> <span class="inputspan"> <label class="inputtext ">投影
			</label> <input class="chk" myid="${r.id}" type="checkbox"> <label
				class="inputtext ">话筒 </label> <input class="chk" myid="${r.id}"
				type="checkbox"> <label class="inputtext ">插排 </label> <input
				class="chk" myid="${r.id}" type="checkbox">
			</span> <span class="inputspan"> <label class="inputtext ">注意事项:
			</label> <input class="inputinput" name="attention"
				value="${requestScope.info.attention}" />
			</span> <span class="inputspan1 "> <label class="inputtext" style="">备注:</label>
				<textarea class="inputarea" name="comments" style="margin-left:0px;margin-top:0px;"
					value="${requestScope.info.comments}"></textarea>
			</span>
			<div class="inputbtpanel">
				<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="save();">保存</button>
			</div>
		</div>
	</form>
	<c:import url="/Model/form_footer.jsp"></c:import>