<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <title>로그인</title>
    <meta charset='utf-8' />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<style type="text/css">
	:root {
              --green-color: #1abc9c;
              --blue-color: rgb(57, 35, 252);
              --light-gray: rgb(197, 197, 197);
          }

          * 
          {
              margin: 0;
              padding: 0;
              box-sizing: border-box;
          }
          body 
          {
              font-family: "Source Sans Pro", sans-serif;              
          }

          .main-container 
		{
		    background-image: url(./images/login/login_bg.svg);
		    min-height: 100vh;
		    width: 100%;
		    background-repeat: no-repeat;
		    background-position: center;
		    background-size: cover;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		}
		
		/*------  container.login  ------*/
		
		.container
		{
		    position: relative;      
		}
		
		.container > .form 
		{
		    height: 550px;
		    position: absolute;
		    top:50%;
		    left: 48%;
		    transform:translate(-50%,-50%);
		    text-align: center;
		    padding: 40px 20px;
		}
		
		
		input 
		{
		    width: 400px;
		    height: 50px;
		    border: 1px solid #dadada;
		    border-radius: 5px;   
		    padding-left: 10px;
		    margin-bottom: 20px;
		}
		
		.logo 
		{
		    margin-bottom: 60px;
		    text-align: center;
		}
		
		input::placeholder 
		{
		    color: #ccc;
		}
		
		.id_save 
		{
		    display: flex;    
		    width: 400px;
		    margin: 10px 0 30px;
		    align-items: center;
		}
		
		.id_save_check 
		{
		    width: 18px;
		    height: 18px;
		    border: 1px solid #dadada;
		    border-radius: 5px;
		    margin-right: 10px;
		    margin-bottom:0;
		}
		
		.id_save_h3
		{
		    color: #999;
		    font-weight: 300;
		    font-size: 16px;
		}
		
		#btn_signin 
		{
		    width: 400px;
		    height: 55px;
		    background: #FF4E43;
		    color: #fff;
		    font-size: 18px;
		    font-weight: 900;
		    border-radius: 5px;
		    border:0;
		}
		
		.bottom_con 
		{
		    width: 400px; 
		    display: flex; 
		    justify-content: space-between;
		    margin-top: 30px;       
		}
		
		.bottom_con > a 
		{
		    color: #999;
		    font-weight: 400;
		    font-size: 16px; 
		}
		
		.hidden{
			display: none;
		}
		
		
		/*----- container.join  -----*/
		
		/*-- 회원가입  --*/
		
		.join_title 
		{
			margin-bottom: 50px;
		}
		
		.container.join > .form > .input 
		{
			margin-bottom: 20px;
		}
		
		.container.join > .form > .input > h5 
		{
			text-align: left;
			color: #999;
			font-size: 14px;
			font-weight: 400;
			margin-top: 5px;
		}
		
		.container.join > .form > .input > input 
		{
			margin-bottom: 0;
		}
		
		.input.agree 
		{
			display: flex;
    		align-items: center;
		}
		
		.input.agree.hidden 
		{
			display: none;
		}
		
		.container.join > .form > .input.agree > h5 
		{
			margin-top: 0;
		}
		
		input#agree 
		{
			width: 15px;
			height: 15px;
			margin-top: 3px;
		}
		
		.agree_check_txt 
		{
			margin-left: 10px;
		}
		
		.agree_see 
		{
			margin-left: auto;
			cursor:pointer;
		}
		
		.join-btn.next, .join-btn.join, .id_btn, .pw_btn  
		{
		    width: 400px;
		    height: 55px;
		    background: #FF4E43;
		    color: #fff;
		    font-size: 18px;
		    font-weight: 900;
		    border-radius: 5px;
		    border:0;
		    margin-top: 45px;
		}
		
		/*-- 회원정보입력  --*/
		
		.join_title2 
		{
			margin-bottom: 50px;
		}
		
		.form_con 
		{
			height: calc(100% - 20px);
		    overflow: scroll;
		    padding: 0 20px;
		}
		
		.form_con > .input 
		{
			display: flex;
			align-items: center;
			margin-bottom: 20px;
		}
		
		.input_con_title 
		{
			width: 60px;
			text-align: left;
		}
		
		.form_con > .input >input 
		{
			    width: 320px;
    			margin-bottom: 0;
    			margin-left: auto;
		}
		
		.input.code 
		{
			display: flex;   			
		}
		
		input#code, input#addr 
		{
			width: 180px;
		}
		
		button.btn_auth, button.btn_location
		{
			width: 120px;
    		height: 50px;
    		border: 1px solid #FF4E43;
    		border-radius: 5px;
    		background: #fff;
    		color: #FF4E43;
    		font-size: 16px;
    		font-weight: 600;
    		margin-left: auto;
		}
		
		.join-btn.join  
		{
			margin-bottom: 45px;
		}
		
		/*----- container.find  -----*/
		
		/*-- 아이디 찾기  --*/
		
		.form.find_id
		{
			left: 8%;
			top: 50%;
			transform: translate(0,-50%);
			border-right: 1px dashed #dadada;
    		padding-right: 70px;
		}
		
		.form.find_id > .form_con, .form.find_pw > .form_con 
		{
			overflow: initial;
		}
		
		.find_title1, .find_title2 
		{
			margin-bottom: 50px;
		}
		
		.input.code.find > #code2 
		{
			width: 180px;
		}
		
		.id_btn 
		{
			margin-top: 115px;
		}
		
		/*-- 비밀번호 찾기  --*/
		.find_pw.form
		{
			left: 74%;
		}
	</style>
