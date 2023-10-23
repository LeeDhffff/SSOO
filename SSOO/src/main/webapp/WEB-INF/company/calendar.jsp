<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
  	<title>회사</title>
    <meta charset='utf-8' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/progressbar.js/1.0.1/progressbar.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/progressbar.js/1.0.1/progressbar.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/round-slider@1.6.1/dist/roundslider.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/round-slider@1.6.1/dist/roundslider.min.css">
    
    <style type="text/css">
        :root {
            --main-color: #0E51BB;
            --font-color: #636363;
            --border-color: #d6d6d6;
            --white-color: #fff;
            --button-color: #ececec;
            --button-green: #ceffc2;
            --font-green: #185709;
            --button-red: #ffa2a2;
            --font-red: #9a0000;
            --nav-background : #FFC5C1;
            --individual: #0F31A7;
            --company: #FF4E43;
        }
        
        .container{
            height: 100vh;
            position: relative;
        }

        section{
            width: calc(100% - 160px);
            padding: 40px 50px;
            display: flex;
            justify-content: space-between;
        }

		header {
            height: 50px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            line-height: 57px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .left_div{
            width: 75%;
        }

        .right_div{
            width: 23%;
        }
        
        #teamList{
        	width: 200px;
            height: 30px;
            border: 1px solid #dadada;
            border-radius: 30px;
    		margin-left: 20px;
    		-webkit-appearance:none; /* for chrome */
   			-moz-appearance:none; /*for firefox*/
   			appearance:none;
   			background:url(../images/arrow_down.svg) no-repeat 95% 50%/12px auto;
   			padding: 0 20px;
   			font-size: 16px;
        }

        .favicon_div{
            display: flex;
            align-items: center;
			margin-left: auto;
			margin-right: 80px;
            /* justify-content: space-around;
            margin-bottom: 45px; */
        }

        .bk{
            /* width: 200px;
            border: 1px solid #c5c5c5;
            text-align: center; */
            
            box-shadow: 0 0 3px rgb(0 0 0 / 40%);
		    border-radius: 10px;
		    width: 50px;
		    height: 50px;
		    margin-right: 20px;
		    cursor:pointer;
        }
        
        .bk_add 
		{
			box-shadow: 0 0 3px rgb(0 0 0 / 40%);
		    border-radius: 10px;
		    width: 50px;
		    height: 50px;
		    margin-right: 20px;
		    cursor:pointer;
		}
        
        .bk a{
            text-decoration-line: none;
            color: black;
        }


		.change_mode 
		{
			margin-top: 40px;
    		margin-right: 80px;
		}
		
		.change_mode>button 
		{
			width: 90px;
			height: 40px;
			border-radius: 15px 15px 0 0;
			color: #fff;
			font-size: 16px;
			font-weight: 500;
			margin-left: 20px;
			border:0;			
		}
		
		.change_mode>button.btn.ps
		{
			background-color: var(--individual);
		}
		
		.change_mode>button.btn.cp
		{
			background-color: var(--company);
		}


        .graph_div{
            border: 1px solid #c5c5c5;
            padding: 5px;
            margin-bottom: 10px;
        }

        .notice_div{
            border: 1px solid #c5c5c5;
            padding: 5px;
        }

        .notice_header{
            display: flex;
            /* justify-content: space-between; */
            align-items: center;
        }

        .timepicker{
            width: 100px;
        }

		.schedule_div{
			height: 100px;
			overflow: scroll;
		}

		.schedule_item{
			display: flex;
			justify-content: space-between;
			align-items: center;
			background-color: #f3f3f3;
			margin: 6px 0;
		}

        /* 일정등록 팝업 */
        .modal {
            position: absolute;
            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            display: none;
        }

		.modal2 {
            position: absolute;
            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            display: none;
        }

        .modal_body {
            position: absolute;
            top: 50%;
            left: 50%;

            width: 550px;
            height: 250px;

            padding: 40px;

            text-align: center;

            background-color: #c5c5c5;
            border-radius: 10px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

            transform: translateX(-50%) translateY(-50%);
        }

        .modal_content{
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .btn_div{
            margin-top: 40px;
        }

        .close{
            width: 40px;
            height: 40px;
        }
        
        .close2{
            width: 40px;
            height: 40px;
        }

        #achievement{
            margin: 20px;
            width: 300px;
            height: 160px;
        }

        .hidden{
            display: none;
        }

        /* fullCalendar 관련
        .fc .fc-highlight{
        	background-color: #fff4f4;
        } */
    </style>
    <script>
		var uid = '<%=(String)session.getAttribute("SESSION_COD_MEMB")%>';
		var tid = '<%=request.getParameter("team")%>';
		console.log(tid, uid);
	</script>
  </head>
  <body>
  	<header>
		<select id="teamList" onChange="changeTeam()"></select>
         
        <div class="favicon_div">
			<div class="bk slot0">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot1">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot2">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot3">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot4">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot5 hidden">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot6 hidden">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot7 hidden">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot8 hidden">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk slot9 hidden">
				<input type='text' class="bk_url hidden" value="" />
				<img src="" class="bk_fav">
				<p class="bk_name"></p>
			</div>
			<div class="bk_add">
				<input type='text' class="bk_url hidden" value="" />
				<img src="../images/add.png" alt="#" class="bk_fav">
			</div>
		</div> 
         <div class="change_mode">
             <button class="btn ps">개인</button>
             <button class="btn cp">회사</button>
    	</div>
    </header>
    <div class="container">
    	
        <section>
            <div class="left_div">
                
                <div class="calendar_div">
                    <div id='calendar'></div>
                    <div class="schedule_div">
                    	<!-- <div class="schedule_item">
                    		<h3>스케줄 제목</h3>
                    		<div class="delete"><img src="../images/delete.png" alt="#"></div>
                    	</div> -->
                    </div>
                </div>
            </div>
            <div class="right_div">
                <div class="graph_div">
                    <div id="achievement"></div>
                    <div id="slider"></div>
                </div>
                <div class="notice_div">
                    <div class="notice_header">
                        <img class="btn_notice" src="../images/arrow_left.png" alt="#" style="width: 24px; height: 24px;">
                        <h2>공지사항</h2>
                    </div>
                    <div class="notice_body">
                        <h3>[전체] 공지사항</h3>
                        <p>10월 02일(월)은 대체공휴일입니다.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <div class="modal">
        <div class="modal_body">
            <div style="display: flex; justify-content: space-between;">
                <h3>스케줄 등록</h3>
                <img src="../images/close.png" class="close">
            </div>
            
            <hr>

            <div class="modal_content">
                <div>
                    <label for="name">스케줄명</label>
                    <input type="text" name="title" id="title">
                </div>
                
                <div>
                    <label for="startDay">시작</label>
                    <input type="date" name="startDay" id="startDay">
                    <input type="text" name="startHH" id="startHH" class="timepicker hh">
                    <input type="text" name="startMM" id="startMM" class="timepicker mm">
                </div>
                <div>
                    <label for="endDay">종료</label>
                    <input type="date" name="endDay" id="endDay">
                    <input type="text" name="endtHH" id="endHH" class="timepicker hh">
                    <input type="text" name="endMM" id="endMM" class="timepicker mm">
                </div>
                <div>
                    <label for="allDay">종일</label>
                    <input type="checkbox" name="allDay" id="allDay">
                </div>
            </div>

            <div class="btn_div">
                <button id="sch_addEvt" class="btn save">생성하기</button>
            </div>
        </div>
    </div>
    
    <div class="modal2">
    	<div class="modal_body">
    		<div style="display: flex; justify-content: space-between;">
                <h3>자주가는 페이지 등록</h3>
                <img src="../images/close.png" class="close2">
            </div>
            
            <div class="modal_content">
            	<div>
                    <label for="name">자주가는 페이지 URL</label>
                    <input type="text" name="bk_url" id="bk_url">
                </div>
                
                <div>
                    <label for="name">자주가는 페이지 이름</label>
                    <input type="text" name="bk_name" id="bk_name">
                </div>
            </div>
            
            <div class="btn_div">
                <button id="url_addEvt" class="btn add">등록하기</button>
            </div>
    	</div>
    </div>
  </body>
  <script>
    var calendarEl, calendar;
    var isAllDay = false;
    var cnt = 0;
    var firstClick, slot;

    let today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;

    $(document).ready(function () {
    	if(month < 10) month = "0"+month;
    	
    	window.addEventListener("keydown", function(e){
            if(e.code == "Tab"){
                // 개인으로 이동
                $('.btn.ps').click();
            }
        });
    	
    	calendarEl = document.getElementById('calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            selectable: true,
            height: 650,
            locale: 'ko',
            customButtons: {
                addButton:{
                    text: '일정등록',
                    click: function(){ }
                }
            },
            dateClick: function(i){
                console.log(i.jsEvent);
                $('#sch_addEvt')[0].innerText = "등록하기";
                
                if(firstClick == i.dateStr){
                   console.log('dblclick');
                   
                   	$('.container').css('z-index',-1);
                    $(".modal").css('display','block');
                    $('#startDay').val(i.dateStr);
                    $('#startHH').val(today.getHours());
                    $('#startMM').val(today.getMinutes());

                    $('#endDay').val(i.dateStr);
                    $('#endHH').val(today.getHours()+1);
                    $('#endMM').val(today.getMinutes());
                }else{
                   console.log('click');
                }
                
                firstClick = i.dateStr;
            },
            eventClick: function(i) {
            	$('.container').css('z-index',-1);
                $(".modal").css('display','block');
                
                $('#title').val(i.event.title);
                                
                console.log(i.event);
                
                if(i.event.allDay){
                	$('#allDay').prop("checked",true);
                	$('#startDay').val(i.event.startStr);
                	$('#endDay').val(i.event.endStr);
                	$('.timepicker').css('display','none');
                }else{
                	$('#allDay').prop("checked",false);
                	
                	$('#startDay').val(i.event.startStr.split('T')[0]);
                	$('#endDay').val(i.event.endStr.split('T')[0]);
                	
                	$('#startHH').val(i.event.startStr.split('T')[1].split(':')[0]);
                    $('#startMM').val(i.event.startStr.split('T')[1].split(':')[1]);
                	
                    $('#endHH').val(i.event.endStr.split('T')[1].split(':')[0]);
                    $('#endMM').val(i.event.endStr.split('T')[1].split(':')[1]);
                    
                	$('.timepicker').css('display','');
                }
                
                $('#sch_addEvt')[0].innerText = "수정하기";
            }
        });
        calendar.render();
    	
    	start();
    	loadBK();
    	
	    $('input.hh').timepicker({
            timeFormat: 'HH',
            interval: 1,
            startHour: '00',
            maxHour: '24',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });

        $('input.mm').timepicker({
            timeFormat: 'mm',
            interval: 1,
            startMinutes: '00',
            maxMinutes: '59',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });

        $('#sch_addEvt').on('click',function(){
            var title = $('#title').val();
            var start = $('#startDay').val()+'T'+$('#startHH').val()+':'+$('#startMM').val()+':00';
            var end = $('#endDay').val()+'T'+$('#endHH').val()+':'+$('#endMM').val()+':00';
            
            console.log($('#allDay').is(":checked"));
            
            if($('#sch_addEvt')[0].innerText == "수정하기"){
            	console.log("삭제:: ", title);
            	$.ajax({
                	type: "POST",
    				url : "./Calendar_Delete.do",
    				data: {
    					USERID: uid,
    					TEAM: tid,
    					TITLE: title
    				},
    				async: false,
    				success:function(data){
    					console.log('삭제가 완료되었습니다.');
    					document.getElementById(title).remove();
    				},
    				error: function(err){
    					console.log(err);
    				}
                });
            }
            
           	if($('#allDay').is(":checked")){				
           		$.ajax({
	        		type: "POST",
					url : "./Calendar_Insert.do",
					data: {
						USERID: uid,
						TEAM : tid,
						TITLE : title,
						DAY_FROM : start.split('T')[0],
						DAY_TO : end.split('T')[0],
						TIME_FROM :'00:00:00',
						TIME_TO : '12:00:00',
						ALLDAY : 'Y'
					},
					async: false,
					success:function(data){
						alert(JSON.parse(data).RESULTMSG);
						location.reload(true);
					},
					error:function(err){
						alert('등록이 실패했습니다.');
					}
	        	});
           		console.log(start, end);
            }else{            	
            	
            	console.log(start, end);
            	$.ajax({
	        		type: "POST",
					url : "./Calendar_Insert.do",
					data: {
						USERID: uid,
						TEAM : tid,
						TITLE : title,
						DAY_FROM : start.split('T')[0],
						DAY_TO : end.split('T')[0],
						TIME_FROM : start.split('T')[1],
						TIME_TO : end.split('T')[1],
						ALLDAY : 'N'
					},
					async: false,
					success:function(data){
						alert(JSON.parse(data).RESULTMSG);
						location.reload(true);
					},
					error:function(err){
						alert('등록이 실패했습니다.');
					}
	        	});
            }
            
            
            $(".close").click();
        });
        

        // 북마크
        $('.bk').on('click',function(){
            /* var url = $(this)[0].childNodes[1].value;
            slot = $(this)[0].classList[1];
            console.log(url);
			
            if(url != ''){ 
            	window.open(url, target="_blank");
            	// window.location.href = $(this)[0].childNodes[1].value;
            }else{                
                alert('등록된 사이트가 없습니다.');
            } */
            var url = $(this)[0].childNodes[1].value;
            slot = $(this)[0].classList[1];
			
            if(url != ''){ 
                window.location.href = $(this)[0].childNodes[1].value;
            }else{                
            	$(".modal2").css('display','block');
                $('.container').css('z-index',-1);
            }
        });
        
        $('.bk_add').on('click',function(){
        	/* if($('.bk').length < 10){
	        	$('.bk_add').before("<div class='bk slot"+$('.bk').length+"'><input type='text' class='bk_url hidden' value='' /><img src='' class='bk_fav'><p class='bk_name'></p></div>");
        	}else{
        		alert('슬롯을 더 이상 늘릴 수 없습니다.');
        	} */
        	console.log($('.bk').hasClass('hidden'));
        	for(var i = 0; i < $('.bk').length; i++){
        		console.log(i, $('.bk.slot'+i).hasClass('hidden'));
        		if($('.bk.slot'+i).hasClass('hidden')){
        			$('.bk.slot'+i).removeClass('hidden')
        			break
        		}
        	}
        });
        
        // 자주가는 사이트 등록
        $('#url_addEvt').on('click',function(){
        	var insertData = {
       			USERID: uid,
   				TEAM: '',
   				SLOT: slot.substr(slot.length-1, 1),
				URL: $('#bk_url').val(),
				BK_NAME: $('#bk_name').val()
			}

            $.ajax({
            	type: "POST",
				url : "./BK_INSERT.do",
				data: insertData,
				async: false,
				success:function(data){
					var result = JSON.parse(data);
					alert(result.RESULTMSG);
				},
				error: function(err){
					console.log(err);
				}
            });
            
            $(".close2").click();
            loadBK();
        });

        // 달성률 관련
        var semiCircle = new ProgressBar.SemiCircle(achievement, {
            strokeWidth: 6,
            color: '#FFEA82',
            trailColor: '#eee',
            trailWidth: 1,
            easing: 'easeInOut',
            duration: 1400,
            svgStyle: null,
            text: {
                value: '',
                alignToBottom: false
            },
            from: {color: '#FFEA82'},
            to: {color: '#ED6A5A'},

            // Set default step function for all animate calls
            step: function(state, semiCircle){
                semiCircle.path.setAttribute('stroke', state.color);
                var value = Math.round(semiCircle.value() * 100);

                if (value === 0) {
                    semiCircle.setText('0%');
                } else {
                    semiCircle.setText(value+'%');
                }

                semiCircle.text.style.color = state.color;
                
            }
        });
        semiCircle.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
        semiCircle.text.style.fontSize = '2rem';

        semiCircle.animate(0.5);
        
        $("#achievement").roundSlider({
        	radius: 80,
            width: 8,
            handleSize: "+16",
            handleShape: "dot",
            circleShape: "half-top",
            sliderType: "min-range",
            value: 65,
            tooltipFormat: function (e) {
            	return e.value + "%";
            }
		});
        
        function tooltipVal(args){
        	return args.value+"%";
        }
		
        $(".close").click(function(){
            $(".modal").css('display','none');
            $('.container').css('z-index',1);
            firstClick = "";
            dialog_reset();
        });
        
        $(".close2").click(function(){
            $(".modal2").css('display','none');
            $('.container').css('z-index',1);
            
            $('.bk_url').val('');
            $('.bk_name').val('');
        });
        
        $('.btn.ps').on('click',function(){
        	location.href = "../Individual.do";
        });
        
        $('.btn.cp').on('click',function(){
        	location.href = "../Company/main.do";
        });
        
        $('input[type=checkbox][name=allDay]').change(function() {
            if ($(this).is(':checked')) {
                // 종일 체크
                $('.timepicker').css('display','none');
                isAllDay = true;
            }
            else {
                // 종일 체크 해제
            	$('.timepicker').css('display','');
            	isAllDay = false;
            }
        });
        
        $('.btn_notice').on('click',function(){
        	$('.btn_notice').attr("src","../images/arrow_right.png");
        	
        	$('.notice_body').empty();
        	$('.notice_body').append("<div id='000'><h3>[전체] 공지사항</h3></div><div id='001'><h3>[디자인팀] 공지사항</h3></div><div id='002'><h3>[개발팀] 공지사항</h3></div>");
        	
        	$('#000').on('click',function(){
    			$('.btn_notice').attr("src","../images/arrow_left.png");
            	
            	$('.notice_body').empty();
            	$('.notice_body').append("<h3>[전체] 공지사항</h3><p>10월 02일(월)은 대체공휴일입니다.</p>");
            });
            
            $('#001').on('click',function(){
    			$('.btn_notice').attr("src","../images/arrow_left.png");
            	
            	$('.notice_body').empty();
            	$('.notice_body').append("<h3>[디자인팀] 공지사항</h3><p>디자인 시안 전달 양식이 변경되어 공지드립니다.</p>");
            });
            
            $('#002').on('click',function(){
    			$('.btn_notice').attr("src","../images/arrow_left.png");
            	
            	$('.notice_body').empty();
            	$('.notice_body').append("<h3>[개발팀] 공지사항</h3><p>어? 소리 금지</p>");
            });
        });
        
        
    });
        
    function deleteEvt(title){
    	if(confirm('해당 일정을 삭제하시겠습니까?')){
	    	document.getElementById(title).remove();
	    	
	    	var Evt = calendar.getEventById(title);
	    	Evt.remove();
	    	
	    	$.ajax({
            	type: "POST",
				url : "./Calendar_Delete.do",
				data: {
					USERID: uid,
					TEAM: tid,
					TITLE: title
				},
				async: false,
				success:function(data){
					alert('삭제가 완료되었습니다.');
				},
				error: function(err){
					console.log(err);
				}
            });
    	}else{
    		alert('삭제를 취소했습니다.');
    	}
    }
    
    function changeTeam(){
    	var teamSelect = document.getElementById("teamList");  
    	var selectValue = teamSelect.options[teamSelect.selectedIndex].value;  
    	
    	var frm = document.createElement("form");
    	frm.setAttribute("charset", "UTF-8");
    	frm.setAttribute("method", "POST");
    	frm.setAttribute("action", "./calendar.do");
    	
    	var hiddenField = document.createElement("input");
    	hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "team");
        hiddenField.setAttribute("value", selectValue);
        frm.appendChild(hiddenField);
        
        document.body.appendChild(frm);
        frm.submit();
    }

    function dialog_reset(){
    	$('#title').val('');
    	$('#startDay').val('');
    	$('#startHH').val('');
    	$('#startMM').val('');
    	
    	$('#endDay').val('');
    	$('#endHH').val('');
    	$('#endMM').val('');
    }
    
	function start(){
		$.ajax({
			type: "POST",
			url : "./TEAM_SELECT.do",
			data: {
				USER: uid
			},
			async: false,
			success:function(data){
				var result = JSON.parse(data);
				console.log(result);
				if(result.length > 0){
					for(var i = 0; i < result.length; i++){
						if(result[i].TEAM_ID == tid){
							$('#teamList').append("<option value='"+result[i].TEAM_ID+"' selected>"+result[i].TEAM_NAME+"</option>")
						}else{
							$('#teamList').append("<option value='"+result[i].TEAM_ID+"'>"+result[i].TEAM_NAME+"</option>")
						}
					}
				}
				
			},
			error:function(err){
				console.log(err);
			}
		});
		
		$.ajax({
    		type: "POST",
			url : "./Calendar_Select.do",
			data: {
				USERID: uid,
				TEAM: tid,
				MONTH: year+"-"+month
			},
			async: false,
			success:function(data){
				var result = JSON.parse(data);
				console.log(result);
				
				for(var i=0 ; i<result.length; i++){
					if(result[i].ALLDAY == 'N '){			            
						calendar.addEvent({ 
							id: result[i].TITLE,
							title: result[i].TITLE,
							start: result[i].DAY_FROM+"T"+result[i].TIME_FROM,
							end: result[i].DAY_TO+"T"+result[i].TIME_TO
						})
						
					}else if(result[i].ALLDAY == 'Y '){
						calendar.addEvent({ 
							id: result[i].TITLE,
							title: result[i].TITLE,
							start: result[i].DAY_FROM,
							end: result[i].DAY_TO,
							allDay: true
						})
					}
					$('.schedule_div').append('<div id="'+result[i].TITLE+'" class="schedule_item"><h3>'+result[i].TITLE+'</h3><button class="btn delete" onClick="deleteEvt(\''+result[i].TITLE+'\')"><img src="../images/delete.png" alt="#"></button></div>');
				}
			},
			error:function(err){
				console.log(err);
			}
    	});
	}
	
	function loadBK(){
		$.ajax({
        	type: "POST",
			url : "./BK_SEARCH.do",
			data: {
				USERID: uid,
				TEAM: ''
			},
			async: false,
			success:function(data){
				var result = JSON.parse(data);
				console.log(result);
				
				for(var i = 0; i < result.length; i++){
					if(i > 4){
						$('.bk.slot'+i).removeClass('hidden')
					}
					$('.bk_url')[result[i].SLOT].value = result[i].URL;
					$('.bk_fav')[result[i].SLOT].src = result[i].URL+'/favicon.ico';
					// $('.bk_name')[result[i].SLOT].innerText = result[i].BK_NAME;
					// https://dummyimage.com/16x16/a3a3a3/363636.png&text=X
				}
			},
			error: function(err){
				console.log(err);
			}
        });
	}
  </script>
</html>