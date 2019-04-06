<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>

<style type="text/css">
.layui-laydate-content>.layui-laydate-list {
	padding-bottom: 0px;
	overflow: hidden;
}

.layui-laydate-content>.layui-laydate-list>li {
	width: 50%
}

.merge-box .scrollbox .merge-list {
	padding-bottom: 5px;
}
</style>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>

<body style="min-width: 100px;">
	<script>
		function save() {

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
				$.post("times/insert_json1", $(".f1").serialize(), function(
						json) {
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

			} else {
				$.post("times/update_json", $(".f1").serialize(),
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

		laydate.render({
			elem : '#test11',
			type : 'date'
		});

		laydate.render({
			elem : '#test4',
			type : 'time',
			range : true,
			format : 'HH:mm' //可任意组合
			,
			btns : [ 'clear', 'confirm' ],
			ready : formatminutes
		});
		laydate.render({
			elem : '#test5',
			type : 'time',
			range : true,
			format : 'HH:mm' //可任意组合
			,
			btns : [ 'clear', 'confirm' ],
			ready : formatminutes
		});
		laydate.render({
			elem : '#test6',
			type : 'time',
			range : true,
			format : 'HH:mm' //可任意组合
			,
			btns : [ 'clear', 'confirm' ],
			ready : formatminutes
		});

		function formatminutes(date) {
			var aa = $(".laydate-time-list li ol")[1];
			var showtime = $($(".laydate-time-list li ol")[1]).find("li");
			for (var i = 0; i < showtime.length; i++) {
				var t00 = showtime[i].innerText;
				if (t00 != "00" && t00 != "20" && t00 != "30" && t00 != "40"
						&& t00 != "50") {
					showtime[i].remove()
				}
			}
			$($(".laydate-time-list li ol")[2]).find("li").remove(); //清空秒

		}
	</script>



	<form class="f1">
		<c:if test="${requestScope.info==null}">
			<input type="hidden" class="cmd" name="insert" />
		</c:if>
		<c:if test="${requestScope.info!=null}">
			<input type="hidden" class="cmd" name="update" />
			<input type="hidden" name="id" value="${requestScope.info.id}" />
		</c:if>
		<div class="inputview">
			<span class="inputspan"> <label class="inputtext ">活动:
			</label> <c:if test="${requestScope.info==null}">
					<input type="hidden" value="${activity.id}" name="activity_id">
					<input type="text" class="inputinput" disabled="disabled"
						value="${requestScope.activity.name}">
				</c:if> <c:if test="${requestScope.info!=null}">
					<input type="hidden" value="${info.activity_id}" name="activity_id">
					<input type="text" class="inputinput" disabled="disabled"
						value="${requestScope.info.a_name}">
				</c:if>
			</span> <span class="inputspan"> <label class="inputtext ">日期：
			</label> <input type="text" class="inputinput" class="layui-input"
				id="test11" name="date" placeholder="yyyy-MM-dd"
				value="${requestScope.info.date}"> <label class="inputtext ">地点信息:
			</label> <c:if test="${requestScope.info==null}">
					<input class="inputinput" name="roominfo"
						value="${requestScope.activity.roominfo}" />
				</c:if> <c:if test="${requestScope.info!=null}">
					<input class="inputinput" name="roominfo"
						value="${requestScope.info.roominfo}" />
				</c:if>
			</span> <span class="inputspan"> <label class="inputtext ">时间1：
			</label> <input class="inputinput" type="text" name="time1" id="test4"
				lay-key="5" value="${requestScope.info.time1}"> <label
				class="inputtext ">时间2： </label> <input class="inputinput"
				type="text" name="time2" id="test5"
				value="${requestScope.info.time2}">
			</span><span class="inputspan"> <label class="inputtext ">时间3：
			</label> <input class="inputinput" type="text" name="time3" id="test6"
				value="${requestScope.info.time3}"> <label
				class="inputtext ">时间4： </label> <input class="inputinput"
				type="text" name="time4" id="test4"
				value="${requestScope.info.time4}">
			</span><span class="inputspan"> <label class="inputtext ">时间5：
			</label> <input class="inputinput" type="text" name="time5" id="test4"
				value="${requestScope.info.time5}"> <label
				class="inputtext ">时间6： </label> <input class="inputinput"
				type="text" name="time6" id="test4"
				value="${requestScope.info.time6}">
			</span> <span class="inputspan"> <label class="inputtext "
				style="width: 80px;">执行人: </label> <select name="operator_id"
				class="inputinput" style="width: 60px;">
					<c:forEach items="${requestScope.operatorlist}" var="r"
						varStatus="v">
						<c:if test="${requestScope.info.operator_id!=r.id}">
							<option value="${r.id}">${r.name}</option>
						</c:if>
						<c:if test="${requestScope.info.operator_id==r.id}">
							<option selected="selected" value="${r.id}">${r.name}</option>
						</c:if>
					</c:forEach>
			</select> <label class="inputtext " style="width: 80px; margin-left: 82px;">状态:
			</label> <select name="status" class="inputinput" style="width: 60px;">
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
			</span> <span class="inputspan"> <span class="inputspan"> <label
					class="inputtext" style="">备注:</label> <textarea class="inputarea"
						name="comments" style="margin: 0px; width: 380px; height: 50px;"
						value="${requestScope.info.comments}">${requestScope.info.comments}</textarea>
			</span>
				<div class="inputbtpanel" style="margin-top: 16px;">
					<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
					<button class="seachbt1" type="button" onclick="save();">保存</button>
				</div>
		</div>
	</form>