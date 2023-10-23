<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../alert.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
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
            --nav-background : #e5e5e5;
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
            background-color: #fff;
            box-sizing: border-box;
            box-shadow: 0 0 5px rgba(0,0,0,0.4);
            z-index: 2;
        }
        
        .navigation.active 
        {
        	width: 50px;
        }

        .navigation .logo 
        {
            width: 70px;
            height: 70px;
            background-image:url(../images/logo.svg);
            background-position:center;
            background-size: 100% 100%;
            background-repeat: no-repeat;
            margin:20px auto;
        }
        
        .navigation.active .logo 
        {
        	width: 30px;
            background-image:url(../images/active_logo.svg);
            background-position:center;
            background-size: 100% 100%;
            background-repeat: no-repeat;
            margin:20px auto;
        }

		.admin 
        {
            width: 100%;
		    height: 150px;
		    text-align: center;
		    margin: 0 auto;
		    background: #FF776F;
		    padding: 20px 0;
        }       
        
        .navigation.active .admin
        {
        	background: #fff;
        }
        
        .profile_img 
        {
        	width: 80px;
		    height: 80px;
		    margin: 0 auto;
		    border-radius: 50%;
		    background: #fff;
		    display: flex;
		    align-items: center;
		    justify-content: center;	
        }
        
        
        .navigation.active .profile_img 
        {
        	width: 40px;
        }
        
        .profile_txt
        {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        
        .navigation.active .profile_txt 
        {
        	display: none;
        }
        
        .profile_name
        {
            font-size: 18px;
            white-space: nowrap;
            font-weight: 500;
            margin-right: 5px;
            margin-top: 5px;
            color: #fff;
        }
        
        .navigation.active .profile_name
        {
        	display: none;
        }
        
        .btn_edit 
        {
        	cursor:pointer;
        	height: 20px;
        }
        
        .navigation.active .nav_menu_section 
        {
        	width: 100%;
        }
        
        .nav_menu_section
        {
        	margin: 40px auto;
        	width: 220px;
        }
        
        button.btn.add_prj 
        {
        	background: #fff;
		    border: 1px solid #FF776F;
		    border-radius: 5px;
		    font-size: 16px;
		    font-weight: 600;
		    width: 100%;
		    height: 50px;
		    cursor: pointer;
		    color: #FF776F;
        }       
        
        .navigation.active button.btn.add_prj 
        {
        	display: none;
        }
                
        .menu_div 
        {
            width: 100%;
            margin-top: 20px;
            display: flex;
    		align-items: center;            
        }
        
        .navigation.active .menu_div 
        {
        	justify-content: center;
        }
        
        .menu_div > li 
        {
        	font-size: 16px;
        	padding: 20px 0;
        } 
                
        .menu_div > li > a 
        {
        	display: flex;
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
            border-radius: 5px;
            background-color: #ff9767;
        }

        .menu_txt 
        {
            width: 50%;
            margin-left: 20px;
            font-size: 14px;
            white-space: nowrap;
            cursor: pointer;
        } 
        
        .navigation.active .menu_txt 
        {
        	display: none;
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
        
        section.active 
        {
        	width: calc(100% - 50px);
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
        
        /* 프로젝트 생성하기 popup*/
        .modal {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 9;
        }
        .modal_header 
        {
        	height: 70px;
        	display: flex;
		    align-items: center;
		    border-bottom: 1px solid #dadada;
    		padding: 40px 20px;
        }
        
        .file_icon 
        {
        	width: 30px;
        	margin-right: 20px;
        }
        
        .close 
        {
        	margin-left: auto;
        }
        
        .modal_header_title 
        {
        	font-size: 36px;
        	font-weight: 900;
        	color: #222;
        }
        
        .modal2 {
            position: absolute;
            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            display: none;
        }

        .modal_con_wrap {
            position: absolute;
            top: 50%;
            left: 50%;
			width: 800px;
            text-align: center;
            background-color: rgb(255, 255, 255);
            border-radius: 10px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
            transform: translateX(-50%) translateY(-50%);
        }
        
        .modal_body
        {
        	width: 700px;
        	margin:50px auto;
        }
        
        .modal_body .input_div 
        {
        	display: flex;
        	align-items: center;
        	margin-bottom: 20px;
        }
        
        .modal_change_profile{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 9;
        }
        .modal_con_wrap_Mini_1{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 9;
        }
        .modal_con_wrap_Mini_2{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 9;
        }
        .modal_Mini_alert{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 9;
        }
        .input_title 
        {
        	font-size: 18px;
        	color: #222;
        	font-weight: 600;
        	width: 160px;
        	text-align: left;
        }
        
        .modal_body .input_div input 
        {
        	width: 480px;
        	height: 50px;
        	border: 1px solid #dadada;
        	border-radius: 5px;
        	margin-left: 20px;
        }
        
        #prj_link 
        {
        	width: 360px;
        	padding-left: 10px;
        }
        
        .btn.copy, .btn.save1
        {
        	width: 100px;
        	height: 50px;
        	background-color: #FF4E43;
        	border-radius: 5px;
        	color: #fff;
        	font-size: 16px;
        	font-weight: 500;
        	border: 0;
        	margin-left: 20px;
        } 
        
        .btn.save1 
        {
        	width: 150px;
        	margin-bottom: 40px;
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
		
		.favicon_button > img
		{
			width: 100%;
		    height: 100%;
		    border-radius: 10px;
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
            border: 1px solid #e5e5e5;
            margin-top: 60px;
        }
        
        .swiper-wrapper
        {
        	width: 1500px;
        	text-align: center;
        }
        
        
        
        
        .toggle
		{
		    position: absolute;
		    top: calc( 50% - 20px);
		    left: 267px;
		    width: 30px;
		    height: 50px;
		    background: #FF4E43;
		    cursor: pointer;
		    border: 3px solid #fff;
		    border-radius: 0 10px 10px 0;
		}
		.toggle.active
		{
		    left: 48px;
		    transition: 0.5s;
		}
		.toggle::before
		{
		    content: '\f053';
		    font-family: fontAwesome;
		    position:absolute;
		    width: 100%;
		    height: 100%;
		    line-height: 43px;
		    text-align: center;
		    color: #fff;
		    font-size: 14px;
		}
		.toggle.active::before
		{
		    content: '\f105';
		    font-family: fontAwesome;
		    position:absolute;
		    width: 100%;
		    height: 100%;
		    line-height: 43px;
		    text-align: center;
		    color: #fff;
		    font-size: 14px;
		}
		
		
		
        .modal_con_wrap_profile {
            position: absolute;
            top: 50%;
            left: 50%;
			width: 580px;
            text-align: center;
            background-color: rgb(255, 255, 255);
            border-radius: 10px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
            transform: translateX(-50%) translateY(-50%);
        }
        .profile_head{
       	    margin-top: 20px;
    		margin-bottom: 30px;
        }
		.profile_head > h3 {
			font-size: 30px;
			margin-top: 10px;
			margin-bottom: 10px;
		}
		.profile_image_div{
		    width: 100px;
		    height: 100px;
		    background: #b7b7b7;
		    border-radius: 100px;    
		    margin: auto;
		    margin-top: 15px;
    		margin-bottom: 20px;
    		position: relative;
   		    background-size: 100%;
    		border: 2px solid #b7b7b7;
		}
		.profile_input_div{
			display: flex;
			justify-content: center;    
			font-size: 15px;
			margin-top: 10px;
			margin-bottom: 10px;
		}
		.profile_input_div > h4{
			width: 150px;    
			text-align: left;
		    margin-top: auto;
   		 	margin-bottom: auto;
		}
		.profile_input{
			width: 300px;
		    height: 40px;
		    padding-left: 10px;
		    border: 1px solid #9d9d9d;
		    border-radius: 6px;
		}
		.profile_input:disabled{
			background: #ffb8b8;
		}
		.profile_btn_div{
		    margin-top: 30px;
		    margin-bottom: 20px;
		}
		.profile_btn{
		    width: 150px;
		    height: 40px;
		    border: 0;
		    color: white;
		    border-radius: 5px;
		    cursor: pointer;
		}
		.profile_image_div_btn{
		    background: gray;
		    width: 30px;
		    height: 30px;
		    position: absolute;
		    right: 0%;
		    bottom: 0%;
		    border-radius: 100px;
		    cursor: pointer;
		}
		#profile_addEvt{
		    background: var(--company);
		}
		#profile_X{
		    background: black;
		}
    </style>
    <script>
	    var uid = '<%=(String)session.getAttribute("SESSION_COD_MEMB")%>';
	    
	   if('<%=request.getParameter("SESSION_NICK")%>' != 'null'){
		   var uname = '<%=request.getParameter("SESSION_NICK")%>';
	   }else{
		   var uname = '<%=(String)session.getAttribute("SESSION_NICK")%>';
	   }
	    
		console.log(uid, uname);
    </script>
</head>
<body>
    <div class="container">        
		<nav class="navigation">
			<a href="/SSOO/Main.do">
		    <h1 class="logo"></h1>
		    </a>
		    <div class="admin">
		        <div class="profile_img">
		            <img src="../images/admin.png" alt="#">
		        </div>
		        <div class="profile_txt">
		            <h3 class="profile_name">사용자명</h3>
		            <img class="btn_edit" src="../images/edit.png" alt="#">
		        </div>
		        
		    </div>
		    <div class="nav_menu_section">
		    	<button class="btn add_prj">새 프로젝트 만들기</button>
		        <ul class="menu_div"></ul>
		        
		    </div>		    
		</nav>
		<div class="toggle"></div>
		
        <section class="section">
            <header class="header">
                <select name="team" id="team"></select>					
				<div class="favicon_div">
					<div class="favicon_button slot0">
						<input type='text' class="bk_url hidden" value="" />
						<img src="" class="bk_fav">
					</div>
					<div class="favicon_button slot1">
						<input type='text' class="bk_url hidden" value="" />
						<img src="" class="bk_fav">
					</div>
					<div class="favicon_button slot2">
						<input type='text' class="bk_url hidden" value="" />
						<img src="" class="bk_fav">
					</div>
					<div class="favicon_button slot3">
						<input type='text' class="bk_url hidden" value="" />
						<img src="" class="bk_fav">
					</div>
					<div class="favicon_button slot4">
						<input type='text' class="bk_url hidden" value="" />
						<img src="" class="bk_fav">
					</div>
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
	    <div class="modal_con_wrap">
	        <div class="modal_header">
	            <img src="../images/icon_file.svg" class="file_icon">
	            <h3 class="modal_header_title">프로젝트 생성하기</h3>
	            <img src="../images/close.png" class="close">
	        </div>      
	        
	        <div class="modal_body">
	        	<div class="input_div">
	        		<h3 class="input_title">프로젝트 이름</h3>
	        		<input type="text" name="prj_name" id="prj_name" >
	        	</div>
	        	<div class="input_div">
	        		<h3 class="input_title">프로젝트 생성 링크</h3>
	        		<input type="text" name="prj_linl" id="prj_link" value="https://www.jtm.com/">
	                <button class="btn copy">링크 복사</button>
	        	</div>	           
	        </div>	
	        
	        <button class="btn save1">생성하기</button>
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
    
    <div class="modal_change_profile">
    	<div class="modal_con_wrap_profile">
    		<div class="profile_head">
                <h3>내 정보</h3>
                <div class="profile_image_div">
                	<img src="" id="profile_image_preview">
                	<input type="file" class="profile_file" id="profile_image" style="display:none;" onchange="readURL(this);">
	                <label class="profile_image_div_btn" for="profile_image">
	                </label>
                </div>
            </div>
    		<div class="profile_body">
                <div class="profile_input_div">
            		<h4>아이디</h4>
            		<input class="profile_input" id="profile_id" disabled>
                </div>
                <div class="profile_input_div">
            		<h4>이름</h4>
            		<input class="profile_input" id="profile_name" placeholder="이름을 입력하세요.">
                </div>
                <div class="profile_input_div">
            		<h4>닉네임</h4>
            		<input class="profile_input" id="profile_nick" placeholder="닉네임을 입력하세요.">
                </div>
                <div class="profile_input_div">
            		<h4>현재 패스워드</h4>
            		<input type="password" class="profile_input" id="profile_now_pass" placeholder="현재 패스워드를 입력하세요.">
            		<input type="hidden" class="profile_input" id="profile_now_pass_chk" placeholder="변경 패스워드를 입력하세요.">
                </div>
                <div class="profile_input_div">
            		<h4>변경 패스워드</h4>
            		<input type="password" class="profile_input P_password" id="profile_new_pass" placeholder="변경 패스워드를 입력하세요." disabled>
            		<input type="hidden" class="profile_input" id="profile_new_pass_chk" placeholder="변경 패스워드를 입력하세요.">
                </div>
                <div class="profile_input_div">
            		<h4>변경 패스워드 확인</h4>
            		<input type="password" class="profile_input P_password" id="profile_new_pass_2" placeholder="변경 패스워드 확인" disabled>
                </div>
                <div class="profile_input_div">
            		<h4>전화번호</h4>
            		<input class="profile_input" id="profile_phone" placeholder="전화번호를 입력하세요.">
                </div>
                <div class="profile_input_div">
            		<h4>주소</h4>
            		<input class="profile_input" id="profile_address" placeholder="주소를 입력하세요.">
                </div>
            </div>
            <div class="profile_btn_div">
                <button id="profile_X" class="profile_btn">취소하기</button>
                <button id="profile_addEvt" class="profile_btn">등록하기</button>
            </div>
    	</div>
    </div>
    
    <div class="modal_Mini_alert" id="modal_Mini_1">
    	<div class="modal_con_wrap_Mini_1">
    	</div>
    	<div class="modal_con_wrap_Mini_2">
    	</div>
   	</div>
</body>
<script>
    $(document).ready(function() {
    	window.addEventListener("keydown", function(e){
            if(e.code == "Tab" && $(".modal_change_profile").css("display") == 'none'){
                // 개인으로 이동
                $('.btn.ps').click();
            }
            else if(e.code == "Escape" && ($(".modal").css("display") == 'block' || $(".modal2").css("display") == 'block' || $(".modal_change_profile").css("display") == 'block')){
                // 개인으로 이동
                $('.close').click();
                $('.close2').click();
                $('#profile_X').click();
            }
        });
    	
    	start();
    	
        var rand = '';
        
        $('.profile_name')[0].innerText = uname+'님';

        $('.btn_edit').on('click',function(){
        	$(".modal_change_profile").show();
        	profileReset();
//         	var new_name = prompt('변경할 이름을 입력해주세요','');
        	

        });
        
        /* toggle */
        const navigation = document.querySelector('.navigation');
        const section = document.querySelector('.section');
        document.querySelector('.toggle').onclick = function(){
            this.classList.toggle('active');
            navigation.classList.toggle('active');
            section.classList.toggle('active');
        }
        
        $(".add_prj").click(function(){
        	$('.container').css('z-index',-1);
        	$('.swiper').css('z-index',-1);
            $(".modal").css('display','block');
        });

        $(".close").click(function(){
            $(".modal").css('display','none');
            $('.container').css('z-index',1);
            $('.swiper').css('z-index',1);
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
    					OWNER: uid
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
    							USER: uid,
    							TYPE: 'O'
    						},
    						async: false,
    						success:function(data){
    							$(".close").trigger('click');
    							window.location.reload();
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
        	// window.location.href = "./calendar.do";
        	
        	var frm = document.createElement("form");
        	frm.setAttribute("charset", "UTF-8");
        	frm.setAttribute("method", "POST");
        	frm.setAttribute("action", "./calendar.do");
        	
        	var hiddenField = document.createElement("input");
        	hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "team");
            hiddenField.setAttribute("value", tid);
            frm.appendChild(hiddenField);
            
            document.body.appendChild(frm);
            frm.submit();
        });
        
        $('.btn.cp').on('click',function(){
        	location.replace("calendar.do");
        });
        
        
        $('.btn.ps').on('click',function(){
        	location.href = "../Individual.do";
        });
        
        
        $('#search_team').on('click',function(){
        	if($('.searchBar').val() != ''){
        		$.ajax({
    				type: "POST",
    				url : "./TEAM_SEARCH.do",
    				data: {
    					LINK: $('.searchBar').val()
    				},
    				async: false,
    				success:function(data){
    					var result = JSON.parse(data);
    					console.log($('.searchBar').val().split('/'));
    					if(confirm('['+result.resultMsg+']에 가입하시겠습니까?')){
    						$.ajax({
    							
        						type: "POST",
        						url : "./TEAM_JOIN.do",
        						data: {
        							TEAM: $('.searchBar').val().split('/')[3],
        							USER: uid,
        							TYPE: 'M'
        						},
        						async: false,
        						success:function(data){
        							console.log(data);
        						},
        						error:function(err){ console.log(err); }
    	    					
    						});
    						alert('가입이 완료되었습니다');
    						window.location.reload();
    					}else{
    						alert('가입을 취소했습니다.');
    					}
    				},
    				error:function(err){
    					alert('잘못된 링크입니다.');
    				}
    			});
            	start()
        	}else{
        		alert('링크를 입력해주시기 바랍니다.');
        	}
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
        
        
        
        
        $('.favicon_button').on('click',function(){
            var url = $(this)[0].childNodes[1].value;
            slot = $(this)[0].classList[1];
            console.log(url);
			
            if(url != ''){ 
            	window.open(url, target="_blank");
            }else{                
                alert('등록된 사이트가 없습니다.');
            }
        });
        
        $('.favicon_add').on('click',function(){
        	$('#bk_url').val('');
			$('#bk_name').val('');
			var cnt = 0;
        	for(cnt = 0; cnt < 5; cnt++){
        		var chk = $('.favicon_button.slot'+cnt)[0].childNodes[1].value;
        		if(chk == '' || chk == undefined || chk == null){
        			console.log(cnt, '없음');
        			slot = cnt;
        			break
        		}
        	}
        	
        	if(cnt<5){
	        	$(".modal2").css('display','block');
    	        $('.container').css('z-index',-1);
    	        $('.swiper').css('z-index',-1);
        	}else if(cnt>=5){
        		alert('더 이상 등록할 수 없습니다.');
        	}
        });
        
        $(".close2").click(function(){
            $(".modal2").css('display','none');
            $('.container').css('z-index',1);
            $('.swiper').css('z-index',1);
            
            $('.bk_url').val('');
            $('.bk_name').val('');
        });
        
        $('#url_addEvt').on('click',function(){
        	var insertData = {
          			USERID: uid,
      				TEAM: '',
   				SLOT: slot,
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
        
        
        $("#profile_X").on("click",function(){
        	$(".modal_change_profile").hide();
        })
        $("#profile_addEvt").on("click",function(){
        	
        	if($("#profile_name").val() == ''){
     		   popup_alert.alerts('이름을 입력해주세요.')
        	}
        	else if($("#profile_nick").val() == ''){
      		   popup_alert.alerts('닉네임을 입력해주세요.')
        	}
        	else if($("#profile_new_pass_chk").val() == '' && $("#profile_now_pass_chk").val() == 'Y'){
       		   popup_alert.alerts('비밀번호가 일치하지 않습니다.')
        	}
        	else{
        		

				var pwd = ($("#profile_now_pass_chk").val() == '') ? ''
					  : $("#profile_new_pass").val();

    		 	var form = new FormData();
    		 
    		 	form.append("USERID",uid);
    		 	form.append("PWD",pwd);
    		 	form.append("USERNAME",$("#profile_name").val());
    		 	form.append("NICKNAME",$("#profile_nick").val());
    		 	form.append("TEL",$("#profile_phone").val());
    		 	form.append("ADDR",$("#profile_address").val());
    		 	form.append("profileImage",$("#profile_image")[0].files[0]);
    		 	
    		 	
	            	$.ajax({
	        		type: "POST",
					url : "./edit_profile.do",
					data: form,
					async: false,
					processData : false,
					contentType : false,
					success:function(data){
						console.log(data);
						
						var frm = document.createElement("form");
			        	frm.setAttribute("charset", "UTF-8");
			        	frm.setAttribute("method", "POST");
			        	frm.setAttribute("action", "./main.do");
			        	
			        	var hiddenField = document.createElement("input");
			        	hiddenField.setAttribute("type", "hidden");
			            hiddenField.setAttribute("name", "SESSION_NAM_KOR");
			            hiddenField.setAttribute("value", $("#profile_name").val());
			            frm.appendChild(hiddenField);
			            
			            document.body.appendChild(frm);
			            frm.submit();
			            

						var frm2 = document.createElement("form");
			        	frm2.setAttribute("charset", "UTF-8");
			        	frm2.setAttribute("method", "POST");
			        	frm2.setAttribute("action", "./main.do");
			        	
			        	var hiddenField2 = document.createElement("input");
			        	hiddenField2.setAttribute("type", "hidden");
			            hiddenField2.setAttribute("name", "SESSION_NICK");
			            hiddenField2.setAttribute("value", $("#profile_nick").val());
			            frm2.appendChild(hiddenField2);
			            
			            document.body.appendChild(frm2);
			            frm2.submit();
			            
			            profileReset();
					},
					error:function(err){
						console.log(err);
					}
	        	});
        	}
        })
        
        $("#profile_now_pass").on("change",function(){

        	$.ajax({
    		type: "POST",
			url : "./pwd_profile.do",
			data:{
				USERID: uid,
				PWD: $("#profile_now_pass").val(),
				},
			success : function(data){
					if(data == '비밀번호가 일치합니다.'){
						$("#profile_now_pass_chk").val('Y')
						$("#profile_new_pass").prop("disabled",false);
						$("#profile_new_pass_2").prop("disabled",false);
						$("#profile_new_pass").val("");
						$("#profile_new_pass_2").val("");
						$("#profile_new_pass_chk").val("");
					}
					else{
						$("#profile_now_pass_chk").val('');
						$("#profile_new_pass").prop("disabled",true);
						$("#profile_new_pass_2").prop("disabled",true);
						$("#profile_new_pass").val("");
						$("#profile_new_pass_2").val("");
						$("#profile_new_pass_chk").val("");
					}
				}
        	})
        })
        
        $(".P_password").on("change",function(){

			if($("#profile_new_pass").val() == $("#profile_new_pass_2").val()){
				$("#profile_new_pass_chk").val('Y')
			}
			else{
				$("#profile_new_pass_chk").val('')
			}
        })
    });
    
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
						$('.nav_menu_section').append("<div id='"+result[i].TEAM_ID+"' class='menu_div'><div id='t"+i+"' class='marker'></div><h5 class='menu_txt'>"+result[i].TEAM_NAME+"</h5></div>");
						$('.swiper-wrapper').append("<div id='"+result[i].TEAM_ID+"' class='team_div swiper-slide'><h3>"+result[i].TEAM_NAME+"</h3><hr></div>");
						$('.marker')[i].style.backgroundColor = '#'+result[i].TEAM_ID.substr(0,6);
						$('.msg').css('display','none');
						$('.empty_div').css('display','none');
						
						$('#team').append("<option value='"+result[i].TEAM_ID+"'>"+result[i].TEAM_NAME+"</option>")
					}
				}
				
			},
			error:function(err){
				console.log(err);
			}
		});
    	loadBK()
    	todaySch()
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
					console.log(result[i].URL);
					$('.bk_url')[result[i].SLOT].value = result[i].URL;
					$('.bk_fav')[result[i].SLOT].src = result[i].URL+'/favicon.ico';
					// $('.bk_name')[result[i].SLOT].innerText = result[i].BK_NAME;
				}
			},
			error: function(err){
				console.log(err);
			}
        });
	}
    
    function todaySch(){
    	$.ajax({
        	type: "POST",
			url : "./Today_Schedule.do",
			data: {
				USERID: uid
			},
			async: false,
			success:function(data){
				var result = JSON.parse(data);
				
				for(var i = 0; i<result.length; i++){
					console.log(result[i]);
					$('#'+result[i].TEAM+'.team_div').append("<div>"+result[i].TITLE+"<p>("+result[i].TIME_FROM+"~"+result[i].TIME_TO+")</p></div>");
				}
			},
			error: function(err){
				console.log(err);
			}
        });
    }
    function profileReset(){
    	
    	$.ajax({
        	type: "POST",
			url : "./select_profile.do",
			data: {
				USERID: uid
			},
			async: false,
			success:function(data){
				var result = JSON.parse(data);

		    	$(".profile_input").val("");

		    	$("#profile_id").val(result[0].ID);
		    	$("#profile_name").val(result[0].USERNAME);
		    	$("#profile_nick").val(result[0].NICKNAME);
		    	$("#profile_phone").val(result[0].TEL);
		    	$("#profile_address").val(result[0].ADDR);
		    	$(".profile_image_div").css("background-image","url(/SSOO/Company/proFile/" + result[0].FILE_SAVE_NAME + ")");
// 		    	$("#profile_image_preview").attr("src","/proFile/" + result[0].FILE_SAVE_NAME);
		    	
		    	console.log(result);
			},
			error: function(err){
				console.log(err);
			}
        });
    }
    
    function readURL(input) {
    	  if (input.files && input.files[0]) {
    	    var reader = new FileReader();
    	    reader.onload = function(e) {
//     	      document.getElementById('profile_image_preview').src = e.target.result;
			$(".profile_image_div").css("background-image", "url(" + e.target.result + ")");
    	    };
    	    reader.readAsDataURL(input.files[0]);
    	  } else {
  			$(".profile_image_div").css("background-image","");
//     	    document.getElementById('profile_image_preview').src = "";
    	  }
    	}
</script>
</html>