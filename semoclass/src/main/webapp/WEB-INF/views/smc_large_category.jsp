<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<link rel="stylesheet" type="text/css" href="resources/css/main1.css">
<link rel="stylesheet" type="text/css" href="resources/css/large_cate_btn.css">

<style type="text/css">
.event_scate_btn{
	display: flex;
	flex-flow: row wrap; 
	justify-content: space-around;
	text-align: center; 
	padding: 0;
	margin: 0 5%;
}
a{text-decoration:none; color:#000000}
#l_cate_btn {
	width: 120px;
	height: 70px;
	border-radius: 35px;
	border: 1px solid #3d4ea2;
	background-color: white;
	font-size: medium;
	font-weight: bold;
}
#l_cate_btn:hover{
	width:140px;
	box-shadow: 10px 10px 30px #a6a6a6,
				-10px -10px 30px #ffffff;
	border-radius : 35px;
	cursor: pointer;
	border: 2px solid #3d4ea2;
	padding:1%;
}
#l_cate_btn:focus{
	border:none;
	outline: none;
}


#large_list{
	display: flex;
	flex-flow: row wrap; 
	justify-content: space-around;
	text-align: center; 
	padding: 0;
	margin: 0;
}

#Cate_list{
	width: 20%;
	height: 390px;
	margin: 2%;
}

#Cate_list:hover{
	animation-name: wider;
	animation-duration: 1s;
	animation-fill-mode: forwards;
}

@keyframes wider{
	0% {
	border-radius : 10px;
	cursor: pointer;
	width: 20%;
	height: 390px;
	}
	100% {
	box-shadow: 10px 10px 30px #a6a6a6,
				-10px -10px 30px #ffffff;
	border-radius : 10px;
	cursor: pointer;
	height: 400px;
	padding:1%;
	border : 3px solid;
	border-image: linear-gradient(to right, rgb(173,45,255), rgb(42,203,255));
	background-origin: border-box;
	border-image-slice: 1;
	}
}
button{	cursor: pointer;}
</style>
</head>
<body style="margin-left: 15%; margin-right: 15%;">
<jsp:include page="include/header_2.jsp" />
<br>
<!-- 버튼후보1 -->
<div id="btn_body"> 
<a href="<%=request.getContextPath()%>/early_bird.do?cate_code=${Large_cate_code }" id="btn">
	<span>
	<i class="fas fa-dove" style="color: #3d4ea2;"></i>얼리버드
	</span>
</a>
<a href="<%=request.getContextPath()%>/open_plan.do?cate_code=${Large_cate_code }" id="btn">
	<span>
	<i class="far fa-clock" style="color: #3d4ea2;"></i>오픈예정
	</span>
</a>
<a href="<%=request.getContextPath()%>/imme_regi.do?cate_code=${Large_cate_code }" id="btn">
	<span>
	<i class="far fa-play-circle" style="color: #3d4ea2;"></i>바로수강
	</span>
</a>
<c:set value="${C_list }" var="clist"/>
<c:set value="${Distinct_cate }" var="dlist" />
<c:forEach items="${dlist }" var="cate_code">
<c:forEach items="${clist }" var="cdto">
<c:if test="${cate_code == cdto.getCate_code() }">
 <a href='s_category.do?cate_code=${cate_code }' id="btn">
 	<span>
 	${cdto.getCate_name() }
 	</span>
 </a>
</c:if>
</c:forEach>
</c:forEach>

</div>

<div id="large_list" align="center">
<c:set value="${L_cate }" var="list"/>
<c:if test="${!empty list }">
<c:forEach items="${list }" var="dto">
<div id="Cate_list">
<%-- 썸네일 이미지 --%>
<a href="<%=request.getContextPath() %>/info_cont.do?no=${dto.getLec_no() }">
<div>
<img src="resources/img/lec_info/${dto.getLec_thumbnail() }" width="100%" height="200px">
<br>
<%-- 분류 --%>
<div align="left">
<c:set value="${C_list }" var="clist"/>
		<c:forEach items="${clist }" var="cdto">
			<c:if test="${cdto.getCate_code() == dto.getCate_fk() }">
			<!-- 카테고리이름 -->
			<span class="main_memname">${cdto.getCate_name() } ・</span>
			<!-- 강사명 -->
			<c:set value="${Member_list }" var="mlist"/>
				<c:forEach items="${mlist }" var="mdto">
					<c:if test="${mdto.getMember_id() == dto.getLec_member() }">
					<span class="main_memname">${mdto.getMember_name() }</span>
					</c:if>
				</c:forEach>
			</c:if>
	</c:forEach>
<br>
<%-- 강의 이름 --%>
<span class="main_lecname">${dto.getLec_name() }</span>
<br>
<%-- 좋아요 수 + 좋아요 비율 --%>

<c:set value="${All_list_for_like }" var="like_list"/>
<c:forEach items="${like_list }" var="likedto">
<c:if test="${likedto.getLec_no() == dto.getLec_no() }">
<span class="main_like"><i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${likedto.getAll_pref_like() } 개</span>
&nbsp;&nbsp;&nbsp;
<c:if test="${likedto.getAll_pref_like() + likedto.getAll_pref_dislike() != 0 }">
<span class="main_like">
<i class="fas fa-heart" style="color: red;"></i> <fmt:formatNumber value="${likedto.getAll_pref_like() / (likedto.getAll_pref_like() + likedto.getAll_pref_dislike()) }" type="percent" />
</span>
</c:if>
<br>
</c:if>
</c:forEach>
<hr width="100%" color="#3d4ea2" style="opacity: 20%;">
<%-- 강의 가격 --%>
<strong class="main_price">
<fmt:formatNumber value="${dto.getLec_price() }" />원
</strong>
<br>
<%-- 수강 가능 여부 --%> 
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:parseDate value="${dto.getLec_startdate().substring(0,4) }${dto.getLec_startdate().substring(5,7) }${dto.getLec_startdate().substring(8,10) }" pattern="yyyyMMdd" var="startDate" />
<fmt:parseDate value="${dto.getLec_enddate().substring(0,4) }${dto.getLec_enddate().substring(5,7) }${dto.getLec_enddate().substring(8,10) }" pattern="yyyyMMdd" var="endDate" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />             <%-- 오늘날짜 --%>
<fmt:formatDate value="${startDate}" pattern="yyyyMMdd" var="openDate"/>       <%-- 시작날짜 --%>
<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="closeDate"/>        <%-- 마감날짜 --%>
<c:if test="${openDate < nowDate && closeDate > nowDate}">
	<span class="main_poss1"><i class="far fa-calendar-alt">바로수강가능</i></span>
</c:if>
<c:if test="${openDate > nowDate }">
	<span class="main_poss2"><i class="far fa-calendar-alt">오픈 예정</i></span>
</c:if>
<c:if test="${closeDate < nowDate }">
	<span class="main_poss2"><i class="far fa-calendar-times">마감된 강의</i></span>
</c:if>

<br>
</div>
</a>
</div>
</div>
</c:forEach>
</c:if>
<c:if test="${empty list }">
<h2>아무도 강의 등록을 안했네요 ....</h2>
</c:if>

<jsp:include page="include/footer.jsp" />
</div>
</body>
</html>