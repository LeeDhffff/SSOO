<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 스케쥴러</title>
</head>
<jsp:include page="../alert.jsp"></jsp:include>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css"/>
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <link rel="stylesheet" href="./css/individual/style.css" type="text/css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/mdbassit/Coloris@latest/dist/coloris.min.css"/>
    <script src="https://cdn.jsdelivr.net/gh/mdbassit/Coloris@latest/dist/coloris.min.js"></script>

<!-- 	<link href='./js/individual/core/main.css' rel='stylesheet' /> -->
<!-- 	<link href='./js/individual/daygrid/main.css' rel='stylesheet' /> -->
<!-- 	<script src='./js/individual/core/main.js'></script> -->
<!-- 	<script src='./js/individual/interaction/main.js'></script> -->
<!-- 	<script src='./js/individual/daygrid/main.js'></script> -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	
    

<style>
</style>
<body>

   <div class="popup" id="todo_popup">
   		<div class="black">
   			<div class="pop_dialog">
   				<div class="pop_head">
   					<img src="./images/individual/watch.png" alt="watch">
	   				<h3>To-Do List 생성</h3>
	   				<button class="popup_X">X</button>
   				</div>
   				<div class="pop_middle">
   					<div class="pop_input">
   						<h4>일정 제목 </h4>
   						<input id="pop_TODO_Title" placeholder="일정 제목을 입력해주세요.">
   					</div>
   					<div class="pop_input time">
   						<h4>일정 시간</h4>
   						<div class="time_wrap">
   							<input type="number" class="pop_TODO_time" value="0" max="12" min="-1" oninput="handleOnInput2(this, 2)">
							<input type="number" class="pop_TODO_minute" value="0" max="60" min="-1" oninput="handleOnInput2(this, 2)">
							<select class="pop_TODO_Time_AMPM">
								<option value="AM">A.M</option>
								<option value="PM">P.M</option>
							</select>
   						</div>
						
   					</div>
   					<div class="pop_input">
   						<h4>일정 위치</h4>
   						<input id="pop_TODO_location" >
   					</div>
   					<div class="pop_input">
   						<h4>파일 첨부</h4>
   						<div>
   						<input type="file" id="pop_TODO_file" style="display:none;">
   						<input class="uploaded_file" id="name_pop_TODO_file" value="" placeholder="첨부파일" readonly="">
   						<label for="pop_TODO_file">업로드</label>
   						</div>
   					</div>
   						
   				</div>
   				<div class="pop_bottom">
   					<button class="popup_Save" id="pop_TODO_save">등록하기</button>
   				</div>
   			</div>
   		</div>
   </div>
    <div class="popup"  id="calendar_popup">
   		<div class="black">
   			<div class="pop_dialog">
   				<div class="pop_head">
   					<img src="./images/individual/watch.png" alt="watch">
	   				<h3>일정 만들기</h3>
	   				<input type="hidden" id="pop_IDX_SORT">
	   				<button class="popup_X">X</button>
   				</div>
   				<div class="pop_middle">
   					<div class="pop_input">
   						<h4>제목 </h4><input id="pop_Calendar_Title" placeholder="제목을 입력해주세요.">
   					</div>
   					<div class="pop_input">
   						<h4>시작일</h4>
						<input id="pop_Calendar_FROM">
   					</div>
   					<div class="pop_input">
   						<h4>종료일</h4>
						<input id="pop_Calendar_TO">
   					</div>
   					<div class="pop_input">
   						<h4>시작시간</h4>
						<input type="number" class="pop_Calendar_time" id="pop_Calendar_time" value="0" max="12" min="-1" oninput="handleOnInput3(this, 2)"> :
						<input type="number" class="pop_Calendar_minute" id="pop_Calendar_minute" value="0" max="60" min="-1" oninput="handleOnInput3(this, 2)">
						<select id="pop_Calendar_Time_AMPM">
							<option value="AM">A.M</option>
							<option value="PM">P.M</option>
						</select>
   					</div>
   					
   					<div class="pop_input">
   						<h4>종료시간</h4>
						<input type="number" class="pop_Calendar2_time" id="pop_Calendar2_time" value="0" max="12" min="-1" oninput="handleOnInput4(this, 2)"> :
						<input type="number" class="pop_Calendar2_minute" id="pop_Calendar2_minute" value="0" max="60" min="-1" oninput="handleOnInput4(this, 2)">
						<select id="pop_Calendar2_Time_AMPM">
							<option value="AM">A.M</option>
							<option value="PM">P.M</option>
						</select>
   					</div>
   					<div class="pop_input">
   						<h4>색상</h4>
						<input type="text" id="pop_Calendar_Color" value="#ff4e43" data-coloris>
   					</div>
   				</div>
   				<div class="pop_bottom">
   					<button class="popup_Save" id="pop_Calendar_save">등록</button>
   					<button class="popup_Update" id="pop_Calendar_update">수정</button>
   					<button class="popup_Delete" id="pop_Calendar_delete">삭제</button>
   				</div>
   			</div>
   		</div>
   </div>
   <div class="popup popup_trash" id="popup_trash">
   		<div class="black">
   			<div class="pop_dialog">
   				<div class="pop_head">
   					<img src="./images/individual/watch.png" alt="watch">
	   				<h3>휴지통</h3>
	   				<input type="hidden" id="pop_IDX_SORT">
	   				<button class="popup_X">X</button>
   				</div>
   				<div class="pop_dialog_trash"></div>   				
   			</div>
   		</div>   		
   	</div>
  <div class="container">

        

        <header class="header">
            <h3 class="logo">
                <a href="Main.do">
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
   						<h3 id="todo_date"></h3>
                    </div>
                    <div class="to_do_icon_div">
                        <h3 class="plus">
                            <img src="./images/individual/plus.png" alt="plus">
                        </h3>
                        <h3 class="trash notopen">
                            <img src="./images/individual/trash.png" alt="trash" class="trash_img">
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

                        <div class="to_do_board_con_grid" idx="1"></div>                       
                        <div class="to_do_board_con_grid" idx="2"></div>                       
                        <div class="to_do_board_con_grid" idx="3"></div>
                        <div class="to_do_board_con_grid" idx="4"></div>                       
                        <div class="to_do_board_con_grid" idx="5"></div>                       
                        <div class="to_do_board_con_grid" idx="6"></div>
                        <div class="to_do_board_con_grid" idx="7"></div>                       
                        <div class="to_do_board_con_grid" idx="8"></div>                       
                        <div class="to_do_board_con_grid" idx="9"></div>
                        <div class="to_do_board_con_grid" idx="10"></div>                       
                        <div class="to_do_board_con_grid" idx="11"></div>                       
                        <div class="to_do_board_con_grid" idx="12"></div>
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
                <div class="diary_section" id="side_calendar_section">
				 	 	<div id='calendar_mini'></div>
                </div>
                <div class="diary_header" id="side_todo" style="display:none;">
                    <div class="diary_title_div">
                        <h3 class="watch">
                            <img src="./images/individual/watch.png" alt="watch">
                        </h3>
                        <h3 class="board_name">To-Do List</h3>
                        <h3 class="count_num">0</h3>
                    </div>
                </div>
                <div class="diary_section" id="side_todo_section" style="display:none;">
                </div>
            </div>

            <div class="character">
            	<div class="character_div">
    				
	            	<div class="character_status">
	            		<div class="character_option">
	            			<i class="fa-solid fa-gear"></i>
	            			<div class="character_button" style="display:none;">
				            	<button id="mission">오늘의 미션</button>
				            	<button id="character_change">Custom</button>
	            			</div>
	            		</div>            		
	            		<div class="character_image"></div>
	            	</div>
	            	<h3 class="character_owner"><%=(String)session.getAttribute("SESSION_NICK")%></h3>
            		<div class="level_number">
	            		<h5 class="character_h5">Level</h5>
		            	<h5 class="watch">
	                    	<img src="./images/individual/watch.png" alt="watch" style="width: 15px; height: 15px;">
	                    </h5>
                    </div>
    				<progress id="character_exp" value="0" max="100"></progress>        
            		<div class="level_number">
 		           		<h5 class="now_level"></h5>
 		           		<h5 class="next_level"></h5>
            		</div>
	            </div>
            </div>
            
			<div class="character_menu" style="display:none;">
				<div class="character_con_wrap">
					
					<!-- 타이틀 + X버튼 -->
					<div class="chacracter_con_header">
						<h5 class="cat_icon"></h5>
						<h3 class="title"><span><%=(String)session.getAttribute("SESSION_NICK")%></span>님의 야옹이 카테고리</h3>
						<div class="character_menu_toggle">
							<i class="fa-solid fa-xmark"></i>
						</div>
					</div>	
					
					<!-- 탭버튼 -->
					<div class="character_table_tab">
						<button class="table_tab active" id="change_table_o">캐릭터</button>
						<button class="table_tab" id="change_table">포즈</button>
						<button class="table_tab" id="change_table2">배경</button>
					</div>
									
					<div class="character_table_div">
						<!-- 케릭터 테이블 -->
						<div class="con_table" id="character_table">
							<div class="grid_con ch" id="character1"><img src="./images/Character/1.svg" id="o_1"></div>
							<div class="grid_con ch" id="character2"><img src="./images/Character/1_1.svg" id="o_1_1"></div>
							<div class="grid_con ch" id="character3"><img src="./images/Character/1_2.svg" id="o_1_2"></div>
							<div class="grid_con ch" id="character4"><img src="./images/Character/1_3.svg" id="o_1_3"></div>
