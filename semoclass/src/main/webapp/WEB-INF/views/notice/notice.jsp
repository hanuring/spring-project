<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<meta charset="UTF-8">
<style type="text/css">
#notice_container{
	width: 800px;
	margin: 0 auto;
}
#notice_container>div:first-child{
	width: 100%;
	height: 470px;
}

#notice_tab{
	width: 100%;
	table-layout: fixed;
	word-break: break-all;
	margin: 100px 0 10px 0;
}
#notice_tab, #notice_tab td, #notice_tab th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-collapse: collapse;
	height: 36px;
	text-align: center;
}
#notice_tab tr:first-child{
	background-color: rgba(0,0,150,0.05);
}
.notice_row:hover{
	background-color: rgba(0,0,50,0.05);
}
.td_link{
	cursor: pointer;
}


.write_btn{
	float: right;
	border: 0;
	background-color: rgba(0,0,0,0.1);
	border-radius: 2px;
	cursor: pointer;
	color: rgb(100,100,100);
	padding: 4px 7px;
	margin: 0 4px;
	outline: 0;
}

.page{
	padding: 5px 8px;
	border: 1px solid rgba(0,0,0,0.1);
	margin: 0;
	cursor: pointer;
	display: inline-block;
}
.curPage{
	font-weight: bold;
	color: rgb(149,75,255);
}

@media screen and (max-width: 1024px){
	#notice_container{
		width: 70%;
	}
}
@media screen and (max-width:767px) {
	#notice_container{
		width: 100%;
	}
}
</style>
</head>
<body style="margin-left: 15%; margin-right: 15%;">

<!-- 공지사항 목록 -->
	<jsp:include page="../include/header_2.jsp" />
	<div align="center" id="notice_container">
		<div >
			<c:set var="nList" value="${noticeList}" />

			<table id="notice_tab">
				<colgroup>
					<col width="15%" />
					<col width="55%" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th>공지번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
				<c:if test="${!empty nList}">
					<c:forEach items="${nList}" var="dto">
						<tr class="notice_row">
							<td>${dto.getNotice_no()}</td>
							<td onclick="location.href='<%=request.getContextPath()%>/notice_cont.do?no=${dto.getNotice_no()}'" class="td_link">
								${dto.getNotice_title()}</td>
							<td>${dto.getMember_name()}</td>
							<td>${dto.getNotice_hit()}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty nList}">
					<tr>
						<td colspan="4" align="center">
							<h3>작성된 공지사항이 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>
			
		</div>
		<!-- admin일때만 나타나게 -->
			<c:if test="${memID=='admin'}">
				<div>
					<button onclick="location.href='<%=request.getContextPath()%>/notice_write.do'"
						class="write_btn">공지사항 작성</button>
				</div>
			</c:if>
			<div id="page_btn">
				<c:if test="${page == startBlock && page != 1}">
					<div class="page" onclick="location.href='<%=request.getContextPath()%>/notice.do?page=${i-1}'">◀</div>
				</c:if>
				
				<c:forEach begin="${startBlock}" end="${endBlock}" var="i">
					<c:if test="${page == i}">
						<div class="page curPage" onclick="location.href='<%=request.getContextPath()%>/notice.do?page=${i}'">${i}</div>
					</c:if>
					<c:if test="${page != i}">
						<div class="page" onclick="location.href='<%=request.getContextPath()%>/notice.do?page=${i}'">${i}</div>
					</c:if>
				</c:forEach>
				
				<c:if test="${page == endBlock && page != allPage}">
					<div class="page" onclick="location.href='<%=request.getContextPath()%>/notice.do?page=${i+1}'">▶</div>
				</c:if>
			</div>
	</div>

</body>
</html>