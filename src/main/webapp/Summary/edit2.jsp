<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>

<style>
.opt_mark {
    width: 50px;
    height: 20px;
    background-color: #3F3;
    color: #FFF;
    cursor: pointer;
    text-align: center;
    border: solid #eee 1px;
}
.opt_mark1 {
    width: 50px;
    height: 20px;
    background-color: #F33;
    color: #FFF;
    cursor: pointer;
    text-align: center;
    border: solid #eee 1px;
}
.input{

  width: 350px;
    height: 60px;
    margin-left: 120px;
     border:solid 1px #808080;
}
</style>
</head>

<body style="min-width:100px;">



	<script>
	
	
	
$(function(){
	var ops=$(".viewlist");
	for(var i=0;i<ops.size();i++){	
		var id=ops.eq(i).find(".opt_mark1").attr("myid");
	
	var po=ops.eq(i).find(".optionsAnswer");
	po.val(id);	
	}
	
});
	
	
	var mark=0;
	if(mark==0){
		$(document).on("click",".opt_mark",function(e){
		var o=$(e.target);
			o.removeClass("opt_mark"); 
			o.addClass("opt_mark1");
			o.siblings().removeClass("opt_mark1");
			 o.siblings().addClass("opt_mark");
			 var p=o.parent().parent().parent().parent();
			var po=p.find(".optionsAnswer");
			var id=o.attr("myid");
			po.val(id);	
		
		});
		
		}
	
	
		function edit() {
			
			var data = $(".f").serializeArray();
			$.ajax({
				url : "summarys/update_json",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				//event.srcElement.disabled=false;
					if (json.status > 0) {
						parent.fresh();
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);

					}
				}
			});
		}
		
		function pageParam(obj) {
		}
	

	</script>
	
	<form class="f">
		<div class="inputpanel">
			<fieldset class="view field_panel seach">
					
				<input type="hidden" name="update" />
					<input type="hidden" name="id" value="${requestScope.info.id}" /> 
					
					<div class="viewlist"> 
						<b style="margin-left: 40px;">第1项 </b>
						<input type="hidden"  class="optionsAnswer" name="sstatus" />
						
												
							<div style="margin-left: 120px;">
							<b>学生状况</b>
							</div>
							<label class="title" ><b style="margin-left: 120px;">选项：</b> </label>
							      &nbsp; A比较好   &nbsp; &nbsp; B一般  &nbsp;&nbsp; C较差 
							<br>
							<label class="title" style="margin-left: 120px;"><b>回答：</b> </label>
							
						    
							<table style="position: relative;margin-left: 165px;margin-top: -35px;"><tbody><tr>
							
						<c:if test="${requestScope.info.sstatus==1}">
							<td class="opt_mark1" myid="1">A</td>
							</c:if>
							<c:if test="${requestScope.info.sstatus!=1}">
							<td class="opt_mark" myid="1">A</td>
							</c:if>
							
							<c:if test="${requestScope.info.sstatus==2}">
							<td class="opt_mark1" myid="2">B</td>
							</c:if>
							<c:if test="${requestScope.info.sstatus!=2}">
							<td class="opt_mark" myid="2">B</td>
							</c:if>
							<c:if test="${requestScope.info.sstatus==3}">
							<td class="opt_mark1" myid="3">C</td>
							</c:if>
							<c:if test="${requestScope.info.sstatus!=3}">
							<td class="opt_mark" myid="3">C</td>
							</c:if>
						
							
							</tr></tbody></table>
					</div>
					
						<div class="viewlist">
						<b style="margin-left: 40px;">第2项 </b>
						<input type="hidden" class="optionsAnswer" name="tstatus" />
					
												
							<div style="margin-left: 120px;">
							<b>课程状况</b>
							</div>
							<label class="title" ><b style="margin-left: 120px;">选项：</b> </label>
							      &nbsp; A比较好   &nbsp; &nbsp; B一般  &nbsp;&nbsp; C较差 
							<br>
							<label class="title" style="margin-left: 120px;"><b>回答：</b> </label>
							
						
							<table style="position: relative;margin-left: 165px;margin-top: -35px;"><tbody><tr>
							
								<c:if test="${requestScope.info.tstatus==1}">
							<td class="opt_mark1" myid="1">A</td>
							</c:if>
							<c:if test="${requestScope.info.tstatus!=1}">
							<td class="opt_mark" myid="1">A</td>
							</c:if>
							
							<c:if test="${requestScope.info.tstatus==2}">
							<td class="opt_mark1" myid="2">B</td>
							</c:if>
							<c:if test="${requestScope.info.tstatus!=2}">
							<td class="opt_mark" myid="2">B</td>
							</c:if>
							<c:if test="${requestScope.info.tstatus==3}">
							<td class="opt_mark1" myid="3">C</td>
							</c:if>
							<c:if test="${requestScope.info.tstatus!=3}">
							<td class="opt_mark" myid="3">C</td>
							</c:if>
							
							</tr></tbody></table>
					</div>
						<div class="viewlist">
						<b style="margin-left: 40px;">第3项 </b>
						<input type="hidden" class="optionsAnswer" name="xstatus" />
						
												
							<div style="margin-left: 120px;">
							<b>学校状况</b>
							</div>
							<label class="title" ><b style="margin-left: 120px;">选项：</b> </label>
							      &nbsp; A比较好   &nbsp; &nbsp; B一般  &nbsp;&nbsp; C较差 
							<br>
							<label class="title" style="margin-left: 120px;"><b>回答：</b> </label>
							
					
							<table style="position: relative;margin-left: 165px;margin-top: -35px;"><tbody><tr>
							
								<c:if test="${requestScope.info.xstatus==1}">
							<td class="opt_mark1" myid="1">A</td>
							</c:if>
							<c:if test="${requestScope.info.xstatus!=1}">
							<td class="opt_mark" myid="1">A</td>
							</c:if>
							
							<c:if test="${requestScope.info.xstatus==2}">
							<td class="opt_mark1" myid="2">B</td>
							</c:if>
							<c:if test="${requestScope.info.xstatus!=2}">
							<td class="opt_mark" myid="2">B</td>
							</c:if>
							<c:if test="${requestScope.info.xstatus==3}">
							<td class="opt_mark1" myid="3">C</td>
							</c:if>
							<c:if test="${requestScope.info.xstatus!=3}">
							<td class="opt_mark" myid="3">C</td>
							</c:if>
							
							</tr></tbody></table>
					</div>
						<div class="viewlist">
						<b style="margin-left: 40px;">第4项 </b>
						<input type="hidden" class="optionsAnswer" name="cstatus"  />
					
												
							<div style="margin-left: 120px;">
							<b>市场状况</b>
							</div>
							<label class="title" ><b style="margin-left: 120px;">选项：</b> </label>
							      &nbsp; A比较好   &nbsp; &nbsp; B一般  &nbsp;&nbsp; C较差 
							<br>
							<label class="title" style="margin-left: 120px;"><b>回答：</b> </label>
							
						
							<table style="position: relative;margin-left: 165px;margin-top: -35px;"><tbody><tr>
							
								<c:if test="${requestScope.info.cstatus==1}">
							<td class="opt_mark1" myid="1">A</td>
							</c:if>
							<c:if test="${requestScope.info.cstatus!=1}">
							<td class="opt_mark" myid="1">A</td>
							</c:if>
							
							<c:if test="${requestScope.info.cstatus==2}">
							<td class="opt_mark1" myid="2">B</td>
							</c:if>
							<c:if test="${requestScope.info.cstatus!=2}">
							<td class="opt_mark" myid="2">B</td>
							</c:if>
							<c:if test="${requestScope.info.cstatus==3}">
							<td class="opt_mark1" myid="3">C</td>
							</c:if>
							<c:if test="${requestScope.info.cstatus!=3}">
							<td class="opt_mark" myid="3">C</td>
							</c:if>
							
							</tr></tbody></table>
					</div><br>
					
					<label class="title" style="margin-left: 70px;"><b>总结：</b> </label><br>
					<textarea class="input" name="summary" >${requestScope.info.summary}</textarea><br>
					
					<label class="title" style="margin-left: 70px;"><b>建议：</b> </label><br>
				<textarea class="input" name="proposal" >${requestScope.info.proposal}</textarea><br>
				
					<label class="title" style="margin-left: 70px;"><b>备注：</b> </label><br>
					<textarea class="input" name="comments" >${requestScope.info.comments}</textarea><br>
				
				<br>
				<button class="seachbt"  style="margin-left: 210px" type="button" onclick="layer_close();">取消</button>
				<button class="seachbt"  type="button" onclick="edit();">提交</button>

			</fieldset>

		</div>
	</form>
	
  <c:import url="/Model/form_footer.jsp" ></c:import>