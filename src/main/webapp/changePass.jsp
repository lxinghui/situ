<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>

<body style="min-width:100px;overflow: hidden; ">
	<script>
		
		function edit() {
			if (oldpassword.value == ""||newpassword.value == ""||confirmpassword.value == "") {
				MsgDialog("必须录入密码！", "录入错误");
				return;
			}
			if (oldpassword.value == newpassword.value ) {
				MsgDialog("密码不能相同！", "录入错误");
				return;
			}
			if (confirmpassword.value != newpassword.value ) {
				MsgDialog("密码不相同！", "录入错误");
				return;
			}
			/*
			*密码判断 if oldpassword != new password 
			*        if new password != confirm passowrd
			*/
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

	

		<form class="f2">
		<input type="hidden" name="update" />
		<input type="hidden" name="cmd" value="${requestScope.cmd}"/>
		 <input type="hidden"	name="id" value="${requestScope.id}" />
			<div class="inputview1">
				<span class="inputspan">
				<label class="inputtext ">原密码:
							</label>  <input type="password"
								class="inputinput" id="oldpassword" name="oldpassword"
								value="${requestScope.password}"
								 />
							</span>	
							<span class="inputspan">
				<label class="inputtext ">新密码
							</label> 
							  <input type="password"
								class="inputinput" id="newpassword" name="newpassword"
								
								 />
							</span>
							<span class="inputspan">
				<label class="inputtext ">再确认
							</label> 
							 <input type="password"
								class="inputinput" id="confirmpassword" name="confirmpassword"
								
								 />
							</span>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				</div>
		</form>
	
  <c:import url="/Model/form_footer.jsp" ></c:import>