
$(document).ready(function(){

/*
const option = document.querySelector('.option_pop');
document.querySelector('.option_div').onclick = function(){
    option.classList.toggle('active');
}
*/
dragopen()
	$(".creat").on('click',function(){
	var idx = 1;
	$('.to_do_board_con').each(function(){
		idx = Number($(this).attr('idx')) + 1 ;
	})
	var title = $("#TODO_ADD").val();
	if(title.length == 0){
		title = '제목없음'
	}
	var AddTODO = '';
	AddTODO += '<div class="to_do_board_con" idx="' + (String)(idx) + '">';
	AddTODO += '<div class="mosuri"></div>';
	AddTODO += '	<div class="board_con_header">';
	AddTODO += '		<h3 class="board_con_title">'+ title +'</h3>';
	AddTODO += '		<input type="hidden" class="board_con_update U_Title" value="'+title+'">' ;
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
	AddTODO += '		<h3 class="con_txt time_txt">00:00 A.M</h3>';
	AddTODO += '		<div class="cont_U_time" style="display:none;">';
	AddTODO += '			<input type="number" class="board_con_update U_Time_time" value="0" max="12" min="-1" oninput="handleOnInput(this, 2)"> : ';
	AddTODO += '			<input type="number" class="board_con_update U_Time_minute" value="0" max="60" min="-1" oninput="handleOnInput(this, 2)">';
	AddTODO += '			<select class="U_Time_AMPM">';
	AddTODO += '			<option value="AM">A.M</option>';
	AddTODO += '			<option value="PM">P.M</option></select>';
	AddTODO += '		</div>';
	AddTODO += '	</div>';
	AddTODO += '	<div class="con location_div">';
	AddTODO += '	<h3 class="location">';
	AddTODO += '		<img src="./images/individual/location.png" alt="location">';
	AddTODO += '	</h3>';
	AddTODO += '	<h3 class="con_txt location_txt">Location</h3>';
	AddTODO += '		<input type="hidden" class="board_con_update U_Location" value="Location">';
	AddTODO += '	</div>';
	AddTODO += '	<div class="con add_file_div">';
	AddTODO += '	<h3 class="add_file">';
	AddTODO += '	 <img src="./images/individual/add.png" alt="add_file">';
	AddTODO += '	 </h3>';
	AddTODO += '	<h3 class="con_txt add_file_txt">파일 없음</h3>';
	AddTODO += '	</div>';
	AddTODO += '</div>';
                                
   if($(".to_do_board_header > .to_do_board_con").length < 4){
		$(".to_do_board_header").append(AddTODO)
		dragopen()
		checkTodoNum()
   }                            
   else{
	   alert('윗칸에는 4개만 넣을수 있습니다.')
   }
                            
                        
	
	})
	
	
	$(".to_do_change").on("click",function(){
		$(".to_do").hide();
		$(".calendar").show();
		$("#side_calendar").hide();
		$("#side_calendar_section").hide();
		$("#side_todo").show();
		$("#side_todo_section").show();
	    $(".fc-next-button").trigger('click');
	    $(".fc-prev-button").trigger('click');
	})

	$(".calendar_change").on("click",function(){
		$(".to_do").show();
		$(".calendar").hide();
		$("#side_calendar").show();
		$("#side_calendar_section").show();
		$("#side_todo").hide();
		$("#side_todo_section").hide();
	})
	
	$(".plus").on("click",function(){
		$(".popup").show();
	})

	$(".popup_X").on("click",function(){
		$(".popup").hide();
	})
	$(".popup_Save").on("click",function(){
		$(".popup").hide();
		var idx = 1;
		$('.to_do_board_con').each(function(){
			idx = Number($(this).attr('idx')) + 1 ;
		})
		var title = $("#pop_TODO_Title").val();
		
		
		const time_b = ($(".pop_TODO_time").val() < 10) ? "0" + $(".pop_TODO_time").val()
		             : $(".pop_TODO_time").val();
	
		const minute = ($(".pop_TODO_minute").val() < 10) ? "0" + $(".pop_TODO_minute").val()
		             : $(".pop_TODO_minute").val();

		var time = time_b + ":" + minute + " " + $('.pop_TODO_Time_AMPM option:selected').text();
		
		var location = $("#pop_TODO_location").val();
		if(title.length == 0){
			title = '제목없음'
		}
		var AddTODO = '';
		AddTODO += '<div class="to_do_board_con" idx="' + (String)(idx) + '">';
		AddTODO += '<div class="mosuri"></div>';
		AddTODO += '	<div class="board_con_header">';
		AddTODO += '		<h3 class="board_con_title">'+ title +'</h3>';
		AddTODO += '		<input type="hidden" class="board_con_update U_Title" value="'+title+'">' ;
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
		AddTODO += '		<h3 class="con_txt time_txt">'+time+'</h3>';
		AddTODO += '		<div class="cont_U_time" style="display:none;">';
		AddTODO += '			<input type="number" class="board_con_update U_Time_time" value="'+Number($(".pop_TODO_time").val())+'" max="12" min="-1" oninput="handleOnInput(this, 2)"> : ';
		AddTODO += '			<input type="number" class="board_con_update U_Time_minute" value="'+Number($(".pop_TODO_minute").val())+'" max="60" min="-1" oninput="handleOnInput(this, 2)">';
		AddTODO += '			<select class="U_Time_AMPM">';
		if($('.pop_TODO_Time_AMPM').val() == "AM"){
			
		AddTODO += '			<option value="AM" selected>A.M</option>';
		AddTODO += '			<option value="PM">P.M</option>';
		}
		else{
		AddTODO += '			<option value="AM">A.M</option>';
		AddTODO += '			<option value="PM" selected>P.M</option>';
		}
		AddTODO += '			</select>'
		AddTODO += '		</div>';
		AddTODO += '	</div>';
		AddTODO += '	<div class="con location_div">';
		AddTODO += '	<h3 class="location">';
		AddTODO += '		<img src="./images/individual/location.png" alt="location">';
		AddTODO += '	</h3>';
		AddTODO += '	<h3 class="con_txt location_txt">'+location+'</h3>';
		AddTODO += '		<input type="hidden" class="board_con_update U_Location" value="'+location+'">';
		AddTODO += '	</div>';
		AddTODO += '	<div class="con add_file_div">';
		AddTODO += '	<h3 class="add_file">';
		AddTODO += '	 <img src="./images/individual/add.png" alt="add_file">';
		AddTODO += '	 </h3>';
		AddTODO += '	<h3 class="con_txt add_file_txt">파일 없음</h3>';
		AddTODO += '	</div>';
		AddTODO += '</div>';
	                                
	   if($(".to_do_board_header > .to_do_board_con").length < 4){
			$(".to_do_board_header").append(AddTODO)
			dragopen()
			checkTodoNum()
	   }                            
	   else{
		   alert('윗칸에는 4개만 넣을수 있습니다.')
	   }
     
	})
	
	$.ajax({
		data : null,
		type : "POST",
		url : "ListDays.do",
		async : false,
		success : function(data){
			var result = JSON.parse(data)
			console.log(result);
		}
	
	})
	
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
	
	const time = ($(parent).find('.U_Time_time').val() < 10) ? "0" + $(parent).find('.U_Time_time').val()
	             : $(parent).find('.U_Time_time').val();

	const minute = ($(parent).find('.U_Time_minute').val() < 10) ? "0" + $(parent).find('.U_Time_minute').val()
	             : $(parent).find('.U_Time_minute').val();
	const ampm = $(parent).find('.U_Time_AMPM option:selected').text();
	
	$(parent).find('.time_txt').text(time + ":" + minute + " " + ampm);
	
	
	$(parent).find('.location_txt').text($(parent).find('.U_Location').val());
	
	$(parent).find('.board_con_title').show();
	$(parent).find('.time_txt').show();
	$(parent).find('.location_txt').show();
	
	$(parent).find('.cont_U_time').hide();
	$(parent).find('.U_Title').attr('type','hidden');
	//$(parent).find('.U_Time').attr('type','hidden');
	$(parent).find('.U_Location').attr('type','hidden');
	$(this).removeClass('save')
	$(this).addClass('update')
	$(this).text('수정')
	
})

function dragopen() {
	$( '.to_do_board_con' ).draggable({
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
					alert("야이 쓰레기야!")
				}
				else{
					
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
						}
						else if($(element5[i]).hasClass("to_do_board_header") == true){
							draggrid = 1;
						}
					}
				}
					
					if(dragnum > 0 && draggrid > 0){
		 		         $(element5[3]).append($(this).attr("style",""))
					}
					else if (draggrid <= 0){
						$(thispr).append($(this).attr("style",""))
					}
					else if (dragnum <= 0){
						$(thispr).append($(this).attr("style",""))
					}
				
				checkTodoNum()
			}
	});
}

function handleOnInput(el, maxlength) {
  if(el.value.length > maxlength)  {
    el.value 
      = el.value.substr(0, maxlength);
	}
  if(el.className.indexOf('U_Time_time') > 0){
	if(el.value == 12){
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
		
		if($(parent).find('.U_Time_time').val() == 12){
			
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
	if(el.value == 12){
		
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
		
		if($('.pop_TODO_time').val() == 12){
			
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

function checkTodoNum() {
	$('.count_num').text($(".to_do_board_body > .to_do_board_con_grid > .to_do_board_con").length);
}
