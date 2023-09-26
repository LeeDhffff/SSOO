<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 스케쥴러</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css"/>
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <link rel="stylesheet" href="../css/individual/style.css" type="text/css">
    <script type="text/javascript" src="../js/individual/index.js"></script>
<style>

</style>
<body>

   <div class="popup">
   		<div class="black">
   			<div class="pop_dialog">
   				<h3>To-Do List 생성</h3>
   			</div>
   		</div>
   </div>
  <div class="container">

        

        <header class="header">
            <h3 class="logo">
                <a href="#">
                    <img src="../images/individual/logo.png" alt="logo">
                </a>
            </h3>
            <div class="tab_div">
                <h3 class="tab individual">
                    <img src="../images/individual/foot_pink.png" alt="individual">
                </h3>
                <h3 class="tab company">
                    <img src="../images/individual/foot_blue.png" alt="company">
                </h3>
            </div>
        </header>
        <section class="section">

            <div class="to_do">
                <div class="to_do_header">
                    <div class="to_do_title_div">
                        <h3 class="watch">
                            <img src="../images/individual/watch.png" alt="watch">
                        </h3>
                        <h3 class="board_name">To-Do List</h3>
                        <h3 class="count_num">0</h3>
                    </div>
                    <div class="to_do_input_div">
                        <input type="text" id="TODO_ADD" placeholder="등록할 스케줄을 입력해주세요.">
                        <button class="creat">생성</button>
                    </div>
                    <div class="to_do_icon_div">
                        <h3 class="plus">
                            <img src="../images/individual/plus.png" alt="plus">
                        </h3>
                        <h3 class="trash">
                            <img src="../images/individual/trash.png" alt="trash">
                        </h3>
                    </div>
                </div>
                <div class="to_do_section">
                    <div class="to_do_change toggle">
                        <h3 class="change">
                            <img src="../images/individual/change.png" alt="change">
                        </h3>
                    </div>
                    
                    <!--    TO-DO리스트 헤드    -->
                    <div class="to_do_board_header">
                    </div>
                    
                    <!--    TO-DO리스트    -->
                    <div class="to_do_board_body">

                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>                       
                        <div class="to_do_board_con_grid"></div>
                    </div>
                </div>
            </div>

            <div class="diary">
                <div class="diary_header">
                    <div class="diary_title_div">
                        <h3 class="watch">
                            <img src="../images/individual/watch.png" alt="watch">
                        </h3>
                        <h3 class="board_name">달력</h3>
                    </div>
                </div>
                <div class="diary_section"></div>
            </div>

            <div class="character"></div>

        </section>
        <section class="section" style="display:none;">
        	
        </section>
        
   </div>
   
   
</body>
<script>

// dragopen()





</script>
</html>