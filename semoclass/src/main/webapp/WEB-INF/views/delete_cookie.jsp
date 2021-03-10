<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Cookie[] ck = request.getCookies();

	if (ck != null) {
		for (int i = 0; i < ck.length; i++) {
			ck[i].setMaxAge(0);
			response.addCookie(ck[i]);
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="<%=request.getContextPath() %>/main.do">메인</a>
	
</body>
</html>