<!-- 							<div class="grid_con ch" id="character5"></div> -->
<!-- 							<div class="grid_con ch" id="character6"></div> -->
<!-- 							<div class="grid_con ch" id="character7"></div> -->
						</div>
						
						<!-- 포즈 테이블 -->
						<div class="con_table" id="pose_table" style="display: none;">
							<div class="grid_con pose" id="pose1"></div>
							<div class="grid_con pose" id="pose2"></div>
							<div class="grid_con pose" id="pose3"></div>
							<div class="grid_con pose" id="pose4"></div>
						</div>
						
						<!-- 배경 테이블 -->
						<div class="con_table" id="background_table" style="display: none;">
							<div class="grid_con back" id="back1"><img src="./images/background/1.svg" id="back_1"></div>
							<div class="grid_con back" id="back2"><img src="./images/background/2.svg" id="back_2"></div>
							<div class="grid_con back" id="back3"><img src="./images/background/3.svg" id="back_3"></div>
							<div class="grid_con back" id="back4"><img src="./images/background/4.svg" id="back_4"></div>
							<div class="grid_con back" id="back5"><img src="./images/background/5.svg" id="back_5"></div>
							<div class="grid_con back" id="back6"><img src="./images/background/6.svg" id="back_6"></div>
						</div>
						
						<!-- <table id="character_table">
							<thead>
								<tr><th colspan="3">캐릭터 선택</th></tr>
							</thead>
							<tbody>
								<tr><td id="character1"><img src="./images/Character/1.svg" id="o_1"></td><td id="character1_1"><img src="./images/Character/1_1.svg" id="o_1_1"></td><td id="character1_2"><img src="./images/Character/1_2.svg" id="o_1_2"></td></tr>
								<tr><td id="character1_3"><img src="./images/Character/1_3.svg" id="o_1_3"></td><td id="character1_4"></td><td id="character1_5"></td></tr>
							</tbody>
						</table>
						<div class="tablediv">
						<table id="pose_table" style="display:none;">
							<thead>
								<tr><th colspan="3">포즈 선택</th></tr>
							</thead>
							<tbody>
								<tr><td id="pose1"></td><td id="pose2"></td><td id="pose3"></td></tr>
								<tr><td id="pose4"></td><td id="pose5"></td><td id="pose6"></td></tr>
							</tbody>
						</table>
						<table id="background_table" style="display:none;">
							<thead>
								<tr><th colspan="3">배경 선택</th></tr>
							</thead>
							<tbody>
								<tr><td id="back1"><img src="./images/background/1.svg" id="back_1"></td><td id="back2"><img src="./images/background/2.svg" id="back_2"></td><td id="back3"><img src="./images/background/3.svg" id="back_3"></td></tr>
								<tr><td id="back4"><img src="./images/background/4.svg" id="back_4"></td><td id="back5"><img src="./images/background/5.svg" id="back_5"></td><td id="back6"><img src="./images/background/6.svg" id="back_6"></td></tr>
							</tbody>
						</table> -->
	<!-- 					</div> -->
						<div class="now_ch_wrap">
							<div id="nowCharacter"></div>
							<div class="ch_info_wrap">
								<h5 class="level">LV15</h5>
								<h1 class="name">진아네 고양이</h1>
								<h3 class="sub_name">살찐 야옹이</h3>
								<div class="item_list">
									<div class="item cat_type">
										<h3 class="cat_foot_icon"></h3>치즈
									</div>
									<div class="item cat_pose">
										<h3 class="cat_foot_icon"></h3>앉아있는 고양이
									</div>
									<div class="item cat_bg">
										<h3 class="cat_foot_icon"></h3>배경을 선택해주세요.
									</div>
								</div>
							</div>
						</div>						
					</div> <!-- character_table_div 끝 -->
				</div>	<!-- character_con_wrap 끝 -->			
			</div> <!-- character_menu 끝 -->
			
        </section>
        <div class="mission_pop" style="display:none;">
        	<div class="mission_pop_con_wrap">
        		<div class="mission_pop_header">
        			<button class="misson_pop_X">X</button>
        			<h3 class="misson_pop_logo">
        				<img src="./images/logo_white.svg">
        			</h3>
        			<h1>오늘의 미션</h1>
        		</div>
        		<div class="mission_pop_body">        			
		        	<div class="mission_pop_div"></div>
		        	<button id="mission_update">미션 편집</button>
		         	<button id="mission_add" style="display:none;">미션 추가</button>
		         	<div class="mission_pop_div_update" style="display:none;"></div>
		         	<button id="Mission_save" style="display:none;">SAVE</button>
        		</div>        		
        	</div>         	
        </div>
   </div>
   
   
