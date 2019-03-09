<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
<head>
 <style>
    .opt{
    float:right;
    padding-right:100px;
    }
 </style>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>

<body style="min-width:100px;">
	<script>

		function load(){
			
			$(".opt").each(function(){
				var str="";
				//找每个opt下面的select
				var optA =$(this).find('.sel').eq(0).val();
				
				var optB =$(this).find('.sel').eq( 1).val();
				var optC =$(this).find('.sel').eq(2).val();
				str = "A."+optA+"B."+optB+"C."+optC;
                str=""+str;
                alert(str);
				$(this).find('#opt').val(str);
				alert($('#opt').eq(0).val());
			});
		}1

		function save() {
			load();
			if($(".cmd").prop("name")=="insert"){
			$.post("ques/insert_json1", $(".f1").serialize(), function(json) {
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
			$.post("ques/update_json", $(".f1").serialize(), function(json) {
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
				<span class="inputspan">
				<label class="inputtext ">活动:
						</label> 
						<select name="activity_id">
        <c:forEach items="${requestScope.activitylist}" var="r" varStatus="v">
     <c:if test="${requestScope.info.activity_id!=r.id}">
							<option value="${r.id}">${r.name}</option>
						</c:if>
	<c:if test="${requestScope.info.activity_id==r.id}">
							<option selected="selected" value="${r.id}">${r.name}</option>
						</c:if>
        </c:forEach>
        </select>
						</span>
						<span class="inputspan">
				<label class="inputtext ">问题一:
						</label> 
						 <input class="inputinput" name="ques1" value="${requestScope.info.ques1}"/>
					
						 <div class="opt">
						<label class="inputtext ">选项A:</label>
				        <select  class="sel">
        <c:forEach items="${requestScope.optA}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项B:</label>
				        <select  class="sel">
        <c:forEach items="${requestScope.optB}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项C:</label>
				        <select  class="sel">
        <c:forEach items="${requestScope.optC}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
        </div>
        <input type="hidden" name="option1" value="${requestScope.info.option1}">
						</span>
						<span class="inputspan">
				<label class="inputtext ">问题二:
						</label> 
						 <input class="inputinput" name="ques2" value="${requestScope.info.ques2}"/>
						  <div class="opt">
						  
						<label class="inputtext ">选项A:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optA}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项B:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optB}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项C:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optC}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
        </div>
        <input type="hidden" name="option2" id="opt">
						</span>
						<span class="inputspan">
				<label class="inputtext ">问题三:
						</label> 
						 <input class="inputinput" name="ques3" value="${requestScope.info.ques3}"/>
						  <div class="opt">
						<label class="inputtext ">选项A:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optA}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项B:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optB}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项C:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optC}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
        </div>
        <input type="hidden" name="option3" id="opt">
						</span>
						<span class="inputspan">
				<label class="inputtext ">问题四:
						</label> 
						 <input class="inputinput" name="ques4" value="${requestScope.info.ques4}"/>
						  <div class="opt">
						<label class="inputtext ">选项A:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optA}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项B:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optB}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项C:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optC}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
        </div>
        <input type="hidden" name="option4" id="opt">
						</span>
						<span class="inputspan">
				<label class="inputtext ">问题五:
						</label> 
						 <input class="inputinput" name="ques5" value="${requestScope.info.ques5}"/>
						  <div class="opt">
						<label class="inputtext ">选项A:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optA}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项B:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optB}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项C:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optC}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
        </div>
        <input type="hidden" name="option5" id="opt">
						</span>
						<span class="inputspan">
				<label class="inputtext ">问题六:
						</label> 
						 <input class="inputinput" name="ques6" value="${requestScope.info.ques6}"/>
						  <div class="opt">
						<label class="inputtext ">选项A:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optA}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项B:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optB}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项C:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optC}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
        </div>
        <input type="hidden" name="option6" id="opt">
						</span>
						<span class="inputspan">
				<label class="inputtext ">问题七:
						</label> 
						 <input class="inputinput" name="ques7" value="${requestScope.info.ques7}"/>
						  <div class="opt">
						<label class="inputtext ">选项A:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optA}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项B:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optB}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
                        <label class="inputtext ">选项C:</label>
				        <select class="sel">
        <c:forEach items="${requestScope.optC}" var="r" varStatus="v">
							<option value="${r}">${r}</option>
        </c:forEach>
        </select>
        </div>
        <input type="hidden" name="option7" id="opt">
						</span>
						<span class="inputspan">
				<label class="inputtext ">文本一:
						</label> 
						 <input class="inputinput" name="text1" value="${requestScope.info.text1}"/>
						</span>
						<span class="inputspan">
				<label class="inputtext ">文本二:
						</label> 
						 <input class="inputinput" name="text2" value="${requestScope.info.text2}"/>
						</span>
						<span class="inputspan">
				<label class="inputtext ">文本三:
						</label> 
						 <input class="inputinput" name="text3" value="${requestScope.info.text3}"/>
						</span>
						<span class="inputspan">
				<label class="inputtext ">文本四:
						</label> 
						 <input class="inputinput" name="text4" value="${requestScope.info.text4}"/>
						</span>
						<span class="inputspan">
				<label class="inputtext ">文本五:
						</label> 
						 <input class="inputinput" name="text5" value="${requestScope.info.text5}"/>
						</span>
						<span class="inputspan">
				<label class="inputtext ">文本六:
						</label> 
						 <input class="inputinput" name="text6" value="${requestScope.info.text6}"/>
						</span>
						<span class="inputspan">
				<label class="inputtext ">文本七:
						</label> 
						 <input class="inputinput" name="text7" value="${requestScope.info.text7}"/>
						</span>
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="save();"
						>保存</button>
				</div>
			</div>
		</form>
  <c:import url="/Model/form_footer.jsp" ></c:import>