
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
    selectTodo();
	
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

	insertTodayMission(selectMission);
	
	/*===============================================================================================*/
	/*==========================================TODO=================================================*/
	/*===============================================================================================*/
	
	$(".creat").on('click',function(){
		var title = $("#TODO_ADD").val();
		if(title.length == 0){
			title = '제목없음'
		}
	                                
	   if($(".to_do_board_header > .to_do_board_con").length < 4){
		   
		   

		 	var form = new FormData();
		 
		 	form.append("COD_MEMB",uid);
		 	form.append("TXT_TITLE",title);
		 	form.append("DAY_KEY",$("#todo_date").text() + " 00:00");
		 	form.append("LOCATION","Location");
		 	form.append("COLOR","");
		 	form.append("CHK_POINT","None");
		 	form.append("uploadFile",null);
		 	
		 	
		   var insertdata = {
					COD_MEMB : uid,
					TXT_TITLE : title,
					DAY_KEY : $("#todo_date").text() + " 00:00",
					LOCATION : "Location",
					COLOR : "",
					CHK_POINT : "None",
					uploadFile : null
			}
			
			$.ajax({
				url: "Individual_Todo_Insert.do",
				data: form,
				type: "POST",
				async: false,
				processData : false,
				contentType : false,
				success: function(data){
					selectTodo()
					dragopen()
					checkTodoNum()
				}
				
			})
	   }                            
	   else{
		   popup_alert.alerts('윗칸에는 4개만 넣을수 있습니다.')
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
					COD_MEMB : uid,
					TXT_TITLE : title,
					DAY_KEY : $("#todo_date").text() + " " + time,
					LOCATION : location,
					COLOR : "",
					CHK_POINT : "None"
			}

		 	var form = new FormData();
		 
		 	form.append("COD_MEMB",uid);
		 	form.append("TXT_TITLE",title);
		 	form.append("DAY_KEY",$("#todo_date").text() + " " + time);
		 	form.append("LOCATION",location);
		 	form.append("COLOR","");
		 	form.append("CHK_POINT","None");
		 	form.append("uploadFile",$("#pop_TODO_file")[0].files[0]);
		 	
			
			$.ajax({
				url: "Individual_Todo_Insert.do",
				data: form,
				type: "POST",
				async: false,
				processData : false,
				contentType : false,
				success: function(data){
					selectTodo()
					dragopen()
					checkTodoNum()
				}
				
			})
		   
	   }                            
	   else{
		   popup_alert.alerts('윗칸에는 4개만 넣을수 있습니다.')
	   }
     
	});
	
	
	$(".trash").on("click",function(){
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
	

	
	$("#mission").on("click",function(){
		if($(".mission_pop").css("display") == "none"){
			$(".mission_pop").show();	
		
		
		
		}else{
			$(".mission_pop").hide();
		}
		
	});
	
	$("#mission_update").on("click",function(){

		if($(".mission_pop_div_update").css("display") == "none"){
			$(".mission_pop_div_update").show();	
			$("#mission_add").show();	
			$(".mission_pop_div").hide();	
			$("#Mission_save").show();	
			$("#mission_update").text("편집 취소");
		
		}else{
			$(".mission_pop_div_update").hide();	
			$("#mission_add").hide();	
			$(".mission_pop_div").show();
			$("#Mission_save").hide();	
			$("#mission_update").text("미션 편집");
		}
		
		
	});
	$("#mission_add").on("click",function(){


		var addString2 = "";
			addString2 += '<div class="mission_div">';
			addString2 += '<input class="Mission_input" value="" idx="0">';
			addString2 += '<button class="Mission_remove"  idx="0">-</button>';
			addString2 += '</div>';
//			addString2 += '<button id="Mission_save">SAVE</button>';
		
		
        $(".mission_pop_div_update").append(addString2);
	});
	$(document).on("click",".Mission_remove",function(){
		var target = $(this);
		if($(this).attr("idx") == '0'){
			$(this).parent('.mission_div').remove();
		}
		else{
			popup_alert.confirm("해당 미션을 삭제하시겠습니까?", function (res) {
	            if (res){
				var selectdata2 = {
						COD_MEMB : uid,
						IDX_SORT :  target.attr("idx")
				};
				$.ajax({
					url: "TodaysMission_Delete.do",
					data: selectdata2,
					type: "POST",
					async: false,
					success: function(data2){		
						var result2 = JSON.parse(data2);
						
						popup_alert.alerts("삭제되었습니다.");
						$(".mission_pop_div_update").empty();
						
						selectMission();
					}
				})
			
	            }
			})
		}
	});
	$(document).on("click","#Mission_save",function(){

		
		$(".Mission_input").each(function(){
			if($(this).val() != ''){

				var selectdata2 = {
						COD_MEMB : uid,
						IDX_SORT :  $(this).attr("idx"),
						MISSION_NM : $(this).val()
				};
				
				$.ajax({
					url: "TodaysMission_Update.do",
					data: selectdata2,
					type: "POST",
					async: false,
					success: function(data2){		
						var result2 = JSON.parse(data2);

						$(".mission_pop_div_update").empty();
						
						selectMission();
					}
				})
			}
		})
		
		popup_alert.alerts("저장되었습니다.");
	});
	

	
	$(".misson_pop_X").on("click",function(){
		$(".mission_pop").hide();
	})
	
	/*===============================================================================================*/
	/*==========================================기타==================================================*/
	/*===============================================================================================*/
	
	
	
	$(".tab.company").on("click",function(){
		location.href = "Company/main.do"
	})
	
//	
//document.querySelector("body").addEventListener("click", function(e) {
//	if($("#popup_trash").css("display") != "none"){
//		if(e.target.className != e.currentTarget.querySelector(".popup_trash").className 
//				&& e.target.className != e.currentTarget.querySelector(".trash").className
//				&& e.target.className != e.currentTarget.querySelector(".trash_img").className
//				&& $(e.target).parents(".popup_trash").attr("id") != 'popup_trash'){
//			$("#popup_trash").hide();
//			if($(".trash").hasClass("notopen") == false){
//				$(".trash").addClass("notopen");
//				
//			}
//	    }
//	}
//})

	$("#character_change").on("click",function(){
		$(".character_menu").show();
		
	})
	$(".character_menu_toggle").on("click",function(){
		$(".character_menu").hide();
		
	})
	
	
	$("#character_table > .grid_con").on("click",function(){
		var thisid = $(this).attr("id");
		var imgid = $(this).find("img").attr("id").replaceAll("o_","");
		
		var selectdata2 = {
				COD_MEMB : uid,
				CHARACTER :  imgid,
				BACKGROUND : "",
				ADD_EXP : 0
		};
		
		$.ajax({
			url: "Character_Update.do",
			data: selectdata2,
			type: "POST",
			async: false,
			success: function(data2){		
				var result2 = JSON.parse(data2);

				
				selectCharacter();
			}
		})
		
//		$("#pose_table").show();
//		$("#background_table").hide();
	})
	
	// 포즈 선택 후 저장
	$("#pose_table > .grid_con").on("click",function(){
		if($(this).has("img").length > 0){
			var imgid = $(this).find("img").attr("id");
			
			var selectdata2 = {
					COD_MEMB : uid,
					CHARACTER :  imgid,
					BACKGROUND : "",
					ADD_EXP : 0
			};
			
			$.ajax({
				url: "Character_Update.do",
				data: selectdata2,
				type: "POST",
				async: false,
				success: function(data2){		
					var result2 = JSON.parse(data2);

					
					selectCharacter();
				}
			})
		}
		
	})
	
	// 배경 선택 후 저장
	$("#background_table > .grid_con").on("click",function(){
		if($(this).has("img").length > 0){
			var imgid = $(this).find("img").attr("id").replaceAll("back_","");
			
			var selectdata2 = {
					COD_MEMB : uid,
					CHARACTER :  "",
					BACKGROUND : imgid,
					ADD_EXP : 0
			};
			
			$.ajax({
				url: "Character_Update.do",
				data: selectdata2,
				type: "POST",
				async: false,
				success: function(data2){		
					var result2 = JSON.parse(data2);

					
					selectCharacter();
				}
			})
		}
		
	})
	$(".character_option").on("click",function(){
		
		if($(".character_button").css("display") == 'none'){

			$(".character_button").show();
		}
		else{
			$(".character_button").hide();
		}
	})
	$("#change_table_o").on("click",function(){
		$("#character_table").show();
		$("#pose_table").hide();
		$("#background_table").hide();
		$(".table_tab").removeClass("active");
		$(this).addClass("active");
	})
	$("#change_table").on("click",function(){
		$("#character_table").hide();
		$("#pose_table").show();
		$("#background_table").hide();
		$(".table_tab").removeClass("active");
		$(this).addClass("active");
	})
	$("#change_table2").on("click",function(){
		$("#character_table").hide();
		$("#pose_table").hide();
		$("#background_table").show();
		$(".table_tab").removeClass("active");
		$(this).addClass("active");
	})
	
	
    	window.addEventListener("keydown", function(e){
    		if(e.code == 'Escape' && $(".mission_pop").css("display") != 'none'){
    			if($(".minimodal").css("display") != 'none'){
                    $('.modal_close').click();
    			}
    			else{
        			$(".mission_pop").hide();
        			if($("#Mission_save").css("display") != 'none'){
            			$("#mission_update").click();
        			}
    			}
    		}
    		else if(e.code == 'Escape' && $(".character_menu").css("display") != 'none'){   		
        		if($(".minimodal").css("display") != 'none'){
                    $('.modal_close').click();
    			}
    			else{
    				$(".character_menu").hide();
    			}
        	}
    	})
    	
    	$("#logout").click(function(){	
			
    		$.ajax({
    			url:"Logout.do",
    			type:"post",
    			async:false
    		})

    		location.href = "/SSOO"
    	});
	
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
	$(parent).find('.add_file_txt').hide();
	$(parent).find('.add_file_upload').show();
	
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
				COD_MEMB : uid,
				IDX_SORT : idx,
				TXT_TITLE : title,
				DAY_KEY : $("#todo_date").text() + " " + time + ":" + minute,
				LOCATION : location,
				COLOR : "",
				CHK_POINT : ""
		}
	 	
	 	var form = new FormData();
	 
	 	form.append("COD_MEMB",uid);
	 	form.append("IDX_SORT",idx);
	 	form.append("TXT_TITLE",title);
	 	form.append("DAY_KEY",$("#todo_date").text() + " " + time + ":" + minute);
	 	form.append("LOCATION",location);
	 	form.append("COLOR","");
	 	form.append("CHK_POINT","");
	 	form.append("uploadFile",$(parent).find(".add_file_files")[0].files[0]);
	 	
		
		$.ajax({
			url: "Individual_Todo_Update.do",
			data: form,
			type: "POST",
			async: false,
			processData : false,
			contentType : false,
			success: function(data){
				selectTodo();
				selectMission();
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

$(document).on('click','.option_list.delete',function(){
	const parent = $(this).parents('.to_do_board_con');
	
	$(parent).find('.board_con_title').text($(parent).find('.U_Title').val());
	
	const idx = $(parent).attr("idx");
	

	popup_alert.confirm("해당 Todo 항목을 삭제하시겠습니까?", function (res) {
        if (res){

		 var insertdata = {
					COD_MEMB : uid,
					IDX_SORT : idx
			}
			
			$.ajax({
				url: "Individual_Todo_Delete.do",
				data: insertdata,
				type: "POST",
				async: false,
				success: function(data){
					TrashTodo();
					selectMission();
				}
				
			})
	}
	})
})
$(document).on('click','.option_list.recovery',function(){
	const parent = $(this).parents('.to_do_board_con');
	
	$(parent).find('.board_con_title').text($(parent).find('.U_Title').val());
	
	const idx = $(parent).attr("idx");
	

	popup_alert.confirm("해당 Todo 항목을 복구하시겠습니까?", function (res) {
        if (res){

		 var insertdata = {
					COD_MEMB : uid,
					IDX_SORT : idx,
					GUBUN : 'R'
			}
			
			$.ajax({
				url: "Individual_Todo_Trash_Insert.do",
				data: insertdata,
				type: "POST",
				async: false,
				success: function(data){
					selectTodo();
					TrashTodo();
					dragopen();
					checkTodoNum();
				}
				
			})
        }
	})
})

$(document).on("click",".filedown",function(){
	
	var thisname = $(this).attr("name");
	var filePath = "\\\\"+thisname;
	location.href="fileDownload.do?fileName="+encodeURI(filePath);
	
})


$(document).on("change",".add_file_files",function(){
	  var fileName = $(this).val().split('/').pop().split('\\').pop();
	  var label = $(this).parent(".add_file_upload").find(".uploaded_file");
	  $(this).parent(".add_file_upload").find(".uploaded_file").val(fileName);
});

$(document).on("change","#pop_TODO_file",function(){
	  var fileName = $(this).val().split('/').pop().split('\\').pop();
	  $("#name_pop_TODO_file").val(fileName);
});


function dragopen() {
	$( '.to_do').find('.to_do_board_con').draggable({
		scroll : false,
		containment : '.to_do', //부모 요소 안에서만 이동 범위 제한
		handle :".handle",
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


				var dragnum = 0;
				var draggrid = 0;
				var dragTrash = 0;
				
				if(delx > delx2 - 22 && dely < dely2 + 30){


					 var insertdata = {
								COD_MEMB : uid,
								IDX_SORT : idx,
								GUBUN : 'D'
						};
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
										COD_MEMB : uid,
										IDX_SORT : idx,
										DAY_KEY : $("#todo_date").text(),
										CHK_POINT : 'None'
								}
						}
						else if(chkd == "G"){
							 insertdata = {
										COD_MEMB : uid,
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
				COD_MEMB : uid,
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
					AddTODO += '<div class="handle" id="handle1"></div>';
					AddTODO += '<div class="handle" id="handle2"></div>';
					AddTODO += '<div class="handle" id="handle3"></div>';
					AddTODO += '<div class="handle" id="handle4"></div>';
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
//					AddTODO += '				<h3 class="option_list">파일첨부</h3>';
//					AddTODO += '				<h3 class="option_list">파일삭제</h3>';
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
					if(result[i].FILE_NAME == ''){
						AddTODO += '	<h3 class="con_txt add_file_txt">파일 없음</h3>';
					}
					else{
						AddTODO += '	<a class="filedown" name="'+result[i].FILE_SAVE_NAME+'"><h3 class="con_txt add_file_txt">'+result[i].FILE_NAME+'</h3></a>';
					}
					AddTODO += '	<form class="add_file_upload" style="display:none;">';
					AddTODO += '	<input type="file" class="add_file_files" style="display:none;" id="todo_'+i+'" name="todo_'+i+'">';

					if(result[i].FILE_NAME == ''){
						AddTODO += '	<input class="uploaded_file" id="name_todo_'+i+'" value="'+result[i].FILE_NAME+'" placeholder = "첨부파일" readOnly>';
					}
					else{
						AddTODO += '	<input class="uploaded_file" id="name_todo_'+i+'" value="'+result[i].FILE_NAME+'" placeholder = "첨부파일" readOnly>';
					}
					AddTODO += '	<label for="todo_'+i+'">업로드</label>';
					AddTODO += '	</form>';
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
				COD_MEMB : uid,
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
					AddTODO += '				<h3 class="option_list delete">삭제</h3>';
					AddTODO += '				<h3 class="option_list recovery">복구</h3>';
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
					if(result[i].FILE_NAME == ''){
						AddTODO += '	<h3 class="con_txt add_file_txt">파일 없음</h3>';
					}
					else{
						AddTODO += '	<a class="filedown" name="'+result[i].FILE_SAVE_NAME+'"><h3 class="con_txt add_file_txt">'+result[i].FILE_NAME+'</h3></a>';
					}
					AddTODO += '	<form class="add_file_upload" style="display:none;">';
					AddTODO += '	<input type="file" class="add_file_files" style="display:none;" id="trash_'+i+'" name="trash_'+i+'">';

					if(result[i].FILE_NAME == ''){
						AddTODO += '	<input class="uploaded_file" id="name_trash_'+i+'" value="'+result[i].FILE_NAME+'" placeholder = "첨부파일" readOnly>';
					}
					else{
						AddTODO += '	<input class="uploaded_file" id="name_trash_'+i+'" value="'+result[i].FILE_NAME+'" placeholder = "첨부파일" readOnly>';
					}
					AddTODO += '	<label for="trash_'+i+'">업로드</label>';
					AddTODO += '	</form>';
					AddTODO += '	</div>';
					AddTODO += '</div>';
				                                
					$(".pop_dialog_trash").append(AddTODO);

					
				}
			}
		})
	
}
function selectMiniTodo(){
	
	 var selectdata = {
				COD_MEMB : uid,
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
//					AddTODO += '				<h3 class="option_list">파일첨부</h3>';
//					AddTODO += '				<h3 class="option_list">파일삭제</h3>';
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
					if(result[i].FILE_NAME == ''){
						AddTODO += '	<h3 class="con_txt add_file_txt">파일 없음</h3>';
					}
					else{
						AddTODO += '	<a class="filedown" name="'+result[i].FILE_SAVE_NAME+'"><h3 class="con_txt add_file_txt">'+result[i].FILE_NAME+'</h3></a>';
					}
					AddTODO += '	<form class="add_file_upload" style="display:none;">';
					AddTODO += '	<input type="file" class="add_file_files" style="display:none;" id="select_'+i+'" name="select_'+i+'">';

					if(result[i].FILE_NAME == ''){
						AddTODO += '	<input class="uploaded_file" id="name_select_'+i+'" value="'+result[i].FILE_NAME+'" placeholder = "첨부파일" readOnly>';
					}
					else{
						AddTODO += '	<input class="uploaded_file" id="name_select_'+i+'" value="'+result[i].FILE_NAME+'" placeholder = "첨부파일" readOnly>';
					}
					AddTODO += '	<label for="select_'+i+'">업로드</label>';
					AddTODO += '	</form>';
					AddTODO += '	</div>';
					AddTODO += '</div>';
				    
					$("#side_todo_section").append(AddTODO);
					
				}
				checkTodoNum2()
			}
		})
	
}
function insertTodayMission(callback){
	var date = new Date();
	
	var month = (date.getMonth() + 1 < 10) ? "0"+ (String)(date.getMonth() + 1)
				:(String)(date.getMonth() + 1);
	var dates = (date.getDate() < 10) ? "0"+ (String)(date.getDate())
			:(String)(date.getDate());
	
	var today = date.getFullYear() + "-" + month + "-" + dates;
	
	 var selectdata = {
				COD_MEMB : uid,
				DAY_KEY : today
		};
	 
	 $.ajax({
			url: "TodaysMission.do",
			data: selectdata,
			type: "POST",
			async: false,
			success: function(data){		
	            callback();
			}
		})
}

