
$(document).ready(function(){

	
	
	

	/*===============================================================================================*/
	/*=========================================기본 설정================================================*/
	/*===============================================================================================*/
	
	var today = new Date();
	var today_month = (today.getMonth() + 1 < 10) ? "0" + (String)(today.getMonth() + 1)
					  : (String)(today.getMonth() + 1);
	var today_day = (today.getDate() < 10) ? "0" + (String)(today.getDate())
			  : (String)(today.getDate());
	
	var today_date = today.getFullYear() + "-" + today_month + "-" + today_day;
	
	
	$("#todo_date").text(today_date);
	
	$("#pop_Calendar_FROM").datepicker(
			{
				changeMonth : true,
				changeYear : true,
				showMonthAfterYear : true,
				dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
			    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
			    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
				dateFormat : 'yy-mm-dd',
			});

	$("#pop_Calendar_TO").datepicker(
			{
				changeMonth : true,
				changeYear : true,
				showMonthAfterYear : true,
				dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
			    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
			    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
				dateFormat : 'yy-mm-dd',
			});
	dragopen();
	selectMiniTodo();	
	selectCharacter();
	
	
	/*===============================================================================================*/
	/*==========================================TODO=================================================*/
	/*===============================================================================================*/
	
	$(".creat").on('click',function(){
		var title = $("#TODO_ADD").val();
		if(title.length == 0){
			title = '제목없음'
		}
	                                
	   if($(".to_do_board_header > .to_do_board_con").length < 4){
		   
		   var insertdata = {
					COD_MEMB : "ehdgjs",
					TXT_TITLE : title,
					DAY_KEY : $("#todo_date").text() + " 00:00",
					LOCATION : "Location",
					COLOR : "",
					CHK_POINT : "None"
			}
			
			$.ajax({
				url: "Individual_Todo_Insert.do",
				data: insertdata,
				type: "POST",
				async: false,
				success: function(data){
					selectTodo()
					dragopen()
					checkTodoNum()
				}
				
			})
	   }                            
	   else{
		   alert('윗칸에는 4개만 넣을수 있습니다.')
	   }
	                            
	                        
		
		});
	
	$(".to_do_change").on("click",function(){
		$(".to_do").hide();
		$(".calendar").show();
		$("#side_calendar").hide();
		$("#side_calendar_section").hide();
		$("#side_todo").show();
		$("#side_todo_section").show();
	    $("#calendar").find(".fc-next-button").trigger('click');
	    $("#calendar").find(".fc-prev-button").trigger('click');
//	    $(".fc-next-button").trigger('click');
//	    $(".fc-prev-button").trigger('click');
	});
	
	
	$(".plus").on("click",function(){
		$("#todo_popup").show();
	});

	$(".popup_X").on("click",function(){
		$(".popup").hide();
	});
	
	
	$("#pop_TODO_save").on("click",function(){
		$(".popup").hide();
		var idx = 1;
		$(".to_do").find('.to_do_board_con').each(function(){
			idx = Number($(this).attr('idx')) + 1 ;
		})
		var title = $("#pop_TODO_Title").val();
		
		var times = $(".pop_TODO_time").val();
		if($('#pop_TODO_Time_AMPM').val() == 'AM'){
			times = $(".pop_TODO_time").val();
		}
		else{
			times = (String)(Number($(".pop_TODO_time").val()) + 12);
		};
	
		const time_b = (times < 10) ? "0" + times
		             : times;
	
		const minute = ($(".pop_TODO_minute").val() < 10) ? "0" + $(".pop_TODO_minute").val()
		             : $(".pop_TODO_minute").val();

		var time = time_b + ":" + minute
		
		var location = $("#pop_TODO_location").val();
		
		
		if(title.length == 0){
			title = '제목없음'
		}
	                                
	   if($(".to_do_board_header > .to_do_board_con").length < 4){
		   
		   var insertdata = {
					COD_MEMB : "ehdgjs",
					TXT_TITLE : title,
					DAY_KEY : $("#todo_date").text() + " " + time,
					LOCATION : location,
					COLOR : "",
					CHK_POINT : "None"
			}
			
			$.ajax({
				url: "Individual_Todo_Insert.do",
				data: insertdata,
				type: "POST",
				async: false,
				success: function(data){
					selectTodo()
					dragopen()
					checkTodoNum()
				}
				
			})
		   
	   }                            
	   else{
		   alert('윗칸에는 4개만 넣을수 있습니다.')
	   }
     
	});
	
	
	$(".trash").on("click",function(){
		console.log($(this).hasClass("notopen"))
		if($(".trash").hasClass("notopen") == false){
			$("#popup_trash").hide();
			$(".trash").addClass("notopen");
		}
		else{
			$("#popup_trash").show();
			$(this).removeClass("notopen");
			TrashTodo();
		}
	});
	
	/*===============================================================================================*/
	/*==========================================달력==================================================*/
	/*===============================================================================================*/
	
	$(".calendar_change").on("click",function(){
		$(".to_do").show();
		$(".calendar").hide();
		$("#side_calendar").show();
		$("#side_calendar_section").show();
		$("#side_todo").hide();
		$("#side_todo_section").hide();
	    $("#calendar_mini").find(".fc-next-button").trigger('click');
	    $("#calendar_mini").find(".fc-prev-button").trigger('click');
//	    $('#calendar_mini').find(".fc-daygrid-day.fc-day").on("click",function(){
//
//			const parent = $(this).parents('#calendar_mini');
//			
//			$("#calendar_mini").find(".fc-day").css("background","white");
//			$("#calendar_mini").find(".fc-day-today").css("background","var(--fc-today-bg-color,rgba(255,220,40,.15))");
//			
//			$(this).css("background","red");
//			$("#todo_date").text($(this).attr("data-date"));
//		    selectTodo();
//		})
	})
	
	$(".plus_c").on("click",function(){
//		$("#calendar > .fc-daygrid-day-frame.fc-scrollgrid-sync-inner").each(function(){
//			var text = $(this).find(".fc-daygrid-day-number").text();
//			conosle.log(text);
//		})

		$("#calendar_popup").show();
		popReset();
	})

	/*===============================================================================================*/
	/*==========================================캐릭터==================================================*/
	/*===============================================================================================*/
	

	
	
	
	/*===============================================================================================*/
	/*==========================================기타==================================================*/
	/*===============================================================================================*/
	
	
	
	$(".tab.company").on("click",function(){
		location.href = "company/main.do"
	})
	
	
//document.querySelector("body").addEventListener("click", function(e) {
//	if($("#popup_trash").css("display") != "none"){
//		console.log(e,e.target)
//		if(e.target.className != e.currentTarget.querySelector("#popup_trash").className) {
//			$("#popup_trash").hide();
//	    }
//	}
//})
	
}); //documet 끝



