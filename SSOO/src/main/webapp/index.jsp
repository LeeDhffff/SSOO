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
<style>
body{
	margin: auto;
    text-align: center;
}
.main{
	width:100%;
	height:100%;
}
.button{
    width: 200px;
    height: 100px;
    font-size: 1.5em;
    color: white;
    cursor: pointer; 
    border: 0px;
    border-radius: 10px;
}
#individual{
	background : #ff688b;
}
#company{
	background : #8d68ff;
}
</style>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
<body>

	<div class="main">
		<button class="button" id="individual">개인</button>
		<button class="button" id="company">회사</button>
	</div>
	
	
</body>

<script type="text/javascript">
	$(document).ready(function(){
		$("#individual").on('click',function(){
			location.href = "Individual.do"
		})
		$("#company").on('click',function(){
			location.href = "company/main.do"
		})
	})

</script>
</html>