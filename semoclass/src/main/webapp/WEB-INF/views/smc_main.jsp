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
	var hamburger_class = $("#hamburger").attr("class");
	if(hamburger_class == "container change"){
		$(".ddown-content").css("display", "block");
	} else if(hamburger_class == "container"){
		$(".ddown-content").css("display", "none");
	}
}
</script>
<!-- 0203 철민 -->
<link rel="stylesheet" type="text/css" href="resources/css/main1.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style type="text/css">

/* Navbar container */
.nbar {
  overflow: hidden;
  background-color: #3A4CA8;
  font-family: Arial;
  font-weight: bolder;
  padding-top: 1%;
}

/* Links inside the navbar */
.nbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* The dropdown container */
.ddown {
  float: left;
  overflow: hidden;
}

/* Dropdown button */
.ddown .dbtn {
  font-size: 18px;
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: 'Noto Sans KR', sans-serif; /* Important for vertical align on mobile phones */
  font-weight: bolder;
  margin: 0; /* Important for vertical align on mobile phones */
  cursor: pointer;
}

.bar a {
  text-decoration: none;
}

/* Add a red background color to navbar links on hover */
.nbar a:hover, .ddown:hover .dbtn {
  background-color: ;
  color: black;
  text-decoration: none;
}

/* Dropdown content (hidden by default) */
.ddown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.4);
  border-radius : 25px;
  margin-top: 3px;
  pause: 1s;
  z-index: 3;
}

/* Links inside the dropdown */
.ddown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

/* Add a grey background color to dropdown links on hover */
.ddown-content a:hover {
  background-color: #ddd;
}

.ddown-content a:first-child:hover{
  border-radius: 25px 25px 0 0 ;
}
.ddown-content a:last-child:hover{
  border-radius: 0 0 25px 25px ;
}

/* Show the dropdown menu on hover */
.ddown:hover .ddown-content {
  display: block;	
}