//TO-DO 스케쥴 추가할때마다 함수 재설정 

$(document).on('click','.option_div',function(){
	$(this).children('.option_pop').toggleClass('active'); 
}) 
$(document).on('click','.option_list.update',function(){
	const parent = $(this).parents('.to_do_board_con');
	$(parent).find('.board_con_title').hide();
	$(parent).find('.time_txt').hide();
	$(parent).find('.location_txt').hide();
	$(parent).find('.cont_U_time').show();
	$(parent).find('.U_Title').attr('type','text');
	//$(parent).find('.U_Time').attr('type','text');
	$(parent).find('.U_Location').attr('type','text');
	$(this).removeClass('update')
	$(this).addClass('save')
	$(this).text('저장')
	
})

$(document).on('click','.option_list.save',function(){
	const parent = $(this).parents('.to_do_board_con');
	
	$(parent).find('.board_con_title').text($(parent).find('.U_Title').val());
	
	const idx = $(parent).attr("idx");
	var time = ($(parent).find('.U_Time_time').val() < 10) ? "0" + $(parent).find('.U_Time_time').val()
	             : $(parent).find('.U_Time_time').val();

	const minute = ($(parent).find('.U_Time_minute').val() < 10) ? "0" + $(parent).find('.U_Time_minute').val()
	             : $(parent).find('.U_Time_minute').val();
	const ampm = $(parent).find('.U_Time_AMPM option:selected').text();

	
	const title = $(parent).find('.U_Title').val();
	const location = $(parent).find('.U_Location').val();
	
	if(ampm == 'P.M'){
		time = (Number(time) + 12);
	}
	
	
	 var insertdata = {
				COD_MEMB : "ehdgjs",
				IDX_SORT : idx,
				TXT_TITLE : title,
				DAY_KEY : $("#todo_date").text() + " " + time + ":" + minute,
				LOCATION : location,
				COLOR : "",
				CHK_POINT : ""
		}
		
		$.ajax({
			url: "Individual_Todo_Update.do",
			data: insertdata,
			type: "POST",
			async: false,
			success: function(data){
				selectTodo();
				dragopen();
				checkTodoNum();
			}
			
		})
		
//	$(parent).find('.time_txt').text(time + ":" + minute + " " + ampm);
//	
//	
//	$(parent).find('.location_txt').text($(parent).find('.U_Location').val());
//	
//	$(parent).find('.board_con_title').show();
//	$(parent).find('.time_txt').show();
//	$(parent).find('.location_txt').show();
//	
//	$(parent).find('.cont_U_time').hide();
//	$(parent).find('.U_Title').attr('type','hidden');
//	//$(parent).find('.U_Time').attr('type','hidden');
//	$(parent).find('.U_Location').attr('type','hidden');
//	$(this).removeClass('save');
//	$(this).addClass('update');
//	$(this).text('수정');
	
})

