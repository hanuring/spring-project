<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	Cookie[] ck = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function Category(x) {
  x.classList.toggle("change");
// 	alert($("#hamburger").attr("class"));
	var hamburger_class = $("#hamburger").attr("class");
	if(hamburger_class == "container change"){
		$(".dropdown-content").css("display", "block");
	} else if(hamburger_class == "container"){
		$(".dropdown-content").css("display", "none");
	}
}



</script>
<!-- 0203 철민 -->
<link rel="stylesheet" type="text/css" href="resources/css/main1.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style type="text/css">

/* 햄버거 메뉴 */
.container {
	display: inline-block; 
	cursor: pointer;
	float:left;
	margin-left: 30px;
	margin-right: 30px;
}
.hamburger{
	vertical-align: middle;
}
.bar1, .bar2, .bar3 {
  width: 35px;
  height: 5px;
  background-color: white;
  margin: 6px 0;
  transition: 0.4s;
  
}
.change .bar1 {
  -webkit-transform: rotate(-45deg) translate(-9px, 6px);
  transform: rotate(-45deg) translate(-9px, 6px);
}
.change .bar2 {opacity: 0;}
.change .bar3 {
  -webkit-transform: rotate(45deg) translate(-8px, -8px);
  transform: rotate(45deg) translate(-8px, -8px);
}
</style>
</head>
<body>
<jsp:include page="include/header_semi.jsp" />

 	<div class="Cate">
	<c:set value="${L_Cate }" var="l_cate"/>
	<c:set value="${M_Cate }" var="m_cate"/>
	<nav>
	<ul>
	<li class="hamburger">
	<div class="container" onclick="Category(this)" id="hamburger">
  	<div class="bar1"></div>
  	<div class="bar2"></div>
  	<div class="bar3"></div>
	</div>	
  	</li>
	<c:if test="${!empty l_cate }">
	<c:forEach items="${l_cate }" var="ldto">
		<li class="dropdown" id="L_Cate">
		<div class="dropdown-menu">
		<a href="<%=request.getContextPath()%>/l_category.do?cate_code=${ldto.getCate_code() }">${ldto.getCate_name() }</a>
		</div>
		<div class="dropdown-content">
				<c:forEach items="${m_cate }" var="mdto">
					<c:if test="${ldto.getCate_code() == mdto.getCate_code_ref() }">
						<a href="<%=request.getContextPath()%>/s_category.do?cate_code=${mdto.getCate_code() }">${mdto.getCate_name() }</a>
					</c:if>
				</c:forEach>
		</div>
		</li>
	</c:forEach>
	</c:if>
	</ul>
	</nav>
</div> 

	<!-- 철민 -->
	<br><br><br>
	<c:set var="likeList" value="${likeList}" />
	<c:set var="mlist" value="${Member_list }"/>
	<div class="main_container">
		<h2>좋아요 누른 강의</h2>
		<div class="swiper-container swiper1">
			<div class="swiper-wrapper">
				<c:forEach items="${likeList}" var="like">
					<div class="swiper-slide" align="center">
						<a class="a_content" href="<%=request.getContextPath() %>/info_cont.do?no=${like.getLec_no() }">
							<div align="center">
								<img class="thumb" alt="썸네일" src="resources/img/lec_info/${like.getLec_thumbnail() }">
							</div>
							<div align="left">
								<c:forEach items="${mlist }" var="mdto">
									<c:if test="${mdto.getMember_id() == like.getLec_member() }">
										<span class="main_memname">${mdto.getMember_name() }</span>
									</c:if>
								</c:forEach>
								<br>
								<span class="main_lecname">${like.getLec_name() }</span><br>
								<c:if test="${like.getAll_pref_like() eq 0 }">
									<span class="main_like">좋아요 없음</span><br>
								</c:if>
								<c:if test="${like.getAll_pref_like() + like.getAll_pref_dislike() ne 0 }">
									<span class="main_like">
										<img src="resources/img/like_on.png">
										<fmt:formatNumber value="${like.getAll_pref_like() / (like.getAll_pref_like() + like.getAll_pref_dislike()) }" type="percent" />
									</span><br>
								</c:if>
								<strong class="main_price"><fmt:formatNumber value="${like.getLec_price() }" type="number" maxFractionDigits="3" />원</strong><br>
								<c:set var="now" value="<%=new java.util.Date() %>" />
								<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
								<c:set var="compare" value="${nowdate.compareTo(like.getLec_startdate()) }" />
								<c:if test="${compare > 0 }">
									<span class="main_poss1">바로수강가능</span>
								</c:if>
								<c:if test="${compare <= 0 }">
									<fmt:parseDate var="parsedDate" value="${like.getLec_startdate() }" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate var="startdate" value="${parsedDate }" pattern="MM.dd(E)" />
									<span class="main_poss2">
										<fmt:formatDate var="nowdate2" value="${now }" pattern="yyyy" />
										<fmt:formatDate var="test2" value="${parsedDate }" pattern="yyyy" />
										<c:if test="${nowdate2.compareTo(test2) == -1}">${test2 }년 </c:if>${startdate }부터 수강 가능
									</span>
								</c:if>
							</div>			
						</a>
					</div>
				</c:forEach>
			</div>
				
			<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
		
			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
		
		<br><br>

				<input type="button" value="전체 쿠키 삭제" onclick="location.href='<%=request.getContextPath() %>/delete_cookie.do'">
			</div>

	<script src="<%=request.getContextPath()%>/resources/js/main1.js"></script>
	
</body>
</html>