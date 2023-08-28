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

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                background-color: var(--green-color);
                font-family: "Source Sans Pro", sans-serif;
            }

            .main-container {
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background: white;
            }

            .container {
                width: 400px;
                height: 300px;
                border-radius: 7px;
                box-shadow: 0 6px 12px rgba(179, 179, 179, 0.7);
                z-index: 1;
                overflow: hidden;
            }

            .form {
                width: 100%;
                height: 100%;
                display: flex;
                padding: 0px !important;
                flex-direction: column;
                align-items: center;
                background-color: white;
                justify-content: space-evenly;
            }

            a {
                text-decoration: none;
                cursor: pointer;
                color: black;
            }

            a:focus,
            a:hover {
                color: var(--blue-color);
                font-weight: bold;
            }

            .input {
                position: relative;
            }

            .input input,
            .login-btn {
                width: 260px;
                height: 45px;
                outline: none;
                padding: 0 0.7rem;
                border-radius: 3px;
                transition: 0.2s;
                font-weight: bold;
                z-index: 1;
            }

            .input input {
                border: none;
                border-bottom: 1px solid #8c8c8c;
            }
            .login-btn {
                border: 1px solid #8c8c8c;
                background: var(--green-color);
                cursor: pointer;
                font-size: 20px;
                color: #fff;
                text-transform: uppercase;
            }

            .login-btn:focus,
            .login-btn:hover {
                background: #fff;
                cursor: pointer;
                color: var(--green-color);
                text-transform: uppercase;
                border: 1px solid var(--green-color);
                transition: ease-in-out 0.2s;
            }

            .input label {
                position: absolute;
                top: 28%;
                left: 10px;
                font-size: 0.9rem;
                transition: 0.2s;
                font-weight: bold;
                padding: 0 0.1rem;
            }

            .input input:focus {
                border-bottom: 1px solid var(--green-color);
            }

            .input input:focus ~ label,
            .input input:valid ~ label {
                transform: translateY(-25px);
                font-size: 15px;
                color: var(--green-color);
                background: #fff;
            }
	</style>
</head>

<body>
    <div class="main-container">
        <div class="container">
            <div>
            	<div class="form">
					<div>
					    <h1>로그인</h1>
					</div>
					
					<div class="input">
					    <input type="text" name="username" id="username" required
					        title="Please enter your Username here" />
					    <label for="username">ID</label>
					</div>
					
					<div class="input">
					    <input type="password" name="password" id="password" required
					        title="Please enter your Password here" />
					    <label for="username">비밀번호</label>
					</div>
					
					<input type="submit" value="로그인" id="btn_signin" class="login-btn" />
					<div style="width: 65%; display: flex; justify-content: space-between;">
						<a href="./Find.do">ID / 비밀번호 찾기</a>
						<a href="./Join.do">회원가입</a>
					</div>
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