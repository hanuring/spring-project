<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	
	Cookie[] ck = request.getCookies();
	Cookie c;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info_cont.css">

<link rel="stylesheet" type="text/css" href="resources/css/main1.css?5">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />

<script type="text/javascript">

function openPopup(){
    window.open("info_popup.do", "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700, left=0, top=0" );
}

</script>
</head>
<body>

	
	<div class="wrap" align="center">
	
	<jsp:include page="../include/header_2.jsp" />
	
	<c:set var="info" value="${cont }" />
	<!-- 철민 0126 -->
	<c:set var="cname" value="${info.getLec_no() }" />
	<c:set var="cvalue" value="${info.getLec_name() }" />
	<c:set var="member_no" value="${member_no }" />
	<%
		
		String cname = pageContext.getAttribute("cname").toString();
		String cvalue = (String) pageContext.getAttribute("cvalue");
		String member_no = String.valueOf(pageContext.getAttribute("member_no"));
		int i = 0;
		if (member_no != "null") {
			for (Cookie coo : ck) {
				if (coo.getName().equals(member_no + "no" + cname)) {
					ck[i].setMaxAge(0);
					response.addCookie(ck[i]);
				}
				i++;
			}
			c = new Cookie(member_no + "no" + cname, URLEncoder.encode(cvalue, "UTF-8"));
		} else {
			for (Cookie coo : ck) {
				if (coo.getName().equals("cname" + cname)) {
					ck[i].setMaxAge(0);
					response.addCookie(ck[i]);
				}
				i++;
			}
			c = new Cookie("cname" + cname, URLEncoder.encode(cvalue, "UTF-8"));
		}
		c.setMaxAge(60*60);
		response.addCookie(c);
	%>
	<!--  -->
	<c:if test="${!empty info }">
		
		<div class="nav">
			<section class="top-taps">
				<div class="tabs-container">
					<a class="tab" href="#top">클래스 정보</a>
					<a class="tab" href="#mid">클래스 소개</a>
					<a class="tab" href="#community">커뮤니티</a>
					<a class="tab" href="#refund">환불정책</a>
					<a class="tab" href="#recommend">추천</a>
				</div>
			</section>
		</div>
		
		<div class="container"> 
			<div class="contents">
			
			<table>
				<div id="img" class="img">
					<c:if test="${!empty info.getLec_thumbnail() }">	<!-- 이미지 있을때 -->
						<img src="resources/img/lec_info/${info.getLec_thumbnail() }">
					</c:if>
				</div>
				<tr>
					<td id="infotop" colspan="2"><a class="top-slide" id="top">클래스 정보</a></td>
				</tr>
				<tr>
					<td id="classinfo" colspan="2">
						<table>
							<tr>
								<td id="title"> 클래스 분량 </td>
								<td> ${info.getLec_amount() } </td>
								<td id="title"> 수강가능 상태 </td>
								<td> ${info.getLec_possible() } </td>
								<td id="title"> 조회수 </td>
								<td> ${info.getLec_hit() } </td>
							</tr>
						</table>
						<hr width="100%"> <br>
					</td>
				</tr>
				<tr>
					<td id="level" colspan="2"> <p>${info.getLec_level() }</p> 분들을 위한 <br />
						<p>${info.getCate_name() }</p> <br> 클래스입니다. 
					 </td>
				</tr>
				<tr>
					<td id="date">
						<img alt="dateIcon" src="resources/img/icondate.png" width="30"> <br>
						<p> ${info.getLec_enddate().substring(5,10) } 까지 수강 가능</p> <br>
						수강 기간 내 무제한 수강 가능합니다.
					 </td>
					 <td id="note">
						<img alt="noteIcon" src="resources/img/iconnote.png" width="30"> <br>
						<p>다수의 콘텐츠</p> <br>
						총 ${info.getLec_amount() } 강의를 수강 하실 수 있습니다.
					 </td>
				</tr>
				<tr>
					<td id="ot" colspan="2">
					<img alt="playIcon" src="resources/img/iconplay2.png" width="33"> <input type="button" class="btn_purple" value="PLAY" onclick="location.href='<%=request.getContextPath() %>/goto_video_ot?no=${info.getLec_no()}'"> <br>
					<p>무료 오리엔테이션 수강</p> <br>
					무료로 OT를 수강해 보세요.
					<a class="top-slide" id="mid"></a>
				</tr>
					
				<tr>
					<td id="infomid" colspan="2">
					<a> 클래스 소개</a>
					 ${info.getLec_explain() }
					 <hr>
					</td>
				</tr>
				<tr>
					<td id="commu" colspan="2"> <a class="top-slide" id="community">  </a> 
						<!-- 지원님 파트 -->
						<jsp:include page="../comunity.jsp" />
					</td>
				</tr>
				<tr>
					<td id="refun" colspan="2"> 
						<a class="top-slide" id="refund"> 환불정책 </a> <br>
						<p>수강 시작으로 부터 <b>${info.getLec_refund() }일 이내</b> 환불하셔야 위약금없이 환불이 가능합니다. <br/><br/>
						<a class="popup" href="#none" onclick="openPopup()"> 전체 환불 정책 보기 > </a> <br> 
						</p>
					</td>
				</tr>
				
			<!-- 	<tr>
					<td id="commu" colspan="2"> <a class="top-slide" id="recommend">  </a> 
						
					</td>
				</tr> -->
				
				
			</table>

			</div>
			
			<!-- 사이드바 부분 -->
			<div class="side">
				<table>
					<tr>
						<td id="side_top" colspan="2"> ${info.getCate_name() } · ${info.getMember_name() }</td>
					</tr>
					<tr>
						<td id="side_title" colspan="2"> ${info.getLec_name() }</td>
					</tr>
					<tr id="side_price">
						<td id="month"> 4개월 할부 </td>
						<td id="price"> 월 <fmt:formatNumber value="${info.getLec_price() / 4 }" />원 </td>
					</tr>
					<tr>
						<td colspan="2" style="padding-bottom: 0px;"><hr width="95%" color="#eaeaea"></td>
					</tr>
					<tr>
						<td> <img alt="userIcon" src="resources/img/iconuser.png" width="23"> ${info.getLec_level() } 대상 &nbsp;&nbsp; </td>
						<td>	
							<c:if test="${info.getLec_tool() == '유' }">
								<img alt="kitIcon" src="resources/img/iconkit.png" width="25"> 준비물 필요 
							</c:if>
							<c:if test="${info.getLec_tool() == '무' }">
								<img alt="kitIcon" src="resources/img/iconkit.png" width="25"> 준비물 필요 없음
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<!-- 210126이호철 추가 -->
							<jsp:include page="../preference.jsp" />
							<!-- 끝 -->
						</td>
					</tr>
					<tr>
						<!-- 0201 철민 -->
						<c:if test="${check_teacher == 1 }">
						<td colspan="2"><input type="button" class="btn_gray" value="본인 강의입니다" onclick="location.href='<%=request.getContextPath() %>/regist_class.do?lec_no=${info.getLec_no() }&mem_no=${member_no }'" disabled="disabled"> </td> 
						</c:if>
						<c:if test="${check_teacher == 2 }">
						<td colspan="2"><input type="button" class="btn_orange" value="클래스 신청하기" onclick="location.href='<%=request.getContextPath() %>/regist_class.do?lec_no=${info.getLec_no() }&mem_no=${member_no }'"> </td> 
						</c:if>
					</tr>
				</table>
			</div>
			
	 	</div>
	 	
	 	<div id="footerside">
	 		<div class="inner">
	 			<jsp:include page="../preference.jsp" />
				<c:if test="${check_teacher == 1 }">
				<td colspan="2"><input type="button" class="btn_gray" value="본인 강의입니다" onclick="location.href='<%=request.getContextPath() %>/regist_class.do?lec_no=${info.getLec_no() }&mem_no=${member_no }'" disabled="disabled"> </td> 
				</c:if>
				<c:if test="${check_teacher == 2 }">
				<td colspan="2"><input type="button" class="btn_orange" value="클래스 신청하기" onclick="location.href='<%=request.getContextPath() %>/regist_class.do?lec_no=${info.getLec_no() }&mem_no=${member_no }'"> </td> 
				</c:if>
			</div>
		</div>
	 	</c:if>
	 </div>
	 
	 
	<br>
	<c:set var="recentList" value="${recentList }" />
	<c:set value="${Member_list }" var="mlist"/>
	<div style="margin-left: 20%; margin-right: 20%;">
		<c:forEach items="${mlist }" var="mdto">
         <c:if test="${mdto.getMember_no() == member_no }">
            <h3 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;" id="recommend">${mdto.getMember_name() }님을 위한 취향 저격 클래스</h3>
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
      <br>
		<h3 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">오늘 본 클래스 목록</h3>
		<div class="swiper-container swiper2">
			<div class="swiper-wrapper">
				<%
					int cnt = 0;
					int check = 0, check2 = 0;
					if (ck != null) {
						for (int j = ck.length - 1; j >= 0; j--) {
							if (member_no != "null") {
								if (check == 0 && check2 == 0) {
									for (Cookie c3 : ck) {
										if (c3.getName().equals(member_no + "no" + cname)) { 
				%>
											<c:forEach items="${recentList }" var="recent">
												<c:if test="${cname eq recent.getLec_no() }">
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
											check = 1;
										}
									}
									if (check == 0) { 
				%>
										<c:forEach items="${recentList }" var="recent">
											<c:if test="${cname eq recent.getLec_no() }">
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
										check2 = 1;
									}
								}
								pageContext.setAttribute("no", URLDecoder.decode(ck[j].getName(), "UTF-8").substring(2 + member_no.length()));
								if (ck[j].getName().indexOf(member_no + "no") != -1 && !ck[j].getName().equals(member_no + "no" + cname)) { %>
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
							} else if (member_no == "null") {
								if (check == 0 && check2 == 0) {
									for (Cookie c3 : ck) {
										if (c3.getName().equals("cname" + cname)) { %>
											<a href="<%=request.getContextPath() %>/info_cont.do?no=${cname }">
				<%
												out.println(URLDecoder.decode(c3.getValue(), "UTF-8") + "<br>");
				%>
											</a>
				<%
											check = 1;
										}
									}
									if (check == 0) { %>
										<a href="<%=request.getContextPath() %>/info_cont.do?no=${cname }">${cvalue }<br></a>
				<%
										check2 = 1;
									}
								}
								pageContext.setAttribute("no", URLDecoder.decode(ck[j].getName(), "UTF-8").substring(5));
								if (ck[j].getName().indexOf("cname") != -1 && !ck[j].getName().equals("cname" + cname)) { %>
									<c:set var="no" value="${no }" />
									<a href="<%=request.getContextPath() %>/info_cont.do?no=${no }">
				<%
										out.println(URLDecoder.decode(ck[j].getValue(), "UTF-8") + "<br>");
				%>
									</a>
				<%
									cnt++;
									if (cnt == 10) break;
								}
							}
						}
					}
				%>
			</div>
			<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
		
			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/resources/js/main1.js?3"></script>
	
<jsp:include page="../include/footer.jsp" />	
	
</body>
</html>