 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp"></c:import>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>>">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/situ.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script><link type="text/css" rel="stylesheet" href="http://121.42.236.205/js/laydate/need/laydate.css"><link type="text/css" rel="stylesheet" href="http://121.42.236.205/js/laydate/skins/molv/laydate.css" id="LayDateSkin">
<script type="text/javascript" src="js/layer/layer.js"></script><link rel="stylesheet" href="http://121.42.236.205/js/layer/skin/layer.css" id="layui_layer_skinlayercss" style="">
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>


<style>
.opt_mark{
width: 50px;height: 20px;background-color: #3F3;color: #FFF;cursor: pointer;text-align: center;
border: solid #eee 1px;
}
.opt_mark_selected{
width: 50px;height: 20px;background-color: #F33;color: #FFF;cursor: pointer;text-align: center;
border: solid #eee 1px;
}
.seach .input {
    height: 30px;
    margin-right: 15px;
    padding-left: 5px;
    padding-right: 5px;
    line-height: 30px;
    display: inline-block;
    width: 150px;
    border: #bbb solid 1px;
}
.viewlist {
    margin-top: 5px;
    margin-bottom: 5px;
    padding-left: 40px;
}
.seach .title {
    margin-right: 5px;
    padding-right: 5px;
    line-height: 30px;
    width: 100px;
    text-align: right;
    display: inline-block;
}
.view .title {
    margin-right: 5px;
    padding-right: 5px;
    line-height: 30px;
    width: 100px;
    text-align: right;
    display: inline-block;
}
.title {
    cursor: pointer;
}
.input {
    margin-bottom: 10px;
    padding-left: 3px;
}
.viewlist	textarea {
    vertical-align: top;
    resize: none;
}

</style>
</head>

<body style="min-width:200px;max-width:600px">

	<script>
	
	$(function(){
		var txt1 = "${info.text1}";
		var txt2 = "${info.text2}";
		$("[name=text1]").text(txt1);
		$("[name=text2]").text(txt2);
		var ops=$(".viewlist");
		for(var i=0;i<ops.size();i++){	
			var id=ops.eq(i).find(".opt_mark_selected").attr("myid");
		    var po=ops.eq(i).find(".optionsAnswer");
		    po.val(id);	
		}
		
	});
