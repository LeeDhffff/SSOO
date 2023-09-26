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
		
		.container
		{
		    position: relative;      
		}
		
		.form 
		{
		    position: absolute;
		    top:50%;
		    left: 48%;
		    transform:translate(-50%,-50%);
		    text-align: center;
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
                <input type="text" name="username" id="username" required title="Please enter your Username here" placeholder="아이디">
                <input type="password" name="password" id="password" required title="Please enter your Password here" placeholder="비밀번호">                               
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
        </div>
        <div class="container join" style="display:none;">
            <div>
                <form>
                    <div>
                        <h1>회원가입</h1>
                    </div>

                    <div class="input">
                        <input type="text" name="Join_id" id="Join_id" required
                            title="Please enter your Id here" />
                        <label for="Join_id">ID</label>
                        <p class="warning"></p>
                    </div>

                    <div class="input">
                        <input type="password" name="Join_password" id="Join_password" required
                            title="Please enter your Password here" />
                        <label for="Join_password">비밀번호</label>
                    </div>
                    
                    <div class="input">
                        <input type="password" name="password_confirm" id="password_confirm" required
                            title="Please enter your Password here" />
                        <label for="password_confirm">비밀번호 확인</label>
                    </div>
                    
                    <div class="input">
                        <input type="text" name="username" id="username" required
                            title="Please enter your Username here" />
                        <label for="username">이름</label>
                    </div>
                    
                    <div class="input">
                        <input type="email" name="email" id="email" required
                            title="Please enter your E-Mail here" />
                        <label for="email">메일</label>
                    </div>
                    
                    <div class="input">
                        <input type="tel" name="phone" id="phone" required
                            title="Please enter your Phone Number here" />
                        <label for="phone">전화번호</label>
                    </div>
                    
                    <div class="input">
                        <input type="text" name="addr" id="addr" required
                            title="Please enter your Address here" />
                        <label for="addr">주소</label>
                    </div>

					<div class="input">
                        <input type="text" name="perpose" id="perpose" required
                            title="Please enter your Perpose here" />
                        <label for="perpose">사용목적(선택)</label>
                    </div>
                    
                    <div class="input">
                        <input type="text" name="contact" id="contact" required
                            title="Please enter your Contact here" />
                        <label for="contact">알게된 경로(선택)</label>
                    </div>

                    <input type="submit" value="가입하기" class="join-btn" />
                </form>
            </div>
        </div>
        <div class="container find" style="display:none;">
               <div class="find_id form">
                   <div>
                       <h1>ID 찾기</h1>
                   </div>

					<div class="input">
                       <input type="text" name="findid_username" id="findid_username" required
                           title="Please enter your Username here" />
                       <label for="findid_username">이름</label>
                   </div>

                   <div class="input">
                       <input type="email" name="findid_email" id="findid_email" required
                           title="Please enter your E-Mail here" />
                       <label for="findid_email">메일</label>
                   </div>
                   
                   <div class="input">
                       <input type="tel" name="findid_phone" id="findid_phone" required
                           title="Please enter your Phone Number here" />
                       <label for="findid_phone">전화번호</label>
                   </div>
                
                   <input type="submit" value="ID찾기" class="id_btn" />
               </div>
               
               <div class="find_pw form">
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
               </div>
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
		
		
		$('.join-btn').on('click',function(){
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
				NAME: $('#username').val(),
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