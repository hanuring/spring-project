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

function itemChange(){
	var creative = ["미술","공예","디지털 드로잉","라이프 스타일"];
	var career = ["비즈니스/생산성", "영상/디자인","데이터/개발", "글쓰기/콘텐츠"];
	var money = ["부동산/주식/제테크","온라인 쇼핑몰","SNS/콘텐츠", "창업"];
	var selectItem = $("#large_cate").val();
	var changeItem;
	if(selectItem == 100){
	  changeItem = creative;
	  $('#small_cate').empty();
		var option = "";
		option +="<option value='' style='background-color: rgb(108,123,255);'>카테고리</option>"
		option +="<option value='101' style='background-color: rgb(108,123,255);'>"+changeItem[0]+"</option>";
		option +="<option value='102' style='background-color: rgb(108,123,255);'>"+changeItem[1]+"</option>";
		option +="<option value='103' style='background-color: rgb(108,123,255);'>"+changeItem[2]+"</option>";
		option +="<option value='104' style='background-color: rgb(108,123,255);'>"+changeItem[3]+"</option>";
		$('#small_cate').append(option);
	}
	else if(selectItem == 200){
	  changeItem = career;
	  $('#small_cate').empty();
		var option = "";
			option +="<option value='' style='background-color: rgb(108,123,255);'>카테고리</option>"
			option +="<option value='201' style='background-color: rgb(108,123,255);'>"+changeItem[0]+"</option>";
			option +="<option value='202' style='background-color: rgb(108,123,255);'>"+changeItem[1]+"</option>";
			option +="<option value='203' style='background-color: rgb(108,123,255);'>"+changeItem[2]+"</option>";
			option +="<option value='204' style='background-color: rgb(108,123,255);'>"+changeItem[3]+"</option>";
		$('#small_cate').append(option);
		
	} else if(selectItem == 300){
	  changeItem =  money;
	  $('#small_cate').empty();
		var option = "";
			option +="<option value='' style='background-color: rgb(108,123,255);'>카테고리</option>"
			option +="<option value='301' style='background-color: rgb(108,123,255);'>"+changeItem[0]+"</option>";
			option +="<option value='302' style='background-color: rgb(108,123,255);'>"+changeItem[1]+"</option>";
			option +="<option value='303' style='background-color: rgb(108,123,255);'>"+changeItem[2]+"</option>";
			option +="<option value='304' style='background-color: rgb(108,123,255);'>"+changeItem[3]+"</option>";
		$('#small_cate').append(option);
		
	} else if (selectItem == ''){
		$('#small_cate').empty();
		var option ="";
			option +="<option value='' style='background-color: rgb(108,123,255);'>카테고리</option>";
		$('#small_cate').append(option);
	}
	
}