</body>
<script>

/*===============================================================================================*/
/*=========================================캘린더 설정================================================*/
/*===============================================================================================*/
// dragopen()
  var calendar;
  var calendar2;

  var uid = '<%=(String)session.getAttribute("SESSION_COD_MEMB")%>';


  	$(document).ready(function(){
		if(uid == '' || uid == 'null' || uid == null){
			location.href = "Login.do";
		}

	  var clickCnt = 0;
    var calendarEl = $('#calendar')[0];
    var calendarEl2 = $('#calendar_mini')[0];

    calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
    	height: '700px',
    	eventColor : '#ff4e43',
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
// 	       console.log(obj);
	     },
	     eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
			
	    	 
	    	var start_year = obj.event.start.getFullYear();
	    	var start_month = (obj.event.start.getMonth() + 1 < 10) ? "0" + (String)(obj.event.start.getMonth() + 1)
	    					  : (String)(obj.event.start.getMonth() + 1);
	    	var start_date = (obj.event.start.getDate() < 10) ? "0" + (String)(obj.event.start.getDate())
					  		: (String)(obj.event.start.getDate());
	    	var start_hour = (obj.event.start.getHours() < 10) ? "0" + (String)(obj.event.start.getHours())
			  		: (String)(obj.event.start.getHours());
	    	var start_minute = (obj.event.start.getMinutes() < 10) ? "0" + (String)(obj.event.start.getMinutes())
			  		: (String)(obj.event.start.getMinutes());

	    	var end_year = obj.event.end.getFullYear();
	    	var end_month = (obj.event.end.getMonth() + 1 < 10) ? "0" + (String)(obj.event.end.getMonth() + 1)
					  : (String)(obj.event.end.getMonth() + 1);
	    	var end_date = (obj.event.end.getDate() < 10) ? "0" + (String)(obj.event.end.getDate())
			  		: (String)(obj.event.end.getDate());
	    	var end_hour = (obj.event.end.getHours() < 10) ? "0" + (String)(obj.event.end.getHours())
			  		: (String)(obj.event.end.getHours());
	    	var end_minute = (obj.event.end.getMinutes() < 10) ? "0" + (String)(obj.event.end.getMinutes())
			  		: (String)(obj.event.end.getMinutes());
	 		

	 		var startday = start_year + "-" + start_month + "-" + start_date + " " + start_hour + ":" + start_minute;
	 		var endday = end_year + "-" + end_month + "-" + end_date + " " + end_hour + ":" + end_minute;

	    	
	 		var updatedata = {
	 				COD_MEMB : uid,
	 				IDX_SORT : obj.event._def.extendedProps.idx,
	 				TXT_TITLE : obj.event.title,
	 				DAY_FROM : startday,
	 				DAY_TO : endday,
	 				COLOR : obj.event.backgroundColor,
	 		}
	 		
	 		$.ajax({
	 			url: "Individual_Calendar_Update.do",
	 			data: updatedata,
	 			type: "POST",
	 			async: false,
	 			success: function(data){
	 				

	 				calendar.removeAllEvents();
	 				calendar2.removeAllEvents();

	 				selectCalendar();
	 			    popReset();
	 			}
	 			
	 		})
	 		
	     },
	     eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
