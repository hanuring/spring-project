<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.footer>div{
	margin-bottom: 50px;
	padding-top: 50px;
	font-size: 0;
}
.f_section{
	width: 25%;
	display: inline-block;
	font-size: 14px;
	vertical-align: top;
	padding-bottom: 50px;
}
.f_section:first-child{
	width: 33%;
	margin-right: 12%;
	margin-left: 5%;
}
.f_section ul{
	list-style: none;
	padding-left: 0;
	margin: 0 10% 0 0;
}
.f_section ul li{
	padding: 10px 0 10px 5px;
	margin: 2px 0;
	border-radius: 3px;
	cursor: pointer;
}
.f_section ul li:hover{
	background-color: rgba(0,0,0,0.05);
}
.footer hr{
	width: 100%;
	border: 0;
	height: 1px;
	background-color: rgb(235,235,235);
}
.footer hr:first-child{
	position: absolute;
	left:0;
	width: 100%;
	border: 0;
	height: 1px;
	background-color: rgb(200,200,200);
}

.f_title{
	font-size: 20px;
	font-weight: bold;
	padding-bottom: 15px;
}
.footer div:first-child .f_title{
	font-size: 26px;
}
.footer div:first-child div{
	padding-bottom: 15px;
}

#f_details{
	/* position: relative; */
}
#f_details ul{
	list-style: none;
	font-size: 12px;
	padding-left: 0;
	display: inline-block;
	margin: 13px auto;
	width: 100%;
}
#f_details li{
	display: inline-block;
	cursor: pointer;
	color: rgb(100,100,100);
	padding:5px 0 5px 10px;
}
#f_details li:hover{
	color: rgb(0,0,0);
	font-weight: bold;
}

#f_details .f_detail{
	color: gray;
	font-size: 12px;
	display: inline-block;
	width: 65%;
}
#f_details .f_link_box{
	vertical-align: top;
	color: gray;
	font-size: 12px;
	display: inline-block;
	width: 33%;
	margin-right: 2%;
}
</style>

<footer class="footer">
	<hr>
<div>
	<div class="f_section">
		<div class="f_title">세상의 모든 클래스</div>
		<div>세상의 모든 클래스는 모든 사람이 사랑하는 일을 하며 살 수 있도록 세상을 바꾸고자 합니다.</div>
		<div>🇰🇷 한국어/ 한국 스토어</div>
	</div>

	<div class="f_section">
		<div class="f_title">세모클</div>
		<ul>
			<li onclick="location.href='<%=request.getContextPath()%>/main.do'">홈</li>
			<li>채용</li>
			<li>도움말</li>
		</ul>
	</div>
	<div class="f_section">
		<div class="f_title">고객센터</div>
		<ul>
			<li onclick="location.href='<%=request.getContextPath()%>/notice.do?page=1'">공지사항</li>
			<li>1:1 문의</li>
		</ul>
	</div>
	
	<hr>
	
	<div id="f_details">
		<div class="f_link_box">
			<ul>
				<li>세모클 Korea</li>
				<li>· 세모클 USA</li>
				<li>· 세모클JAPAN</li>
				<li>Instargram</li>
				<li>· Youtube</li>
				<li>· Facebook</li>
				<li>· Naverpost</li>
				<li>· Naverblog</li>
				<li>· Playstore</li>
				<li>· Appstore</li>
			</ul>
		</div>
		<div class="f_detail">
			<ul>
				<li>이용약관</li>
				<li>· 개인정보 처리방침</li>
				<li>· 환불 정책</li>
				<li>· 사업자 정보 확인</li>
				<li>· 제휴/협력 문의</li>
				<li>· 단체/기업 교육 문의</li>
				<li>· 정기구독서비스 이용약관</li>
			</ul>
			
			<div>
				세모클 | 대표 ○○○ | 서울특별시 ○○구 ○○로 123 ○○○빌딩 ○층 | 사업자등록번호 : 000-00-00000 | 통신판매업신고 : ○○○○-서울○○구-○○○○ | 세모클은 전자상거래 등에서의 소비자보호에 관한 법률에 따른 통신판매업과 통신판매중개업을 영위하고 있습니다. 세모클은 통신판매중개자로서 중개하는 통신판매에 관하여서는 통신판매의 당사자가 아니므로 어떠한 책임도 부담하지 아니합니다.
			</div>
		</div>
	</div>
</div>
</footer>