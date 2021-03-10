<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#notice_form{
	width: 600px;
	margin: 0 auto;
}
.notice_form_tab{
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
	word-break: break-all;
}
.notice_form_tab th,.notice_form_tab td{
	border-top: 1px solid gray;
	padding: 12px 0 12px 12px;
}
.notice_form_tab th{
	border-right: 1px solid gray;
	padding: 12px 0;
}

input[name="notice_title"]:focus, textarea[name="notice_cont"]:focus{
	background-color: rgba(0,0,0,0.05);
}

textarea[name="notice_cont"]{
	border: 0;
	outline: 0;
	height: 280px;
	width: 380px;
	resize: none;
}

.write_btn,.cancel_btn{
	border: 0;
	background-color: rgba(0,0,0,0.1);
	border-radius: 2px;
	cursor: pointer;
	color: rgb(100,100,100);
	padding: 4px 7px;
	margin: 0 4px;
	outline: 0;
}

.title_input{
	border: none;
	outline: none;
	padding: 5px;
	font-size: 14px;
	width: 75%;
}

@media screen and (max-width: 1024px){
	#notice_form{
		width: 75%;
	}
}
@media screen and (max-width:767px) {
	#notice_form{
		width: 100%;
	}
}
</style>
</head>
<body style="margin-left: 15%; margin-right: 15%;">
<jsp:include page="../include/header_2.jsp" />

<div id="notice_form" align="center">
	<h3>공지사항 작성</h3>
	<form action="<%=request.getContextPath()%>/notice_update_ok.do" method="post" enctype="multipart/form-data">
	<c:set var="cont" value="${updateCont}"/>
	<input type="hidden" name="notice_no" value="${cont.getNotice_no()}">
		<table class="notice_form_tab">
			<colgroup>
				<col width="25%" />
				<col width="75%" />
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="notice_title" class="title_input" value="${cont.getNotice_title()}" required autofocus></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="notice_cont" required maxlength="1000">${cont.getNotice_cont()}</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					기존 파일: ${cont.getNotice_file()}
					<input type="file" name="notice_filename" title="${cont.getNotice_file()}">
					<input type="hidden" name="old_filename" value="${cont.getNotice_file()}">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정완료" class="write_btn">
					<input type="button" value="취소" onclick="location.href='<%=request.getContextPath()%>/notice.do?page=0'" class="cancel_btn">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>