// 	       console.log(obj);
	     },
	     dateClick: function(obj) {
	    	 if($(obj.dayEl).find('.fc-daygrid-day-number').hasClass("clicked") == false){

					$(".fc-day").css("background","white");
					$('.fc-daygrid-day-number').css("color","");
					$(".fc-day-today").css("background","var(--fc-today-bg-color,rgba(255,220,40,.15))");
					
					$(obj.dayEl).css("background","red");
					$(obj.dayEl).find('.fc-daygrid-day-number').css("color","white");
				    $('.fc-daygrid-day-number').removeClass("clicked");
				    $(obj.dayEl).find('.fc-daygrid-day-number').addClass("clicked");
					$("#todo_date").text(obj.dateStr);
				    selectTodo();
	    	 }
	    	 else{
	    		 $("#calendar_popup").show();
	    		 $("#pop_Calendar_FROM").val(obj.dateStr);
	    		 $("#pop_Calendar_TO").val(obj.dateStr);
	    	 }
	     },
	     eventClick: function(info) {

			$("#calendar_popup").show();
			$("#pop_Calendar_update").show();
			$("#pop_Calendar_delete").show();
			$("#pop_Calendar_save").hide();
			var date1 = info.event.start;
			
			var Startyear = (date1.getFullYear() < 10) ? "0" + date1.getFullYear()
							: date1.getFullYear();
			var Startmonth = (date1.getMonth() + 1 < 10) ? "0" + (String)(date1.getMonth() + 1)
							: (String)(date1.getMonth() + 1);
			var Startday = (date1.getDate() < 10) ? "0" + date1.getDate()
							: date1.getDate();

			var Starttime = date1.getHours();
			var Starttime2 = (Starttime >= 12) ? Starttime - 12
							: Starttime;
			
			var StartAMPM = (Starttime >= 12) ? "PM"
					        : "AM";
			
			var Startminute = date1.getMinutes();

			var Startdate = Startyear + "-" + Startmonth + "-" + Startday;
			
			
			
			
			var date2 = (info.event.end != null ) ? info.event.end
					    : date1;
			var endyear = (date2.getFullYear() < 10) ? "0" + date2.getFullYear()
							: date2.getFullYear();
			var endmonth = (date2.getMonth() + 1 < 10) ? "0" + (String)(date2.getMonth() + 1)
							: (String)(date2.getMonth() + 1);
			var endday = (date2.getDate() < 10) ? "0" + date2.getDate()
							: date2.getDate();

			var endtime = date2.getHours();
			var endtime2 = (endtime >= 12)  ? endtime - 12
							: endtime;
			
			var endAMPM = (endtime >= 12) ? "PM"
			        : "AM";

			var endminute = date2.getMinutes();

			var enddate = endyear + "-" + endmonth + "-" + endday;

			
			
			$("#pop_Calendar_FROM").val(Startdate);
			$("#pop_Calendar_TO").val(enddate);
			
			$("#pop_Calendar_time").val(Starttime2);
			$("#pop_Calendar2_time").val(endtime2);

			$("#pop_Calendar_minute").val(Startminute);
			$("#pop_Calendar2_minute").val(endminute);
			
			$("#pop_Calendar_Time_AMPM").val(StartAMPM);
			$("#pop_Calendar2_Time_AMPM").val(endAMPM);

			$("#pop_Calendar_Title").val(info.event._def.title);
			$("#pop_IDX_SORT").val(info.event._def.extendedProps.idx);
			$("#pop_Calendar_Color").val(info.event._def.ui.backgroundColor);
			$(".pop_input > .clr-field").css("color",info.event._def.ui.backgroundColor);
			
	    	},
      events: [
      ]
     , eventDidMount: function(info) {		
    			info.el.style.backgroundColor = info.event.extendedProps.color
    		
    	}
	 ,
    });

    
    calendar2 = new FullCalendar.Calendar(calendarEl2, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: ''
        },
    	height: '90%',
    	eventColor : '#ff4e43',
        expandRows: true, // 화면에 맞게 높이 재설정
	     editable: false,
	     eventLimit: true, // allow "more" link when too many events
	     initialView: 'dayGridMonth',
	     navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	     selectable: false, // 달력 일자 드래그 설정가능
	     nowIndicator: true, // 현재 시간 마크
	     dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	     locale: 'ko', // 한국어 설정
	     dateClick: function(obj) {
				$(".fc-day").css("background","white");
				$('.fc-daygrid-day-number').css("color","");
				$(".fc-day-today").css("background","var(--fc-today-bg-color,rgba(255,220,40,.15))");
				
				$(obj.dayEl).css("background","red");
				$(obj.dayEl).find('.fc-daygrid-day-number').css("color","white");
				$("#todo_date").text(obj.dateStr);
			    selectTodo();
	     },
	     eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
