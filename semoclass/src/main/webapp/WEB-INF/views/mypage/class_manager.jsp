<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

function check(no) {
	var del = confirm("정말로 삭제하시겠습니까?");
	if(del) {
		location.href="class_delete.do?no="+no;
	}
}
	
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_class_manager.css">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />

</head>
<body>

	<div align="center">
	<jsp:include page="../include/simple_header.jsp" />
		<hr id="hr" width="1300px">
	<table>
		<tr style="border: none; background-color: white;">
			<th> 카테고리 </th> <th> 썸네일 </th> <th> 클래스 이름 </th> <th> 등록일 </th> 
			<th> 가격 </th> <th> 클래스 관리 </th> <th> OT 관리 </th>
		</tr>
		<c:set var="list" value="${cList }" />
		<c:if test="${!empty list }">
		<c:forEach items="${list }" var="info">
			<tr>
				<td width="120px"> ${info.getCate_name() } </td>
				<td> <a href="class_update.do?no=${info.getLec_no() }"> <img src="resources/img/lec_info/${info.getLec_thumbnail() }" width="200" > </a> </td>
				<td width="350px"> <a href="class_update.do?no=${info.getLec_no() }"> ${info.getLec_name() } </a> </td>
				<td width="150px"> ${info.getLec_date().substring(0,10) } </td>
				<td> <fmt:formatNumber value="${info.getLec_price() }" /> 원 </td>
				<td align="center">
					<input type="button" value="수정" class="btn_blue" onclick="location.href='class_update.do?no=${info.getLec_no() }'"> <br />
					<input type="button" value="삭제" class="btn_orange" onclick="check(${info.getLec_no() })"> 
				</td>
				<td align="center">
					<input type="button" value="추가/수정" class="btn_blue" onclick="location.href='ot_insertEdit.do?no=${info.getLec_no() }'"> <br />
					<input type="button" value="삭제" class="btn_orange" onclick="location.href='<%=request.getContextPath() %>/ot_delete.do?no=${info.getLec_no() }'"> 
				</td>
			</tr>
		</c:forEach>
		</c:if>
		</table>
	</div>

</body>
</html>