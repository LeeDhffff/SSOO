<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>켈린더</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://code.jquery.com/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>

body{
  display: flex;
  
}
#container1{
  order : 1;
}
#container2{
  order : 2;
}
#container3{
  order : 3;
}
#container4{
  order : 4;
    
}

table, td, th {
    border-collapse : collapse;
/*     border : 1px solid black; */
};
.head{
	display: flex;
}
.header{
	display: flex;
}
.days{
	display: flex;
}
.C_header {
    width: 100px;
    height: 80px;
    border: 1px solid black;
    background-color: #ffc3d7;
    text-align: center;
    font-weight: bold;
}
.C_days {
    width: 100px;
    height: 80px;
    border: 1px solid black;
/*     background-color: #ffc3d7; */
    text-align: right;
    font-weight: bold;
}
.days .C_days:first-child{
    color: red;
}
.days .C_days:last-child{
    color: blue;
}
.canvas{
	width : 700px;
	height : 648px;
	border : 2px solid black;
}

.div{
	width : 100px;
    height: 60px;
 	border : 1px dotted black; 
}
.drag{
    position: relative;
    width: 90px;
    height: 60px;
    /* border: 1px solid black; */
    background: #ff92a5;
    border-radius: 5px;
    cursor:grab;
	
  -ms-user-select: none; 
  -moz-user-select: -moz-none;
  -khtml-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
.grid{
	width : 700px;
	height : 550px;
	border-collapse: collapse;
}
.canvas_case{
     display: flex;
	height : 80px;
	background : gray;
}

#Character{

  width: 500px;
/*   height: 500px; */
}
#gage{
  display:flex;
  width: 400px;
  height : 30px;
  border: 1px solid black;