// 	       console.log(obj);
	     },
	     eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
// 	       console.log(obj);
	     },
	     eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
// 	       console.log(obj);
	     },
      events: [
      ]
    });
    
    calendar.render();
    calendar2.render();
    

	
	
    selectCalendar();
// 	 var selectdata = {
// 				COD_MEMB : uid
// 		}
		
// 		$.ajax({
// 			url: "ListDays.do",
// 			data: selectdata,
// 			type: "POST",
// 			async: false,
// 			success: function(data){
				
// 				var result = JSON.parse(data);
				
// 				console.log(result);
				
// 				for(var i=0 ; i<result.length; i++){
// 					var date1 = new Date(result[i].DAY_FROM)
// 					var date2 = new Date(result[i].DAY_TO)
					
// 					calendar.addEvent({
// 					       title: result[i].TXT_TITLE,
// 					       start: date1,
// 					       end: date2,
// 					       color : result[i].COLOR,
// 					       idx : result[i].IDX_SORT
// 					     })
// 				     calendar2.addEvent({
// 				       title: result[i].TXT_TITLE,
// 				       start: date1,
// 				       end: date2,
// 				       color : result[i].COLOR,
// 				       idx : result[i].IDX_SORT
// 				     })
					    
// 				}
				
// 			}
			
