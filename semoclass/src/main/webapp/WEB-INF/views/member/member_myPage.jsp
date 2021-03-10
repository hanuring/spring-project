<%@ page import="java.net.URLDecoder"%> <!-- 0210 철민 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 0210 철민 -->
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	Cookie[] ck = request.getCookies();
%> <!-- 0210 철민 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


<!-- 0210 철민 -->
<link rel="stylesheet" type="text/css" href="resources/css/mypage1.css?3">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style type="text/css">

.btn-light {
 
  color: #212529;
 
  background-color: #f8f9fa;
 
  border-radius: 35px;
 
  border: 1px solid rgba(248, 249, 250, 0.75);    
 
}

</style>

</head>
<body>

<jsp:include page="../include/simple_header.jsp" />


	<c:set value="${dto }" var="dto" />
	
	<hr style="border:solid 1px #3A4CA8; margin-bottom: 2%;" width="65%">

	<c:if test="${dto.getMember_grade() == '강사'}">
	<div class="row" style="margin-left: 35%; margin-right: 20%;" align="center">
    	<div class="col-md-2" align="center"><button type="button" class="btn btn-light" onclick="location.href='member_goto_edit.do?no=${dto.getMember_no() }'"><font style="font-weight: bolder;">회원정보수정</font></button></div>
    	<div class="col-md-2" align="center"><button type="button" class="btn btn-light" onclick="location.href='member_try_quit.do?no=${dto.getMember_no() }'"><font style="font-weight: bolder;">회원탈퇴</font></button></div>
    	<div class="col-md-2" align="center"><button type="button" class="btn btn-light" onclick="location.href='class_insert.do?mem=${dto.getMember_id() }'"><font style="font-weight: bolder;">클래스등록</font></button></div>
    	<div class="col-md-2" align="center"><button type="button" class="btn btn-light" onclick="location.href='class_management.do?mem=${dto.getMember_id() }'"><font style="font-weight: bolder;">클래스관리</font></button></div>
	</div>
	</c:if>
	
	<c:if test="${dto.getMember_grade() == '일반'}">
	<div class="row" style="margin-left: 35%; margin-right: 20%;" align="center">
    	<div class="col-md-4" align="center"><button type="button" class="btn btn-light" onclick="location.href='member_goto_edit.do?no=${dto.getMember_no() }'"><font style="font-weight: bolder;">회원정보수정</font></button></div>
    	<div class="col-md-4" align="center"><button type="button" class="btn btn-light" onclick="location.href='member_try_quit.do?no=${dto.getMember_no() }'"><font style="font-weight: bolder;">회원탈퇴</font></button></div>
	</div>
	</c:if>
	
	<br><br><br>
	<div style="margin-left: 20%;">
		<font style="font-weight: bold;" size="6px">${dto.getMember_name() } </font> <img src="resources/img/mypage_logo2.PNG" id="icon" alt="User Icon" /><br>
		<a href="#" onclick="location.href='member_goto_edit.do?no=${dto.getMember_no() }'"><font style="color: gray;">${dto.getMember_id() } ㆍ ${dto.getMember_grade() } > </font> </a>
		
	</div>
