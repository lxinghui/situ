<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
<head>
<style>
.opt {
	float: right;
	padding-right: 100px;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<body style="min-width: 100px;">
	<script>
	
	var ids = "${requestScope.info.ids}";
	var a_id = "${requestScope.activity.id}";
	var ss = "${requestScope.info.id}";
	var gname = "${requestScope.gname}";
	var gpath = "${requestScope.gpath}";
	var gproject = "${requestScope.gproject}";
	var gcomments = "${requestScope.gcomments}";
 
	function fresh1(ids,g_name,g_path,g_comments,g_project) {
		
		if(a_id!=null){
		location.href = "groups/add1?ids="+ids+"&&a_id="+a_id+"&&gname="+g_name+"&&gproject="+g_project+"&&gpath="+g_path+"&&gcomments="+g_comments;
		}
	}
	function fresh(ids) {
		 var s = "${id}";
		
		 if(s!=""){
		location.href = "groups/edit1?&id="+s+"&&ids="+ids;
		 }
	}
	function openuser(){
		 var g_name=$("#gname").val();
	     var g_project=$(".gproject").val();
		 var g_path=$('.gpath').val();
		 var g_comments=$('.gcomments').val();
		if(ss!=""){
			layer_show("学生表","users/show?a_id="+a_id+"&&gcmd=g_update&&g_id="+ss+"&&cmd=update&&gname="+g_name+"&&gproject="+g_project+"&&gpath="+g_path+"&&gcomments="+g_comments,480,320);
		}else{
		layer_show("学生表","users/show?gcmd=g_update&&a_id="+a_id+"&&gcmd=g_update&&g_id="+ss+"&&gname="+g_name+"&&gproject="+g_project+"&&gpath="+g_path+"&&gcomments="+g_comments,480,320);
		}
		}

		function save() {
		//	  var ss = "${requestScope.ids}";
			//  if(ss!=""){
				  $(".ids").val(ids);
			//  }
			if($(".cmd").prop("name")=="insert"){
			$.post("groups/insert_json1", $(".f1").serialize(), function(json) {

				if (json.status > 0) {
					parent.fresh();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				} else {
					alert(json.text);
				}
			}, "json");
			}
			else{
			$.post("groups/update_json1", $(".f1").serialize(), function(json) {

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
		function delid(id){
			var data =[];
			//var ids="${requestScope.info.ids}";
			data=ids.split(",");
			for(var i=0;i<data.length;i++){
				if(data[i]==id){
					data.splice(i,1);
				}
			}
			ids = data.join(",");
			return ids;
		}
		 $(function(){
			if(gname!=""){
				$("#gname").val(gname);
				$(".gpath").val(gpath);
				$(".gproject").val(gproject);
				$(".gcomments").val(gcomments);
			}
			 var data = [];
			 $(".del").each(function(){
				 var id = parseInt($(this).attr("myid"));
				 data.push(id);
				 ids=data.join(",");	
			 });
			 $(".del").on("click",function(){
				 var msg = "确认删除？";
				 if(confirm(msg) == true){
					 var id = parseInt($(event.target).attr("myid"));
					 $(event.target).remove();
					 var ids = delid(id);
					  $(".ids").val(ids);
				 }
			 });
				
		 });
	</script>



	<form class="f1">
		<div class="inputview">
			<c:if test="${requestScope.info==null}">
				<input type="hidden" class="cmd" name="insert" />
				<c:if test="${requestScope.activity!=null}">
					<input type="hidden" value="${activity.id}" name="activity_id">
				</c:if>
			</c:if>
			<c:if test="${requestScope.info!=null}">
				<input type="hidden" class="cmd" name="update" />
				<input type="hidden" value="${requestScope.info.id}" name="id">
				<input type="hidden" value="${requestScope.info.activity_id}"
					name="activity_id">
			</c:if>
			<span class="inputspan"> <label class="inputtext">组名:
			</label> <input type="text" class="inputinput gname" id="gname"
				style="width: 378px;" name="name" value="${requestScope.info.name}">
			</span> <span class="inputspan"> <label class="inputtext ">项目:
			</label> <input type="text" class="inputinput gproject" name="project"
				value="${requestScope.info.project}"> <label
				class="inputtext ">上传路径: </label> <input type="text"
				class="inputinput gpath" name="path"
				value="${requestScope.info.path}">
			</span> <span class="inputspan"> <label class="inputtext ">小组成员:
			</label>
				<div
					style="border: 1px solid #BABABA; width: 378px; height: 70px; position: absolute; left: 112px;">
					<c:if test="${users!=null}">
						<div>
							<c:forEach items="${requestScope.users}" var="r">
								<i id="del" class="del    fa  fa-minus-square" myid="${r.id}">${r.name}</i>&nbsp;
						</c:forEach>
					</c:if>
					<input type="hidden" name="ids" class="ids"> <i
						class="fa fa-plus-square" onclick="openuser(${info.activity_id});"></i>
				</div>
			</span>
		</div>
		<span class="inputspan"
			style="position: absolute; left: 20px; top: 230px;"> <label
			class="inputtext ">备注: </label> <textarea
				class="inputarea gcomments" name="comments"
				style="margin-top: -20px; margin-left: 0px; width: 378px; height: 100px;"
				value="${requestScope.info.comments}">${requestScope.info.comments}</textarea>
		</span>
		</div>
		<div class="inputbtpanel" style="position: absolute; top: 320px;">
			<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
			<button class="seachbt1" type="button" onclick="save();">保存</button>
		</div>
	</form>
	<script>
	   </script>
	<c:import url="/Model/form_footer.jsp"></c:import>