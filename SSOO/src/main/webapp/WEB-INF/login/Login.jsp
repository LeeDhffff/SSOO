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
        <div class="container">
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
                    <a href="./Find.do">ID / 비밀번호 찾기</a>
                    <a href="./Join.do">회원가입</a>
                </div>
			</div>            
        </div>
    </div>
</body>
<script>
	$(document).ready(function(){
		
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
	    				location.href = "/SSOO";
	    			}else if (relt.resultMsg == "0"){
	    				alert("아이디 또는 비밀번호를 확인하세요.");
	    			}
	    		},
	    		error : function(xhr, status, error){
	    			console.log(error);
	    		}
			});
			
		}
	});
</script>
</html>