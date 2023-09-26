<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <title>회원가입</title>
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
                height: 680px;
                border-radius: 7px;
                box-shadow: 0 6px 12px rgba(179, 179, 179, 0.7);
                z-index: 1;
                overflow: hidden;
            }

            form {
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
            .join-btn {
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
            .join-btn {
                border: 1px solid #8c8c8c;
                background: var(--green-color);
                cursor: pointer;
                font-size: 20px;
                color: #fff;
                text-transform: uppercase;
            }

            .join-btn:focus,
            .join-btn:hover {
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
                <form>
                    <div>
                        <h1>회원가입</h1>
                    </div>

                    <div class="input">
                        <input type="text" name="id" id="id" required
                            title="Please enter your Id here" />
                        <label for="id">ID</label>
                        <p class="warning"></p>
                    </div>

                    <div class="input">
                        <input type="password" name="password" id="password" required
                            title="Please enter your Password here" />
                        <label for="username">비밀번호</label>
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
    </div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
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
				ID: $('#id').val(),
				PW: $('#password').val(),
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
		$('#id').on('change',function(evt,ui){
			var id = $('#id').val();
			
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
	});
</script>
</html>