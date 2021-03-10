<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


<style type="text/css">

@import url(http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700);
@import url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);

body {
    background: #fff;
	font-family: 'Roboto', sans-serif;
	color:#333;
	line-height: 22px;	
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color:#111;
	margin-top:5px;
	margin-bottom:5px;
}
h1, h2, h3 {
	text-transform:uppercase;
}

input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 12px;
    cursor: pointer;
    opacity: 1;
    filter: alpha(opacity=1);    
}

.form-inline .form-group{
    margin-left: 0;
    margin-right: 0;
}
.control-label {
    color:#333333;
}
</style>

</head>
<body>
	<c:set value="${dto }" var="dto" />
	
	<div align="center" style="margin-bottom: 30px">
	<img src="resources/img/login_logo.PNG" id="icon" alt="User Icon" />
</div>
<div class="container" style="margin-left: 24%">
	<div class="row">
    <div class="col-md-10">
      <section>
        <hr style="border:solid 1px #3A4CA8;">
        <h3 class="entry-title" align="center"><span><font color="#3A4CA8" style="font-weight: bolder;">정말 회원을 탈퇴하시겠습니까?</font></span> </h3>
        <hr style="border:solid 1px #3A4CA8;">
        <br><br>
        	<form action="<%=request.getContextPath() %>/member_quit_check.do" method="post" name="signup" id="signup" class="form-horizontal">
        	<input type="hidden" value="${dto.getMember_no() }" name="no">
        <div class="form-group"  style="margin-left: 150px;">
          <label class="control-label col-sm-3">비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group" >
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="try_pwd" id="cpassword" placeholder="탈퇴를 위해 비밀번호를 입력해주세요." value="">
            </div>  
          </div>
        </div>
        <br><br><br><br>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input name="Submit" type="submit" value="탈퇴" class="btn btn-primary" style="margin-left: 180px;">&nbsp;
            <input name="Submit" type="submit" value="취소" class="btn btn-danger">
          </div>
        </div>
      </form>
    </div>
</div>
</div>

</body>
</html>