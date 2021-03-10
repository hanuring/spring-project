<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
</head>
<body>

	<div class="wrap" align="center">
	<c:set var="list" value="${cList }" />
	<c:if test="${!empty list }">
	<c:forEach items="${list }" var="info">
		<table>
			<tr>
				<td> <img alt="썸네일" src="resources/img/lec_info/${info.getLec_thumbnail() }" width="300">
			</tr>
			<tr>
				<td> ${info.getCate_name() } </td>
			</tr>
			<tr>
				<td> <a href="<%=request.getContextPath() %>/info_cont.do?no=${info.getLec_no() }">  ${info.getLec_name() } </a></td>
			</tr>
			<tr>
				<td> <fmt:formatNumber value="${info.getLec_price() }" /> 원</td>
			</tr>
			<tr>
				<td> ${info.getLec_possible() } 수강 가능 </td>
			</tr>
		</table>
	</c:forEach>
	</c:if>

</body>
</html>