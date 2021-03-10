<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>

<style type="text/css">

.btn-primary {
  font-family: Raleway-SemiBold;
  font-size: 13px;
  color: rgba(58, 133, 191, 0.75);
  letter-spacing: 1px;
  line-height: 15px;
  border: 2px solid rgba(58, 133, 191, 0.75);
  border-radius: 40px;
  background: transparent;
  transition: all 0.3s ease 0s;
}

.btn-primary:hover {
  color: #FFF;
  background: rgba(58, 133, 191, 0.75);
  border: 2px solid rgba(58, 133, 191, 0.75);
}

#member-part{
	display: flex;
	flex-flow: row wrap;
	justify-content: space-between;
	width: 200px;
}
.member_part{
	width : 100px;
	height: 100px;
}

a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}

</style>

</head>
<body>

	<c:set value="${dto }" var="dto"/>
	<c:set value="${ldto }" var="ldto"/>
	<c:set var="member_no" value="${member_no }" />
	
	<p style="margin-left: 2.5%; margin-top: 1%; float: left;">
		
		<a href="<%=request.getContextPath()%>/main.do"><img src="resources/img/video_logo.PNG"> </a>
		
		<div id="member-part" style="float: right; margin-right: 2.5%;">
				<div class="member-part log-out">
				<button style="background-color: white; border: 0; cursor: pointer; margin-top: 20%;" onclick="location.href='goto_logout_member.do'" ><i class="fas fa-user-slash fa-3x"></i><br>로그아웃</button>
				</div>
				<div class="member-part myPage">
				<form action="<%=request.getContextPath() %>/goto_myInfo_member.do?no=${member_no }" method="post">
					<button type="submit" style="background-color: white; border: 0; cursor: pointer; margin-top: 20%;" ><i class="fas fa-user fa-3x"></i><br>마이페이지</button>
				</form>
				</div>
		</div>
		<hr style="border:solid 1px #3A4CA8;" width="95%">
	</p>

	<div class="row">
      <div class="col-md-8"> 
      	
      	<div style="margin-left: 8%; margin-top: 1%">
      		<a href="javascript:window.history.back()"><font style="font-weight: bold; font-size: 20px;">${ldto.getLec_name() } ▼ </font></a>
      		<font style="font-weight: bold;">
      		<c:if test="${check_teacher == 1}">
      		<button type="button" class="btn btn-default" style="float: right; margin-right: 15%;" onclick="location.href='<%=request.getContextPath() %>/regist_class.do?lec_no=${ldto.getLec_no() }&mem_no=${member_no }'" disabled>본인 강의 입니다</button>
      		</c:if>
      		<c:if test="${check_teacher == 2}">
      		<button type="button" class="btn btn-primary" style="float: right; margin-right: 15%;" onclick="location.href='<%=request.getContextPath() %>/regist_class.do?lec_no=${ldto.getLec_no() }&mem_no=${member_no }'">클래스 신청하기</button>
      		</c:if>
      		</font>
      	</div>
      	
     	<script src="//code.jquery.com/jquery.min.js"></script>
		<script>
		function open_in_frame(url) {
			$('#my_frame').attr('src', url);
		}
		</script>
		
	    <iframe id='my_frame' width="80%" height="580px" src="${dto.getOt_src() }" frameborder="0" style="margin-left: 8%; margin-top: 2%;"></iframe>
	    
	  	<br> <br>
	  </div>
	  
      
      <!-- 우측영역  -->
      <div class="col-md-4" style="margin-top: 2.5%;">
        <img src="resources/img/video_img1.PNG">
        <br><br>
        
        <h3><font style="font-weight: bolder;">수업노트</font></h3>
		<c:set value="${tokens }" var="tokens" />
		<br>
		<h4><font style="font-weight: bold;">[수업 목표]</font></h4>
		<h5>${dto.getOt_title() } </h5>
		<br>
		<h4><font style="font-weight: bold;">[수업 태그]</font></h4>
		<br>
		
		<c:forEach var="i" begin="0" step="2" end="${tlength - 1 }">
		<font style="color: #3A4CA8; font-size: 15px; font-weight: bolder;" > # </font>
		<button class="btn btn-primary" onclick='open_in_frame("${dto.getOt_src() }?autoplay=1&start=${tokens[i] }")'>
		<fmt:parseNumber value="${tokens[i] / 60 - ((tokens[i] / 60) % 1) }" integerOnly="true">
		</fmt:parseNumber>:${String.format("%02d", tokens[i] % 60) }</button> &nbsp; ${tokens[i+1] }
		<br><br>
		</c:forEach>
		
		<br><br>
		<h4><font style="font-weight: bold;">[수업 예고]</font></h4>
		<h5>${dto.getOt_notice() } </h5>
	  </div>
    </div>
   

</body>
</html>