</head>

<body>
    <div class="main-container">    	
        <div class="container login">
            <img src="./images/login/note_s.png" alt="#" class="note">
            
            <div class="form">                
                <h1 class="logo">
                    <img src="./images/login/logo.svg" alt="#">
                </h1>            
                <input type="text" name="username" id="username" required title="Please enter your Username here" placeholder="아이디" autocomplete="off">
                <input type="password" name="password" id="password" required title="Please enter your Password here" placeholder="비밀번호" >                               
                <div class="id_save">
                    <input type="checkbox" class="id_save_check">
                    <h3 class="id_save_h3">아이디 저장</h3>
                </div>
                <button type="submit" value="로그인" id="btn_signin" class="login-btn">로그인</button>
                <div class="bottom_con">
                    <a id="gofind" href="#">ID / 비밀번호 찾기</a>
                    <a id="gojoin" href="#">회원가입</a>
                </div>
			</div> 
			           
        </div> <!-- container.login -->
        
        
        <div class="container join" style="display:none;">
        	<img src="./images/login/note_s.png" alt="#" class="note">
            <div class="form">
                
                <!--회원가입 -->
            	<h1 class="join_title">회원가입</h1>

                <div class="input userid">
                    <input type="text" name="Join_id" placeholder="아이디" id="Join_id" required
                        title="Please enter your Id here" autocomplete="off"/>
                    <p class="warning"></p>
                </div>

                <div class="input pwd">
                    <input type="password" name="Join_password" placeholder="비밀번호" id="Join_password" required
                        title="Please enter your Password here" autocomplete="off"/>
                    <h5>숫자, 영문, 특수문자 포함 8자이상</h5>
                </div>
                
                <div class="input confirm">
                    <input type="password" name="password_confirm" placeholder="비밀번호 재입력" id="password_confirm" required
                        title="Please enter your Password here" autocomplete="off"/>
                </div>
                
                <div class="input agree">
                    <input type="checkbox" id="agree">
                    <h5 class="agree_check_txt">[필수] 이용 약관에 동의합니다.</h5>
                    <h5 class="agree_see">보기</h5>
                </div>
                
                <button type="submit" value="다음" class="join-btn next">다음</button>
                
<!--                 <div class="input username hidden"> -->
<!--                     <input type="text" name="Join_username" id="Join_username" required -->
<!--                         title="Please enter your Username here" /> -->
<!--                     <label for="Join_username">이름</label> -->
<!--                 </div> -->
    
