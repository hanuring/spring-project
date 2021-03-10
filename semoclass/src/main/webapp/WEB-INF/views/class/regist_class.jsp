<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function getRadio(event) {
	$("#final_price")[0].innerText= "";
	var radioValue = event.target.value;
	var period ;
	if(radioValue == 1){
		period = "(일시불)";
	} else {
		period = "(" +radioValue + "개월)";
	}
	radioValue = parseInt($("#total_price").val()/radioValue);
	var price = radioValue.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	$("#final_price")[0].innerText = price+period;
}
</script>
<link rel="stylesheet" href="resources/css/regist_pay.css">
</head>
<body style="margin-left: 15%; margin-right: 15%;">
<jsp:include page="../include/simple_header.jsp" />
<div align="center">
	<div id="wrap" align="center">
	<br><br>
		<c:set var="dto" value="${dto }" />
		<form method="post" action="<%=request.getContextPath() %>/regist_class_ok.do?lec_no=${dto.getLec_no() }&mem_no=${member_no }">
		<div align="center">
		<header id="pay_header">
			<div id="pay_header_div">
				<h3 id="pay">결제하기</h3>
				<strong><i class="fas fa-lock" id="security"></i>암호화 중</strong>
			</div>
		</header>
	<section id="pay_section">
	<div align="left">
		<h2>주문 정보</h2>
		<div id="class_name">
			${dto.getLec_name() }
		</div>
		<br>
			<div>
			<img src="resources/img/lec_info/${dto.getLec_thumbnail() }" width="200px" height="200px">
			</div>
			<hr color="#edeff0">
			<div class="member_info">
			<h2>연락처 정보</h2>
			</div>
			<div>
			 <label>받으시는분</label>
			</div>
			<div>
			<input type="text" id="receiver" value="${member_name }">
			</div>
			<p id="input_description">배송 시 수령인 확인을 위해 실명을 입력해 주세요.</p>
			<br>
			<div>
				<label id="phone">휴대폰 번호(연락처)</label>
			</div>
			<div>
				<input type="text" id="phone_number" placeholder="받으시는 분의 연락처를 입력하세요." required>
			</div><br>
			<hr color="#edeff0">	
			<div class="member_info">
			<h2>결제 금액</h2>
			</div>
			<br>
			<table id="price_table">
				<tr>
					<th>총 상품 금액 </th>
					<td> 
						<b><fmt:formatNumber currencySymbol="KRW" value="${dto.getLec_price() }" currencyCode="KRW"/>원 </b>
						<input type="hidden" value="${dto.getLec_price() }" id="total_price">
					</td>
				</tr>			
				<tr>
					<th>할부 선택 </th>
					<td>
						<input type="radio" name="installment" value='1' onclick="getRadio(event)" required />일시불
						<input type="radio" name="installment" value="2" onclick="getRadio(event)" />2개월
						<input type="radio" name="installment" value="4" onclick="getRadio(event)" />4개월
						<input type="radio" name="installment" value="6" onclick="getRadio(event)" />6개월
					</td>
				</tr>
				<tr>
					<th>
						최종 금액
					</th>
					<td id="final_price">
						<fmt:formatNumber currencySymbol="KRW" value="${dto.getLec_price() }" currencyCode="KRW"/>원 </b>
					</td>
				</tr>
			</table>			
			<hr color="#edeff0">	
			<section id="method_pay">
				<h2>결제 방식</h2>
				<div id="method_pay_div">
					<button id="method_pay_btn" type="button"><i class="far fa-credit-card fa-2x"></i><div id="method_pay_text">&nbsp;카드 결제</div></button>
					<button id="method_pay_btn" type="button"><i class="far fa-money-bill-alt fa-2x"></i><div id="method_pay_text">&nbsp;무통장 입금</div></button>
					<button id="method_pay_btn" type="button"><i class="fab fa-apple-pay fa-4x"></i><div id="method_pay_text"></div></button>
					<button id="method_pay_btn" type="button"><i class="fab fa-paypal fa-2x"></i><div id="method_pay_text">&nbsp;페이팔</div></button>
				</div>
			</section>
			<br>
			<div>
				<button id="pay_btn" type="submit"><span id="pay_btn_text">결제하기</span></button>						
				<!-- <script type="text/javascript">
					$("#pay_btn").click(function(){
						alert('수강 신청 성공');
					});
				</script> -->
			</div>
			</div>
			<br><br><br><br>
	</section>
	</div>
	</form>
	<br>
	</div>
	
<jsp:include page="../include/footer.jsp" />	
	
</div>
</body>
</html>