$(function(){
	var cate_code;
	$("#small_cate").change(function() {
	cate_code = this.value;
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/get_mid_cateList.do",
			data : {"cate_code" : cate_code},
			dataType: "json",
			success: function(item){
				$("#Mid_Cate_List").empty();
				getList(item);
			}
		});
		
		function getList(item){
			if(item.length != 0){
			$.each(item, function(index, item){
				var price = item.lec_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				var list ="";
				list += "<div id='Cate_list'>"
				list += "<a href='<%=request.getContextPath() %>/info_cont.do?no="+item.lec_no+"'>";
				list += "<div>";
				list += "<img src='resources/img/lec_info/"+item.lec_thumbnail + "' width='100%' height='200px'><br>";
				list += "<div align='left'>"
				list += "<span class='main_memname'>"+item.cate_name+" ・ </span>";
				list += "<span class='main_memname'>"+item.member_name+"</span><br>";
				list += "<span class='main_lecname'>"+item.lec_name+"</span><br>";
				list += "<span class='main_like'><i class='far fa-thumbs-up' style='color: #3d42a2;'></i> "+item.like_num+"개</span>&nbsp;&nbsp;&nbsp;";
				list += "<span class='main_like'><i class='fas fa-heart' style='color: red;'></i> "+item.percent+"%</span><br>";
				list += "<hr width='100%' color='#3d42a2' style='opacity: 20%;'>";
				list += "<strong class='main_price'>"+price +" 원 </strong><br>"
				if(item.compare == 0){
					list += "<span class='main_poss2'><i class='far fa-calendar-alt'>오픈 예정</i></span>";
				} else if (item.compare== 1){
					list += "<span class='main_poss1'><i class='far fa-calendar-alt'>바로수강가능</i></span>";
				} else if(item.compare == 2){
					list += "<span class='main_poss2'><i class='far fa-calendar-times'>마감된 강의</i></span>";
				}
				list += "</div></a></div>";
				$("#Mid_Cate_List").append(list);
				});
			}else if(item.length == 0 ){
				var list = "<h2>검색된 결과가 없습니다.</h2>";
				$("#Mid_Cate_List").append(list);
			}
		}
	});	
	
	
	/* 정렬 */
	 $("#sort_list").change(function() {
		var sorting = this.value; 
	 	$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/sort_mid_cateList.do",
			dataType: "json",
			data: {
				"cate_code" : cate_code,
				"sort" : sorting
			}, 
			success: function(item){
				$("#Mid_Cate_List").empty();
				sortList(item);
			}  ,error:function(request,status,error){
			    alert("카테고리를 먼저 설정해 주세요");
			    $('#sort_list').val('recent').prop("selected",true);
			    }
		});
		function sortList(item){
			if(item.length != 0){
				$.each(item, function(index, item){
					var price = item.lec_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					var list ="";
					list += "<div id='Cate_list'>"
					list += "<a href='<%=request.getContextPath() %>/info_cont.do?no="+item.lec_no+"'>";
					list += "<div>";
					list += "<img src='resources/img/lec_info/"+item.lec_thumbnail + "' width='100%' height='200px'><br>";
					list += "<div align='left'>"
					list += "<span class='main_memname'>"+item.cate_name+" ・ </span>";
					list += "<span class='main_memname'>"+item.member_name+"</span><br>";
					list += "<span class='main_lecname'>"+item.lec_name+"</span><br>";
					list += "<span class='main_like'><i class='far fa-thumbs-up' style='color: #3d42a2;'></i> "+item.like_num+"개</span>&nbsp;&nbsp;&nbsp;";
					list += "<span class='main_like'><i class='fas fa-heart' style='color: red;'></i> "+item.percent+"%</span><br>";
					list += "<hr width='100%' color='#3d42a2' style='opacity: 20%;'>";
					list += "<strong class='main_price'>"+price +" 원 </strong><br>"
					if(item.compare == 0){
						list += "<span class='main_poss2'><i class='far fa-calendar-alt'>오픈 예정</i></span>";
					} else if (item.compare== 1){
						list += "<span class='main_poss1'><i class='far fa-calendar-alt'>바로수강가능</i></span>";
					} else if(item.compare == 2){
						list += "<span class='main_poss2'><i class='far fa-calendar-times'>마감된 강의</i></span>";
					}
					list += "</div></a></div>";
					$("#Mid_Cate_List").append(list);
					});
				}else if(item.length == 0 ){
					var list = "<h2>검색된 결과가 없습니다.</h2>";
					$("#Mid_Cate_List").append(list);
				}
			}
	}); 
	
});

</script>
<style type="text/css">
a{text-decoration:none; color:#000000}
#Mid_Cate_List{
	display: flex;
	flex-flow: row wrap; 
	justify-content: space-around;
	text-align: center; 
	padding: 0;
	margin: 0 5%;
}

#Cate_list{
	width: 20%;
	height: 390px;
	margin: 2%;
}
#Cate_list:hover{
	animation-name: wider;
	animation-duration: 1s;
	animation-fill-mode: forwards;
}

@keyframes wider{
	0% {
	border-radius : 10px;
	cursor: pointer;
	width: 20%;
	height: 390px;
	}
	100% {
	box-shadow: 10px 10px 30px #a6a6a6,
				-10px -10px 30px #ffffff;
	border-radius : 10px;
	cursor: pointer;
	height: 400px;
	padding:1%;
	border : 3px solid;
	border-image: linear-gradient(to right, rgb(173,45,255), rgb(42,203,255));
	background-origin: border-box;
	border-image-slice: 1;
	}
}


</style>
<link rel="stylesheet" type="text/css" href="resources/css/cate_option.css">
<link rel="stylesheet" type="text/css" href="resources/css/main1.css">
</head>
<body style="margin-left: 15%; margin-right: 15%;">
<jsp:include page="include/header_2.jsp" />
<div align="center">
<div id="select_option" align="left">
<c:set value="${L_cate }" var="list"/>
<c:set value="${C_list }" var="clist"/>
<select id="large_cate" onchange="itemChange()">
	<option value="" selected style="background: rgb(173,45,255);">브랜드</option>
	<c:forEach items="${clist }" var="cdto">
		<c:if test="${cdto.getCate_code_ref() == 0 }">
			<option value="${cdto.getCate_code() }" style="background: rgb(173,45,255);">${cdto.getCate_name() } </option>		
		</c:if>
	</c:forEach>