/*   height: 500px; */
}
.ingage{

    display: block;
    width: 10%;
    height: 100%;
    background: green;
}
</style>
<body>

 	<div id="container1">
 		<h3>드래그 테스트</h3>
 		<div class="canvas_button">
 		<input id="canvas_plus_text"><button id="canvas_plus_button">+</button></div>
 		<div class="canvas">
 			<div class="canvas_case">
 			</div>
 			<table class="grid">
	 			<tr>
	 			<td class="div" xidx="1" yidx="1"></td>
	 			<td class="div" xidx="2" yidx="1"></td>
	 			<td class="div" xidx="3" yidx="1"></td>
	 			<td class="div" xidx="4" yidx="1"></td>
	 			<td class="div" xidx="5" yidx="1"></td>
	 			<td class="div" xidx="6" yidx="1"></td>
	 			<td class="div" xidx="7" yidx="1"></td>
	 			</tr>
	 			<tr>
	 			<td class="div" xidx="1" yidx="2"></td>
	 			<td class="div" xidx="2" yidx="2"></td>
	 			<td class="div" xidx="3" yidx="2"></td>
	 			<td class="div" xidx="4" yidx="2"></td>
	 			<td class="div" xidx="5" yidx="2"></td>
	 			<td class="div" xidx="6" yidx="2"></td>
	 			<td class="div" xidx="7" yidx="2"></td>
	 			</tr>
	 			<tr>
	 			<td class="div" xidx="1" yidx="3"></td>
	 			<td class="div" xidx="2" yidx="3"></td>
	 			<td class="div" xidx="3" yidx="3"></td>
	 			<td class="div" xidx="4" yidx="3"></td>
	 			<td class="div" xidx="5" yidx="3"></td>
	 			<td class="div" xidx="6" yidx="3"></td>
	 			<td class="div" xidx="7" yidx="3"></td>
	 			</tr>
	 			<tr>
	 			<td class="div" xidx="1" yidx="4"></td>
	 			<td class="div" xidx="2" yidx="4"></td>
	 			<td class="div" xidx="3" yidx="4"></td>
	 			<td class="div" xidx="4" yidx="4"></td>
	 			<td class="div" xidx="5" yidx="4"></td>
	 			<td class="div" xidx="6" yidx="4"></td>
	 			<td class="div" xidx="7" yidx="4"></td>
	 			</tr>
	 			<tr>
	 			<td class="div" xidx="1" yidx="5"></td>
	 			<td class="div" xidx="2" yidx="5"></td>
	 			<td class="div" xidx="3" yidx="5"></td>
	 			<td class="div" xidx="4" yidx="5"></td>
	 			<td class="div" xidx="5" yidx="5"></td>
	 			<td class="div" xidx="6" yidx="5"></td>
	 			<td class="div" xidx="7" yidx="5"></td>
	 			</tr>
	 			<tr>
	 			<td class="div" xidx="1" yidx="6"></td>
	 			<td class="div" xidx="2" yidx="6"></td>
	 			<td class="div" xidx="3" yidx="6"></td>
	 			<td class="div" xidx="4" yidx="6"></td>
	 			<td class="div" xidx="5" yidx="6"></td>
	 			<td class="div" xidx="6" yidx="6"></td>
	 			<td class="div" xidx="7" yidx="6"></td>
	 			</tr>
	 			<tr>
	 			<td class="div" xidx="1" yidx="7"></td>
	 			<td class="div" xidx="2" yidx="7"></td>
	 			<td class="div" xidx="3" yidx="7"></td>
	 			<td class="div" xidx="4" yidx="7"></td>
	 			<td class="div" xidx="5" yidx="7"></td>
	 			<td class="div" xidx="6" yidx="7"></td>
	 			<td class="div" xidx="7" yidx="7"></td>
	 			</tr>
	 			<tr>
	 			<td class="div" xidx="1" yidx="8"></td>
	 			<td class="div" xidx="2" yidx="8"></td>
	 			<td class="div" xidx="3" yidx="8"></td>
	 			<td class="div" xidx="4" yidx="8"></td>
	 			<td class="div" xidx="5" yidx="8"></td>
	 			<td class="div" xidx="6" yidx="8"></td>
	 			<td class="div" xidx="7" yidx="8"></td>
	 			</tr>
	 			<tr>
	 			<td class="div" xidx="1" yidx="9"></td>
	 			<td class="div" xidx="2" yidx="9"></td>
	 			<td class="div" xidx="3" yidx="9"></td>
	 			<td class="div" xidx="4" yidx="9"></td>
	 			<td class="div" xidx="5" yidx="9"></td>
	 			<td class="div" xidx="6" yidx="9"></td>
	 			<td class="div" xidx="7" yidx="9"></td>
	 			</tr>
	 		</table>
 		</div>
 		
 	</div>
 	<div id="container2">
 		<button id="change_button"> < > </button>
 	</div>
 	<div id="container3">
	 	<div>
	 		<h2>캘린더</h2>
	 		
	 		<div class="head">
	 		<button id="calandar_prev"> < </button>
	 		<h3 id="thismonth"></h3>
	 		<button id="calandar_next"> > </button>
	 		</div>
	 	</div>
	 	<div>
	 		<div id="Calandar">
	 			<div class="header" id="Calandar_header">
		 			<div class="C_header">일</div>
		 			<div class="C_header">월</div>
		 			<div class="C_header">화</div>
		 			<div class="C_header">수</div>
		 			<div class="C_header">목</div>
		 			<div class="C_header">금</div>
		 			<div class="C_header">토</div>
	 			</div>
	 			<div class="days" id="Calandar_days_first">
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
	 			</div>
	 			<div class="days" id="Calandar_days_second">
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
	 			</div>
	 			<div class="days" id="Calandar_days_third">
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
	 			</div>
	 			<div class="days" id="Calandar_days_fourth">
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
	 			</div>
	 			<div class="days" id="Calandar_days_fiveth">
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
	 			</div>
	 			<div class="days" id="Calandar_days_sixth">
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
		 			<div class="C_days"></div>
	 			</div>
	 		</div>
	 	</div>
 	</div>
 	
 	<div id="container4">
	 	<div id="Character_head">
	 		<h2>캐릭터</h2>
	 		
	 		<div class="head">
	 		<button id="Character_lvup"> up </button>
	 		<button id="Character_lvdown"> down </button>
	 		</div>
	 	</div>
	 	<div>
	 		<div id="Character">
	 			<h3>레벨 : <span id="lv">1</span></h3>
	 			<input type="hidden" id="point" value=0 >
	 		</div>
	 		<div id="levelpoint">
	 			<div id="gage">
	 			<span></span><span></span><span></span><span></span><span></span>
	 			<span></span><span></span><span></span><span></span><span></span>
	 			</div>
	 		</div>
	 	</div>
 	</div>