function dragopen() {
	$( '.to_do').find('.to_do_board_con').draggable({
		scroll : false,
		containment : '.to_do', //부모 요소 안에서만 이동 범위 제한
//			snap: '.div',
// 		 snapMode: "inner",
			  snapTolerance: 50,
			stop: function (event, ui) {
				var idx = $(this).attr("idx");
		        var left = $(this).css("left");
		        var top = $(this).css("top");
		        var x = $(this).offset().left;
		        var y = $(this).offset().top;
		        var delx = $(this).find('.mosuri').offset().left;
		        var dely = $(this).find('.mosuri').offset().top;
		        var delx2 = $('.trash').offset().left;
		        var dely2 = $('.trash').offset().top;
				const thispr = $(this).parent();
		        const element = document.elementsFromPoint(x, y);
		        const element5 = document.elementsFromPoint(x+50, y+30);    
				
		        const elementdel = document.elementsFromPoint(delx, dely);

//				console.log(delx,dely,delx2,dely2,elementdel)

				var dragnum = 0;
				var draggrid = 0;
				var dragTrash = 0;
				
				if(delx > delx2 - 22 && dely < dely2 + 30){


					 var insertdata = {
								COD_MEMB : "ehdgjs",
								IDX_SORT : idx
						};
						console.log(insertdata)
						$.ajax({
							url: "Individual_Todo_Trash_Insert.do",
							data: insertdata,
							type: "POST",
							async: false,
							success: function(data){
								selectTodo();
								dragopen();
								checkTodoNum();
							}
							
						})
					
				}
				else{
					var chkd = "H";
					for(let i=0; i<element5.length; i++){
						
						if($(element5[i]).hasClass("to_do_board_con") == true && dragnum == 0){
							dragnum = 1;
						}
						else if($(element5[i]).hasClass("to_do_board_con") == true && dragnum > 0){
			  		      dragnum = 0
			  		      break;
						}
	
						if($(element5[i]).hasClass("to_do_board_con_grid") == true){
							draggrid = 1;
							chkd = "G"
						}
						else if($(element5[i]).hasClass("to_do_board_header") == true){
							draggrid = 1;
							chkd = "H"
						}
					}
					

					if(dragnum > 0 && draggrid > 0){
						 var insertdata = {
								 
						 }
						if(chkd == "H"){
							insertdata = {
										COD_MEMB : "ehdgjs",
										IDX_SORT : idx,
										DAY_KEY : $("#todo_date").text(),
										CHK_POINT : 'None'
								}
						}
						else if(chkd == "G"){
							 insertdata = {
										COD_MEMB : "ehdgjs",
										IDX_SORT : idx,
										DAY_KEY : $("#todo_date").text(),
										CHK_POINT : $(element5[3]).attr("idx")
								}
						}
							
							$.ajax({
								url: "Individual_Todo_Move_Update.do",
								data: insertdata,
								type: "POST",
								async: false,
								success: function(data){
									selectTodo()
									dragopen()
									checkTodoNum()
								}
								
							})
					}
					else if (draggrid <= 0){
						$(thispr).append($(this).attr("style",""))
					}
					else if (dragnum <= 0){
						$(thispr).append($(this).attr("style",""))
					}
				
				checkTodoNum()
				}
					
			}
	});
}

