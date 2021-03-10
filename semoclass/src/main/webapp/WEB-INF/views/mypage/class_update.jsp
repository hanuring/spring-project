<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script> --%>

<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_class.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<script type="text/javascript">

function itemChange(){
	var creative = ["미술","공예","디지털 드로잉","라이프 스타일"];
	var career = ["비즈니스/생산성", "영상/디자인","데이터/개발", "글쓰기/콘텐츠"];
	var money = ["부동산/주식/제테크","온라인 쇼핑몰","SNS/콘텐츠", "창업"];
	var selectItem = $("#category1").val();
	var changeItem;
	if(selectItem == 100){
	  changeItem = creative;
	  $('#category2').empty();
		var option = "";
		option +="<option value='101'>"+changeItem[0]+"</option>";
		option +="<option value='102'>"+changeItem[1]+"</option>";
		option +="<option value='103'>"+changeItem[2]+"</option>";
		option +="<option value='104'>"+changeItem[3]+"</option>";
		$('#category2').append(option);
	}
	else if(selectItem == 200){
	  changeItem = career;
	  $('#category2').empty();
		var option = "";
			option +="<option value='201'>"+changeItem[0]+"</option>";
			option +="<option value='202'>"+changeItem[1]+"</option>";
			option +="<option value='203'>"+changeItem[2]+"</option>";
			option +="<option value='204'>"+changeItem[3]+"</option>";
		$('#category2').append(option);
		
	} else if(selectItem == 300){
	  changeItem =  money;
	  $('#category2').empty();
		var option = "";
			option +="<option value='301'>"+changeItem[0]+"</option>";
			option +="<option value='302'>"+changeItem[1]+"</option>";
			option +="<option value='303'>"+changeItem[2]+"</option>";
			option +="<option value='304'>"+changeItem[3]+"</option>";
		$('#category2').append(option);
		
	} else if (selectItem == ''){
		$('#category2').empty();
		var option ="";
			option +="<option value=''>----- 카테고리 2 ----</option>";
		$('#category2').append(option);
	}
	
}

