<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<style type="text/css">
#notice_container{
	width: 750px;
	margin: 0 auto;
}
#notice_container>div{
	font-size: 0;/* 안보이는 여백 없애기 */
}
#notice_tab{
	width: 100%;
	margin: 100px 0 10px 0;
}

#notice_title{
	font-weight: bolder;
	font-size: 24px;
	float: left;
	padding-left: 25px;
	padding-bottom: 10px;
	display: inline-block;
}
#notice_date{
	color: rgba(0,0,0,0.5);
	font-size: 14px;
	float: right;
	padding-right: 25px;
	padding-top: 10px;
	display: inline-block;
	margin: auto 0 0 0;
}

#wrtier_hit>div{
	display: inline-block;
	width: 50%;
}
#wrtier_hit>div div:first-child{
	font-weight: bolder;
	font-size: 16px;
	display: inline-block;
	padding: 0 40px 0 25px;
}
#wrtier_hit>div div:last-child{
	text-align: left;
	font-weight: normal;
	font-size: 16px;
	display: inline-block;

}
#file>div div:first-child{
	text-align: center;
	font-weight: bolder;
	font-size: 16px;
	display: inline-block;
	padding: 0 25px;
}
#file>div div:last-child{
	text-align: left;
	display: inline-block;
	font-size: 16px;
}

#notice_cont{
	font-size: 16px;
	text-align: left;
	padding: 15px 25px;
}

.list_btn, .delete_btn, .update_btn{
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

.notice_hr{
	border: 0;
	height: 1px;
	width: 100%;
	background-color: gray;
	margin: 10px 0;
}
@media screen and (max-width: 1024px){
	#notice_container{
		width: 75%;
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
<jsp:include page="../include/header_2.jsp" />

<div>
<div id="notice_container">
	<div id="notice_tab">
		<div>
			<span id="notice_title">${notice.getNotice_title()}</span>
			<span id="notice_date">${notice.getNotice_date()}</span>
		</div>
		<hr class="notice_hr">
		<div id="wrtier_hit">
			<div>
				<div>작성자</div><div>${notice.getMember_name()}</div>
			</div>
			<div>
				<div>조회수</div><div>${notice.getNotice_hit()}</div>
			</div>
		</div>
		<hr class="notice_hr">
		<div id="file">
			<div>
				<div>첨부파일</div><div><a href="file_download.do?name=${notice.getNotice_file()}">${notice.getNotice_file()}</a></div>
			</div>
		</div>
		<hr class="notice_hr">
		<div><!-- 
			<div id="notice_cont" style="white-space:pre-line;"> -->
			<div id="notice_cont" style="white-space:pre-line;">
				${notice.getNotice_cont()}
			</div>
		</div>
		<hr class="notice_hr">
		<!-- admin일때만 나타나게 -->
			<c:if test="${memID=='admin'}">
				<button onclick="location.href='<%=request.getContextPath()%>/notice_delete.do?no=${notice.getNotice_no()}'"
					class="delete_btn">공지사항 삭제</button>
				<button onclick="location.href='<%=request.getContextPath()%>/notice_update.do?no=${notice.getNotice_no()}'"
					class="update_btn">공지사항 수정</button>
			</c:if>
		<button onclick="location.href='<%=request.getContextPath()%>/notice.do?page=1'" class="list_btn">목록으로</button>
	</div>
</div>
</div>

</body>
</html>