<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성하기</title>
<style type="text/css">
body{
}
.btn{
	border: 0;
	background-color: rgba(0,0,0,0.1);
	border-radius: 2px;
	cursor: pointer;
	color: rgb(100,100,100);
	padding: 4px 7px;
	margin: 20px 4px;
}
textarea[name=comu_cont]{
	outline: none;
	font-size: 14px;
	resize: none;
	width: 95%;
	height: 350px;
	padding: 10px;
}
.comu_write_label{
	font-size: 18px;
	font-weight: bold;
	padding: 10px 0;
	margin: 6px 0;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function comuWriteClose(){
	var comuData = $('[name=comu_write]').serialize();
	$.ajax({
		type: "post",
		url: 'comu_writeOk.do',
		data: comuData,
		success: function(data){
			window.opener.location.reload();
			window.close();
		}
	});
}
function comuWriteCancel(){
	window.close();
}
</script>
</head>
<body>

<div align="center">
	<!-- action="<%=request.getContextPath()%>/comu_writeOk.do" -->
	<form method="post" name="comu_write">
	<input type="hidden" name="mem_no_fk" value="${member_no}">
	<input type="hidden" name="lec_no_fk" value="${lec_no}">
		<div class="comu_write_label">
			[${lec_name}]<br>
			커뮤니티 글 작성하기</div>
		<div>
			<textarea name="comu_cont" autofocus required></textarea>
		</div>
		<input type="button" value="작성 완료" onclick="comuWriteClose()" class="btn">
		<input type="button" value="닫기" onclick="comuWriteCancel()" class="btn">
	</form>
</div>

</body>
</html>