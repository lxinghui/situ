<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='fullcalendar-3.10.0/fullcalendar.min.css' rel='stylesheet' />
<link href='fullcalendar-3.10.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='fullcalendar-3.10.0/lib/moment.min.js'></script>
<script src='fullcalendar-3.10.0/lib/jquery.min.js'></script>
<script src='fullcalendar-3.10.0/fullcalendar.min.js'></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<script>
function show(url,w,h){
	layer.open({
		type:2,
	    area:[w+'px',h+'px'],
	    fixed:false, //不固定
	    maxmin:true,
	    content:url,
	});
}
  $(document).ready(function() {
	 
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listMonth'
      },
      defaultDate: '2019-01-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      allday:false,
      events: function(start,end,timezone,callback){
    	  $.ajax({
    		  type: "post",
    		  url:"getEvent",
    		  success: function(json){
    			  var events = [];
    			  var list = json.listJSON;
    			  
    			  if(json.status =='1'){
    			  $.each(list,function(key,value){
    				  events.push({
    					  id:value.id,
    					  title:value.title,
    					  start:value.start,
    					  end:value.end,
    					  description :value.content,
    			          color: '#ff9f89'
    				  });
    			  });
    			  }
    			  callback(events);
    		  }
    	 
    	  });
      },
      eventClick: function(event){
    	     show("实训编辑","activities/edit1?id="+event.id,750,500);
      }
      
    });

  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>