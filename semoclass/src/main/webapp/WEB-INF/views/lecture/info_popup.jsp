<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.sans { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol"; }
.code { font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace; }
.serif { font-family: Lyon-Text, Georgia, YuMincho, "Yu Mincho", "Hiragino Mincho ProN", "Hiragino Mincho Pro", "Songti TC", "Songti SC", "SimSun", "Nanum Myeongjo", NanumMyeongjo, Batang, serif; }
.mono { font-family: iawriter-mono, Nitti, Menlo, Courier, monospace; }
.pdf .sans { font-family: Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK SC', 'Noto Sans CJK KR'; }

.pdf .code { font-family: Source Code Pro, "SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK SC', 'Noto Sans Mono CJK KR'; }

.pdf .serif { font-family: PT Serif, Lyon-Text, Georgia, YuMincho, "Yu Mincho", "Hiragino Mincho ProN", "Hiragino Mincho Pro", "Songti TC", "Songti SC", "SimSun", "Nanum Myeongjo", NanumMyeongjo, Batang, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK SC', 'Noto Sans CJK KR'; }

.pdf .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK SC', 'Noto Sans Mono CJK KR'; }

.highlight-default {
}
.highlight-gray {
	color: rgb(155,154,151);
}
.highlight-brown {
	color: rgb(100,71,58);
}
.highlight-orange {
	color: rgb(217,115,13);
}
.highlight-yellow {
	color: rgb(223,171,1);
}
.highlight-teal {
	color: rgb(15,123,108);
}
.highlight-blue {
	color: rgb(11,110,153);
}
.highlight-purple {
	color: rgb(105,64,165);
}
.highlight-pink {
	color: rgb(173,26,114);
}
.highlight-red {
	color: rgb(224,62,62);
}
.highlight-gray_background {
	background: rgb(235,236,237);
}
.highlight-brown_background {
	background: rgb(233,229,227);
}
.highlight-orange_background {
	background: rgb(250,235,221);
}
.highlight-yellow_background {
	background: rgb(251,243,219);
}
.highlight-teal_background {
	background: rgb(221,237,234);
}
.highlight-blue_background {
	background: rgb(221,235,241);
}
.highlight-purple_background {
	background: rgb(234,228,242);
}
.highlight-pink_background {
	background: rgb(244,223,235);
}
.highlight-red_background {
	background: rgb(251,228,228);
}
.block-color-default {
	color: inherit;
	fill: inherit;
}
.block-color-gray {
	color: rgba(55, 53, 47, 0.6);
	fill: rgba(55, 53, 47, 0.6);
}
.block-color-brown {
	color: rgb(100,71,58);
	fill: rgb(100,71,58);
}
.block-color-orange {
	color: rgb(217,115,13);
	fill: rgb(217,115,13);
}
.block-color-yellow {
	color: rgb(223,171,1);
	fill: rgb(223,171,1);
}
.block-color-teal {
	color: rgb(15,123,108);
	fill: rgb(15,123,108);
}
.block-color-blue {
	color: rgb(11,110,153);
	fill: rgb(11,110,153);
}
.block-color-purple {
	color: rgb(105,64,165);
	fill: rgb(105,64,165);
}
.block-color-pink {
	color: rgb(173,26,114);
	fill: rgb(173,26,114);
}
.block-color-red {
	color: rgb(224,62,62);
	fill: rgb(224,62,62);
}
.block-color-gray_background {
	background: rgb(235,236,237);
}
.block-color-brown_background {
	background: rgb(233,229,227);
}
.block-color-orange_background {
	background: rgb(250,235,221);
}
.block-color-yellow_background {
	background: rgb(251,243,219);
}
.block-color-teal_background {
	background: rgb(221,237,234);
}
.block-color-blue_background {
	background: rgb(221,235,241);
}
.block-color-purple_background {
	background: rgb(234,228,242);
}
.block-color-pink_background {
	background: rgb(244,223,235);
}
.block-color-red_background {
	background: rgb(251,228,228);
}
.select-value-color-default { background-color: rgba(206,205,202,0.5); }
.select-value-color-gray { background-color: rgba(155,154,151, 0.4); }
.select-value-color-brown { background-color: rgba(140,46,0,0.2); }
.select-value-color-orange { background-color: rgba(245,93,0,0.2); }
.select-value-color-yellow { background-color: rgba(233,168,0,0.2); }
.select-value-color-green { background-color: rgba(0,135,107,0.2); }
.select-value-color-blue { background-color: rgba(0,120,223,0.2); }
.select-value-color-purple { background-color: rgba(103,36,222,0.2); }
.select-value-color-pink { background-color: rgba(221,0,129,0.2); }
.select-value-color-red { background-color: rgba(255,0,26,0.2); }

.checkbox {
	display: inline-flex;
	vertical-align: text-bottom;
	width: 16;
	height: 16;
	background-size: 16px;
	margin-left: 2px;
	margin-right: 5px;
}

.checkbox-on {
	background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Crect%20width%3D%2216%22%20height%3D%2216%22%20fill%3D%22%2358A9D7%22%2F%3E%0A%3Cpath%20d%3D%22M6.71429%2012.2852L14%204.9995L12.7143%203.71436L6.71429%209.71378L3.28571%206.2831L2%207.57092L6.71429%2012.2852Z%22%20fill%3D%22white%22%2F%3E%0A%3C%2Fsvg%3E");
}

.checkbox-off {
	background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Crect%20x%3D%220.75%22%20y%3D%220.75%22%20width%3D%2214.5%22%20height%3D%2214.5%22%20fill%3D%22white%22%20stroke%3D%22%2336352F%22%20stroke-width%3D%221.5%22%2F%3E%0A%3C%2Fsvg%3E");
}

</style>
<title>환불정책</title>
</head>
<body>

	<article id="5775cada-31b8-4604-a8e2-4fe78fb52e3c" class="page sans">
		<header>
			<h1 class="page-title"></h1>
		</header>
		<div class="page-body">
			<h1 id="a64ee399-e4ce-415f-bd22-f7b3e5cd81b0" class="">
				<strong>환불정책</strong>
			</h1>
			<p id="cfd86411-306f-43a0-acae-9a875bc41287" class="">
				<strong>수강권 환불</strong>
			</p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="resources/img/popup_1.png" width="600">
			<ul id="7f69a3aa-4756-4c75-b21c-17a69c211589" class="bulleted-list">
				<li>수강기간이란 회사가 회원에게 유상으로 제공하는 클래스 이용기간으로서 90일을 의미합니다. 단, 개별
					클래스에 따라 90일 미만의 수강기간이 제공될 수 있습니다.</li>
			</ul>
			<ul id="1956305a-e3a3-4274-a1e1-20064fda5a08" class="bulleted-list">
				<li>수강기간은 결제일부터 시작합니다. 단, 결제일 당시 클래스영상을 이용할 수 없는 경우 수강기간은
					클래스영상의 이용 가능일부터 시작합니다.</li>
			</ul>
			<ul id="62b1a7a4-7d0d-4efc-8542-5ac1fc27e8d3" class="bulleted-list">
				<li>수강진도란 총 클래스영상 수 중 기 이용한 영상 수의 비율을 의미합니다. 단, 클래스영상 일부 재생 시
					이용으로 간주합니다.</li>
			</ul>
			<ul id="cf8b5bb9-5b09-4b72-88f5-9b97a8d7614b" class="bulleted-list">
				<li>회원이 클래스와 함께 제공되는 자료 또는 정보를 다운로드하는 경우 해당 자료 또는 정보가 포함된
					클래스영상을 이용한 것으로 간주합니다.</li>
			</ul>
			<p id="fc285b6c-1440-4e61-a7a5-5a9e5bfcdcc2" class=""></p>
			<p id="19f06b18-1958-4140-9339-e799b0160721" class="">
				<strong>코칭권 환불</strong>
			</p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="resources/img/popup_2.png" width="600">
			<p id="f2279805-addd-44a9-b747-378ba6295f43" class=""></p>
			<p id="34722c5d-704b-40c3-9a1f-daf1b9d7d237" class="">
				<strong>환불 기간</strong>
			</p>
			<ul id="6996fa7d-349f-4238-bad6-015202b4ba54" class="bulleted-list">
				<li>간편 신용카드/체크카드 : 취소 완료 후 3~5영업일 이후 환불(승인/매입 구분 불가)</li>
			</ul>
			<ul id="bbe8b54c-98dc-4c24-ab38-8fd0d8578ccc" class="bulleted-list">
				<li>간편 계좌이체 : 취소 완료 즉시 환불(단, 은행 정기점검시간등에는 환불 실패)</li>
			</ul>
			<ul id="a93d5d5a-a440-410a-a3a7-0288b7d4f3b7" class="bulleted-list">
				<li>포인트 : 취소 완료 즉시 환불</li>
			</ul>
			<p id="22bf84a9-a7df-4f8e-8677-487317c85b2c" class=""></p>
			<p id="ea25bbf2-1ec3-48c1-94fb-f0f60c0d7df7" class="">
				<strong>기타 사항</strong>
			</p>
			<ul id="ae8ba30d-15ad-406a-9401-9771029d69d8" class="bulleted-list">
				<li>회사가 마케팅, 이벤트 등과 관련하여 무상으로 부여하는 추가 이용기간(보너스기간)은 환불에 영향을 미치지
					아니합니다.</li>
			</ul>
			<ul id="2791532b-82a1-4e9b-b543-ba536d17a4bf" class="bulleted-list">
				<li>회사는 환불 시 금융거래수수료, 제세공과금 등을 공제할 수 있습니다.</li>
			</ul>
			<ul id="70c8a0fc-ec4c-4ab3-bf2a-7a7a2d1171ea" class="bulleted-list">
				<li>회사는 회원이 관계 법령 또는 이용약관 등을 위반한 경우 이용약관 및 정책에 따라 환불을 거부할 수
					있습니다.</li>
			</ul>
			<ul id="c09d08b3-7890-4d78-bc65-d7739f858ee0" class="bulleted-list">
				<li>결합 상품의 경우 각 구성 상품(용역)의 환불 조건에 의하되 개별 상품 안내페이지를 통하여 고지합니다.</li>
			</ul>
			<p id="da07dbaf-0449-46dc-a831-0a43cd8287f9" class=""></p>
		</div>
	</article>

</body>
</html>