<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

function insertTr() {
   
   $('#tag2').show();
   
   $("[name=txt_second]").attr("required", true);
   var btn1 = $('#btn1');
   btn1.attr('onclick','insertTr2()');
   
   /* style='width:260px;' */
   
}
function insertTr2() {
   
   $('#tag3').show();
   
   $("[name=txt_third]").attr("required", true);
   var btn1 = $('#btn1');
   btn1.remove();
}

</script>

<style type="text/css">

/* Style the Image Used to Trigger the Modal */
#myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 0px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (Image) */
.modal-content {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 1200px;
}

/* Caption of Modal Image (Image Text) - Same Width as the Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
}

/* Add Animation - Zoom in the Modal */
.modal-content, #caption {
  animation-name: zoom;
  animation-duration: 0.6s;
}

@keyframes zoom {
  from {transform:scale(0)}
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}

.modal {
        text-align: center;
        z-index : 1050;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}

.btn_add  {
	background-color: #3A4CA8;
	width: 65px;
	height: 35px;
	color: #fff;
	letter-spacing: 0.1em;
	font-size: 14px;
	font-weight: bold;
	border: none;
	margin-bottom: 3px;
	border-radius: 4px;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

.btn_add:hover {
  background-color: #5C71DC;
  border-color: #5C71DC;
  color: #fff;
}

.btn_blue  {
	background-color: #3A4CA8;
	width: 200px;
	height: 40px;
	color: #fff;
	letter-spacing: 0.1em;
	font-size: 16px;
	font-weight: bold;
	border: none;
	margin-bottom: 3px;
	border-radius: 4px;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

.btn_blue:hover {
  background-color: #5C71DC;
  border-color: #5C71DC;
}

.btn_orange  {
	background-color: orange;
	width: 200px;
	height: 40px;
	color: #fff;
	letter-spacing: 0.1em;
	font-size: 16px;
	font-weight: bold;
	border: none;
	margin-bottom: 3px;
	border-radius: 4px;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

.btn_orange:hover {
	opacity: 80%;
	border-color: orange;
}

.btn_blueline  {
	border: none;
	background-color: white;
	width: 100px;
	height: 40px;
	color: #3A4CA8;
	letter-spacing: 0.1em;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 3px;
	border-radius: 4px;
}

.btn_blueline:hover {
	border-color: white;
}

body {
	font-size: 16px;
}

a {
	color: black;
}

a:hover {
	color: gray;
	text-decoration: none;
}

</style>

</head>
<body>


<!-- Modal --> 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog" style="width: 1000px;height: auto;"> 
                <div class="modal-content"> 
                        <div class="modal-header"> 
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                                <h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">Youtube링크 복사 방법</h4> 
                        </div> 
                        <div class="modal-body" align="center"> 
                                <p><img src="resources/img/exam_copylink.jpg" class="img-responsive"></p> 
                                <hr style="border:solid 1px #3A4CA8;" width="65%">
                                <p style="font-weight: bold;"><font style="color: red;">*</font>  원하시는 동영상을 선택후, URL창에 뜨는 주소를 복사해 붙여넣어주세요.</p> 
                        </div> 
                </div> 
        </div> 
</div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog" style="width: 1700px;height: auto;"> 
                <div class="modal-content"> 
                        <div class="modal-header"> 
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                                <h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">OT등록 참고예시</h4> 
                        </div> 
                        <div class="modal-body" align="center"> 
                                <p><img src="resources/img/exam_regist_ot.PNG" class="img-responsive"></p> 
                                <hr style="border:solid 1px #3A4CA8;" width="65%">
                                <p style="font-weight: bold;"><font style="color: red;">*</font>첨부된 링크 주소에 해당하는 동영상과 입력한 OT관련 정보가 다음과 같이 예비수강생들에게 보여집니다.</p> 
                        </div> 
                </div> 
        </div> 
</div>

	<!-- 상단 -->
  		 <h3 align="center"><img src="resources/img/ot_logo.PNG" id="icon" alt="User Icon" style="width: 300px;" /> </h3>
	<hr style="border:solid 1px #3A4CA8;" width="65%">
	<br>
  		 <h3 align="center"> 강의의 OT정보를 등록해주세요! </h3>
  		  
  		 
   <!-- 중단 -->
   
<form action="<%=request.getContextPath() %>/insert_ot_video.do" name="signup" id="signup" method="post" class="form-horizontal">
<input type="hidden" value="${lec_no }" name="lec_no">

   <div class="container" style="margin-left: 22%">
	<div class="row">
	<div class="col-md-9">
	 
	</div>
    <div class="col-md-9">
      <section>
        <br><br>
        <div class="form-group" style="float: left">
          <label class="control-label col-sm-3" style="size: 15px">수업목표 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <input type="text" class="form-control" name="ot_title" id="ottitle" placeholder="해당 클래스의 강의 목표를 입력해주세요." value="" style="width: 700px;"> 
          	  </div>
            <br>
            <small> <span class="text-danger">*&nbsp;</span>수강생은 강의 목표를 통해 해당 클래스 수강의 필요여부를 결정합니다.</small> </div>
        </div>
        
         <div class="form-group" style="float: left">
          <label class="control-label col-sm-3" style="size: 15px">수업예고 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <textarea rows="7" cols="95" class="form-control" name="ot_notice" id="otnotice"></textarea>
          	  </div>
            <br>
            <small> <span class="text-danger">*&nbsp;</span>클래스의 강의가 어떤 순서로 진행되는지 입력해주세요.</small> </div>
        </div>
        
        <div class="form-group">
        
          <label class="control-label col-sm-3" style="size: 15px">타임태그 #1&nbsp;<span class="text-danger">*</span></label>
          <div class="form-inline form-group">
          	  <label class="control-label col-sm-8" style="size: 15px">
              <input type="number" name="time_first_m" style='width:80px;' value="0" class="form-control"> 분 <input type="number" name="time_first_s" style='width:70px;' value="0" class="form-control">초 
               / 태그내용 <input type="text" name="txt_first" style='width:300px;' value="" required='true' class="form-control"></label>
               <br><br>
          </div>
          
          <div style="display: none" id="tag2">
          <label class="control-label col-sm-3" style="size: 15px">타임태그 #2&nbsp;<span class="text-danger">*</span></label>
          <div class="form-inline form-group">
          	  <label class="control-label col-sm-8" style="size: 15px">
              <input type="number" name="time_second_m" style='width:80px;' value="0" class="form-control"> 분 <input type="number" name="time_second_s" style='width:70px;' value="0" class="form-control">초 
               / 태그내용 <input type="text" name="txt_second" style='width:300px;' value="" class="form-control"></label>
               <br><br>
          </div>
          </div>
          
          <div style="display: none" id="tag3">
          <label class="control-label col-sm-3" style="size: 15px">타임태그 #3&nbsp;<span class="text-danger">*</span></label>
          <div class="form-inline form-group">
          	  <label class="control-label col-sm-8" style="size: 15px">
              <input type="number" name="time_third_m" style='width:80px;' value="0" class="form-control"> 분 <input type="number" name="time_third_s" style='width:70px;' value="0" class="form-control">초 
               / 태그내용 <input type="text" name="txt_third" style='width:300px;' value="" class="form-control"></label>
               <br><br>
          </div>
          </div>
          
            <div class="form-inline form-group">
               <label class="control-label col-sm-7" style="size: 15px"><button onclick="insertTr()" id="btn1" class="btn btn_add">추가</button></label>
          	</div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">동영상 링크 주소 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="ot_src_origin" id="member_name" placeholder="Youtube동영상의 링크를 복사해 입력해주세요." value=""><br>
            <a href="https://www.youtube.com" target="_blank"><img src="resources/img/youtube.png" width="90">바로가기</a> &nbsp;&nbsp;
            <button type="button" class="btn_blueline" data-toggle="modal" data-target="#myModal">
               	 자세히보기
        	</button> 
          </div>
        </div>
       
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input name="submit" type="submit" value="OT등록" class="btn_blue">&nbsp;&nbsp;
            <button class="btn_orange" onclick="location.href='<%=request.getContextPath()%>/resist_ot_later.do'">나중에 등록</button>&nbsp;&nbsp;
            <button type="button" class="btn_blueline" data-toggle="modal" data-target="#myModal2">
               	 참고예시
     		</button> 
          </div>
        </div>
     	<br> <br>
    </div>
</div>
</div>
</form>

</body>
</html>