function handleOnInput(el, maxlength) {
  if(el.value.length > maxlength)  {
    el.value 
      = el.value.substr(0, maxlength);
	}
  if(el.className.indexOf('U_Time_time') > 0){
	if(el.value >= 12){
		const parent = $(el).parents('.to_do_board_con');
		
		$(el).val(0)
		if($(parent).find('.U_Time_AMPM').val() == 'AM'){
			$(parent).find('.U_Time_AMPM').val("PM")
		}
		else{
			$(parent).find('.U_Time_AMPM').val("AM")
		}
		
		
	}
	else if(el.value == -1){
		const parent = $(el).parents('.to_do_board_con');
		
		$(el).val(11)
		if($(parent).find('.U_Time_AMPM').val() == 'AM'){
			$(parent).find('.U_Time_AMPM').val("PM")
		}
		else{
			$(parent).find('.U_Time_AMPM').val("AM")
		}
		
		
	}
  }
  else if(el.className.indexOf('U_Time_minute') > 0){
	if(el.value == 60){
		const parent = $(el).parents('.to_do_board_con');
		if($(parent).find('.U_Time_time').val() < 12){
			
			$(parent).find('.U_Time_time').val(Number($(parent).find('.U_Time_time').val()) + 1)
			$(el).val(0)
		}
		
		if($(parent).find('.U_Time_time').val() >= 12){
			
			$(parent).find('.U_Time_time').val(0)
			if($(parent).find('.U_Time_AMPM').val() == 'AM'){
				$(parent).find('.U_Time_AMPM').val("PM")
			}
			else{
				$(parent).find('.U_Time_AMPM').val("AM")
			}
		}
	}
	else if(el.value == -1){
		const parent = $(el).parents('.to_do_board_con');
		if($(parent).find('.U_Time_time').val() > -1){
			
			$(parent).find('.U_Time_time').val(Number($(parent).find('.U_Time_time').val()) - 1)
			$(el).val(59)
		}
		
		if($(parent).find('.U_Time_time').val() == -1){
			
			$(parent).find('.U_Time_time').val(11)
			if($(parent).find('.U_Time_AMPM').val() == 'AM'){
				$(parent).find('.U_Time_AMPM').val("PM")
			}
			else{
				$(parent).find('.U_Time_AMPM').val("AM")
			}
		}
	}
  }
}


function handleOnInput2(el, maxlength) {
  if(el.value.length > maxlength)  {
    el.value 
      = el.value.substr(0, maxlength);
	}
  if(el.className.indexOf('pop_TODO_time') >= 0){
	if(el.value >= 12){
		
		$(el).val(0)
		if($('.pop_TODO_Time_AMPM').val() == 'AM'){
			$('.pop_TODO_Time_AMPM').val("PM")
		}
		else{
			$('.pop_TODO_Time_AMPM').val("AM")
		}
		
		
	}
	else if(el.value == -1){
		
		$(el).val(11)
		if($('.pop_TODO_Time_AMPM').val() == 'AM'){
			$('.pop_TODO_Time_AMPM').val("PM")
		}
		else{
			$('.pop_TODO_Time_AMPM').val("AM")
		}
		
		
	}
  }
  else if(el.className.indexOf('pop_TODO_minute') >= 0){
	if(el.value == 60){
		if($('.pop_TODO_time').val() < 12){
			
			$('.pop_TODO_time').val(Number($('.pop_TODO_time').val()) + 1)
			$(el).val(0)
		}
		
		if($('.pop_TODO_time').val() >= 12){
			
			$('.pop_TODO_time').val(0)
			$(el).val(0)
			if($('.pop_TODO_Time_AMPM').val() == 'AM'){
				$('.pop_TODO_Time_AMPM').val("PM")
			}
			else{
				$('.pop_TODO_Time_AMPM').val("AM")
			}
		}
	}
	else if(el.value == -1){
		if($('.pop_TODO_time').val() > -1){
			
			$('.pop_TODO_time').val(Number($('.pop_TODO_time').val()) - 1)
			$(el).val(59)
		}
		
		if($('.pop_TODO_time').val() == -1){
			
			$('.pop_TODO_time').val(11)
			$(el).val(59)
			if($('.pop_TODO_Time_AMPM').val() == 'AM'){
				$('.pop_TODO_Time_AMPM').val("PM")
			}
			else{
				$('.pop_TODO_Time_AMPM').val("AM")
			}
		}
	}
  }
}