<!------------------회원정보 입력 ------------------------->
                
                <h1 class="join_title2 hidden">회원정보 입력</h1>
                
	                
                	<div class="form_con hidden">
                	
                	
	                <div class="input username hidden">
                		<h5 class="input_con_title">이름</h5>
	                    <input type="text" name="Join_username" id="Join_username" placeholder="이름"  required
	                        title="Please enter your Username here" autocomplete="off"/>
	                </div>
	                
	                <div class="input nickname hidden">
                		<h5 class="input_con_title">닉네임</h5>
	                    <input type="text" name="nickname" id="nickname" placeholder="닉네임" required
	                        title="Please enter your Nickname here" autocomplete="off"/>
	                </div>
	                
                	<div class="input mail hidden">
                		<h5 class="input_con_title">이메일</h5>
	                	<input type="email" name="email" placeholder="이메일" 
	                    id="email" required title="Please enter your E-Mail here" autocomplete="off"/>
	                </div>               
	                
	                <div class="input tel hidden">
	                <h5 class="input_con_title">전화번호</h5>
	                    <input type="tel" name="phone" id="phone" placeholder="'-'제외, 전화번호 입력"
	                    required title="Please enter your Phone Number here" autocomplete="off"/>
	                </div>                 
	                
	                <div class="input code hidden">
	                	<h5 class="input_con_title">인증번호</h5>
	                    <input type="text" name="code" id="code" required placeholder="인증번호 입력"
	                        title="Please enter your Address here" autocomplete="off" />
	                    <button type="button" class="btn_auth">인증번호 받기</button>
	                </div>
	                
	                <div class="input addr hidden">
	                	<h5 class="input_con_title">주소</h5>
	                    <input type="text" name="addr" placeholder="주소 입력" id="addr" required
	                        title="Please enter your Address here" autocomplete="off"/>
	                    <button type="button" class="btn_location">우편번호 찾기</button>
	                </div>
	                
	                <div class="input addr2 hidden">
	                	<input type="text" name="addr" placeholder="상세 주소 입력" id="addr2" required
	                        title="Please enter your Address here" autocomplete="off"/>
	                </div>
	
					<div class="input perpose hidden">
						<h5 class="input_con_title">사용목적</h5>
	                    <input type="text" name="perpose" placeholder="어떤 용도로 사용하실 건가요? (선택)" id="perpose" required
	                        title="Please enter your Perpose here" autocomplete="off"/>
	                </div>
	                
	                <div class="input contact hidden">
	                	<h5 class="input_con_title">컨텍경로</h5>
	                    <input type="text" name="contact" placeholder="JTM을 어디서 처음 접하셨나요? (선택)"id="contact" required
	                        title="Please enter your Contact here" autocomplete="off"/>
	                </div>
	                
	                <button type="submit" value="가입하기" class="join-btn join hidden">가입하기</button>
                </div>
                
            </div>
        </div>
        <div class="container find" style="display:none;">
        	<img src="./images/login/note.l.png" alt="#" class="note">
        	
        	<div class="form find_id">              
                
                <h1 class="find_title1">아이디 찾기</h1>
                
                <div class="form_con">
                
                	<div class="input name find">
                		<h5 class="input_con_title">이름</h5>
	                	<input type="email" name="email" placeholder="이름 입력" 
	                    id="findid_username" required title="Please enter your Name here" autocomplete="off"/>
	                </div>
	                
                	<div class="input email find">
                		<h5 class="input_con_title">이메일</h5>
	                	<input type="email" name="email" placeholder="이메일" 
	                    id="findid_email" required title="Please enter your E-Mail here" autocomplete="off"/>
	                </div>               
	                
	                <div class="input tel find">
	                <h5 class="input_con_title">전화번호</h5>
	                    <input type="tel" name="phone" id="findid_phone" placeholder="'-'제외, 전화번호 입력"
	                    required title="Please enter your Phone Number here" autocomplete="off"/>
	                </div>                 
	                
	                <div class="input code find">
	                	<h5 class="input_con_title">인증번호</h5>
	                    <input type="text" name="code" id="code2" required placeholder="인증번호 입력"
	                        title="Please enter your Address here" autocomplete="off"/>
	                    <button type="button" class="btn_auth">인증번호 받기</button>
	                </div>
	                
	                <button type="submit" value="ID찾기" class="id_btn">아이디 조회하기</button>
                </div>
                
            </div>
            
            <div class="form find_pw">              
                
                <h1 class="find_title2">비밀번호 찾기</h1>
                
                <div class="form_con">
                
                	<div class="input id find">
                		<h5 class="input_con_title">아이디</h5>
	                	<input type="text" placeholder="ID 입력" name="findpw_id" id="findpw_id" 
	                    required title="Please enter your ID here" autocomplete="off"/>
	                </div>
                
                	<div class="input name find">
                		<h5 class="input_con_title">이름</h5>
	                	<input type="email" placeholder="이름 입력" name="findpw_username" 
	                	id="findpw_username" required title="Please enter your Username here" autocomplete="off"/>
	                </div>
	                
                	<div class="input email find">
                		<h5 class="input_con_title">이메일</h5>
	                	<input type="email" name="findpw_email" id="findpw_email" 
	                	placeholder="이메일" required title="Please enter your E-Mail here" autocomplete="off"/>
	                </div>               
	                
	                <div class="input tel find">
	                <h5 class="input_con_title">전화번호</h5>
	                    <input type="tel" name="findpw_phone" id="findpw_phone" placeholder="'-'제외, 전화번호 입력"
	                    required title="Please enter your Phone Number here" autocomplete="off"/>
	                </div>                 
	                
	                <div class="input code find">
	                	<h5 class="input_con_title">인증번호</h5>
	                    <input type="text" name="code" id="code2" required placeholder="인증번호 입력"
	                        title="Please enter your Address here" autocomplete="off"/>
	                    <button type="button" class="btn_auth">인증번호 받기</button>
	                </div>
	                
	                <button type="submit" value="비밀번호찾기" class="pw_btn">비밀번호 조회하기</button>
                </div>
                
            </div>   
               
               <!-- <div class="find_pw form hidden">
               	   <div>
                       <h1>비밀번호 찾기</h1>
                   </div>
				   
                   <div class="input">
                       <input type="text" name="findpw_id" id="findpw_id" required
                           title="Please enter your ID here" />
                       <label for="findpw_id">ID</label>
                   </div>

					<div class="input">
                       <input type="text" name="findpw_username" id="findpw_username" required
                           title="Please enter your Username here" />
                       <label for="findpw_username">이름</label>
                   </div>

                   <div class="input">
                       <input type="email" name="findpw_email" id="findpw_email" required
                           title="Please enter your E-Mail here" />
                       <label for="findpw_email">메일</label>
                   </div>
                   
                   <div class="input">
                       <input type="tel" name="findpw_phone" id="findpw_phone" required
                           title="Please enter your Phone Number here" />
                       <label for="findpw_phone">전화번호</label>
                   </div>
				   
                   <input type="submit" value="비밀번호 찾기" class="pw_btn" />
               </div> -->
        </div>
    </div>
