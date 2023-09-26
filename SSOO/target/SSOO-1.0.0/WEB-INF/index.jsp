<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <jsp:forward page="/egovSampleList.do"/> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="kr">    
    <title>JMT - 스케쥴러</title>
</head>
<style type="text/css">
	:root {
              --green-color: #1abc9c;
              --blue-color: rgb(57, 35, 252);
              --light-gray: rgb(197, 197, 197);
              --individual: #0F31A7;
              --company: #FF4E43;
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
			width: 90%;
		    position: absolute;
		    top:50%;
		    left: 50%;
		    transform:translate(-50%,-50%);
		    text-align: center;
		    display: flex;
			align-items: center;
			padding: 20px;
		}				
		
		.choice
		{
			width: 50%;
		}
		
		.choice.individual 
		{
			border-right: 1px solid #dadada;
		}
		
		.con_div 
		{
			padding: 60px 0;
		}
		
		.con_div>img 
		{
			 display: block;
   			 margin: 0 auto;
		}
		
		.con_div>button 
		{
			 width: 220px;
			 height: 50px;
			 border-radius: 5px;
			 color: #fff;
			 border:0;
			 font-size: 16px;
			 cursor: pointer;			 
		}
		
		.con_div>button.individual 
		{
			background: var(--individual);
		}
		
		.con_div>button.company 
		{
			background: var(--company);
		}
	</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
    <div class="main-container">    	
        <div class="container">
            <img src="./images/login/note.l.png" alt="#" class="note">
            <div class="form">                
                <div class="choice individual">
                	<div class="con_div">
                		<img src="./images/login/individual.svg" alt="#" class="note">
                		<button class="button individual">개인모드로 바로가기</button>
                	</div>
                </div>
                <div class="choice company">
                	<div class="con_div">
                		<img src="./images/login/company.svg" alt="#" class="note">
                		<button class="button company">회사모드로 바로가기</button>
                	</div>
                </div>
			</div>            
        </div>
    </div>
</body>

<script type="text/javascript">
var uid = '<%=(String)session.getAttribute("SESSION_COD_MEMB")%>';
	console.log(uid);

	$(document).ready(function(){

		if(uid == '' || uid == 'null' || uid == null){
			location.href = "Login.do";
		}
	
		$(".individual").on('click',function(){
			location.href = "Individual.do"
		})
		$(".company").on('click',function(){
			location.href = "Company/main.do"
		})
	})

</script>
</html>