function handleOnInput3(el, maxlength) {
	  if(el.value.length > maxlength)  {
	    el.value 
	      = el.value.substr(0, maxlength);
		}
	  if(el.id.indexOf('pop_Calendar_time') >= 0){
		if(el.value >= 12){
			
			$(el).val(0)
			
			
			if($('#pop_Calendar_Time_AMPM').val() == 'AM'){
				$('#pop_Calendar_Time_AMPM').val("PM")
			}
			else{
				$('#pop_Calendar_Time_AMPM').val("AM")
			}
			
			
		}
		else if(el.value == -1){
			
			$(el).val(11)
			if($('#pop_Calendar_Time_AMPM').val() == 'AM'){
				$('#pop_Calendar_Time_AMPM').val("PM")
			}
			else{
				$('#pop_Calendar_Time_AMPM').val("AM")
			}
			
			
		}
	  }
	  else if(el.id.indexOf('pop_Calendar_minute') >= 0){
		if(el.value == 60){
			if($('#pop_Calendar_time').val() < 12){
				
				$('#pop_Calendar_time').val(Number($('#pop_Calendar_time').val()) + 1)
				$(el).val(0)
			}
			
			if($('#pop_Calendar_time').val() >= 12){
				
				$('#pop_Calendar_time').val(0)
				$(el).val(0)
				if($('#pop_Calendar_Time_AMPM').val() == 'AM'){
					$('#pop_Calendar_Time_AMPM').val("PM")
				}
				else{
					$('#pop_Calendar_Time_AMPM').val("AM")
				}
			}
		}
		else if(el.value == -1){
			if($('#pop_Calendar_time').val() > -1){
				
				$('#pop_Calendar_time').val(Number($('#pop_Calendar_time').val()) - 1)
				$(el).val(59)
			}
			
			if($('#pop_Calendar_time').val() == -1){
				
				$('#pop_Calendar_time').val(11)
				$(el).val(59)
				if($('#pop_Calendar_Time_AMPM').val() == 'AM'){
					$('#pop_Calendar_Time_AMPM').val("PM")
				}
				else{
					$('#pop_Calendar_Time_AMPM').val("AM")
				}
			}
		}
	  }
	}

function handleOnInput4(el, maxlength) {
	  if(el.value.length > maxlength)  {
	    el.value 
	      = el.value.substr(0, maxlength);
		}
	  
	  
	  if(el.id.indexOf('pop_Calendar2_time') >= 0){
		if(el.value >= 12){

			$(el).val(0)
			if($('#pop_Calendar2_Time_AMPM').val() == 'AM'){
				$('#pop_Calendar2_Time_AMPM').val("PM")
			}
			else{
				$('#pop_Calendar2_Time_AMPM').val("AM")
			}
			
			
		}
		else if(el.value == -1){
			
			$(el).val(11)
			if($('#pop_Calendar2_Time_AMPM').val() == 'AM'){
				$('#pop_Calendar2_Time_AMPM').val("PM")
			}
			else{
				$('#pop_Calendar2_Time_AMPM').val("AM")
			}
			
			
		}
	  }
	  else if(el.id.indexOf('pop_Calendar2_minute') >= 0){
		if(el.value == 60){
			if($('#pop_Calendar2_time').val() < 12){
				
				$('#pop_Calendar2_time').val(Number($('#pop_Calendar2_time').val()) + 1)
				$(el).val(0)
			}
			
			if($('#pop_Calendar2_time').val() >= 12){
				
				$('#pop_Calendar2_time').val(0)
				$(el).val(0)
				if($('#pop_Calendar2_Time_AMPM').val() == 'AM'){
					$('#pop_Calendar2_Time_AMPM').val("PM")
				}
				else{
					$('#pop_Calendar2_Time_AMPM').val("AM")
				}
			}
		}
		else if(el.value == -1){
			if($('#pop_Calendar2_time').val() > -1){
				
				$('#pop_Calendar2_time').val(Number($('#pop_Calendar2_time').val()) - 1)
				$(el).val(59)
			}
			
			if($('#pop_Calendar2_time').val() == -1){
				
				$('#pop_Calendar2_time').val(11)
				$(el).val(59)
				if($('#pop_Calendar2_Time_AMPM').val() == 'AM'){
					$('#pop_Calendar2_Time_AMPM').val("PM")
				}
				else{
					$('#pop_Calendar2_Time_AMPM').val("AM")
				}
			}
		}
	  }
	}

