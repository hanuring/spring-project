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
<link href="<c:url value="/resources/css/main1.css?after1"/>" rel="stylesheet">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">

.hot_container {
	width: 90%;
	margin: 0 auto;
	text-align: center;
}

.hot_div {
	width: 20%;
	height: 300px;
	display: inline-block;
	vertical-align: top;
}

.recent_container {
	width: 90%;
	margin: 0 auto;
	text-align: center;
}

.recent_div {
	width: 20%;
	height: 300px;
	display: inline-block;
	vertical-align: top;
}

</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<br><br><br><br><br><br>
	<c:set var="mdto" value="${mdto }" />
	<c:set var="recentList" value="${recentList }" />
	<c:set value="${Member_list }" var="mlist"/>
	<c:set var="member_no" value="${member_no }" />
	<c:set var="wishList" value="${wishList }" />
	<c:if test="${mdto.getMember_grade() == '강사' }">
		<c:if test="${member_no ne 0 }"><h3>내가 개설한 클래스</h3></c:if>
		<div class="recent_container" align="center">
			<c:forEach items="${recentList }" var="recent">
				<c:if test="${mdto.getMember_id() eq recent.getLec_member() }">
					<div class="recent_div" align="center">
						<a href="<%=request.getContextPath() %>/info_cont.do?no=${recent.getLec_no() }">
						<div align="center">
							<img alt="썸네일" src="resources/img/lec_info/${recent.getLec_thumbnail() }" width="300">
						</div>
						<div align="center">
							<c:forEach items="${mlist }" var="mdto">
								<c:if test="${mdto.getMember_id() == recent.getLec_member() }">
									${mdto.getMember_name() }	
								</c:if>
							</c:forEach>
		<%-- 					${hot.getLec_member() } --%>
							<br>
		<%-- 					<a href="<%=request.getContextPath() %>/info_cont.do?no=${hot.getLec_no() }">${hot.getLec_name() }</a><br> --%>
							${recent.getLec_name() }<br>
							<c:if test="${recent.getAll_pref_like() eq 0 }">
								좋아요 없음
							</c:if>
							<c:if test="${recent.getAll_pref_like() + recent.getAll_pref_dislike() ne 0 }">
								<fmt:formatNumber value="${recent.getAll_pref_like() / (recent.getAll_pref_like() + recent.getAll_pref_dislike()) }" type="percent" /><br>
							</c:if>
							<!-- 0201 철민 -->
							<fmt:formatNumber value="${recent.getLec_price() }" type="number" maxFractionDigits="3" /><br>
							${recent.getLec_possible() }<br>
						</div>			
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
	
	<c:if test="${member_no ne 0 }"><h3>오늘 본 클래스</h3></c:if>
	<div class="recent_container" align="center">
		<%	
			int cnt = 0;
			String member_no = String.valueOf(pageContext.getAttribute("member_no"));
			if (ck != null) {
				for (int i = ck.length - 1; i >= 0; i--) {
					if (member_no != "0") {
						pageContext.setAttribute("no", URLDecoder.decode(ck[i].getName(), "UTF-8").substring(3 + member_no.length()));
						if (ck[i].getName().indexOf("mem" + member_no) != -1) { %>
							<c:forEach items="${recentList }" var="recent">
								<c:if test="${no eq recent.getLec_no() }">
									<div class="recent_div" align="center">
										<a href="<%=request.getContextPath() %>/info_cont.do?no=${recent.getLec_no() }">
										<div align="center">
											<img alt="썸네일" src="resources/img/lec_info/${recent.getLec_thumbnail() }" width="300">
										</div>
										<div align="center">
											<c:forEach items="${mlist }" var="mdto">
												<c:if test="${mdto.getMember_id() == recent.getLec_member() }">
													${mdto.getMember_name() }	
												</c:if>
											</c:forEach>
						<%-- 					${hot.getLec_member() } --%>
											<br>
						<%-- 					<a href="<%=request.getContextPath() %>/info_cont.do?no=${hot.getLec_no() }">${hot.getLec_name() }</a><br> --%>
											${recent.getLec_name() }<br>
											<c:if test="${recent.getAll_pref_like() eq 0 }">
												좋아요 없음
											</c:if>
											<c:if test="${recent.getAll_pref_like() + recent.getAll_pref_dislike() ne 0 }">
												<fmt:formatNumber value="${recent.getAll_pref_like() / (recent.getAll_pref_like() + recent.getAll_pref_dislike()) }" type="percent" /><br>
											</c:if>
											<!-- 0201 철민 -->
											<fmt:formatNumber value="${recent.getLec_price() }" type="number" maxFractionDigits="3" /><br>
											${recent.getLec_possible() }<br>
										</div>			
										</a>
									</div>
								</c:if>
							</c:forEach>
		<% 
							cnt++;
							if (cnt == 10) break;
						}
					} else if (member_no == "0") {
						pageContext.setAttribute("no", URLDecoder.decode(ck[i].getName(), "UTF-8").substring(5));
						if (ck[i].getName().indexOf("cname") != -1) { %>
							<c:set var="no" value="${no }" />
							<a href="<%=request.getContextPath() %>/info_cont.do?no=${no }">
		<%
								out.println(URLDecoder.decode(ck[i].getValue(), "UTF-8") + "<br>");
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
	</div><br><br>
	
	<c:if test="${member_no ne 0 }"><h3>내가 찜한 클래스</h3></c:if>
	<div class="recent_container" align="center">
		<c:forEach items="${recentList }" var="recent">
			<c:forEach items="${wishList }" var="wish">
				<c:if test="${wish eq recent.getLec_no() }">
					<div class="recent_div" align="center">
						<a href="<%=request.getContextPath() %>/info_cont.do?no=${recent.getLec_no() }">
						<div align="center">
							<img alt="썸네일" src="resources/img/lec_info/${recent.getLec_thumbnail() }" width="300">
						</div>
						<div align="center">
							<c:forEach items="${mlist }" var="mdto">
								<c:if test="${mdto.getMember_id() == recent.getLec_member() }">
									${mdto.getMember_name() }	
								</c:if>
							</c:forEach>
		<%-- 					${hot.getLec_member() } --%>
							<br>
		<%-- 					<a href="<%=request.getContextPath() %>/info_cont.do?no=${hot.getLec_no() }">${hot.getLec_name() }</a><br> --%>
							${recent.getLec_name() }<br>
							<c:if test="${recent.getAll_pref_like() eq 0 }">
								좋아요 없음
							</c:if>
							<c:if test="${recent.getAll_pref_like() + recent.getAll_pref_dislike() ne 0 }">
								<fmt:formatNumber value="${recent.getAll_pref_like() / (recent.getAll_pref_like() + recent.getAll_pref_dislike()) }" type="percent" /><br>
							</c:if>
							<!-- 0201 철민 -->
							<fmt:formatNumber value="${recent.getLec_price() }" type="number" maxFractionDigits="3" /><br>
							${recent.getLec_possible() }<br>
						</div>			
						</a>
					</div>
				</c:if>
			</c:forEach>
		</c:forEach>
	</div>
	
</body>
</html>