function check(){
	if($("#category1").val() == ""){
		alert("카테고리를 선택해주세요.");
		$("#category1").focus();
		return false;
	}
	if($("#lec_amount").val() == ""){
		alert("클래스 분량을 입력해주세요.");
		$("#lec_amount").focus();
		return false;
	}
	if($("#lec_possible").val() == ""){
		alert("수강 가능일을 입력해주세요.");
		$("#lec_possible").focus();
		return false;
	}
	if($("#thumbnail").val() == ""){
		alert("대표 이미지를 첨부해주세요.");
		$("#thumbnail").focus();
		return false;
	}
	if($("#lec_name").val() == ""){
		alert("클래스 제목을 입력해주세요.");
		$("#lec_name").focus();
		return false;
	}
	if($("#lec_refund").val() == ""){
		alert("환불 가능일 입력해주세요.");
		$("#lec_refund").focus();
		return false;
	}
	if($("#lec_price").val() == ""){
		alert("가격을 입력해주세요.");
		$("#lec_price").focus();
		return false;
	}
	if($("#lec_startdate").val() == ""){
		alert("수업 시작일을 선택해주세요.");
		$("#lec_startdate").focus();
		return false;
	}
	if($("#lec_enddate").val() == ""){
		alert("수업 종료일을 선택해주세요.");
		$("#lec_enddate").focus();
		return false;
	}
	
}


	function setThumbnail(event) {
		var reader = new FileReader();
		
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	

</script>
</head>
<body>

	<div align="center">
<%-- 	<jsp:include page="../include/header.jsp" /> --%>
  		 <h3 align="center"><img src="resources/img/ot_logo.PNG" width="300" id="icon" alt="User Icon" /> </h3>
		<hr style="border:solid 1px #3A4CA8;" width="65%">
		
		<!-- <hr width="70%" color="lightgray"> -->
		
		<form method="post" action="<%=request.getContextPath() %>/class_update_ok.do" enctype="multipart/form-data" onsubmit="return check()">
			<input type="hidden" name="lec_no" value="${dto.getLec_no() }"> 
			<input type="hidden" name="lec_member" value="${dto.getLec_member() }">
			<table>
				<c:set var="dto" value="${dto }" />
				<c:if test="${!empty dto }">
				<tr>
					<th> 브랜드 </th>
					<td> 
					<select name="category1" id="category1" onchange="itemChange()">
						<option value="100" <c:if test="${dto.getCate_code_ref() == '100' }">selected</c:if>>크리에이티브</option>
						<option value="200" <c:if test="${dto.getCate_code_ref() == '200' }">selected</c:if>>커리어</option>
						<option value="300" <c:if test="${dto.getCate_code_ref() == '300' }">selected</c:if>>머니</option>			
					</select>
					</td>
				</tr>
				<tr>
					<th> 카테고리 </th>
					<td>
						<select name="cate_fk" id="category2">
							<c:if test="${dto.getCate_code_ref() == '100' }">
								<option value="101" <c:if test="${dto.getCate_fk() == '101' }">selected</c:if>>미술</option>
								<option value="102" <c:if test="${dto.getCate_fk() == '102' }">selected</c:if>>공예</option>
								<option value="103" <c:if test="${dto.getCate_fk() == '103' }">selected</c:if>>디지털 드로잉</option>
								<option value="104" <c:if test="${dto.getCate_fk() == '104' }">selected</c:if>>라이프 스타일</option>
							</c:if>
							<c:if test="${dto.getCate_code_ref() == '200' }">
								<option value="201" <c:if test="${dto.getCate_fk() == '201' }">selected</c:if>>비즈니스/생산성</option>
								<option value="202" <c:if test="${dto.getCate_fk() == '202' }">selected</c:if>>영상/디자인</option>
								<option value="203" <c:if test="${dto.getCate_fk() == '203' }">selected</c:if>>데이터/개발</option>
								<option value="204" <c:if test="${dto.getCate_fk() == '204' }">selected</c:if>>글쓰기/콘텐츠</option>
							</c:if>
							<c:if test="${dto.getCate_code_ref() == '300' }">
								<option value="301" <c:if test="${dto.getCate_fk() == '301' }">selected</c:if>>부동산/주식/재테크</option>
								<option value="302" <c:if test="${dto.getCate_fk() == '302' }">selected</c:if>>온라인 쇼핑몰</option>
								<option value="303" <c:if test="${dto.getCate_fk() == '303' }">selected</c:if>>SNS/콘텐츠</option>
								<option value="304" <c:if test="${dto.getCate_fk() == '304' }">selected</c:if>>창업</option>
							</c:if>
						</select>
					</td>
				</tr>
				<tr>
					<th> 클래스 분량 </th>
					<td> <input name="lec_amount" id="lec_amount" type="text" value="${dto.getLec_amount() }">  </td>
				</tr>
				<tr>
					<th> 수강 가능 상태 </th>
					<td> <input name="lec_possible" id="lec_possible" type="text" value="${dto.getLec_possible() }"> </td>
				</tr>
				<tr>
					<th> 대표 이미지 </th>
					<td> 
						<input type="hidden" name="lec_thumbnail" value="${dto.getLec_thumbnail() }" >
						<img src="resources/img/lec_info/${dto.getLec_thumbnail() }" width="300" > <br>
							이미지를 변경하려면 클릭하세요.
						<input name="thumbnail" id="img" type="file" accept="img/*" onchange="setThumbnail(event);" style="border: none;">
						<div id="image_container"> </div>	
					</td>
 				</tr>
				<tr>
					<th> 클래스 제목 </th>
					<td> <input name="lec_name" id="lec_name" type="text" size="90" value="${dto.getLec_name() }"> </td>
				</tr>
				<tr>
					<th> 클래스 소개 </th>
					<td> <textarea id="content" name="lec_explain">${dto.getLec_explain() }</textarea> </td>
				</tr>
				<tr>
					<th> 환불 가능일 </th>
					<td> <label> <input name="lec_refund" id="lec_refund" type="number" style="border: none; width: 630px; height: 32px;" value="${dto.getLec_refund() }"> 일 이내 </label> </td>
				</tr>
				<tr>
					<th> 대상 </th>
					<td>
						<select name="lec_level">
							<option value="입문자" <c:if test="${dto.getLec_level() == '입문자' }">selected</c:if> >입문자</option>
							<option value="초급자" <c:if test="${dto.getLec_level() == '초급자' }">selected</c:if> >초급자</option>
							<option value="중급자" <c:if test="${dto.getLec_level() == '중급자' }">selected</c:if> >중급자</option>
							<option value="준전문가" <c:if test="${dto.getLec_level() == '준전문가' }">selected</c:if> >준전문가</option>
						</select>
					</td>
				</tr>
				<tr>
					<th> 준비물 유무 </th>
					<td>
						<select name="lec_tool">
							<option value="유" <c:if test="${dto.getLec_tool() == '유' }">selected</c:if> >유</option>
							<option value="무" <c:if test="${dto.getLec_tool() == '무' }">selected</c:if> >무</option> 
						</select>
					</td>
				</tr>
				<tr>
					<th> 가격 </th>
					<td> <label> <input name="lec_price" name="lec_price" type="number" style="border: none; width: 650px; height: 32px;" value="${dto.getLec_price() }"> 원</label></td>
				</tr>
				<tr>
					<th> 수업 시작일 </th>
					<td> <input name="lec_startdate" id="lec_startdate" value="${dto.getLec_startdate().substring(0,10) }"> </td>
				</tr>
				<tr>
					<th> 수업 종료일 </th>
					<td> <input name="lec_enddate" id="lec_enddate" value="${dto.getLec_enddate().substring(0,10) }"> </td>
				</tr>
				<tr align="center">
					<td align="center" colspan="2">
						<input type="submit" value="수정" class="btn_blue">
						<input type="reset" value="재작성" class="btn_blue">
						<input type="button" value="뒤로" class="btn_blue" onclick="history.back();"> &nbsp;&nbsp;
					</td>
				</tr>
			</c:if>
			</table>
		</form>
	
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>

</body>
</html>