</select>
<select id="small_cate">
	<option selected style='background-color: rgb(42,203,255);'>카테고리</option>
</select>
<select id="sort_list">
	<option value="recent" selected style='background-color: rgb(42,203,255);'>최신순 </option>
	<option value="hit" style='background-color: rgb(42,203,255);'>조회수순 </option>
	<option value="satisfy" style='background-color: rgb(42,203,255);'>좋아요순 </option>
</select>
</div>

<div id="Mid_Cate_List" align="center">
<c:if test="${!empty list }">
<c:forEach items="${list }" var="dto">
<div id="Cate_list">
<%-- 썸네일 이미지 --%>
<a href="<%=request.getContextPath() %>/info_cont.do?no=${dto.getLec_no() }">
<div>
<img src="resources/img/lec_info/${dto.getLec_thumbnail() }" width="100%" height="200px">
<br>
<%-- 분류 --%>
<div align="left">
<c:set value="${C_list }" var="clist"/>
		<c:forEach items="${clist }" var="cdto">
			<c:if test="${cdto.getCate_code() == dto.getCate_fk() }">
			<!-- 카테고리이름 -->
			<span class="main_memname">${cdto.getCate_name() } ・ </span>
			<!-- 강사명 -->
			<c:set value="${Member_list }" var="mlist"/>
				<c:forEach items="${mlist }" var="mdto">
					<c:if test="${mdto.getMember_id() == dto.getLec_member() }">
					<span class="main_memname">${mdto.getMember_name() }</span>
					</c:if>
				</c:forEach>
			</c:if>
	</c:forEach>
<br>
<%-- 강의 이름 --%>
<span class="main_lecname">${dto.getLec_name() }</span>
<br>
<%-- 좋아요 수 + 좋아요 비율 --%>

<c:set value="${All_list_for_like }" var="like_list"/>
<c:forEach items="${like_list }" var="likedto">
<c:if test="${likedto.getLec_no() == dto.getLec_no() }">
<span class="main_like"><i class="far fa-thumbs-up" style="color: #3d4ea2;"></i> ${likedto.getAll_pref_like() } 개</span>
&nbsp;&nbsp;&nbsp;
<c:if test="${likedto.getAll_pref_like() + likedto.getAll_pref_dislike() != 0 }">
<span class="main_like">
<i class="fas fa-heart" style="color: red;"></i> <fmt:formatNumber value="${likedto.getAll_pref_like() / (likedto.getAll_pref_like() + likedto.getAll_pref_dislike()) }" type="percent" />
</span>
</c:if>
<br>
</c:if>
</c:forEach>
<hr width="100%" color="#3d4ea2" style="opacity: 20%;">
<%-- 강의 가격 --%>
<strong class="main_price">
<fmt:formatNumber value="${dto.getLec_price() }" />원
</strong>
<br>
<%-- 수강 가능 여부 --%> 
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:parseDate value="${dto.getLec_startdate().substring(0,4) }${dto.getLec_startdate().substring(5,7) }${dto.getLec_startdate().substring(8,10) }" pattern="yyyyMMdd" var="startDate" />
<fmt:parseDate value="${dto.getLec_enddate().substring(0,4) }${dto.getLec_enddate().substring(5,7) }${dto.getLec_enddate().substring(8,10) }" pattern="yyyyMMdd" var="endDate" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />             
<fmt:formatDate value="${startDate}" pattern="yyyyMMdd" var="openDate"/>       
<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="closeDate"/>       
<c:if test="${openDate < nowDate && closeDate > nowDate}">
	<span class="main_poss1"><i class="far fa-calendar-alt">바로수강가능</i></span>
</c:if>
<c:if test="${openDate > nowDate }">
	<span class="main_poss2"><i class="far fa-calendar-alt">오픈 예정</i></span>
</c:if>
<c:if test="${closeDate < nowDate }">
	<span class="main_poss2"><i class="far fa-calendar-times">마감된 강의</i></span>
</c:if>

<br>
</div>	<!-- a태그 안의 div end -->
</a>
</div>
</div>	<!-- mid_cate_list div end -->
</c:forEach>
</c:if>
</div>
<c:if test="${empty list }">

<h2>아무도 강의 등록을 안했네요 ....</h2>

</c:if>
</div>

<jsp:include page="include/footer.jsp" />

</body>
</html>