<!-- 0210 철민 -->
	<br><br>
	<c:set var="mem" value="${mdto }" />
	<c:set value="${Member_list }" var="mlist"/>
	<c:set var="recentList" value="${recentList }" />
	<c:set var="wishList" value="${wishList }" />
	<c:set var="member_no" value="${member_no }" />
	<c:if test="${mem.getMember_grade() == '강사' }">
		<div class="mypage_container">
			<font style="font-weight: bold;" size="5px">내가 개설한 클래스 ▼ </font> <br><br>
			<div class="swiper-container swiper1">
				<div class="swiper-wrapper">
					<c:set var="recent_loop" value="false" />
					<c:set var="recent_chk" value="0" />
					<c:forEach items="${recentList }" var="recent">
						<c:if test="${not recent_loop }">
							<c:if test="${mem.getMember_id() eq recent.getLec_member() }">
								<c:set var="now" value="<%=new java.util.Date() %>" />
								<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
								<c:set var="compare" value="${nowdate.compareTo(recent.getLec_enddate()) }" />
								<c:if test="${compare <= 0 }">
									<div class="swiper-slide" align="center">
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
									<c:set var="recent_chk" value="${recent_chk + 1 }" />
									<c:if test="${recent_chk eq 20 }">
										<c:set var="recent_loop" value="true" />
									</c:if>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${recent_chk eq 0 }">
							<div class="no-recent">
								<h2>내가 개설한 클래스가 없습니다</h2>
							</div>
					</c:if>
				</div>
				<c:if test="${recent_chk ne 0 }">
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
				</c:if>
			</div>
		</div>
	</c:if>
	<br><br>
	
	<div class="mypage_container">
		<font style="font-weight: bold;" size="5px">내가 수강 중인 클래스 ▼ </font> <br><br>
		<div class="swiper-container swiper4">
			<div class="swiper-wrapper">
				<c:set var="reg_loop" value="false" />
				<c:set var="reg_chk" value="0" />
				<c:forEach items="${regList }" var="reg">
					<c:if test="${not reg_loop }">
				<c:forEach items="${recentList }" var="recent">
							<c:if test="${reg eq recent.getLec_no() }">
								<c:set var="now" value="<%=new java.util.Date() %>" />
								<fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
								<c:set var="compare" value="${nowdate.compareTo(recent.getLec_enddate()) }" />
								<c:if test="${compare <= 0 }">
									<div class="swiper-slide" align="center">
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
									<c:set var="reg_chk" value="${reg_chk + 1 }" />
									<c:if test="${reg_chk eq 20 }">
										<c:set var="reg_loop" value="true" />
									</c:if>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
				<c:if test="${reg_chk eq 0 }">
						<div class="no-recent">
							<h2>내가 수강 중인 클래스가 없습니다</h2>
						</div>
				</c:if>
			</div>
			<c:if test="${reg_chk ne 0 }">
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</c:if>
		</div>
	</div>
	<br><br>
	
	<div class="mypage_container">
		<font style="font-weight: bold;" size="5px">최근 본 클래스 ▼ </font> <br><br>
		<div class="swiper-container swiper2">
			<div class="swiper-wrapper">
				<%	
					int cnt = 0;
					String member_no = String.valueOf(pageContext.getAttribute("member_no"));
					if (ck != null) {
						for (int i = ck.length - 1; i >= 0; i--) {
							if (member_no != "0") {
								pageContext.setAttribute("no", URLDecoder.decode(ck[i].getName(), "UTF-8").substring(2 + member_no.length()));
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
	</div>
	<br><br>
	
	<div class="mypage_container">
      <font style="font-weight: bold;" size="5px">내가 좋아요한 클래스 ▼ </font> <br><br>
      <div class="swiper-container swiper3">
         <div class="swiper-wrapper">
            <c:set var="wish_loop" value="false" />
            <c:set var="wish_chk" value="0" />
            <c:forEach items="${recentList }" var="recent">
               <c:if test="${not wish_loop }">
                  <c:forEach items="${wishList }" var="wish">
                     <c:if test="${wish eq recent.getLec_no() }">
                        <c:set var="now" value="<%=new java.util.Date() %>" />
                        <fmt:formatDate var="nowdate" value="${now }" pattern="yyyy-MM-dd" />
                        <c:set var="compare" value="${nowdate.compareTo(recent.getLec_enddate()) }" />
                        <c:if test="${compare <= 0 }">
                           <div class="swiper-slide" align="center">
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
                           <c:set var="wish_chk" value="${wish_chk + 1 }" />
                           <c:if test="${wish_chk eq 20 }">
                              <c:set var="wish_loop" value="true" />
                           </c:if>
                        </c:if>
                     </c:if>
                  </c:forEach>
               </c:if>
            </c:forEach>
            <c:if test="${wish_chk eq 0 }">
                  <div class="no-recent">
                     <h2>내가 좋아요한 클래스가 없습니다</h2>
                  </div>
            </c:if>
         </div>
         <c:if test="${wish_chk ne 0 }">
            <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
            <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
         
            <!-- 페이징 -->
         </c:if>
         <div class="swiper-pagination"></div>
      </div>
   </div>
   <script src="<%=request.getContextPath()%>/resources/js/main1.js?1"></script>
   
<jsp:include page="../include/footer.jsp" />

</body>
</html>