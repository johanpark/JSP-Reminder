<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dev.vo.TodoVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Reminder/resources/css/main.css" />
<script src="/Reminder/resources/js/main.js"></script>
<title>Insert title here</title>
</head>
<style>
html, body {
	overflow: hidden; /* don't do scrollbars */
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar-container {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	padding-top: 50px;
}

.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
</style>

<body>
	<%@include file="../header/nav.jsp"%>

	<%
		ArrayList<TodoVO> calendartodos = (ArrayList<TodoVO>) request.getAttribute("calendartodos");
	%>

	<!-- Modal -->
	<div class="modal fade" id="modal_input" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Input Your Todo!</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="js-TodoForm text-center mx-auto" style="width: 400px;"
						action="/Reminder/calendarInput.do" method="post">
						<!-- TodoList 입력 -->
						<input type="text" placeholder=" Write here!"
							class="form-input text form-control input-sm" name="todoinput" />
						<input type="date" class="form-input text form-control input-sm" name="startday"/ >
						<input type="date" class="form-input text form-control input-sm" name="endday"/ >
						<button class="btn btn-primary pull-right">Submit</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


<div class="modal fade" id="successModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Edit Evnet</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					
				</div>
				<div class="modal-footer">
					
				</div>
			</div>
		</div>
	</div>


	<!-- Calendar -->
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>

	<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      height: '100%',
      expandRows: true,
      slotMinTime: '08:00',
      slotMaxTime: '20:00',
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today custom1',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      customButtons: {
          custom1: {
            text: 'Input',
            click: function() {
              $('#modal_input').modal('show');
            }
          }
        },
   
      initialView: 'dayGridMonth',
      initialDate: new Date(),
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      selectable: true,
      nowIndicator: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2020-09-01',
          end: '2020-09-12'
        },
        <%for (int i = 0; i < calendartodos.size(); i++) {
	TodoVO todo = calendartodos.get(i);%>
        {
        	id:'<%=todo.getTodoID()%>',
     		title: '<%=todo.getTodoContent()%>',
     		start: '<%=todo.getTodoStartDate()%>',
     		end: '<%=todo.getTodoEndDate()%>',
     		<%if (i == calendartodos.size() - 1) {%>
     			}
     		<%} else {%>
     			},
     	<%}%>
		
        <%}%>
        ],
        eventClick: function(event) {
        	$('#successModal .modal-body *').remove();
        	$('#successModal .modal-footer *').remove();
        	/* console.log(event.event._def.title); */
        	console.log(event.event._def.publicId);
        	var title = event.event._def.title;
        	var ID = event.event._def.publicId;
        	console.log(event.event._instance.range.start);
        	console.log(event.event._instance.range.end);
        	console.log(event.event._instance.range.start.toISOString());
        	console.log(event.event._instance.range.end.toISOString());
        	var startDay = event.event._instance.range.start.toISOString();
        	var endDay =event.event._instance.range.end.toISOString();
        	startDay =getFormatDate(startDay);
        	endDay = getFormatDate(endDay);
        	console.log(startDay);
        	console.log(endDay);
        	
        	var newEditForm =$('<form></form>');
        	newEditForm.attr("name","editTodo");
        	newEditForm.attr("method", "post");
        	newEditForm.attr("action","/Reminder/calendarUpdate.do");
        		
        	newEditForm.append($('<input />',{type:'text', value:title, name:"todotitle"}));
        	newEditForm.append($('<input />',{type:'date', value:startDay, name:"todoStartDay"}));
        	newEditForm.append($('<input />',{type:'date', value:endDay, name:"todoEndDay"}));
        	newEditForm.append($('<input />',{type:'hidden', value:ID, name:"todoID"}));
        	newEditForm.append($('<button class="btn btn-success">Edit</button>'));
        	newEditForm.appendTo('#successModal .modal-body');
        		

            	var newDeleteForm =$('<form></form>');
            	newDeleteForm.attr("name","deleteTodo");
            	newDeleteForm.attr("method", "post");
            	newDeleteForm.attr("action","/Reminder/calendarDelete.do");
            		
            	newDeleteForm.append($('<input/>',{type:'hidden', value:ID, name:"todoID"}));
            	newDeleteForm.append($('<button class="btn btn-danger">Delete</button>'));
            	newDeleteForm.appendTo('#successModal .modal-footer');
            
            var close = $('<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>');
            $('#successModal .modal-footer').append(close);
        	/* var span = $('<span>domTest</span>');  */
			/* var titleinput = $('<input type="text" /> ');
        	$(#successModal .modal-body).append(titleinput); */
        	/* $("#successModal").append(span); */
        	$("#successModal").modal("show");

        	
        	
        	/* $("#successModal .modal-body p").text(event.title); */
        	/* $("#successModal .modal-body #titleinput").val(title);
        	$("#successModal .modal-body #IDinput").val(ID); */
        	
        	
        	}

  });
    calendar.render();
  });

</script>
<script>
function getFormatDate(date){
	var pickdate = String(date);
	var year = pickdate.substring(0,4);
    var month = pickdate.substring(5,7);
    var day = pickdate.substring(8,10);

    return year + "-" + month + "-" + day;
}
</script>
</body>
</html>