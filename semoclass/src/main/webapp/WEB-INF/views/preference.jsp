<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.like, .dislike, .add_wish{
	cursor: pointer;
	margin: 2px 0;
}
#dislike_count, #like_count, .pref, #dislike_container, #like_container{
	display: inline-block;
}
#dislike_count, #like_count{
	font-size: 16px;
	color: rgb(0,0,0);
	font-weight: bold;
}
#dislike_container, #like_container{
	margin: 0 8px;
}
#dislike_container img, #like_container img{
	vertical-align: middle; 
	width: 22px;
	height: auto;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function prefCount(lec_no){
	$(function(){
		$.ajax({
			ContentType:"application/x-www-form-urlencoded; charset=UTF-8",
			type: "post",
			url:'pref_count.do',
			data:{'lec_no_fk':lec_no},
			dataType:'',
			success: function(data){
				$("#like_count").html(data.likeCount);
				$("#dislike_count").html(data.dislikeCount);
			}
		});
	});
}
function like(lec_no, mem_no){
	$(function(){
		$.ajax({
			ContentType:"application/x-www-form-urlencoded; charset=UTF-8",
			type: "post",
			url:'lec_like.do',
			data:{'lec_no_fk':lec_no,'mem_no_fk':mem_no},
			dataType:'',
			success: function(data){
				$(".dislike").attr("src","resources/img/dislike_off.png");
				if(data == 0){
					$(".like").attr("src","resources/img/like_off.png");
				}else{
					$(".like").attr("src","resources/img/like_on.png");
				}
				prefCount(lec_no);
			}
		});
	});
}
function dislike(lec_no, mem_no){
	$(function(){
		$.ajax({
			ContentType:"application/x-www-form-urlencoded; charset=UTF-8",
			type: "post",
			url:'lec_dislike.do',
			data:{'lec_no_fk':lec_no,'mem_no_fk':mem_no},
			dataType:'',
			success: function(data){
				$(".like").attr("src","resources/img/like_off.png");
				if(data == 0){
					$(".dislike").attr("src","resources/img/dislike_off.png");
				}else{
					$(".dislike").attr("src","resources/img/dislike_on.png");
				}
				prefCount(lec_no);
			}
		});
	});
}
function wish(lec_no, mem_no){
	$(function(){
		$.ajax({
			ContentType:"application/x-www-form-urlencoded; charset=UTF-8",
			type: "post",
			url:'wishlist.do',
			data:{'lec_no_fk':lec_no,'mem_no_fk':mem_no},
			dataType:'',
			success: function(data){
				if(data == 1){
					$(".add_wish").attr("src","resources/img/wish_on.png");
				}else if(data == 0){
					$(".add_wish").attr("src","resources/img/wish_off.png");
				}
			}
		});
	});
}
</script>

<style type="text/css">
</style>
</head>
<body>

<div class="pref">
<c:set value="${mdto }" var="mdto"/>
<c:set value="${cont }" var="ldto"/>
	<c:set var="pref" value="${pref_info}" />
	<c:if test="${!empty pref}">
		<div id="like_container">
			<c:if test="${pref.getPref_like()==1}">
				<img src="resources/img/like_on.png" class="like" onclick="like(${ldto.getLec_no() },${mdto.getMember_no() })">
			</c:if>
			<c:if test="${pref.getPref_like()==0}">
				<img src="resources/img/like_off.png" class="like" onclick="like(${ldto.getLec_no() },${mdto.getMember_no() })">
			</c:if>
			<div id="like_count"></div>
		</div>
		
		<div id="dislike_container">
			<c:if test="${!empty pref && pref.getPref_dislike()==1}">
					<img src="resources/img/dislike_on.png" class="dislike" onclick="dislike(${ldto.getLec_no() },${mdto.getMember_no() })">
			</c:if>
			<c:if test="${!empty pref && pref.getPref_dislike()==0}">
				<img src="resources/img/dislike_off.png" class="dislike" onclick="dislike(${ldto.getLec_no() },${mdto.getMember_no() })">
			</c:if>
			<div id="dislike_count"></div>
		</div>
	</c:if>

	<c:if test="${empty pref}">
		<div id="like_container">
			<img src="resources/img/like_off.png" class="like"
				onclick="like(${ldto.getLec_no() },${mdto.getMember_no() })">
			<div id="like_count"></div>
		</div>
		<div id="dislike_container">
			<img src="resources/img/dislike_off.png" class="dislike"
				onclick="dislike(${ldto.getLec_no() },${mdto.getMember_no() })">
			<div id="dislike_count"></div>
		</div>
	</c:if>
	
</div>

<%-- <div class="wish">
	<img src="resources/img/wish_off.png" class="add_wish"
		onclick="wish(${ldto.getLec_no() },${mdto.getMember_no() })">
</div> --%>

<script type="text/javascript">
	prefCount(${ldto.getLec_no() });
</script>


</body>
</html>