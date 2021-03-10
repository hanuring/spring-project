<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:set value="${sess_member_no }" var="sess_member_no" />
	<c:if test="${!empty sess_member_no }">
		<h5>세션 값(회원번호) : ${sess_member_no }</h5>
		<input type="button" value="로그아웃" onclick="location.href='goto_logout_member.do'">
		<form action="<%=request.getContextPath() %>/goto_myInfo_member.do?no=${sess_member_no }" method="post">
			<input type="submit" value="마이페이지">
		</form>
	</c:if>
	
	<c:if test="${empty sess_member_no }">
	<h5>세션 값 없음</h5>
		<input type="button" value="로그인페이지" onclick="location.href='goto_login_member.do'">
		<input type="button" value="회원가입" onclick="location.href='goto_join_member.do'">
	</c:if>
	
	<br>
	

</body>
</html>