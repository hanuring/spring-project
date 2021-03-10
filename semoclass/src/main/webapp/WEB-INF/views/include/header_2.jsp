<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">

$(function() {
	var tags =[];
	$.ajax({
		ContentType:"application/x-www-form-urlencoded; charset=UTF-8",
		type: "post",
		url:'autoComplete.do',
		data:{
				'search_field':$('#search_field option:selected').val()
			 },
		dataType:'',
		success : function(data){
			$.each(data, function(id, value){
					tags.push(value);					
			});
			 $("#search_keyword").autocomplete({
			      source: tags
			    });
		}
	});
	
	$("#search_field").change(function(){
		var tags =[];
		var search_field = this.value;
		$.ajax({
			ContentType:"application/x-www-form-urlencoded; charset=UTF-8",
			type: "post",
			url:'autoComplete.do',
			data:{
					'search_field': search_field 
				 },
			dataType:'',
			success : function(data){
				$.each(data, function(id, value){
						tags.push(value);					
				});
				 $("#search_keyword").autocomplete({
				      source: tags
				    });
			}
		});
		
	});
});



</script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
a{text-decoration:none; color:#000000}
body { font-family: 'Noto Sans KR', sans-serif; font-weight: bold; }
#header {
 display: flex;
 flex-flow: row wrap;
 justify-content: space-between;
 height: 160px;
 margin-bottom: -50px;
 overflow: auto;
}

#member-part{
	display: flex;
	flex-flow: row wrap;
	justify-content: flex-end;
}


#search-form{
	width: 500px;
	height: 50px;
}

#home-btn > img{
	position: absolute;
	top:8%;
	left:0%;
	transform: translate(-50%, -50%);
}

#search-part{
	/* position: absolute;
	top:8%; 
	left:30%;
	transform: translate(-50%, -50%); */
	width: 500px;
	height: 45px;
}

#search_field, #search_keyword, .notice{
	box-sizing: border-box;
  	-moz-box-sizing: border-box;
  	-webkit-box-sizing: border-box;
}

#search_field{
	width:140px; height : 41px; font-size: 15px; color:#999; border :2px solid white;
	border-bottom-color: #3d4ea2;
/*  	appearance:none; -webkit-appearance:none; */
	vertical-align: middle;
/* 	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); */
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
    height: 50px;
}
#search_field:focus{
	outline: none;
	}
#search_field > option {
	width: 100px;
}
#search_keyword{
	width: 300px; height: 35px; font-size:15px; border:2px solid #3d4ea2; 
	overflow: auto;
	vertical-align: middle;
	border-top: none;
	border-left: none;
	border-right:none;
	border-bottom: 2px solid #3d4ea2;
/*     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); */
    font-family: 'Noto Sans KR', sans-serif;
    height: 50px;
}
#search_keyword:focus {outline:none;}
#search_btn{
	background-color: white;
	border: 0px;
	margin-left : -45px;
	width: 20px;
	margin-right: 0;
	vertical-align: middle;
}

.fa-user-slash{
	color: #6d7afe;
}
.fa-user{
	color: #6d7afe;
}

#login-btn{
	background-color: white;
	border : 0px; 
	cursor: pointer;
	width: 60px;
	height: 100px;
	margin-top: 10%;
	margin-right: 2%;
}
#join-btn{
	background-color: white;
	border : 0px; 
	cursor: pointer;
	height: 100px;
	margin-top: 10%;
	margin-left: -4%;
}

#member-part{
	display: flex;
	flex-flow: row wrap;
	justify-content: space-between;
	width: 200px;
}
.member_part{
	width : 100px;
	height: 100px;
}
	ul{ list-style:none;}
	
	.notice{width:100%; height:50px; overflow:hidden; background-color:#fff;}
	.rolling{position:relative; width:100%; height:auto;}
	.rolling li{width:100%; height:50px; line-height:50px;}
	.rolling_stop{display:block; width:100px; height:20px; background-color:#000; color:#fff; text-align:center;}
	.rolling_start{display:block; width:100px; height:20px; background-color:#000; color:#0f0; text-align:center;}

</style>
</head>
<body>
<table style="width: 100%;">
	<tr>
		<td width="20%" align="center">
		<!-- 홈버튼 / 검색창 / 공백  / 공백 / 내쿠폰 / 내클래스 /마이페이지 버튼-->
			<div id="home-btn">
			<a href="<%=request.getContextPath()%>/main.do"><img alt="홈버튼 아이콘" src="resources/img/homeButton.png" width="234px" height="100px"> </a>
			</div>
		</td>
		<td width="30%">
		<div id="search-part">
		<form method="post" action="<%=request.getContextPath()%>/smc_search.do" class="search-form">
			<select name="search_field" id="search_field">
				<option value="lec_name">&nbsp;&nbsp;강의 이름&nbsp;</option>
				<option value="lec_teacher">&nbsp;&nbsp;강사 이름&nbsp;</option>
				<option value="category">&nbsp;&nbsp;카테고리&nbsp;</option>
			</select> 
			<input type="text" name="search_keyword" id="search_keyword" placeholder="검색어를 입력하세요"> 
			<button type="submit" id="search_btn"><i class="fas fa-search fa-2x" style="color: #3d4ea2;"></i></button>
		</form>
		</div>
		</td>
		<td width="30%" align="left" style="vertical-align: middle;">
			  <div class="notice" style="align-content: center; padding-right: 3%; margin-top: -15%;">
				<ul class="rolling">
				<li>
					<font color="red">인기검색</font>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/smc_search.do?search_field=lec_name&search_keyword=드로잉">
						<font color="black" >1.&nbsp;드로잉</font>
					</a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/smc_search.do?search_field=lec_name&search_keyword=돈"><font color="black" >2.&nbsp;돈</font></a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/smc_search.do?search_field=lec_name&search_keyword=주식"><font color="black" >3.&nbsp;주식 </font></a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/smc_search.do?search_field=category&search_keyword=무자본"><font color="black" >4.&nbsp;무자본 </font> </a>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/smc_search.do?search_field=category&search_keyword=유튜버"><font color="black" >5.&nbsp;유튜버 </font> </a>
				</li>
			</ul>
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
		</td>
		<td width="23%" align="right" style="text-decoration: none;">
			<div id="member-part">
			 <c:set value="${member_no }" var="member_no" />
			  <c:if test="${member_no == 0 || empty member_no}">
		      <a href="goto_join_member.do">회원가입</a> &nbsp;&nbsp; | 
			  <a href="goto_login_member.do" style="margin-left: 4%;">로그인</a>&nbsp;&nbsp;
			  </c:if>
			  <c:if test="${member_no != 0 && !empty member_no}">
		      <a href="goto_logout_member.do">로그아웃</a> &nbsp;&nbsp; | 
			  <a href="<%=request.getContextPath() %>/goto_myInfo_member.do?no=${member_no }" style="margin-left: 4%;">MyPage</a>&nbsp;&nbsp;
			  </c:if>
			</div>
		</td>
	</tr>
</table>
	



</body>
</html>