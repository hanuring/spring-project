<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/comunity.js"></script>
<script type="text/javascript">
function comuWrite(lec_no,lec_name){
	// 210215 이호철 수정 ==> lec_name에 [] 가 들어가면 오류가 나와서 수정함.
	var url= "comu_write.do?no="+lec_no+"&lec_name="+ encodeURI(lec_name);    //팝업창 페이지 URL
	var winWidth = 600;
	var winHeight = 550;
	var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
}
</script>


<style type="text/css">
#community {
	width: 100%;
	background-color: white;
}
#comu_container{
	width: 100%;
	height: 130px;
	position: relative;
	display: inline-block;
	overflow: hidden;
}
#comu_container>div {
	position: absolute;
	top: 0px;
	left: 0px;/* 위치 조절!! */
	padding: 0px;
	font-size: 0px;
}
.comu_cont{
	display: inline-block;
	left: 0;
}
.comu_cont>div {
	width: 98%;
	height: 120px;
	border: 1px solid rgba(0,0,0,0.1);
	border-radius: 5px;
	box-shadow: 1px 1px 4px 1px rgba(0,0,0,0.1);
	background-color: white;
	display: inline-block;
	margin: 3px 1%;
}
.comu_cont .empty_cont{
	text-align: center;
	font-size: 16px;
	color: gray;
	position: absolute;
	top: 50%;
	margin-top: -16px;
	margin-left:auto; 
	margin-right:auto;
	left:0; 
	right:0; 	
}

#reply {
	width: 90%;
	text-align: center;
	margin: 0 5%;
}

.rep_container{
	display: inline-block;
	width: 100%;
	height: auto;
	max-height: 700px;
	background-color: white;
	text-align: left;
	overflow: scroll;
	overflow-x:hidden;
	margin-top: 40px;
	margin-bottom: 20px;
}
/* 스크롤바 디자인 */
.rep_container::-webkit-scrollbar{
	width: 8px;
}
.rep_container::-webkit-scrollbar-thumb{
	border-radius: 4px;
	background: rgb(2,0,36);
	background: linear-gradient(rgb(149,75,255), rgb(39,204,253));
}
.rep_container::-webkit-scrollbar-track{
	border-radius: 4px;
	background: rgba(0,0,0,0.05);
}

.rep_container .rep{
	width: 90%;
	margin: 0 5%;
}
.rep span{
	padding: 0 5px;
}
.rep_write {
	display: inline-block;
	border: 1px solid gray;
	border-radius: 25px 25px 25px 25px/ 50% 50% 50% 50%;
	width: 90%;
	padding: 10px;
	background-color: white;
}
.re_rep_write{
	border: 1px solid gray;
	border-radius: 25px 25px 25px 25px/ 50% 50% 50% 50%;
	width: 90%;
	padding: 10px;
	background-color: white;
}
.re_rep_write img{
	vertical-align: middle;
}
.reply_input{
	border: none;
	outline: none;
	border-bottom: 1px solid lightgray;
	padding: 5px;
	font-size: 14px;
	width: 75%;
}
.re_rep_write .reply_input{
	border: none;
	outline: none;
	border-bottom: 1px solid lightgray;
	padding: 5px;
	font-size: 14px;
	width: 82%;
	margin-left: 1%;
}
.rep_hr{
	width: 99SS%;
	border: 0;
	height: 1px;
	background-color: black; S
}
.re_rep_hr{
	width: 100%;
	margin: 0;
	height: 1px;
	border: 0;
	background-color: rgb(200,220,240); 
}
.re_rep>div{
	vertical-align: top;
	/* position:relative;
	width: 20px;
	height: auto; */
}
.rep>div, .re_rep{
	margin: 10px;
}
.re_rep .l_block, .re_rep .r_block{
	display:inline-block;
}
.r_block>div, .rep>div>div:first-child{
	margin-bottom: 3px;
}
#btns{
	height: 30px;
	position: relative;
}
#dots{
	text-align: center;
	display: inline-block;
	position: absolute;
	margin: 0 auto;
	left:0; 
	right:0; 	
}
#prev_next_btn{
	 display: inline-block;
	 position: absolute;
	 right: 0;
	 margin-right: 15px;
	 background-color: rgba(0,0,0,0);
}
#prev, #next{
	padding-left: 8px;
	padding-right: 8px;
	padding-bottom: 4px;
	color: rgb(170,170,170);
	background-color: white;
	border: 1px solid rgba(0,0,0,0.15);
	cursor: pointer;
	border-radius: 3px;
	outline: 0;
}
#prev:hover, #next:hover{
	background-color: rgba(0,0,0,0.05);
}
.dot{
	cursor: pointer;
	height: 8px;
	width: 8px;
	margin: 0 px;
	background-color: rgba(0,116,255,0.5);
	border-radius: 4px;
	display: inline-block;
}
.active, .dot:hover{
	background-color: rgba(0,116,255,1);
}