var mark=0;
if(mark==0){
	$(document).on("click",".opt_mark",function(e){
	var o=$(e.target);
		o.addClass("opt_mark_selected");
		o.siblings().removeClass("opt_mark_selected");
		o.siblings().addClass("opt_mark");
		var p=o.parent().parent().parent().parent();
		var po=p.find(".optionsAnswer");
		var id=o.attr("myid");
		po.val(id);	
	});
	
	}
		function pageParam(obj) {

		}
		function add(){
	
	 
		var ops=$(".viewlist");
		var id=$("[name=id]").val();
		for(var i=0;i<ops.size();i++){	
		var id=ops.eq(i).find(".opt_mark_selected").attr("myid");
	    var po=ops.eq(i).find(".optionsAnswer");
	    po.val(id);	
		}
		var data = $(".f").serializeArray();
		
			$.ajax({
				url : "feedbacks/update_json",
				type : "post",
				data : data,
				//contentType : "application/json;charset=utf-8", 加上这句拿不到值
				dataType : "json",
				success : function(json) {
				
					if (json.status > 0) {
						parent.fresh();
						layer_close();
					}
				}
			});
		}
	</script>
	<form class="f">
	<input type="hidden" name="id" value="${info.id}">
		<div class="inputpanel">
			<fieldset class="view field_panel seach">
					
				
					<div class="viewlist">
						<b>第1项</b>
												
							<div style="margin-left: 60px;">
							<b>你对当班讲师的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden"  name="opt1" style=" position: relative;width:40px; height:25px;top:5px" value="">
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							<c:if test="${requestScope.info.opt1=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt1!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt1=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt1!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt1=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt1!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
						
						
						
						<label class="title" style="width: 100%;margin-left: -440px;"><b>不太好的原因：</b> </label>
						
						
							
							
							<textarea class="input" name="text1" value="${info.text1}" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;"></textarea>
							
							
						
						
					</div>

					
				
					<div class="viewlist">
						<b>第2项</b>
											
							<div style="margin-left: 60px;">
							<b>讲师与学生除了上课外，与大家的交流多吗？</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.    挺多的         B.    还行         C.   不怎么交流
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt2" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt2=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt2!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt2=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt2!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt2=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt2!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
						
						
						
					</div>

					
				
					<div class="viewlist">
						<b>第3项</b>
												
							<div style="margin-left: 60px;">
							<b>讲师讲课时有激情吗？</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.  较 激情     B.   一般        C.   较闷
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt3" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt3=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt3!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt3=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt3!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt3=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt3!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
						
					</div>

					
				
					<div class="viewlist">
						<b>第4项</b>
												
							<div style="margin-left: 60px;">
							<b>你认为当班讲师的班级学生管理方式？</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.    比较严厉       B.    还好        C.    比较温柔
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt4" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt4=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt4!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt4=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt4!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt4=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt4!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
						
						
					</div>

					
				
					<div class="viewlist">
						<b>第5项</b>
												
							<div style="margin-left: 60px;">
							<b>你对讲师的讲课方式满意吗？</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.    比较满意     B.    一般        C.   不太好
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt5" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt5=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt5!='A'}">
							<td class="opt_mark"  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt5=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt5!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt5=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt5!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
						
						
						
						<label class="title" style="width: 100%;margin-left: -440px;"><b>不好的原因：</b> </label>
						
						
							
							
							<textarea class="input " name="text2" value="${info.text2}" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;"></textarea>
							
							
						
						
					</div>

					
				
					<div class="viewlist">
						<b>第6项</b>
												
							<div style="margin-left: 60px;">
							<b>讲师讲解难点或辅导学生有耐心吗？</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.   很有耐心      B.   一般        C.   较懒
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt6" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt6=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt6!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt6=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt6!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt6=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt6!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
						
						
						
					</div>

					
				
					<div class="viewlist">
						<b>第7项</b>
												
							<div style="margin-left: 60px;">
							<b>讲师讲课有意思有乐趣吗</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.   有乐趣      B.   一般        C.   较枯燥
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt7" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt7=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt7!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt7=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt7!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt7=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt7!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
						
					
					</div>

					
				
					<div class="viewlist">
						<b>第8项</b>
										
							<div style="margin-left: 60px;">
							<b>讲师讲课时有出现声音大小，普通话，脏话等状况吗？</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.   标准     B.   一般        C.  较差
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt8" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt8=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt8!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt8=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt8!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt8=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt8!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
						
					
					</div>

					
				
					<div class="viewlist">
						<b>第9项</b>
			
												
							<div style="margin-left: 60px;">
							<b>讲师备课准备充分，明细吗？</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.   较好      B.   一般        C.   较差
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt9" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt9=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt9!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt9=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt9!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt9=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt9!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
						
					
					</div>

					
				
					<div class="viewlist">
						<b>第10项</b>
					
												
							<div style="margin-left: 60px;">
							<b>讲师上课之前是否经常告知学生今日本周讲课计划？</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.   经常      B.  偶尔        C.   从未
							<br>
							<label class="title"><b>回答：</b> </label>
							<input class="input optionsAnswer" type="hidden" name="opt10" style="position: relative;width:40px; height:25px;top:5px" value="">
							
							<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
							
							
							<c:if test="${requestScope.info.opt10=='A'}">
							<td class="opt_mark_selected "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt10!='A'}">
							<td class="opt_mark "  myid="A">A</td>
							</c:if>
							<c:if test="${requestScope.info.opt10=='B'}">
							<td class="opt_mark_selected "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt10!='B'}">
							<td class="opt_mark "  myid="B">B</td>
							</c:if>
							<c:if test="${requestScope.info.opt10=='C'}">
							<td class="opt_mark_selected "  myid="C">C</td>
							</c:if>
							<c:if test="${requestScope.info.opt10!='C'}">
							<td class="opt_mark "  myid="C">C</td>
							</c:if>
							</tr></tbody></table>
							
							
				
					</div>

				
				
				<button class="seachbt" style="position: relative;left:240px;" type="button" onclick="layer_close();">取消</button>
				<button class="seachbt" style="position: relative;left:250px;" type="button" onclick="add();">提交</button>

			</fieldset>




		</div>
	</form>
 
<script>
 !function(){
 
 
 
 $(".laydate-icon").attr("readonly","readonly");
laydate.skin('molv');
laydate({elem: '.Calendar',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar1',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar2',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar3',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar4',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.Calendar5',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false});
laydate({elem: '.longCalendar',format:'YYYY年MM月DD日 hh:mm',istime:true});
laydate({elem: '.longCalendar100',format:'YYYY年MM月DD日 hh:mm',istime:true});
laydate({elem: '.longCalendar1',format:'YYYY年MM月DD日 hh:mm:ss',istime:true});
laydate({elem: '.longCalendar2',format:'YYYY年MM月DD日 hh:mm:ss',istime:true});
laydate({elem: '.longCalendar3',format:'YYYY年MM月DD日 hh:mm:ss',istime:true,min:laydate.now(-15),max: laydate.now(+15)});
laydate({elem: '.longCalendar4',format:'YYYY年MM月DD日 hh:mm:ss',istime:true,min:laydate.now(-15),max: laydate.now(+20)});
laydate({elem: '.Calendar11',format:'YYYY年MM月DD日',zIndex:99999999,fixed: false,min:laydate.now()});
laydate({elem: '.longCalendar10',format:'YYYY年MM月DD日 hh:mm:ss',istime:true,min:laydate.now(),max: laydate.now(+7)});
laydate({elem: '.longCalendar11',format:'YYYY年MM月DD日 hh:mm:ss',istime:true,min:laydate.now(),max: laydate.now(+10)});
}();
 
$(function(){
$(document).on("click",".fexp",function(){
	layer.tips($(this).attr("text"), $(this), {
 	tips: [1, '#111111'] //还可配置颜色
});
});
});
</script>



</body></html>