function selectMission(){
	
	var date = new Date();
	
	var month = (date.getMonth() + 1 < 10) ? "0"+ (String)(date.getMonth() + 1)
				:(String)(date.getMonth() + 1);
	var dates = (date.getDate() < 10) ? "0"+ (String)(date.getDate())
			:(String)(date.getDate());
	
	var today = date.getFullYear() + "-" + month + "-" + dates;
	
	 var selectdata = {
				COD_MEMB : uid,
				DAY_KEY : today
		};
	 
		$.ajax({
			url: "ListMission.do",
			data: selectdata,
			type: "POST",
			async: false,
			success: function(data){		
				var result = JSON.parse(data);
				
				var addString = "";
				$(".mission_pop_div").empty();
				for(var i=0; i<result.length ; i++){
					console.log(result[i])
					addString += '<div class="mission_div">';
					if(result[i].POINT > 10){
						addString += '<h4>'+result[i].MISSION_NM+'<span>special!</span></h4>';
					}
					else{
						addString += '<h4>'+result[i].MISSION_NM+'</h4>';
					}
					addString += '<div class="togglebox">';
					addString += '<input type="checkbox" class="checkbox" id="mission' +(String)(i) +'" onclick="CompleteMission(this,event)" idx="'+result[i].IDX_SORT+'" target="'+result[i].MISSION_NM + '"';
					if(result[i].CHK == 'Y'){
						addString += ' checked disabled>';
					}
					else{
						addString += '>';
					}
					addString += '<label for="mission' +(String)(i) +'"></label>';
					addString += '</div>';
					addString += '</div>';
					

					
				}
				
        		
	            $(".mission_pop_div").append(addString);
		 			
			}
		})
		var selectdata2 = {
				COD_MEMB : uid,
				DAY_KEY :  'MODEL'
		};
		
		$.ajax({
			url: "ListMission.do",
			data: selectdata2,
			type: "POST",
			async: false,
			success: function(data2){		
				var result2 = JSON.parse(data2);
				
				var addString2 = "";

				$(".mission_pop_div_update").empty();
				
				for(var i=0; i<result2.length ; i++){

					addString2 += '<div class="mission_div">';
					addString2 += '<input class="Mission_input" value="'+result2[i].MISSION_NM+'" idx="'+result2[i].IDX_SORT+'">';
					addString2 += '<button class="Mission_remove" idx="'+result2[i].IDX_SORT+'">-</button>';
					addString2 += '</div>';
					
				}
        		
	            $(".mission_pop_div_update").append(addString2);
	            
			}
		})
}
function selectCharacter(){
	 var selectdata = {
				COD_MEMB : uid
		};
	 
		$.ajax({
			url: "ListCharacter.do",
			data: selectdata,
			type: "POST",
			async: false,
			success: function(data){		
				var result = JSON.parse(data);
				
				
				console.log(result);
				
				$(".now_level").text(result.LEVEL);
				$(".ch_info_wrap > .level").text("LV" + result.LEVEL);
				$(".ch_info_wrap > .name").text(nick);
//				$(".ch_info_wrap > .sub_name").text(result.POSE);
				$(".cat_type > span").text(result.CAT);
				$(".cat_pose > span").text(result.POSE);
				$(".cat_bg > span").text(result.BACKGROUND_NAME);
				
				$(".next_level").text(Number(result.LEVEL) + 1)
				$("#character_exp").val(result.MIN_EXP)
				$(".character_image").empty();
				$("#nowCharacter").empty();
				$(".pose").empty();

				var Cat = [["1","1_4","1_8","1_12"], ["1_1","1_5","1_9","1_13"],["1_2","1_6","1_10","1_14"],["1_3","1_7","1_11","1_15"]];
				
				for(let i=0; i<Cat.length; i++){
					for(let j=0; j<Cat[i].length; j++){
						if(Cat[i][j] == result.CHARACTER){
							$("#pose1").append("<img src='./images/Character/"+Cat[i][0]+".svg' id='"+Cat[i][0]+"'>");
							$("#pose2").append("<img src='./images/Character/"+Cat[i][1]+".svg' id='"+Cat[i][1]+"'>");
							$("#pose3").append("<img src='./images/Character/"+Cat[i][2]+".svg' id='"+Cat[i][2]+"'>");
							$("#pose4").append("<img src='./images/Character/"+Cat[i][3]+".svg' id='"+Cat[i][3]+"'>");
							break;
						}
					}
				}
				
				
				if(result.BACKGROUND != ""){
					$(".character_image").css("background-image" ,"url('./images/background/"+result.BACKGROUND+".svg')")
					$("#nowCharacter").css("background-image" ,"url('./images/background/"+result.BACKGROUND+".svg')")
				}
				$(".character_image").append("<img class='main_img' src='./images/Character/"+result.CHARACTER+".svg'>");
				$("#nowCharacter").append("<img class='main_img' src='./images/Character/"+result.CHARACTER+".svg'>");
			}
		})
}
function CompleteMission(target,event){
	event.preventDefault();
	popup_alert.confirm("해당 미션을 완료 처리하시겠습니까?", function (res) {
        if (res){
			var idx = $(target).attr("idx");
			var name = $(target).attr("target");
			 
			 var date = new Date();
			 var today = returndate(date);
			 var selectdata = {
					COD_MEMB : uid,
					DAY_KEY : today,
					IDX_SORT : idx,
			};
			$.ajax({
				url: "TodaysMission_Complete.do",
				data: selectdata,
				type: "POST",
				async: false,
				success: function(data){		
		//			var result = JSON.parse(data);
					selectCharacter();
					$(target).prop("disabled",true)
					$(target).prop("checked",true)
				}
			})
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
	
	var date = new Date();
	$("#pop_Calendar_FROM").val(returndate(date));
	$("#pop_Calendar_TO").val(returndate(date));
	
	
	$("#pop_Calendar_time").val(0);
	$("#pop_Calendar_minute").val(0);
	$("#pop_Calendar_Time_AMPM").val("AM");
	$("#pop_Calendar2_time").val(0);
	$("#pop_Calendar2_minute").val(0);
	$("#pop_Calendar2_Time_AMPM").val("AM");
	$("#pop_Calendar_Color").val("#ff4e43")
	$(".pop_input > .clr-field").css("color","#ff4e43")

	$("#pop_Calendar_update").hide();
	$("#pop_Calendar_delete").hide();
	$("#pop_Calendar_save").show();
}
function returndate(date){	
	var month = (date.getMonth() + 1 < 10) ? "0"+ (String)(date.getMonth() + 1)
				:(String)(date.getMonth() + 1);
	var dates = (date.getDate() < 10) ? "0"+ (String)(date.getDate())
			:(String)(date.getDate());
	
	var today = date.getFullYear() + "-" + month + "-" + dates;
	
	
	return today;
}
document.addEventListener('keydown', (event) => {
    if(event.key == 'Escape'){
    	$(".popup").each(function(){
    		if($(this).css("display") == "block"){
    			
    			$(".popup").hide();
    			popReset();
    			return false;
    		}
    	})
    }
});
