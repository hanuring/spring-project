<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
</head>
<body>
	<c:set value="${dto }" var="dto" />
	<form action="<%=request.getContextPath() %>/member_edit_check.do" method="post">
	<input type="hidden" value="${dto.getMember_no() }" name="no">
	
	<table border="1" cellspacing="0">
		<tr>
			<td> 비밀번호를 입력해 주세요 </td>
		</tr>
		<tr>
			<td> <input type="password" name="try_pwd"> </td>
		</tr>
		<tr>
			<td> <input type="submit" value="확인"> </td>
		</tr>
		
	</table>
	
	</form>
	

</body>
</html>