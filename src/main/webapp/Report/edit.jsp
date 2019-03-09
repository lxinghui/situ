<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>

<body style="min-width: 100px;">
	<script>
		
	var activity_id = "${requestScope.activity_id}";
	var date = "${requestScope.date}";

	function save(){
		if(${requestScope.list}!=null){
		var list =  ${requestScope.list};
	
			if(list.json!=""&&list.json!=null){
			var	j = JSON.parse(list.json);
			var row ={
					name:	$("#name").val(),
					info:   $(".info").val()
			};
			j.push(row);
			j=JSON.stringify(j);
			}else{
	
				var row ={
						name:	$("#name").val(),
						info:   $(".info").val()
				};
				var data=[];
				data.push(row);
			var	j=JSON.stringify(data)
			}
		}
	
		var id = "${requestScope.id}";

		$.ajax({
			type : "POST",
			url : "report/updateStus",
			//contentType : "application/json; charset=utf-8",
			data :{"json":j,"id":id},
			datatype:'json',
			success : function() {
				alert("添加成功");
				parent.fresh(activity_id,date);
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
				}
		});
	
	}

	</script>



	<form class="f1">
		<input type="hidden" name="id" value="${requestScope.info.id}" />
		<div class="inputview">
			<span class="inputspan"> <label class="inputtext ">姓名:
			</label> <input type="text" class="inputinput" id="name">
			</span>  <span class="inputspan"> <label class="inputtext ">详情:
			</label> <textarea
					style="width: 400px; height: 90px; border: 1px solid #BABABA;"
					class="info"></textarea>
			</span>

			<div class="inputbtpanel" style="margin-top: 60px;">
				<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="save();">保存</button>
			</div>
		</div>
	</form>
	<c:import url="/Model/form_footer.jsp"></c:import>