function selectTodo(){
	
	 var selectdata = {
				COD_MEMB : "ehdgjs",
				DAY_KEY : $("#todo_date").text(),
				GUBUN : 'S'
		};
	 $('.to_do').find(".to_do_board_con").remove();
	 
		$.ajax({
			url: "ListTodo.do",
			data: selectdata,
			type: "POST",
			async: false,
			success: function(data){			
				
				var result = JSON.parse(data);
				
				
				for(var i=0 ; i<result.length; i++){
					var date = (result[i].DAY_KEY).split(" ")
					
					var time = date[1].split(":");
					
					if(time[0] >= 12){
						if(time[0] - 12 < 10){
							time[0] = "0" + (String)(Number(time[0]) - 12);
						}
						else{
							time[0] = (String)(Number(time[0]) - 12);
						}
						time.push("PM");
						time.push("P.M");
					}
					else{
						time.push("AM");
						time.push("A.M");
					}
					
					var NowTime = time[0] + ":" + time[1] + " " + time[3]
					
					var AddTODO = '';
					AddTODO += '<div class="to_do_board_con" idx="' + result[i].IDX_SORT + '">';
					AddTODO += '<div class="mosuri"></div>';
					AddTODO += '	<div class="board_con_header">';
					AddTODO += '		<h3 class="board_con_title">'+ result[i].TXT_TITLE +'</h3>';
					AddTODO += '		<input type="hidden" class="board_con_update U_Title" value="'+result[i].TXT_TITLE+'">' ;
					AddTODO += '		<div class="option_div">';
					AddTODO += '			<h3 class="option">';
					AddTODO += '				<img src="./images/individual/mitball.png" alt="option">';
					AddTODO += '			</h3>';
					AddTODO += '			<div class="option_pop">';
					AddTODO += '				<h3 class="option_list update">수정</h3>';
					AddTODO += '				<h3 class="option_list">파일첨부</h3>';
					AddTODO += '				<h3 class="option_list">파일삭제</h3>';
					AddTODO += '			</div>';
					AddTODO += '		</div>';
					AddTODO += '	</div>';
					AddTODO += ' 	<div class="con time_div">';
					AddTODO += '		<h3 class="time">';
					AddTODO += ' 			<img src="./images/individual/time.png" alt="time">';
					AddTODO += '		</h3>';
					AddTODO += '		<h3 class="con_txt time_txt">'+ NowTime +'</h3>';
					AddTODO += '		<div class="cont_U_time" style="display:none;">';
					AddTODO += '			<input type="number" class="board_con_update U_Time_time" value="'+(String)(Number(time[0]))+'" max="12" min="-1" oninput="handleOnInput(this, 2)"> : ';
					AddTODO += '			<input type="number" class="board_con_update U_Time_minute" value="'+(String)(Number(time[1]))+'" max="60" min="-1" oninput="handleOnInput(this, 2)">';
					AddTODO += '			<select class="U_Time_AMPM">';
					if(time[2] == "AM"){
						AddTODO += '			<option value="AM" selected>A.M</option>';
						AddTODO += '			<option value="PM">P.M</option>';
					}
					else{
						AddTODO += '			<option value="AM">A.M</option>';
						AddTODO += '			<option value="PM" selected>P.M</option>';
					}
					AddTODO += '			</select>';
					AddTODO += '		</div>';
					AddTODO += '	</div>';
					AddTODO += '	<div class="con location_div">';
					AddTODO += '	<h3 class="location">';
					AddTODO += '		<img src="./images/individual/location.png" alt="location">';
					AddTODO += '	</h3>';
					AddTODO += '	<h3 class="con_txt location_txt">'+result[i].LOCATION+'</h3>';
					AddTODO += '		<input type="hidden" class="board_con_update U_Location" value="'+result[i].LOCATION+'">';
					AddTODO += '	</div>';
					AddTODO += '	<div class="con add_file_div">';
					AddTODO += '	<h3 class="add_file">';
					AddTODO += '	 <img src="./images/individual/add.png" alt="add_file">';
					AddTODO += '	 </h3>';
					AddTODO += '	<h3 class="con_txt add_file_txt">파일 없음</h3>';
					AddTODO += '	</div>';
					AddTODO += '</div>';
				                                
					if(result[i].CHK_POINT != 'None'){

						$(".to_do_board_con_grid").each(function(){
							if($(this).attr("idx") == result[i].CHK_POINT){
								$(this).append(AddTODO);
								
								return false;
							}
						})
					}
					else{
						$(".to_do_board_header").append(AddTODO);
					}
					
				}
				dragopen()
				checkTodoNum()
			    selectMiniTodo();
				TrashTodo();
			}
		})
	
}
function TrashTodo(){
	
	 var selectdata = {
				COD_MEMB : "ehdgjs",
				DAY_KEY : $("#todo_date").text()
		};
	 	$(".pop_dialog_trash").empty();
	 
		$.ajax({
			url: "ListTodo_Trash.do",
			data: selectdata,
			type: "POST",
			async: false,
			success: function(data){			
				
				var result = JSON.parse(data);
								
				for(var i=0 ; i<result.length; i++){
					var date = (result[i].DAY_KEY).split(" ");
					
					var time = date[1].split(":");
					
					if(time[0] >= 12){
						if(time[0] - 12 < 10){
							time[0] = "0" + (String)(Number(time[0]) - 12);
						}
						else{
							time[0] = (String)(Number(time[0]) - 12);
						}
						time.push("PM");
						time.push("P.M");
					}
					else{
						time.push("AM");
						time.push("A.M");
					}
					
					var NowTime = time[0] + ":" + time[1] + " " + time[3]
					
					var AddTODO = '';
					AddTODO += '<div class="to_do_board_con" idx="' + result[i].IDX_SORT + '">';
					AddTODO += '<div class="mosuri"></div>';
					AddTODO += '	<div class="board_con_header">';
					AddTODO += '		<h3 class="board_con_title">'+ result[i].TXT_TITLE +'</h3>';
					AddTODO += '		<input type="hidden" class="board_con_update U_Title" value="'+result[i].TXT_TITLE+'">' ;
					AddTODO += '		<div class="option_div">';
					AddTODO += '			<h3 class="option">';
					AddTODO += '				<img src="./images/individual/mitball.png" alt="option">';
					AddTODO += '			</h3>';
					AddTODO += '			<div class="option_pop">';
					AddTODO += '				<h3 class="option_list update">수정</h3>';
					AddTODO += '				<h3 class="option_list">파일첨부</h3>';
					AddTODO += '				<h3 class="option_list">파일삭제</h3>';
					AddTODO += '			</div>';
					AddTODO += '		</div>';
					AddTODO += '	</div>';
					AddTODO += ' 	<div class="con time_div">';
					AddTODO += '		<h3 class="time">';
					AddTODO += ' 			<img src="./images/individual/time.png" alt="time">';
					AddTODO += '		</h3>';
					AddTODO += '		<h3 class="con_txt time_txt">'+ NowTime +'</h3>';
					AddTODO += '		<div class="cont_U_time" style="display:none;">';
					AddTODO += '			<input type="number" class="board_con_update U_Time_time" value="'+(String)(Number(time[0]))+'" max="12" min="-1" oninput="handleOnInput(this, 2)"> : ';
					AddTODO += '			<input type="number" class="board_con_update U_Time_minute" value="'+(String)(Number(time[1]))+'" max="60" min="-1" oninput="handleOnInput(this, 2)">';
					AddTODO += '			<select class="U_Time_AMPM">';
					if(time[2] == "AM"){
						AddTODO += '			<option value="AM" selected>A.M</option>';
						AddTODO += '			<option value="PM">P.M</option>';
					}
					else{
						AddTODO += '			<option value="AM">A.M</option>';
						AddTODO += '			<option value="PM" selected>P.M</option>';
					}
					AddTODO += '			</select>';
					AddTODO += '		</div>';
					AddTODO += '	</div>';
					AddTODO += '	<div class="con location_div">';
					AddTODO += '	<h3 class="location">';
					AddTODO += '		<img src="./images/individual/location.png" alt="location">';
					AddTODO += '	</h3>';
					AddTODO += '	<h3 class="con_txt location_txt">'+result[i].LOCATION+'</h3>';
					AddTODO += '		<input type="hidden" class="board_con_update U_Location" value="'+result[i].LOCATION+'">';
					AddTODO += '	</div>';
					AddTODO += '	<div class="con add_file_div">';
					AddTODO += '	<h3 class="add_file">';
					AddTODO += '	 <img src="./images/individual/add.png" alt="add_file">';
					AddTODO += '	 </h3>';
					AddTODO += '	<h3 class="con_txt add_file_txt">파일 없음</h3>';
					AddTODO += '	</div>';
					AddTODO += '</div>';
				                                
					$(".pop_dialog_trash").append(AddTODO);

					
				}
			}
		})
	
}
function selectMiniTodo(){
	
	 var selectdata = {
				COD_MEMB : "ehdgjs",
				DAY_KEY : $("#todo_date").text(),
				GUBUN : 'M'
		};
	 	$("#side_todo_section > .to_do_board_con").remove();
	 
		$.ajax({
			url: "ListTodo.do",
			data: selectdata,
			type: "POST",
			async: false,
			success: function(data){			
				
				var result = JSON.parse(data);
				
				console.log(result);
				
				for(var i=0 ; i<result.length; i++){
					var date = (result[i].DAY_KEY).split(" ")
					
					var time = date[1].split(":");
					
					if(time[0] >= 12){
						if(time[0] - 12 < 10){
							time[0] = "0" + (String)(Number(time[0]) - 12);
						}
						else{
							time[0] = (String)(Number(time[0]) - 12);
						}
						time.push("PM");
						time.push("P.M");
					}
					else{
						time.push("AM");
						time.push("A.M");
					}
					
					var NowTime = time[0] + ":" + time[1] + " " + time[3]
					
					var AddTODO = '';
					AddTODO += '<div class="to_do_board_con" idx="' + result[i].IDX_SORT + '">';
					AddTODO += '<div class="mosuri"></div>';
					AddTODO += '	<div class="board_con_header">';
					AddTODO += '		<h3 class="board_con_title">'+ result[i].TXT_TITLE +'</h3>';
					AddTODO += '		<input type="hidden" class="board_con_update U_Title" value="'+result[i].TXT_TITLE+'">' ;
					AddTODO += '		<div class="option_div">';
					AddTODO += '			<h3 class="option">';
					AddTODO += '				<img src="./images/individual/mitball.png" alt="option">';
					AddTODO += '			</h3>';
					AddTODO += '			<div class="option_pop">';
					AddTODO += '				<h3 class="option_list update">수정</h3>';
					AddTODO += '				<h3 class="option_list">파일첨부</h3>';
					AddTODO += '				<h3 class="option_list">파일삭제</h3>';
					AddTODO += '			</div>';
					AddTODO += '		</div>';
					AddTODO += '	</div>';
					AddTODO += ' 	<div class="con time_div">';
					AddTODO += '		<h3 class="time">';
					AddTODO += ' 			<img src="./images/individual/time.png" alt="time">';
					AddTODO += '		</h3>';
					AddTODO += '		<h3 class="con_txt time_txt">'+ NowTime +'</h3>';
					AddTODO += '		<div class="cont_U_time" style="display:none;">';
					AddTODO += '			<input type="number" class="board_con_update U_Time_time" value="'+(String)(Number(time[0]))+'" max="12" min="-1" oninput="handleOnInput(this, 2)"> : ';
					AddTODO += '			<input type="number" class="board_con_update U_Time_minute" value="'+(String)(Number(time[1]))+'" max="60" min="-1" oninput="handleOnInput(this, 2)">';
					AddTODO += '			<select class="U_Time_AMPM">';
					if(time[2] == "AM"){
						AddTODO += '			<option value="AM" selected>A.M</option>';
						AddTODO += '			<option value="PM">P.M</option>';
					}
					else{
						AddTODO += '			<option value="AM">A.M</option>';
						AddTODO += '			<option value="PM" selected>P.M</option>';
					}
					AddTODO += '			</select>';
					AddTODO += '		</div>';
					AddTODO += '	</div>';
					AddTODO += '	<div class="con location_div">';
					AddTODO += '	<h3 class="location">';
					AddTODO += '		<img src="./images/individual/location.png" alt="location">';
					AddTODO += '	</h3>';
					AddTODO += '	<h3 class="con_txt location_txt">'+result[i].LOCATION+'</h3>';
					AddTODO += '		<input type="hidden" class="board_con_update U_Location" value="'+result[i].LOCATION+'">';
					AddTODO += '	</div>';
					AddTODO += '	<div class="con add_file_div">';
					AddTODO += '	<h3 class="add_file">';
					AddTODO += '	 <img src="./images/individual/add.png" alt="add_file">';
					AddTODO += '	 </h3>';
					AddTODO += '	<h3 class="con_txt add_file_txt">파일 없음</h3>';
					AddTODO += '	</div>';
					AddTODO += '</div>';
				    
					$("#side_todo_section").append(AddTODO);
					
				}
				checkTodoNum2()
			}
		})
	
}

