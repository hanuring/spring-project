<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style type="text/css">

	body,html{
	font-size: 0.8rem;
    }
    
    #member-part a {
    	color : #3A4CA8;
    }

	#inputState {
	margin-top: 4%;
	border-color: #3A4CA8;
	border-style: groove;
	border-width: 2px;
	border-radius: 10px;
	}

	.searchbar{
    margin-bottom: auto;
    margin-top: 1%;
    height: 24px;
    background-color: #3A4CA8;
    border-radius: 30px;
    padding-top: 1%;
    padding-left: 2%;
    padding-right: 3%;
    margin-left: -10%;
    }

    .search_input{
    color: white;
    border: 0;
    outline: 0;
    background: none;
    width: 0;
    caret-color:transparent;
    line-height : normal;
    transition: width 0.4s linear;
    }

    .searchbar:hover > .search_input{
    width: 200px;
    margin-bottom: 30%;
    padding-bottom: 5%;
    caret-color:red;
    transition: width 0.4s linear;
    }

    .searchbar:hover > .search_icon{
    background: ;
    color: #fff;
    }

    .search_icon{
    height: 10px;
    width: 10px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 70%;
    color:white;
    text-decoration:none;
    padding-top: 7px;
    }

	/* 자동 롤릴 */
	
	blockquote, q {
		quotes: none;
	}
	blockquote:before, blockquote:after,
	q:before, q:after {
		content: '';
		content: none;
	}
	table {
		border-collapse: collapse;
		border-spacing: 0;
	}
			
	.notice .rolling li a:link {
		text-decoration: none;
		font-weight: bolder;
		color: black;
	}
	
	ul{ list-style:none;}
	
	.notice{width:42%; height:50px; overflow:hidden; background-color:#fff;}
	.rolling{position:relative; width:100%; height:auto;}
	.rolling li{width:100%; height:50px; line-height:50px;}
	.rolling_stop{display:block; width:100px; height:20px; background-color:#000; color:#fff; text-align:center;}
	.rolling_start{display:block; width:100px; height:20px; background-color:#000; color:#0f0; text-align:center;}
	
</style>

</head>
<body>

<form action="">

<div class="row" style="margin-top: 1%; margin-bottom: 0.5%; margin-left: 1%;">
<div class="col-md-1" style="margin-bottom: 1%;"><br>
<a href="main.do" style="margin-bottom: 0.5%;">
<img src="resources/img/header_logo_180.PNG" id="icon" alt="User Icon" width="140" height="auto" />
</a>
</div>
<div class="col-md-11" style="padding-top: 0.5%; margin-top: 0.5%;">
<div class="col-sm-6" style="margin-left: 2%;">
<div class="col-xs-3" style="font-weight: bolder;">
<select id="inputState" class="form-control" style="width: 100px;">
	    <option selected>분류</option>
        <option>강사이름</option>
        <option>강의제목</option>
      </select>
      </div>
      <div class="col-xs-9">
      <div class="d-flex justify-content h-50" >
          <div class="searchbar" style="padding-bottom: 5%; margin-left: 0.5%;">
            <input class="search_input" type="text" name="" style="color: white; padding-bottom: 90%; margin-bottom: 2%; font-size: 13px;">
        		<a href="#" class="search_icon"><i class="fas fa-search"></i></a>
          </div>
       </div>
       </div>
      </div>
     
      <div class="col-sm-3" style="font-size: 16px; margin-right: -20%; margin-left: 0%;">
	  <div class="notice" style="align-content: center; padding-right: 3%;">
			<ul class="rolling">
				<li>
					<font color="red" >인기검색</font>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/smc_search.do?search_field=lec_name&search_keyword=운동">
						<font color="black" >1.&nbsp;운동</font>
					</a>
				</li>
				<li>
					<a href="#"><font color="black" >2.&nbsp;돈</font></a>
				</li>
				<li>
					<a href="#"><font color="black" >3.&nbsp;홈트 </font></a>
				</li>
				<li>
					<a href="#"><font color="black" >4.&nbsp;제작 </font> </a>
				</li>
				<li>
					<a href="#"><font color="black" >5.&nbsp;영상 </font> </a>
				</li>
			</ul>
		</div>   
      </div>
      <script>
		$(document).ready(function(){
			var height =  $(".notice").height();
			var num = $(".rolling li").length;
			var max = height * num;
			var move = 0;
			function noticeRolling(){
				move += height;
				$(".rolling").animate({"top":-move},600,function(){
					if( move >= max ){
						$(this).css("top",0);
						move = 0;
					};
				});
			};
			noticeRollingOff = setInterval(noticeRolling,3000);
			$(".rolling").append($(".rolling li").first().clone());
		
		});		
	</script>
      <div id="member-part" style="font-size: 16px; font-weight: bold;">
      <div class="col-sm-2" align="right" style="margin-left : 4%; margin-top: 1%;">
	  <c:set value="${member_no }" var="member_no" />
	  <c:if test="${member_no == 0 || empty member_no}">
      <a href="goto_join_member.do">회원가입</a> &nbsp;&nbsp; | 
	  <a href="goto_login_member.do" style="margin-left: 4%;">로그인</a>
	  </c:if>
	  <c:if test="${member_no != 0 && !empty member_no}">
      <a href="goto_logout_member.do">로그아웃</a> &nbsp;&nbsp; | 
	  <a href="<%=request.getContextPath() %>/goto_myInfo_member.do?no=${member_no }" style="margin-left: 4%;">MyPage</a>
	  </c:if>
	  </div>
	  
	  
	  
</div>
</div>
</div>


 

</form>

</body>
</html>