/* 햄버거 메뉴 */
.container {
	display: block;
	cursor: pointer;
	float:left;
	margin-left: 30px;
	margin-right: 30px;
	height: 44px;
	border-style: none;
	margin-top: 3%;
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

/* 철민님 css */
.hot_container { width: 90%; margin: 0 auto; text-align: center; }
.hot_div { width: 20%; height: 300px; display: inline-block; vertical-align: top; }

</style>
</head>
<body style="margin-left: 15%; margin-right: 15%;">

<jsp:include page="include/header_2.jsp" />
<%-- <jsp:include page="include/header_semi.jsp" /> --%>



<c:set value="${L_Cate }" var="l_cate"/>
<c:set value="${M_Cate }" var="m_cate"/>
	
<div class="nbar" style="background: linear-gradient(to right, #964aff, #27cdfd);">
   <div class="ddown">
	<button class="hamburger" style="background-color: Transparent; border-style: none;">
	<div class="container" onclick="Category(this)" id="hamburger"  style="padding-top: 4px;">
  	<div class="bar1"></div>
  	<div class="bar2"></div>
  	<div class="bar3"></div>
	</div>
	</button>
	<div class="ddown-content">
    	<c:forEach items="${m_cate }" var="mdto">
			<c:if test="${ldto.getCate_code() == mdto.getCate_code_ref() }">
    			<a href="<%=request.getContextPath()%>/s_category.do?cate_code=${mdto.getCate_code() }">${mdto.getCate_name() }</a>
    		</c:if>
		</c:forEach>
    </div>
  </div>
  
    <c:if test="${!empty l_cate }">
	<c:forEach items="${l_cate }" var="ldto">
	<div class="ddown" style = "margin-right: 1.5%;">
		<button class="dbtn" onclick="location.href='<%=request.getContextPath()%>/l_category.do?cate_code=${ldto.getCate_code() }'">${ldto.getCate_name() }
      	<i class="fa fa-caret-down"></i>
    	</button>
    	<div class="ddown-content">
    	<c:forEach items="${m_cate }" var="mdto">
			<c:if test="${ldto.getCate_code() == mdto.getCate_code_ref() }">
    			<a href="<%=request.getContextPath()%>/s_category.do?cate_code=${mdto.getCate_code() }">${mdto.getCate_name() }</a>
    		</c:if>
		</c:forEach>
      	</div>
    </div>
	<c:if test="${ldto.getCate_name() == '커리어' }">
	<div class="ddown" style = "margin-right: 3.6%;">
		<br><br><br>
    </div>
    </c:if>
	</c:forEach>
	<div class="ddown">
		<a href="<%=request.getContextPath()%>/notice.do?page=1" class="dbtn" style="margin-right: 3.6%; width:150px;">공지사항</a>
	</div>
	</c:if>
</div>
	<!-- 철민 -->
	<br><br><br>
	<c:set var="hotList" value="${hotList }" />
	<c:set value="${Member_list }" var="mlist"/>
	<c:set var="openList" value="${openList }" />
	<c:set var="newList" value="${newList }" />
	<c:set var="recentList" value="${recentList }" />
	<c:set var="member_no" value="${member_no }" />
	<div class="main_container">
		<h2>인기 TOP 클래스</h2>
		<div class="swiper-container swiper1">
			<div class="swiper-wrapper">
				<c:set var="hot_loop" value="false" />
				<c:set var="hot_chk" value="0" />
				<c:forEach items="${hotList }" var="hot">
					<c:if test="${not hot_loop }">
						<c:set var="now" value="<%=new java.util.Date() %>" />
						<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
						<c:set var="compare" value="${nowdate.compareTo(hot.getLec_enddate()) }" />
						<c:if test="${compare <= 0 }">
							<div class="swiper-slide" align="center">
								<a class="a_content" href="<%=request.getContextPath() %>/info_cont.do?no=${hot.getLec_no() }">
									<div class="thumb_div" align="center">
										<img class="thumb" alt="썸네일" src="resources/img/lec_info/${hot.getLec_thumbnail() }">
									</div>
									<div class="cont_div" align="left">
										<c:forEach items="${mlist }" var="mdto">
											<c:if test="${mdto.getMember_id() == hot.getLec_member() }">
												<span class="main_memname">${mdto.getMember_name() }</span>
											</c:if>
										</c:forEach>
										<br>
										<div class="main_lecname">${hot.getLec_name() }</div><br>
										<c:if test="${hot.getAll_pref_like() eq 0 }">
											<span class="main_like"><i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${hot.getAll_pref_like() }개</span><br>
										</c:if>
										<c:if test="${hot.getAll_pref_like() + hot.getAll_pref_dislike() ne 0 }">
											<span class="main_like">
												<i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${hot.getAll_pref_like() }개&nbsp;&nbsp;
												<img src="resources/img/like_on.png">
												<fmt:formatNumber value="${hot.getAll_pref_like() / (hot.getAll_pref_like() + hot.getAll_pref_dislike()) }" type="percent" />
											</span><br>
										</c:if>
										<strong class="main_price"><fmt:formatNumber value="${hot.getLec_price() }" type="number" maxFractionDigits="3" />원</strong><br>
										<c:set var="now" value="<%=new java.util.Date() %>" />
										<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
										<c:set var="compare" value="${nowdate.compareTo(hot.getLec_startdate()) }" />
										<c:if test="${compare > 0 }">
											<span class="main_poss1">바로 수강 가능</span>
										</c:if>
										<c:if test="${compare <= 0 }">
											<fmt:parseDate var="parsedDate" value="${hot.getLec_startdate() }" pattern="yyyy-MM-dd HH:mm:ss" />
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
							<c:set var="hot_chk" value="${hot_chk + 1 }" />
							<c:if test="${hot_chk eq 20 }">
								<c:set var="hot_loop" value="true" />
							</c:if>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${hot_chk eq 0 }">
						<div class="no-recent">
							<h2>인기 클래스가 없습니다</h2>
						</div>
				</c:if>
			</div>
			<c:if test="${hot_chk ne 0 }">
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</c:if>
		</div>
		<br><br>
		
		<!-- 오픈 예정 클래스 -->
		<h2>오픈 예정 클래스</h2>
		<div class="swiper-container swiper4">
			<div class="swiper-wrapper">
				<c:set var="now" value="<%=new java.util.Date() %>" />
				<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
				<c:set var="open_loop" value="false" />
				<c:set var="open_chk" value="0" />
				<c:forEach items="${openList }" var="open">
					<c:if test="${not open_loop }">
							<fmt:parseDate var="parsedDate" value="${open.getLec_startdate() }" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:parseNumber var="day" value="${now.getTime() / 86400000 - parsedDate.getTime() / 86400000}" integerOnly="true" />
							<c:if test="${day <= 0 && day > -31}">
								<div class="swiper-slide" align="center">
									<a class="a_content" href="<%=request.getContextPath() %>/info_cont.do?no=${open.getLec_no() }">
										<div class="thumb_div" align="center">
											<img class="thumb" alt="썸네일" src="resources/img/lec_info/${open.getLec_thumbnail() }">
										</div>
										<div class="cont_div" align="left">
											<c:set value="${Member_list }" var="mlist2"/>
											<c:forEach items="${mlist2 }" var="mdto2">
												<c:if test="${mdto2.getMember_id() == open.getLec_member() }">
													<span class="main_memname">${mdto2.getMember_name() }</span>
												</c:if>
											</c:forEach>
											<br>
											<div class="main_lecname">${open.getLec_name() }</div><br>
											<c:if test="${open.getAll_pref_like() eq 0 }">
												<span class="main_like"><i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${open.getAll_pref_like() }개</span><br>
											</c:if>
											<c:if test="${open.getAll_pref_like() + open.getAll_pref_dislike() ne 0 }">
												<span class="main_like">
													<i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${open.getAll_pref_like() }개&nbsp;&nbsp;
													<img src="resources/img/like_on.png">
													<fmt:formatNumber value="${open.getAll_pref_like() / (open.getAll_pref_like() + open.getAll_pref_dislike()) }" type="percent" />
												</span><br>
											</c:if>
											<strong class="main_price"><fmt:formatNumber value="${open.getLec_price() }" type="number" maxFractionDigits="3" />원</strong><br>
											<c:set var="now" value="<%=new java.util.Date() %>" />
											<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
											<c:set var="compare" value="${nowdate.compareTo(open.getLec_startdate()) }" />
											<c:if test="${compare > 0 }">
												<span class="main_poss1">바로 수강 가능</span>
											</c:if>
											<c:if test="${compare <= 0 }">
												<fmt:parseDate var="parsedDate" value="${open.getLec_startdate() }" pattern="yyyy-MM-dd HH:mm:ss" />
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
								<c:set var="open_chk" value="${open_chk + 1 }" />
								<c:if test="${open_chk eq 20 }">
									<c:set var="open_loop" value="true" />
								</c:if>
							</c:if>
						</c:if>
				</c:forEach>
				<c:if test="${open_chk eq 0 }">
						<div class="no-recent">
							<h2>오픈 예정인 클래스가 없습니다</h2>
						</div>
				</c:if>
			</div>
			<c:if test="${open_chk ne 0 }">
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</c:if>
		</div>
		<br><br>
		
		<!-- 최근 개설된 클래스 -->
		<h2>최근 개설된 클래스</h2>
		<div class="swiper-container swiper5">
			<div class="swiper-wrapper">
				<c:set var="now" value="<%=new java.util.Date() %>" />
				<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
				<c:set var="newc_loop" value="false" />
				<c:set var="newc_chk" value="0" />
				<c:forEach items="${newList }" var="newc">
					<c:set var="compare" value="${nowdate.compareTo(newc.getLec_enddate()) }" />
					<c:if test="${compare <= 0 }">
						<c:if test="${not newc_loop }">
							<div class="swiper-slide" align="center">
								<a class="a_content" href="<%=request.getContextPath() %>/info_cont.do?no=${newc.getLec_no() }">
									<div class="thumb_div" align="center">
										<img class="thumb" alt="썸네일" src="resources/img/lec_info/${newc.getLec_thumbnail() }">
									</div>
									<div class="cont_div" align="left">
										<c:set value="${Member_list }" var="mlist2"/>
										<c:forEach items="${mlist2 }" var="mdto2">
											<c:if test="${mdto2.getMember_id() == newc.getLec_member() }">
												<span class="main_memname">${mdto2.getMember_name() }</span>
											</c:if>
										</c:forEach>
										<br>
										<div class="main_lecname">${newc.getLec_name() }</div><br>
										<c:if test="${newc.getAll_pref_like() eq 0 }">
											<span class="main_like"><i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${newc.getAll_pref_like() }개</span><br>
										</c:if>
										<c:if test="${newc.getAll_pref_like() + newc.getAll_pref_dislike() ne 0 }">
											<span class="main_like">
												<i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${newc.getAll_pref_like() }개&nbsp;&nbsp;
												<img src="resources/img/like_on.png">
												<fmt:formatNumber value="${newc.getAll_pref_like() / (newc.getAll_pref_like() + newc.getAll_pref_dislike()) }" type="percent" />
											</span><br>
										</c:if>
										<strong class="main_price"><fmt:formatNumber value="${newc.getLec_price() }" type="number" maxFractionDigits="3" />원</strong><br>
										<c:set var="now" value="<%=new java.util.Date() %>" />
										<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
										<c:set var="compare" value="${nowdate.compareTo(newc.getLec_startdate()) }" />
										<c:if test="${compare > 0 }">
											<span class="main_poss1">바로 수강 가능</span>
										</c:if>
										<c:if test="${compare <= 0 }">
											<fmt:parseDate var="parsedDate" value="${newc.getLec_startdate() }" pattern="yyyy-MM-dd HH:mm:ss" />
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
							<c:set var="newc_chk" value="${newc_chk + 1 }" />
							<c:if test="${newc_chk eq 20 }">
								<c:set var="newc_loop" value="true" />
							</c:if>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${newc_chk eq 0 }">
						<div class="no-recent">
							<h2>최근 개설된 클래스가 없습니다</h2>
						</div>
				</c:if>
			</div>
			<c:if test="${newc_chk ne 0 }">
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</c:if>
		</div>
		<br><br>
		
		<!-- 취향 저격 -->
		<c:set value="${Member_list }" var="mlist"/>
		<c:if test="${member_no ne 0 }">
			<c:forEach items="${mlist }" var="mdto">
				<c:if test="${mdto.getMember_no() == member_no }">
					<h2>${mdto.getMember_name() }님을 위한 취향 저격 클래스</h2>
					<div class="swiper-container swiper3">
						<div class="swiper-wrapper">
							<c:set var="inter_loop" value="false" />
							<c:set var="inter_chk" value="0" />
							<c:forEach items="${recentList }" var="recent">
								<c:if test="${not inter_loop }">
									<c:if test="${mdto.getMember_category() == recent.getCate_fk() }">
										<div class="swiper-slide" align="center">
											<a class="a_content" href="<%=request.getContextPath() %>/info_cont.do?no=${recent.getLec_no() }">
												<div class="thumb_div" align="center">
													<img class="thumb" alt="썸네일" src="resources/img/lec_info/${recent.getLec_thumbnail() }">
												</div>
												<div class="cont_div" align="left">
													<c:set value="${Member_list }" var="mlist2"/>
													<c:forEach items="${mlist2 }" var="mdto2">
														<c:if test="${mdto2.getMember_id() == recent.getLec_member() }">
															<span class="main_memname">${mdto2.getMember_name() }</span>
														</c:if>
													</c:forEach>
													<br>
													<div class="main_lecname">${recent.getLec_name() }</div><br>
													<c:if test="${recent.getAll_pref_like() eq 0 }">
														<span class="main_like"><i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${recent.getAll_pref_like() }개</span><br>
													</c:if>
													<c:if test="${recent.getAll_pref_like() + recent.getAll_pref_dislike() ne 0 }">
														<span class="main_like">
															<i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${recent.getAll_pref_like() }개&nbsp;&nbsp;
															<img src="resources/img/like_on.png">
															<fmt:formatNumber value="${recent.getAll_pref_like() / (recent.getAll_pref_like() + recent.getAll_pref_dislike()) }" type="percent" />
														</span><br>
													</c:if>
													<strong class="main_price"><fmt:formatNumber value="${recent.getLec_price() }" type="number" maxFractionDigits="3" />원</strong><br>
													<c:set var="now" value="<%=new java.util.Date() %>" />
													<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
													<c:set var="compare" value="${nowdate.compareTo(recent.getLec_startdate()) }" />
													<c:if test="${compare > 0 }">
														<span class="main_poss1">바로 수강 가능</span>
													</c:if>
													<c:if test="${compare <= 0 }">
														<fmt:parseDate var="parsedDate" value="${recent.getLec_startdate() }" pattern="yyyy-MM-dd HH:mm:ss" />
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
										<c:set var="inter_chk" value="${inter_chk + 1 }" />
										<c:if test="${inter_chk eq 20 }">
											<c:set var="inter_loop" value="true" />
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>
							<c:if test="${inter_chk eq 0 }">
									<div class="no-recent">
										<h2>나의 관심 카테고리에 해당하는 클래스가 없습니다</h2>
									</div>
							</c:if>
						</div>
						<c:if test="${inter_chk ne 0 }">
							<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
							<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
						
							<!-- 페이징 -->
							<div class="swiper-pagination"></div>
						</c:if>
					</div>
				</c:if>
			</c:forEach>
			<br><br>
		</c:if>
		
		<!-- 최근 클래스 -->
		<c:if test="${member_no ne 0 }">
			<h3>오늘 본 클래스 목록</h3>
			<div class="swiper-container swiper2">
				<div class="swiper-wrapper">
					<%	
						int cnt = 0;
						String member_no = String.valueOf(pageContext.getAttribute("member_no"));
						if (ck != null) {
							for (int i = ck.length - 1; i >= 0; i--) {
								if (member_no != "0") {
									pageContext.setAttribute("no", URLDecoder.decode(ck[i].getName(), "UTF-8").substring(2 + member_no.length()));
									pageContext.setAttribute("cnt", cnt);
									if (ck[i].getName().indexOf(member_no + "no") != -1) { 
					%>
										<c:forEach items="${recentList }" var="recent">
											<c:if test="${no eq recent.getLec_no() }">
												<div class="swiper-slide">
													<a class="a_content" href="<%=request.getContextPath() %>/info_cont.do?no=${recent.getLec_no() }">
														<div class="thumb_div" align="center">
															<img class="thumb" alt="썸네일" src="resources/img/lec_info/${recent.getLec_thumbnail() }">
														</div>
														<div class="cont_div" align="left">
															<c:forEach items="${mlist }" var="mdto">
																<c:if test="${mdto.getMember_id() == recent.getLec_member() }">
																	<span class="main_memname">${mdto.getMember_name() }</span>
																</c:if>
															</c:forEach>
															<br>
															<div class="main_lecname">${recent.getLec_name() }</div><br>
															<c:if test="${recent.getAll_pref_like() eq 0 }">
																<span class="main_like"><i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${recent.getAll_pref_like() }개</span><br>
															</c:if>
															<c:if test="${recent.getAll_pref_like() + recent.getAll_pref_dislike() ne 0 }">
																<span class="main_like">
																	<i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${recent.getAll_pref_like() }개&nbsp;&nbsp;
																	<img src="resources/img/like_on.png">
																	<fmt:formatNumber value="${recent.getAll_pref_like() / (recent.getAll_pref_like() + recent.getAll_pref_dislike()) }" type="percent" />
																</span><br>
															</c:if>
															<strong class="main_price"><fmt:formatNumber value="${recent.getLec_price() }" type="number" maxFractionDigits="3" />원</strong><br>
															<c:set var="now" value="<%=new java.util.Date() %>" />
															<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
															<c:set var="compare" value="${nowdate.compareTo(recent.getLec_startdate()) }" />
															<c:if test="${compare > 0 }">
																<span class="main_poss1">바로 수강 가능</span>
															</c:if>
															<c:if test="${compare <= 0 }">
																<fmt:parseDate var="parsedDate" value="${recent.getLec_startdate() }" pattern="yyyy-MM-dd HH:mm:ss" />
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
											</c:if>
										</c:forEach>
					<%
										cnt++;
										if (cnt == 20) break;
									}
								}
							}
						}
					%>
					<%
						if (cnt == 0) {		
					%>
							<div class="no-recent">
								<h2>최근 본 클래스가 없습니다</h2>
							</div>
					<%
						}
					%>
				</div>
				
				<%
					if (cnt != 0) {
				%>
						<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
						<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
					
						<!-- 페이징 -->
						<div class="swiper-pagination"></div>
				<% 
					}
				%>
			</div>
			<!-- <input type="button" value="쿠키 삭제" onclick="delete_cookie()"> -->
		</c:if>
	</div>
	<script src="<%=request.getContextPath()%>/resources/js/main1.js?3"></script>
	
	<jsp:include page="include/footer.jsp" />
	
	
</body>
</html>