function selectCharacter(){
	 var selectdata = {
				COD_MEMB : "ehdgjs"
		};
	 
		$.ajax({
			url: "ListCharacter.do",
			data: selectdata,
			type: "POST",
			async: false,
			success: function(data){		
				var result = JSON.parse(data);
				
				$(".now_level").text(result.LEVEL)
				$(".next_level").text(Number(result.LEVEL) + 1)
				$("#character_exp").val(result.MIN_EXP)
			}
		})
}

function checkTodoNum() {
	$('.count_num').text($(".to_do_board_body > .to_do_board_con_grid > .to_do_board_con").length);
}

function checkTodoNum2() {
	$('.count_num').text($("#side_todo_section > .to_do_board_con").length);
}

function popReset(){
	$("#pop_Calendar_Title").val("");
	$("#pop_IDX_SORT").val("");
	$("#pop_Calendar_FROM").val("");
	$("#pop_Calendar_TO").val("");
	$("#pop_Calendar_time").val(0);
	$("#pop_Calendar_minute").val(0);
	$("#pop_Calendar_Time_AMPM").val("AM");
	$("#pop_Calendar2_time").val(0);
	$("#pop_Calendar2_minute").val(0);
	$("#pop_Calendar2_Time_AMPM").val("AM");
	$("#pop_Calendar_Color").val("#ff4e43")
	$(".pop_input > .clr-field").css("color","#ff4e43")

	$("#pop_Calendar_update").hide();
	$("#pop_Calendar_save").show();
}
