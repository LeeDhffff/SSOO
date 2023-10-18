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
</head>
<style type="text/css">
.minimodal .btn{
	cursor: pointer;
	text-align: center;
	border-radius: 5px;
	outline: none;
	font-weight: 500;
}
.dimLayer{
	display: block;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	position: fixed;
	left: 0;
	top: 0px;
	margin: 0;
	padding: 0;
	z-index: 9998;
}
.minimodal{
	width: 600px;
	height: 252px;
	border-radius: 10px;
	padding: 80px 24px;
	box-sizing: border-box;
	text-align: center;
	}
.modal-section{
	background: #ffffff;
	box-sizing: border-box;
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	display: none;
	z-index: 9999;
}
.menu_msg{font-size: 21px;font-weight: 500;}
.enroll_box p{padding-bottom: 56px;}
.gray_btn {width: 150px;background: #000000;color: white;height: 40px;line-height: 40px;transition: 0.1s;font-size: 17px;}
.pink_btn {width: 150px;background: var(--main-color);color: #fff;height: 40px;line-height: 40px;transition: 0.1s;font-size: 17px;border: none;}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
        
        <!-- confirm 모달을 쓸 페이지에 추가 start-->
        <section class="minimodal modal-section type-confirm">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn btn_ok">확인</button>
                <button class="btn gray_btn modal_close">취소</button>
            </div>
        </section>
        <!-- confirm 모달을 쓸 페이지에 추가 end-->

        <!-- alert 모달을 쓸 페이지에 추가 start-->
        <section class="minimodal modal-section type-alert">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn modal_close">확인</button>
            </div>
        </section>
        <!-- alert 모달을 쓸 페이지에 추가 end-->
</body>

<script type="text/javascript">
var popup_alert = {
		timer : 200, // 1000 = 1초
	    confirm : function(txt, callback){
	        if(txt == null || txt.trim() == ""){
	            console.warn("confirm message is empty.");
	            return;
	        }else if(callback == null || typeof callback != 'function'){
	            console.warn("callback is null or not function.");
	            return;
	        }else{
	            $(".type-confirm .btn_ok").on("click", function(){
	                $(this).unbind("click");
	                callback(true);
	                popup_alert.close(this);
	            });
	            this.open("type-confirm", txt);
	        }
	    },

	    alerts : function(txt){
	        if(txt == null || txt.trim() == ""){
	            console.warn("confirm message is empty.");
	            return;
	        }else{
	            this.open("type-alert", txt);
	            $(".pink_btn.modal_close").focus();
	        }
	    },

	    open : function(type, txt){
	        var popup_alert = $("."+type);
	        popup_alert.find(".menu_msg").text(txt);
	        $("body").append("<div class='dimLayer'></div>");
	        $(".dimLayer").css('height', $(document).height()).attr("target", type);
	        popup_alert.fadeIn(this.timer);
	    },

	    close : function(target){
	        var modal = $(target).closest(".modal-section");
	        var dimLayer;
	        if(modal.hasClass("type-confirm")){
	            dimLayer = $(".dimLayer[target=type-confirm]");
	            $(".type-confirm .btn_ok").unbind("click");
	        }else if(modal.hasClass("type-alert")){
	            dimLayer = $(".dimLayer[target=type-alert]")
	        }else{
	            console.warn("close unknown target.")
	            return;
	        }
	        modal.fadeOut(this.timer);
	        setTimeout(function(){
	            dimLayer != null ? dimLayer.remove() : "";
	        }, this.timer);
	    }
	}


$(function () {
    //사용 예시 **************************
//     $(document).on("click", "#confirm", function () {
//         popup_alert.confirm("그래도 하시겠습니까?", function (res) {
//             if (res) {
//                 popup_alert.alerts("확인창을 눌렀습니다.");
//             }
//         })
//     });

//     $(document).on("click", "#alert", function () {
//         popup_alert.alerts("경고창 테스트!!!");
//     });

    //사용 예시 **************************

    	window.addEventListener("keydown", function(e){
            if(e.code == 'Enter' && $(".type-alert").css("display") == 'block'){
                // 개인으로 이동
                $('.modal_close').focus();
                $('.modal_close').click();
            }
            else if(e.code == 'Enter' && $(".type-confirm").css("display") == 'block'){
                // 개인으로 이동
                $('.modal_close').focus();
                $('.modal_close').click();
            }
        });
    
    $(".modal_close").on("click", function () {
        popup_alert.close(this);
    });
});
</script>
</html>