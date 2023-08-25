<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 스케쥴러</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css"/>
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <link rel="stylesheet" href="./css/individual/style.css" type="text/css">
    
    
<!-- 	<link href='./js/individual/core/main.css' rel='stylesheet' /> -->
<!-- 	<link href='./js/individual/daygrid/main.css' rel='stylesheet' /> -->
<!-- 	<script src='./js/individual/core/main.js'></script> -->
<!-- 	<script src='./js/individual/interaction/main.js'></script> -->
<!-- 	<script src='./js/individual/daygrid/main.js'></script> -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	
    <script type="text/javascript" src="./js/individual/index.js"></script>
    

<style>

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
</style>
<body>

   <div class="popup">
   		<div class="black">
   			<div class="pop_dialog">
   				<div class="pop_head">
	   				<h3>To-Do List 생성</h3>
	   				<button class="popup_X">X</button>
   				</div>
   				<div class="pop_middle">
   					<div class="pop_input">
   						<h4>제목 : </h4><input id="pop_TODO_Title" placeholder="제목을 입력해주세요.">
   					</div>
   					<div class="pop_input">
   						<h4>시간 : </h4>
						<input type="number" class="pop_TODO_time" value="0" max="12" min="-1" oninput="handleOnInput2(this, 2)"> :
						<input type="number" class="pop_TODO_minute" value="0" max="60" min="-1" oninput="handleOnInput2(this, 2)">
						<select class="pop_TODO_Time_AMPM">
							<option value="AM">A.M</option>
							<option value="PM">P.M</option>
						</select>
   					</div>
   					<div class="pop_input">
   						<h4>장소 : </h4><input id="pop_TODO_location" placeholder="주소 입력">
   					</div>
   					<div class="pop_input">
   						<h4>파일 : </h4><input type="file" id="pop_TODO_file">
   					</div>
   						
   				</div>
   				<div class="pop_bottom">
   					<button class="popup_Save" id="pop_TODO_save">등록</button>
   				</div>
   			</div>
   		</div>
   </div>
  <div class="container">

        

        <header class="header">
            <h3 class="logo">
                <a href="#">
                    <img src="./images/individual/logo.png" alt="logo">
                </a>
            </h3>
            <div class="tab_div">
                <h3 class="tab individual">
                    <img src="./images/individual/foot_pink.png" alt="individual">
                </h3>
                <h3 class="tab company">
                    <img src="./images/individual/foot_blue.png" alt="company">
                </h3>
            </div>
        </header>
        <section class="section" id="todo">

            <div class="to_do">
                <div class="to_do_header">
                    <div class="to_do_title_div">
                        <h3 class="watch">
                            <img src="./images/individual/watch.png" alt="watch">
                        </h3>
                        <h3 class="board_name">To-Do List</h3>
                        <h3 class="count_num">0</h3>
                    </div>
                    <div class="to_do_input_div">
                        <input type="text" id="TODO_ADD" placeholder="등록할 스케줄을 입력해주세요.">
                        <button class="creat">생성</button>
                    </div>
                    <div class="to_do_icon_div">
                        <h3 class="plus">
                            <img src="./images/individual/plus.png" alt="plus">
                        </h3>
                        <h3 class="trash">
                            <img src="./images/individual/trash.png" alt="trash">
                        </h3>
                    </div>
                </div>
                <div class="to_do_section">
                    <div class="to_do_change toggle">
                        <h3 class="change">
                            <img src="./images/individual/change.png" alt="change">
                        </h3>
                    </div>
                    
                    <!--    TO-DO리스트 헤드    -->
                    <div class="to_do_board_header">
                    </div>
                    
                    <!--    TO-DO리스트    -->
                    <div class="to_do_board_body">

                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>
                    </div>
                </div>
            </div>
			
			 <div class="calendar" style="display:none;">
			 
                <div class="to_do_header">
                    <div class="to_do_title_div">
                        <h3 class="watch">
                            <img src="./images/individual/watch.png" alt="watch">
                        </h3>
                        <h3 class="board_name">달력</h3>
                    </div>
                    <div class="to_do_icon_div">
                        <h3 class="plus_c">
                            <img src="./images/individual/plus.png" alt="plus">
                        </h3>
                    </div>
                </div>
	        	 <div class="calendar_section">
	        	 
                    <div class="calendar_change toggle">
                        <h3 class="change">
                            <img src="./images/individual/change.png" alt="change">
                        </h3>
                    </div>
				 	 <div class="calendar_header">
				 	 	<div id='calendar'></div>
				 	 </div>
			 	 
	            </div>
            </div>


            <div class="diary">
                <div class="diary_header" id="side_calendar">
                    <div class="diary_title_div">
                        <h3 class="watch">
                            <img src="./images/individual/watch.png" alt="watch">
                        </h3>
                        <h3 class="board_name">달력</h3>
                    </div>
                </div>
                <div class="diary_section" id="side_calendar_section"></div>
                <div class="diary_header" id="side_todo" style="display:none;">
                    <div class="diary_title_div">
                        <h3 class="watch">
                            <img src="./images/individual/watch.png" alt="watch">
                        </h3>
                        <h3 class="board_name">To-Do List</h3>
                        <h3 class="count_num">0</h3>
                    </div>
                </div>
                <div class="diary_section" id="side_todo_section"></div>
            </div>

            <div class="character"></div>

        </section>
        
   </div>
   
   
</body>
<script>

// dragopen()


  $(document).ready(function(){
    var calendarEl = $('#calendar')[0];

    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
    	height: '700px',
        expandRows: true, // 화면에 맞게 높이 재설정
	     editable: true,
	     eventLimit: true, // allow "more" link when too many events
	     initialView: 'dayGridMonth',
	     navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	     selectable: true, // 달력 일자 드래그 설정가능
	     nowIndicator: true, // 현재 시간 마크
	     dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	     locale: 'ko', // 한국어 설정
	     eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
	       console.log(obj);
	     },
	     eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
	       console.log(obj);
	     },
	     eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
	       console.log(obj);
	     },
      events: [
        {
          title: 'All Day Event',
          start: '2023-08-01'
        },
        {
          title: 'Long Event',
          start: '2023-08-07',
          end: '2023-08-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-08-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-08-16T16:00:00'
        },
      ]
    });

    calendar.render();
    

  });

//   var title = prompt('Event Title:');
//   if (title) {
//     calendar.addEvent({
//       title: title,
//       start: arg.start,
//       end: arg.end,
//       allDay: arg.allDay
//     })
//   }
//          calendar.unselect()

</script>
</html>