<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	
    <style>
        /* 기본 세팅값 설정 */
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

        *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html,body 
        {
            font-size: 10px;
        }

        ul,li,ol
        {
            list-style:none;
        }

        a
        {
            text-decoration: none;
            color: #000;
        }
        
        .hidden{
        	display: none;
        }

        /* 기본 세팅값 설정 끝 */

        /* .container, .dashboard 시작 */

        .container 
        {
            height: 100vh;
            display: flex;            
        }       

        /* .container, .dashboard 끝 */

        /* .dashboard > nav 시작 */
        nav
        {
            width: 270px;
            height: 100%;
            border-right: 1px solid var(--border-color);
            position:relative;
            background-color: var(--nav-background);
            box-sizing: border-box;
        }

        .logo 
        {
            width: 70px;
            height: 30px;
            background-image:url(../images/logo.svg);
            background-position:center;
            background-size: 100% 100%;
            background-repeat: no-repeat;
            margin:20px auto;
        }

        .nav_menu_section 
        {
            border-top: 1px solid #fff;
        }

        .menu_div 
        {
            width: 100%;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .menu_img 
        {
            width: 25px;
            height: 25px;
        }

        .marker 
        {
            width: 20px;
            height: 20px;
            background-color: #ff9767;
        }

        .menu_txt 
        {
            width: 50%;
            margin-left: 20px;
            font-size: 12px;
            white-space: nowrap;
        }

        .admin 
        {
            /* position: absolute;
            bottom: 50px;
            left: 50%;
            transform:translate(-50%, 0%); */
            text-align: center;
        }

        .profile_img 
        {
        	width: 80px;
		    height: 80px;
		    margin: 20px auto;
		    border-radius: 50%;
		    background: #fff;
		    display: flex;
		    align-items: center;
		    justify-content: center;	
        }
        .profile_name
        {
            font-size: 18px;
            white-space: nowrap;
            font-weight: 500;
            margin-right: 5px;
        }
        
        button.btn.add_prj 
        {
        	background: #fff;
        	border:0;
        	border-radius: 5px;
        	font-size: 16px;
        	font-weight: 600;
        	margin: 50px 0;
        	width: 200px;
        	height: 50px;
        	cursor: pointer;
        }
        
        .profile_sub_txt 
        {
            margin-top: 10px;
            color: #949494;
        }
        .logout 
        {
            padding: 5px 20px;
            border: 1px solid var(--border-color);
            border-radius: 10px;
        }
        /* .dashboard > nav 끝 */

        /* section 시작 */

        section 
        {
            background: #fff;
            width: calc(100% - 270px);
        }

        .section_title 
        {
            font-size: 32px;
            color: #707070;
        }

        .option_div 
        {
            margin-top: 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .select_div > select
        {
            padding:10px 30px;
            border-radius: 5px;
            border: 0;
            margin-right: 10px;
            color: #8d8c8c;
            box-shadow: 3px 3px 5px rgba(0,0,0,0.2);
            font-weight: 600;
            cursor: pointer;
        }

        input 
        {
            cursor: pointer;    
        }

        .icon_div 
        {
            display: flex;
        }

        .icon 
        {
            margin-left: 20px;
            background: #fff;
            border-radius: 5px;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 3px 3px 5px rgba(0,0,0,0.2);
            cursor: pointer;
        }

        .data_div 
        {
            margin-top: 20px;
            width: 100%;
        }

        .data_div ul 
        {
            display : flex;
            background: #fff;
            margin-bottom: 10px;
            height: 60px;
            justify-content:flex-start;
            align-items: center;
            box-shadow: 3px 3px 5px rgba(0,0,0,0.2);
        }

        .data_div ul.data_table_header 
        {
            background: #0074C2;
            color: #fff;
        }

        .data_div ul li 
        {
            width: calc(95% / 9);
            text-align: center;
            font-size: 14px;
        }

        .data_div ul li:first-child 
        {
            width: 5%;
        }
        /* section 끝 */

        /* popup 시작 */
        .modal {
            position: absolute;
            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            display: none;

            background-color: rgba(0, 0, 0, 0.2);
        }

        .modal_body {
            position: absolute;
            top: 50%;
            left: 50%;

            width: 850;
            height: 510px;

            padding: 40px;

            text-align: center;

            background-color: rgb(255, 255, 255);
            border-radius: 10px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

            transform: translateX(-50%) translateY(-50%);
        }

        .modal_body p {
            font-size: 32px;
            text-align: start;
            
        }

        span {
            color: #A1A1A1;
            font-size: 12px;
            font-weight: bold;
        }

        .close {
            width: fit-content;
            height: fit-content;
            align-self: center;
        }

        hr {
            margin-top: 40px;
            margin-bottom: 40px;
        }

        label {
            display: block;
            margin-bottom: 20px;
            font-size: 24px;
            text-align: start;
            font-weight: bold;
        }

        .input_div div input {
            width: 420px;
            height: 40px;
            padding: 10px;
            background-color: #cef1ff;
            border: none;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .input_div div select {
            width: 440px;
            height: 60px;
            padding: 10px;
            background-color: #cef1ff;
            border: none;
            border-radius: 5px;
        }


        .food img {
            height: fit-content;
            margin-right: 18px;
            align-self: center;
        }

        .text_area {
            text-align: start;
            align-self: center;
        }

        .cb_label {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 2px solid #bcbcbc;
            cursor: pointer;
        }

        .cb {
            width: 30px;
            height: 30px;
            align-self: center;
        }



        .btn_div {
            display: flex;
            justify-content: space-between;
            margin-top: 70px;
        }       

        .add_menu {
            width: 90px;
            height: 40px;
            font-size: 14px;
            background-color: #e7ffc1;
        }

        .cancel {
            color: #ffffff;
            background-color: #ff8282;
        }

        .save {
            color: #ffffff;
            background-color: #0074c2;
        }

		/* header */
        .header
        {
            height: 80px;
            border-bottom: 1px solid #dadada;
            display: flex;
    		align-items: center;
        }		

		#team 
		{
			width: 400px;
            height: 50px;
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
		
		.favicon_div 
		{
			display: flex;
			align-items: center;
			margin-left: auto;
			margin-right: 80px;
		}
		
		.favicon_button 
		{
			box-shadow: 0 0 3px rgb(0 0 0 / 40%);
		    border-radius: 10px;
		    width: 50px;
		    height: 50px;
		    margin-right: 20px;
		    cursor:pointer;
		}
		
		.favicon_add 
		{
			width: 20px;
			height: 20px;
			background-image:url(../images/favicon_add.svg);
			background-repeat: no-repeat;
			cursor:pointer;
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
		
        .profile_txt{
            display: flex;
            justify-content: center;
        }

		/* -----content div----- */        
        .content_div
        {
            display: flex;
   			align-items: center;
    		height: calc(100vh - 81px);  
        }
        
        .content_con_div
        {
        	width:80%;
        	margin: 0 auto;        	    		
        }

		/* 팀이 없을 때 팀 가입 url 검색 링크창 */
		.search_div 
		{
			display: flex;
    		align-items: center;
    		margin-top: 80px;
    		position: relative;
		}
		
		.empty_div 
		{
			text-align: center;
		    padding: 200px 0;
		}
		
		.msg 
		{
			font-size: 16px;
    		font-weight: 500;
    		margin-top: 10px;
		}
		
        .searchBar
        {
            width: 100%;
            height: 50px;
            border: 1px solid #dadada;
            border-radius: 30px;
            padding-left: 20px;               			
        }
        
        #search_team 
        {
        	position: absolute;
        	right: 20px;
        }
        
        .no_prj{
            font-size: 40px;
        }

        .team_div{
            width: 300px;
            height: 600px;
            border: 1px solid #383838;
            margin-top: 80px;
        }
        
        .swiper-wrapper
        {
        	width: 1500px;
        	text-align: center;
        }
        
    </style>
</head>
<body>
    <div class="container">        
            <nav>
                <h1 class="logo"></h1>
                <div class="admin">
                    <div class="profile_img">
                        <img src="../images/admin.png" alt="#">
                    </div>
                    <div class="profile_txt">
                        <h3 class="profile_name">사용자명</h3>
                        <img src="../images/edit.png" alt="#">
                    </div>
                    <button class="btn add_prj">새 프로젝트</button>
                </div>
                <div class="nav_menu_section">
                    <div class="menu_div">
                        <h2>팀 리스트</h2>
                    </div>
                    
                </div>
            </nav>

            <section>
                <header class="header">
                    <select name="team" id="team">
					  <option value="design">디자인팀</option>
					  <option value="planning">기획팀</option>
					  <option value="planning_second">기획2팀</option>
					</select>					
					<div class="favicon_div">
						<div class="favicon_button"></div>
						<div class="favicon_button"></div>
						<div class="favicon_button"></div>
						<div class="favicon_button"></div>
						<div class="favicon_button"></div>
						<div class="favicon_add"></div>
					</div>                    
                    <div class="change_mode">
                        <button class="btn ps">개인</button>
                        <button class="btn cp">회사</button>
                    </div>
                </header>
                <div class="content_div">
                	<div class="content_con_div">
	                		
	                    <div class="search_div">
	                        <input type="text" class="searchBar" placeholder="링크를 입력해주세요.">
	                        <img id="search_team" src="../images/search.png" alt="#">
	                    </div>
	                    <div class="empty_div">
	                		<img id="empty_img" src="../images/empty.svg" alt="#">
			                <div class="msg">가입된 팀이 없습니다.</div>
	                	</div>
	                    <div class="swiper">
	                    	<div class="swiper-wrapper">
	                    		                    		
			                </div>
			                <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
		                </div>
                	</div>                    
                </div>
            </section>        
    </div>
    <div class="modal">
	    <div class="modal_body">
	        <div style="display:flex; justify-content:space-between;">
	            <p>프로젝트 생성하기</p>
	            <img src="../images/close.png" class="close">
	        </div>
	        
	        <hr>
	        
	        <div style="display: flex; justify-content:center;">
	            <div class="input_div">
	                <div>
	                    <label for="name">프로젝트 이름</label>
	                    <input type="text" name="prj_name" id="prj_name" >
	                </div>
	
	                <div>
	                    <label for="position">프로젝트 링크</label>
	                    <input type="text" name="prj_linl" id="prj_link" value="https://www.jtm.com/">
	                    <button class="btn copy">링크 복사</button>
	                </div>
	            </div>
	        </div>
	
	        <div class="btn_div">
	            <button class="btn save1">생성하기</button>
	            <button class="btn save2 hidden">생성하기2</button>
	        </div>
	    </div>
	</div>
</body>
<script>
    $(document).ready(function() {
    	start();
    	
        var rand = '';

        $(".add_prj").click(function(){
        	$('.container').css('z-index',-1);
            $(".modal").css('display','block');
        });

        $(".close").click(function(){
            $(".modal").css('display','none');
            $('.container').css('z-index',1);
        });
        
        $('.btn.save1').on('click',function(){
        	if($('#prj_name').val() != ''){
        		rand = Math.random().toString(16).substr(2,8);
                console.log(rand);
                
                $('#prj_link').val('https://www.jtm.com/'+rand);
                
                $.ajax({
            		type: "POST",
    				url : "./TEAM_CREATE.do",
    				data: {
    					ID: rand,
    					NAME: $('#prj_name').val(),
    					LINK: 'https://www.jtm.com/'+rand,
    					OWNER: 'admin'
    				},
    				async: false,
    				success:function(data){
    					console.log(data);
    					alert('팀 생성이 완료되었습니다.');
    					$.ajax({
    						type: "POST",
    						url : "./TEAM_JOIN.do",
    						data: {
    							TEAM: rand,
    							USER: 'admin',
    							TYPE: 'O'
    						},
    						async: false,
    						success:function(data){
    							$(".close").trigger('click');
    							start();
    						},
    						error:function(err){ console.log(err); }
    					});
    				},
    				error:function(err){
    					alert('팀 생성에 실패했습니다.');
    				}
            	});
                
        	}else{
        		alert('프로젝트명을 입력해주세요!');
        	}

        });
        
        $('.btn.save2').on('click',function(){
        	if($('#prj_name').val() != ''){
        		                
                $('#prj_link').val('https://www.jtm.com/'+$('#prj_name').val());
        	}else{
        		alert('프로젝트명을 입력해주세요!');
        	}
        	
        });

        $(".copy").click(function(){
            var content = document.getElementById('prj_link').value;

            navigator.clipboard.writeText(content).then(()=>{
                alert('복사완료');
            }).catch(err => {
                console.log(err);
            })
        });
        
        $('.menu_div').on('click',function(event){
        	var tid = event.currentTarget.id;
        	window.location.href = "./calendar.do#"+tid;
        });
        
        $('.btn.cp').on('click',function(){
        	location.replace("calendar.do");
        });
        
        $('#search_team').on('click',function(){
        	console.log($('.searchBar').val());
        	
        	$.ajax({
				type: "POST",
				url : "./TEAM_SEARCH.do",
				data: {
					LINK: $('.searchBar').val()
				},
				async: false,
				success:function(data){
					var result = JSON.parse(data);
					
					if(confirm('['+result.resultMsg+']에 가입하시겠습니까?')){
						alert('가입이 완료되었습니다');
						start();
					}else{
						alert('가입을 취소했습니다.');
					}
				},
				error:function(err){
					alert('잘못된 링크입니다.');
				}
			});
        });
        
        // swipe 설정
        const swiper = new Swiper('.swiper',{
        	slidesPerView: 4,
			spaceBetween: 20,
			loop: true,
			loopedSlides: 1,
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev"
			}
        });
    });
    
    function start(){
    	$.ajax({
			type: "POST",
			url : "./TEAM_SELECT.do",
			data: {
				USER: 'admin'
				//ojw024 : 팀 없음
				//admin : 팀있음
			},
			async: false,
			success:function(data){
				var result = JSON.parse(data);
				console.log(result);
				if(result.length > 0){
					for(var i = 0; i < result.length; i++){
						$('.nav_menu_section').append("<div id='"+result[i].TEAM_ID+"' class='menu_div'><div id='t"+i+"' class='marker'></div><h5 class='menu_txt'>"+result[i].TEAM_NAME+"</h5></div>");
						$('.swiper-wrapper').append("<div class='team_div swiper-slide'>"+result[i].TEAM_NAME+"</div>");
						$('.marker')[i].style.backgroundColor = '#'+result[i].TEAM_ID.substr(0,6);
						$('.msg').css('display','none');
						$('.empty_div').css('display','none');
					}
				}
				
			},
			error:function(err){
				console.log(err);
			}
		});
    }
</script>
</html>