</body>
<script>
	var circleArr = [];
	var r = 30;
	var current = new Date();
	$(document).ready(function(){
		Calandar(current)
		for (i = 0; i < $(".drag").length; i++) {
	        var drag = $($(".drag")[i])
	        var idx = drag.attr("idx");
	        var x = drag.offset().left;
	        var y = drag.offset().top;
	
	        var left = drag.css("left");
	        var top = drag.css("top");
	        circleArr[idx] = { x: x, y: y, left: left, top: top };
    }
	})// document ready 끝
	
	dragopen();
	
	function dragopen() {
		$( '.drag' ).draggable({
			scroll : false,
			containment : '.canvas', //부모 요소 안에서만 이동 범위 제한
// 			snap: '.div',
//     		 snapMode: "inner",
  			  snapTolerance: 50,
  			stop: function (event, ui) {
  				 var idx = $(this).attr("idx");
  		        var left = $(this).css("left");
  		        var top = $(this).css("top");
  		        var x = $(this).offset().left;
  		        var y = $(this).offset().top;
				const thispr = $(this).parent();
				console.log(thispr);
  		        const element = document.elementsFromPoint(x, y);
//   		        const element2 = document.elementFromPoint(x+100, y);
//   		        const element3 = document.elementFromPoint(x, y+60);
//   		        const element4 = document.elementFromPoint(x+100, y+60);
// 				if($(element).attr(xidx) == null){
					
// 				}
  		        const element5 = document.elementsFromPoint(x+50, y+30);
  		        
//   		        console.log(element)
//   		        console.log(element2)
//   		        console.log(element3)
//   		        console.log(element4)
  		        	console.log(element5)
  		        
//   		        if($(element).attr("xidx") == $(element5).attr("xidx") && $(element).attr("yidx") == $(element5).attr("yidx")){
//   	  		        $(element).append($(this).attr("style",""))
//   		        }
//   		        else if($(element2).attr("xidx") == $(element5).attr("xidx") && $(element2).attr("yidx") == $(element5).attr("yidx")){
//   	  	  		    $(element2).append($(this).attr("style",""))
//   	  		    }
//   		        else if($(element3).attr("xidx") == $(element5).attr("xidx") && $(element3).attr("yidx") == $(element5).attr("yidx")){
//   	  	  		    $(element3).append($(this).attr("style",""))
//   	  		    }
//   		        else if($(element4).attr("xidx") == $(element5).attr("xidx") && $(element4).attr("yidx") == $(element5).attr("yidx")){
//   	  	  		    $(element4).append($(this).attr("style",""))
//   	  		    }
				var dragnum = 0;
				for(let i=0; i<element5.length; i++){
					
					if($(element5[i]).hasClass("drag") == true && dragnum == 0){
						dragnum = 1;
					}
					else if($(element5[i]).hasClass("drag") == true && dragnum > 0){

// 						var centerX = x + (r*2);
// 		  		        var centerY = y + r;

// 		  		        var thisObj = { x: centerX, y: centerY, idx: idx };
// 		  		        if (overLapChecker(".drag", thisObj)) {
// 		  		            //통과
// 		  		            circleArr[idx] = { x: x, y: y, left: left, top: top };
// //		   		            if()
// 		  		        } else {
// 		  		            //겹침
// 		  		            var obj = circleArr[idx];
// 		  		            $(".drag[idx=" + idx + "]").css("top", obj.top);
// 		  		            $(".drag[idx=" + idx + "]").css("left", obj.left);
// 		  		        }
		  		        
		  		      dragnum = 0
		  		      break;
					}
				}
				if(dragnum > 0){
	 		         $(element5[1]).append($(this).attr("style",""))
				}
				else{
					$(thispr).append($(this).attr("style",""))
				}
  			}
// 			grid: [ 99.9, 55.48 ]
// 			handle : '.header' // drag 대상 안 특정 요소에 제한 (여러개 사용 가능)
		});

		for (i = 0; i < $(".drag").length; i++) {
	        var drag = $($(".drag")[i])
	        var idx = drag.attr("idx");
	        var x = drag.offset().left;
	        var y = drag.offset().top;
	
	        var left = drag.css("left");
	        var top = drag.css("top");
	        circleArr[idx] = { x: x, y: y, left: left, top: top };
		}
	}
	$('#canvas_plus_button').click(function(){
		var idx = 1;
		$('.drag').each(function(){
			idx = Number($(this).attr('idx')) +1 ;
		})
		var plus = '<div class="drag" idx=' + idx + '>'+$('#canvas_plus_text').val()+'</div>'
		$('.canvas_case').append(plus);
		$('#canvas_plus_text').val("");
		
		dragopen();
	})
	
	function Calandar(thisdate) {
		clear()
		var current = new Date(thisdate);
		var currentYear = current.getFullYear()
		var currentMonth = current.getMonth()
		
		$("#thismonth").text(currentYear + "년 " + (currentMonth+1) + "월 ")
		var startDay = new Date(currentYear, currentMonth, 1);
		var endDay = new Date(currentYear, currentMonth+1, 0);
		var prevDate = endDay.getDate();
		var prevDay = startDay.getDay();
		var daycount = 1;
		var count = ["first","second","third","fourth","fiveth","sixth"]

		for(let i=0; i < count.length; i++){
			console.log(count[i]);
			console.log(prevDay);
			$('#Calandar_days_'+count[i]+' .C_days').each(function (index, item){
				if(prevDay == 7){
					prevDay = 0;
				}
				
				if(prevDay < 7 && daycount <= prevDate){
					if(index == prevDay){
						$(item).text(daycount);
						daycount++;
						prevDay++
					}
				}
			})
		}
	}
	function clear(){
		var count = ["first","second","third","fourth","fiveth","sixth"]

		for(let i=0; i < count.length; i++){
			$('#Calandar_days_'+count[i]+' .C_days').each(function (index, item){
				
				$(item).text("");

				
			})
		}
	}
	$("#calandar_next").click(function(){
		var currentYear = current.getFullYear()
		var currentMonth = current.getMonth()
		current = new Date(currentYear, currentMonth+1, 1);
		Calandar(current)
	})
	
	$("#calandar_prev").click(function(){
		var currentYear = current.getFullYear()
		var currentMonth = current.getMonth()
		current = new Date(currentYear, currentMonth-1, 1);
		Calandar(current)
	})
	
	function overLapChecker(className, thisObj) {
    var len = $(className).length;
    for (i = 0; i < len; i++) {
        var idx = $($(className)[i]).attr("idx");
        if (idx == thisObj.idx) {
            continue;
        } else {
            var x = circleArr[idx].x + (r*2);
            var y = circleArr[idx].y + r;
            var thisX = thisObj.x;
            var thisY = thisObj.y;

            var distance = Math.sqrt(Math.pow((x - thisX), 2) + Math.pow((y - thisY), 2));
            if ((r * 2) >= distance) {
                return false;
            }
        }
    }
    return true;
}
	

	$("#change_button").click(function(){
		if($("#container1").css("order") == 1){
			$("#container1").css("order",3)
			$("#container3").css("order",1)
			
// 			for (i = 0; i < $(".drag").length; i++) {
// 		        var drag = $($(".drag")[i])
// 		        var idx = drag.attr("idx");
		
// 		        var left = Number(drag.css("left").replaceAll("px",""));
// //	 	        var top = drag.css("top");
// 				drag.css("left", (left + 737.797) + "px")
// 			}
		}
		else if($("#container1").css("order") == 3){
				$("#container1").css("order",1)
				$("#container3").css("order",3)
				
				
// 		for (i = 0; i < $(".drag").length; i++) {
// 	        var drag = $($(".drag")[i])
// 	        var idx = drag.attr("idx");
	
// 	        var left = Number(drag.css("left").replaceAll("px",""));
// // 	        var top = drag.css("top");
// 			drag.css("left", (left - 737.797) + "px")
// 		}
		}
	})
	
	$("#Character_lvup").click(function(){
		var point = Number($("#point").val()) + 1
		
		$(".ingage").removeClass("ingage")
		for(let i=0; i<point; i++){
			$($("#gage > span")[i]).addClass("ingage")
		}
		console.log(point)
		$("#point").val(point)
		if(point == 10){

			$(".ingage").removeClass("ingage")
			$("#point").val(0)
			$("#lv").text(Number($("#lv").text()) + 1)
		}
	})
</script>
</html>