// 		})
    
    
    $("#pop_Calendar_save").on("click",function(){

    	
		
		var time = ($("#pop_Calendar_Time_AMPM").val() == 'AM') ? $("#pop_Calendar_time").val()
				: (String)(Number($("#pop_Calendar_time").val()) + 12);
		time = (time < 10) ? 0 + time
				: time;
		
		var minute = ($("#pop_Calendar_minute").val() < 10) ? "0" + $("#pop_Calendar_minute").val()
		             : $("#pop_Calendar_minute").val();

		var time2 = ($("#pop_Calendar2_Time_AMPM").val() == 'AM') ? $("#pop_Calendar2_time").val()
				: (String)(Number($("#pop_Calendar2_time").val()) + 12);
		time2 = (time2 < 10) ? 0 + time2
		: time2;

		
		var minute2 = ($("#pop_Calendar2_minute").val() < 10) ? "0" + $("#pop_Calendar2_minute").val()
	             : $("#pop_Calendar2_minute").val();
		
		var totime = (String)(time) + ":" + minute
		var totime2 = (String)(time2) + ":" + minute2
		

		var startdate = new Date($("#pop_Calendar_FROM").val() + " " +  totime)
		var enddate = new Date($("#pop_Calendar_TO").val() + " " + totime2)
		
		console.log(startdate,enddate,enddate.getTime() - startdate.getTime())
// 		date.setDate(date.getDate());
		
		if($("#pop_Calendar_FROM").val() == ''){
    		popup_alert.alerts("날짜를 먼저 입력하세요.");
    	}
    	else if($("#pop_Calendar_TO").val() == ''){
    		popup_alert.alerts("날짜를 먼저 입력하세요.")
    	}
    	else if(enddate.getTime() - startdate.getTime() < 0){
    		popup_alert.alerts("시작시간이 종료시간보다 이전 시간이여야 합니다.")
    	}
    	else{
		$(".popup").hide();
		
		var insertdata = {
				COD_MEMB : uid,
				TXT_TITLE : $("#pop_Calendar_Title").val(),
				DAY_FROM : $("#pop_Calendar_FROM").val() + " " +  totime,
				DAY_TO : $("#pop_Calendar_TO").val() + " " + totime2,
				COLOR : $("#pop_Calendar_Color").val(),
		}
		
		$.ajax({
			url: "Individual_Calendar_Insert.do",
			data: insertdata,
			type: "POST",
			async: false,
			success: function(data){
				
				var result = JSON.parse(data);
				
// 				calendar.addEvent({
// 			       title: $("#pop_Calendar_Title").val(),
// 			       start: startdate,
// 			       end: enddate,
// 			       color : $("#pop_Calendar_Color").val(),
// 			       idx : result.IDX
// 			     })
			    selectCalendar()
			    popReset();
			}
			
		})
    		
    	}
		
	})
	$("#pop_Calendar_update").on("click",function(){

		$(".popup").hide();
		
		var time = ($("#pop_Calendar_Time_AMPM").val() == 'AM') ? $("#pop_Calendar_time").val()
				: (String)(Number($("#pop_Calendar_time").val()) + 12);
		time = (time < 10) ? 0 + time
				: time;
		
		var minute = ($("#pop_Calendar_minute").val() < 10) ? "0" + $("#pop_Calendar_minute").val()
		             : $("#pop_Calendar_minute").val();

		var time2 = ($("#pop_Calendar2_Time_AMPM").val() == 'AM') ? $("#pop_Calendar2_time").val()
				: (String)(Number($("#pop_Calendar2_time").val()) + 12);
		time2 = (time2 < 10) ? 0 + time2
		: time2;

		
		var minute2 = ($("#pop_Calendar2_minute").val() < 10) ? "0" + $("#pop_Calendar2_minute").val()
	             : $("#pop_Calendar2_minute").val();
		
		var totime = (String)(time) + ":" + minute
		var totime2 = (String)(time2) + ":" + minute2
		

		var startdate = new Date($("#pop_Calendar_FROM").val() + " " +  totime)
		var enddate = new Date($("#pop_Calendar_TO").val() + " " + totime2)
		
// 		date.setDate(date.getDate());
		
		
		var updatedata = {
				COD_MEMB : uid,
				IDX_SORT : $("#pop_IDX_SORT").val(),
				TXT_TITLE : $("# pop_Calendar_Title").val(),
				DAY_FROM : $("#pop_Calendar_FROM").val() + " " +  totime,
				DAY_TO : $("#pop_Calendar_TO").val() + " " + totime2,
				COLOR : $("#pop_Calendar_Color").val(),
		}
		
		$.ajax({
			url: "Individual_Calendar_Update.do",
			data: updatedata,
			type: "POST",
			async: false,
			success: function(data){
				

				calendar.removeAllEvents();
				calendar2.removeAllEvents();

				selectCalendar();
			    popReset();
			}
			
		})
		
	})

	$("#pop_Calendar_delete").on("click",function(){
		
		popup_alert.confirm("해당 일정을 삭제하시겠습니까?", function (res) {
            if (res){
			$(".popup").hide();
			
			var updatedata = {
					COD_MEMB : uid,
					IDX_SORT : $("#pop_IDX_SORT").val()
			}
			
			$.ajax({
				url: "Individual_Calendar_Delete.do",
				data: updatedata,
				type: "POST",
				async: false,
				success: function(data){
					

					calendar.removeAllEvents();
					calendar2.removeAllEvents();

					selectCalendar();
				    popReset();
				}
				
			})
			
		}
		})
	  });
  });
  
  
  function selectCalendar(){
	  var selectdata = {
				COD_MEMB : uid
		}
		
		$.ajax({
			url: "ListDays.do",
			data: selectdata,
			type: "POST",
			async: false,
			success: function(data){
				
				var result = JSON.parse(data);
				

				calendar.removeAllEvents();
				calendar2.removeAllEvents();
				
				for(var i=0 ; i<result.length; i++){
					var date1 = new Date(result[i].DAY_FROM);
					var date2 = new Date(result[i].DAY_TO);
					
					calendar.addEvent({
					       title: result[i].TXT_TITLE,
					       start: date1,
					       end: date2,
					       color : result[i].COLOR,
					       idx : result[i].IDX_SORT
					     })
				     calendar2.addEvent({
				       title: result[i].TXT_TITLE,
				       start: date1,
				       end: date2,
				       color : result[i].COLOR,
				       idx : result[i].IDX_SORT
				     })

				}
				
			}
			
		})
  }
	

</script>

    <script type="text/javascript" src="./js/individual/index.js"></script>
</html>