</body>
<script>

var uid = '<%=(String)session.getAttribute("SESSION_COD_MEMB")%>';


	$(document).ready(function(){

		if(uid != '' && uid != null && uid != 'null'){
			location.href = "Main.do";
		}
		
		$("#btn_signin").on("click", function(){
    		signin();
    	});
		
		/* 엔터 입력 시 */
		$("#password").on("keypress", function(e){
    		if(e.keyCode == 13){
    			signin();
    		}	    		
    	});
		
		/* 로그인  */
		function signin(){
			var signinData = {
	   			ID : $("#username").val(), 
	   			PW	: $("#password").val()
	    	};
			
			console.log(signinData);
			
			$.ajax({
				type : "POST",
	    		url : "signIn.do",
	    		data : signinData,
	    		success : function(result, status, xhr){
	    			var relt = JSON.parse(result);
	    			console.log(relt);
	    			if(relt.resultMsg == "1"){
	    				location.href = "Main.do";
	    			}else if (relt.resultMsg == "0"){
	    				alert("아이디 또는 비밀번호를 확인하세요.");
	    			}
	    		},
	    		error : function(xhr, status, error){
	    			console.log(error);
	    		}
			});
			
		}
		
		
		$("#gojoin").on("click",function(){
			
			$(".container.login").hide();
			$(".container.join").show();
			
		})
		
		$("#gofind").on("click",function(){
			
			$(".container.login").hide();
			$(".container.find").show();
			
		})
		
		$('.join-btn.next').on('click',function(){
			// $('.join-btn.next').css('display','none');
			$('.input.userid').addClass('hidden');
			$('.input.pwd').addClass('hidden');
			$('.input.confirm').addClass('hidden');
			$('.join-btn.next').addClass('hidden');
			$('.input.agree').addClass('hidden');
			$('.join_title').addClass('hidden');
			
			$('.form_con').removeClass('hidden');
			$('.join_title2').removeClass('hidden');
			$('.input.tel').removeClass('hidden');
			$('.input.mail').removeClass('hidden');
			$('.input.code').removeClass('hidden');
			$('.input.addr').removeClass('hidden');
			$('.input.addr2').removeClass('hidden');
			$('.input.perpose').removeClass('hidden');
			$('.input.contact').removeClass('hidden');
			
			$('.join-btn.join').removeClass('hidden');
		})
		
		$('.btn_send').on('click',function(){
			console.log('인증번호 보내기');
			var mail = $('#email').val();
			
			console.log(mail);
			
			$.ajax({
				type: "POST",
				url:"/api/member/email",
				data: {userEmail:mail},
				success: function(data){ console.log(data) },
				error: function(err){ console.log(err) }
			});
		});
		
		$('.join-btn.join').on('click',function(){
			var perpose, contact;
			
			if($('#perpose').val() != ""){
				perpose = $('#perpose').val();
			}else{
				perpose = "";
			}
			
			if($('#contact').val() != ""){
				contact = $('#contact').val();
			}else{
				contact = "";
			}
			
			var submitData = {
				ID: $('#Join_id').val(),
				PW: $('#Join_password').val(),
				NAME: $('#Join_username').val(),
				NICK: $('#nickname').val(),
				EMAIL: $('#email').val(),
				TEL: $('#phone').val().replaceAll('-',''),
				ADDR: $('#addr').val(),
				PERPOSE: perpose,
				CONTACT: contact
			};
			console.log(submitData);
			$.ajax({
				type: "POST",
				url : "signUp.do",
				data: submitData,
				async: false,
				success:function(data){
					alert('회원가입이 완료되었습니다.');
					// 로그인 페이지로 이동
					location.href = "Login.do";
				},
				error:function(err){
					alert('회원가입에 실패했습니다.');
				}
			});
		});
		
		// ID중복체크
		$('#Join_id').on('change',function(evt,ui){
			var id = $('#Join_id').val();
			
			if(id == ""){
				$('.warning').text("");
			}else{
				$.ajax({
					type: "POST",
					url : "id_chk.do",
					data: { ID : id },
					async: false,
					success:function(data){
						var result = JSON.parse(data);
						
						if(result.resultMsg == 0) $('.warning').text("사용 가능한 ID입니다.");
						else if(result.resultMsg == 1) $('.warning').text("중복된 ID입니다.");
					},
					error:function(err){
						console.log(err);
					}
				});
			}
			
		});
		
	$('.id_btn').on('click',function(){
			
			var submitData = {
				NAME: $('#findid_username').val(),
				EMAIL: $('#findid_email').val()
			};
			console.log(submitData);
			$.ajax({
				type: "POST",
				url : "find_id.do",
				data: submitData,
				async: false,
				success:function(data){
					var result = JSON.parse(data);
					console.log(result);
					alert('회원님의 ID는 '+result.resultMsg+'입니다.');
				},
				error:function(err){
					alert('해당 정보와 일치하는 ID가 없습니다.');
				}
			});
		});
		
		$('.pw_btn').on('click',function(){
			
			var submitData = {
				ID: $('#findpw_id').val(),
				NAME: $('#findpw_username').val(),
				EMAIL: $('#findpw_email').val()
			};
			console.log(submitData);
			$.ajax({
				type: "POST",
				url : "find_pw.do",
				data: submitData,
				async: false,
				success:function(data){
					var result = JSON.parse(data);
					console.log(result);
					alert('회원님의 비밀번호는 '+result.resultMsg+'입니다.');
				},
				error:function(err){
					alert('해당 정보와 일치하는 비밀번호가 없습니다.');
				}
			});
		});
	});
</script>
</html>