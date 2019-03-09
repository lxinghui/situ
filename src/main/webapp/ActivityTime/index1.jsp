<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/Model/list_head.jsp"></c:import>
<head>
<script type="text/javascript" src="fullcalendar/jquery.min.js"></script>
<link href='fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script type="text/javascript" src="fullcalendar/jquery-ui.custom.min.js"></script>
<script src='fullcalendar/fullcalendar.min.js'></script>
<script>
	
	$(document).ready(function() {

	//	var date = new Date();
	//	var d = date.getDate();
		//var m = date.getMonth();
	//	var y = date.getFullYear();
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		editable: true,
		 events: function(start,end,callback) {
		        var date = this.getDate().format('YYYY-MM');
		        $.ajax({
		            url: 'times/cal',
		            dataType: 'json',
		            data: {
		                date: date,
		            },
		            success: function(json) { // 获取当前月的数据
		                var events = [];
		                 for(var i=0;i<json.length;i++)
		                            events.push({
		                                title: json[i].a_name,
		                                start: json[i].date , // will be parsed
		                                color: '#FFEBAC'
		                            });
		                    });
		                
		                callback(events);
		            }
		        });
		    }
	});
	
});

</script>
<style type="text/css">

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
</head>

<body>
			<div id='calendar'></div>


	<c:import url="/Model/list_footer.jsp"></c:import>