.date{
	font-size: 12px;
	color: gray;
	padding-left: 0;
}
.mem_name{
	font-size: 16px;
	font-weight: bold;
}
.cont{
	font-size: 14px;
}
.rep_cont{
	margin: 5px 0;
	font-size: 14px;
}
.delete_btn, .edit_btn, .ok_btn, .cancel_btn, .write_btn, .comu_write_btn{
	float: right;
	border: 0;
	background-color: rgba(0,0,0,0.1);
	border-radius: 2px;
	cursor: pointer;
	color: rgb(100,100,100);
	padding: 4px 7px;
	margin: 0 4px;
	outline: 0;
}
.comu_write_btn{
	float: right;
	border: 0;
	background-color: rgba(0,0,0,0.8);
	border-radius: 3px;
	cursor: pointer;
	color: rgb(200,200,200);
	padding: 8px 12px;
	margin: 0 4px;
	font-size: 14px;
}
.write_btn {
	vertical-align: middle;
}
.delete_cont{
	font-size: 14px;
	color: gray;
}


.comu_cont>div div{
	padding: 3px 20px;
}
.comu_cont>div .mem_name{
	padding: 12px 0 2px 20px;
}

#comu_title{
	margin: 14px 2%;
}
#comu_title span:first-child{
	font-size: 24px;
	font-weight: bolder;
	margin-right: 10px;
}
#comu_title span:nth-child(2){
	font-size: 14px;
	color:gray;
}
</style>

</head>
<body>

	<div id="community">
		<div id="comu_title">
			<span>커뮤니티</span><span>${comuCount}개의 글</span>
			<c:if test="${cont.getMem_no_fk() == mdto.getMember_no()}"><!-- 강의등록한 mem_no와 로그인한 유저 mem_no가 같아야 작성버튼뜨도록 -->
				<button onclick="comuWrite(<%=request.getParameter("no")%>,'${cont.getLec_name() }')" class="comu_write_btn">글 작성하기</button>
			</c:if>
		</div>
		<div id="comu_container">
			<div>
			<c:set var="clist" value="${comuList}" />
			<c:if test="${!empty clist}">
				<c:forEach items="${clist}" var="dto">
				<div class="comu_cont">
					<div>
						<div class="mem_name">${dto.getMember_name()}</div>
						<div class="date">${dto.getComu_date()}</div>
						<div class="cont">${dto.getComu_cont()}</div>
					</div>
				</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty clist}">
				<div class="comu_cont">
					<div>
						<div class="empty_cont">작성된 강의 커뮤니티가 없습니다.</div>
					</div>
				</div>
			</c:if>
			</div>
		</div>
		
		<script type="text/javascript">
			jslide(1);
		</script>
		
		<div id="btns">
			<div id="dots">
			<c:if test="${!empty clist}">
			<c:forEach begin="0" end="${clist.size()-1}" step="1" var="i">
				<span class="dot" onclick="jslide(${i})"></span>
			</c:forEach>
			</c:if>
			</div>
			
			<div id="prev_next_btn">
				<button id="prev">◀</button>
				<button id="next">▶</button>
			</div>
		</div>	
			
		<div id="reply" align="center">
			<div class="rep_container">
			<input type="hidden" name="lec_no_fk" value="<%=request.getParameter("no")%>">
			<script type="text/javascript">
				repList(${mdto.getMember_no()}); //+member_no(01/28)
			</script>
				
			</div>
			<div class="rep_write">
				<form name="memReplyWriteForm">
					<c:set value="${mdto }" var="mdto"/>
					<input type="hidden" name="lec_no_fk" value="<%=request.getParameter("no")%>">
					<input type="hidden" name="mem_no_fk" value="${mdto.getMember_no() }">
					<input type="hidden" name="mem_name" value="${mdto.getMember_name() }">
					
					<span style="font-size:14px;">댓글 작성: </span><input type="text" name="reply_cont" class="reply_input" placeholder="댓글 내용을 입력하세요.">
					<button type="button" name="repWriteBtn" onclick="repWrite(${mdto.getMember_no()})"><img alt="confirmIcon" src="resources/img/iconconfirm.png" width="26"></button>
				</form>
			</div>
		</div>
		
	</div>
	
</body>
</html>