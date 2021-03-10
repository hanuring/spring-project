<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script> --%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
		option +="<option value=''>클래스 분야를 선택해주세요.</option>"
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
			option +="<option value=''>클래스 분야를 선택해주세요.</option>"
			option +="<option value='201'>"+changeItem[0]+"</option>";
			option +="<option value='202'>"+changeItem[1]+"</option>";
			option +="<option value='203'>"+changeItem[2]+"</option>";
			option +="<option value='204'>"+changeItem[3]+"</option>";
		$('#category2').append(option);
		
	} else if(selectItem == 300){
	  changeItem =  money;
	  $('#category2').empty();
		var option = "";
			option +="<option value=''>클래스 분야를 선택해주세요.</option>"
			option +="<option value='301'>"+changeItem[0]+"</option>";
			option +="<option value='302'>"+changeItem[1]+"</option>";
			option +="<option value='303'>"+changeItem[2]+"</option>";
			option +="<option value='304'>"+changeItem[3]+"</option>";
		$('#category2').append(option);
		
	} else if (selectItem == ''){
		$('#category2').empty();
		var option ="";
			option +="<option value=''>클래스 분야를 선택해주세요.</option>";
		$('#category2').append(option);
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

</script>
<style type="text/css">
#lec_price, #lec_refund{
	border: none; width: 630px; height: 32px;
}
</style>


<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage_class.css">
</head>
<body>

	<div align="center">
  		 <h3 align="center"><img src="resources/img/ot_logo.PNG" width="300" id="icon" alt="User Icon" /> </h3>
		<hr style="border:solid 1px #3A4CA8;" width="65%"> <br>
		<h3>간단하게 어떤 클래스인지 알려주세요.</h3>
		<p class="p"> 언젠가 이런 걸 가르쳐봐야지 생각해본 적이 있으신가요? <br>
			간단히 크리에이터님이 알려줄 수 있는 카테고리를 설정해봐요. </p> <br>
		<hr width="70%" color="lightgray">

		<form method="post" action="<%=request.getContextPath() %>/class_insert_ok.do" enctype="multipart/form-data" onsubmit="return check()">
			<input type="hidden" name="lec_member" value="${member_name}">
			<input type="hidden" name="mem_no_fk" value="${sessionScope.member_no}">
			<table>
				<tr>
					<th> 브랜드 </th>
					<td> 
					<c:set var="list" value="${cateList }" />
					<c:if test="${!empty list }">
						<select name="category1" id="category1" onchange="itemChange()" >
							<option value="" disabled selected hidden>클래스(브랜드)를 선택해주세요.</option>
							<c:forEach items="${list }" var="cate">
								<option value="${cate.getCate_code() }">${cate.getCate_name() }</option>
							</c:forEach>
						</select>
					</c:if> 
					</td>
				</tr>
				<tr>
					<th> 카테고리 </th>
					<td>
						<select name="cate_fk" id="category2">
							<option value="" disabled selected hidden>클래스 분야를 선택해주세요.</option>
						</select>
					</td>
				</tr>
				<tr>
					<th> 클래스 분량 </th>
					<td> <input name="lec_amount" id="lec_amount"  type="text" size="20" placeholder="클래스 분량을 간략하게 적어주세요. ex) 8챕터, 20개 세부강의"> </td>
				</tr>
				<tr>
					<th> 수강 가능일 </th>
					<td> <input name="lec_possible" id="lec_possible"  type="text" size="40" placeholder="수강 가능일을 적어주세요. ex) 즉시 가능 or 2주 뒤"> </td>
				</tr>
				<tr>
					<th> 대표 이미지 </th>
					<td> 
						<input name="thumbnail" id="img" type="file" accept="img/*" onchange="setThumbnail(event);" placeholder="대표이미지를 선택해주세요." style="border: none;"/>
						<div id="image_container"></div>
					</td>
 				</tr>
				<tr>
					<th> 클래스 제목 </th>
					<td> <input name="lec_name" id="lec_name"  type="text" size="90" placeholder="컨셉이 잘 드러나는 클래스의 제목을 지어주세요."> </td>
				</tr>
				<tr>
					<th> 클래스 소개 </th>
					<td> <textarea id="content" rows="8" cols="30"  name="lec_explain" placeholder="최대한 상세하게 적어주세요 :)"></textarea> </td>
				</tr>
				<tr>
					<th> 환불 가능일 </th>
					<td> <label> <input name="lec_refund" id="lec_refund" type="number" min="1" max="60" placeholder="환불 가능일자를 적어주세요. ex) 7"> &nbsp;&nbsp;일 이내 </label> </td>
				</tr>
				<tr>
					<th> 난이도 </th>
					<td>
						<select name="lec_level" >
							<option value="" disabled selected hidden>어떤 수강생에게 맞는 난이도인지 선택해주세요.</option>
							<option value="입문자">입문자</option>
							<option value="초급자">초급자</option>
							<option value="중급자">중급자</option>
							<option value="준전문가">준전문가</option>
						</select>
					</td>
				</tr>
				<tr>
					<th> 준비물 </th>
					<td>
						<select name="lec_tool" >
							<option value="" disabled selected hidden>준비물 유/무를 선택해주세요. </option>
							<option value="유">준비물 필요</option>
							<option value="무">준비물 필요 없음</option> 
						</select>
					</td>
				</tr>
				<tr id="label">
					<th> 가격 </th>
					<td> <label > <input name="lec_price" id="lec_price"  type="number" style="border: none; width: 650px; height: 32px;" placeholder="클래스 가격을 적어주세요. ex) 120000"> &nbsp;&nbsp; 원 </label></td>
				</tr>
				<tr>
					<th> 수업 시작일 </th>
					<td> <input name="lec_startdate" id="lec_startdate"  type="date">
				</tr>
				<tr>
					<th> 수업 종료일 </th>
					<td> <input name="lec_enddate" id="lec_enddate" type="date">
				</tr>
				<tr align="center">
					<td align="center" colspan="2">
						<input type="submit" value="신청" class="btn_blue">
						<input type="reset" value="재작성" class="btn_blue">
						<input type="button" value="뒤로" class="btn_blue" onclick="history.back();">
					</td>
				</tr>
			</table>
		</form>
	
		<br/><br/><br/>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>

</body>
</html>