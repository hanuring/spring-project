<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html style="margin:0;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
#header {
 display: flex;
 flex-flow: row wrap;
 justify-content: space-between;
 height: 160px;
 margin-bottom: -80px;
}

#member-part{
   display: flex;
   flex-flow: row wrap;
   justify-content: flex-end;
}


#search-form{
   width: 500px;
   height: 50px;
}

#home-btn > img{
   position: absolute;
   top:8%;
   left:0%;
   transform: translate(-50%, -50%);
}

#search-part{
   position: absolute;
   top:8%; 
   left:30%;
   transform: translate(-50%, -50%);
   width: 500px;
   height: 45px;
}


#search_field{
   width:140px; height : 41px; font-size: 15px; color:#999; border :2px solid #3d4ea2;
   border-right-color:white;
/*    background: url(resources/img/dropdown-img.png) no-repeat right 13px center; */
    appearance:none; -webkit-appearance:none;
   border-radius: 10px 0 0 10px;   
   vertical-align: middle;
   text-align: center;
}
#search_field:focus{
   outline: none;
   }
   
#search_field > option {
   width: 100px;
}
#search_keyword{
   width: 300px; height: 35px; font-size:15px; border:2px solid #3d4ea2; 
   margin-left: -15px;
   border-radius : 0 10px 10px 0;
   overflow: auto;
   vertical-align: middle;
}
#search_keyword:focus {outline:none;}
#search_btn{
   background-color: white;
   border: 0px;
   margin-left : -45px;
   width: 20px;
   margin-right: 0;
   vertical-align: middle;
}

.fa-user-slash{
   color: #6d7afe;
}
.fa-user{
   color: #6d7afe;
}

#login-btn{
   background-color: white;
   border : 0px; 
   cursor: pointer;
   width: 60px;
   height: 100px;
   margin-top: 10%;
   margin-right: 2%;
}
#join-btn{
   background-color: white;
   border : 0px; 
   cursor: pointer;
   height: 100px;
   margin-top: 10%;
   margin-left: -4%;
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

</style>
</head>
<body>
   
   <div id="header" align="center" style="margin-left: 24%; margin-right: 24%; margin-top: 1%; overflow:hidden;">
      <!-- 홈버튼 / 검색창 / 공백  / 공백 / 내쿠폰 / 내클래스 /마이페이지 버튼-->
         <div id="home-btn">
         <a href="<%=request.getContextPath()%>/main.do"><img alt="홈버튼 아이콘" src="resources/img/header_logo_180.PNG" width="150" height="80"> </a>
         </div>
         <div id="member-part" style="font-size: 16px; font-weight: bold; margin-right: 0%; margin-top: 1.5%;">
           <c:set value="${member_no }" var="member_no" />
           <c:if test="${member_no == 0 || empty member_no}">
            <a href="goto_join_member.do">회원가입</a> &nbsp;&nbsp; | 
           <a href="goto_login_member.do" style="margin-left: 4%;">로그인</a>
           </c:if>
           <c:if test="${member_no != 0 && !empty member_no}">
            <a href="goto_logout_member.do">로그아웃</a> &nbsp;&nbsp; | 
           <a href="<%=request.getContextPath() %>/goto_myInfo_member.do?no=${member_no }" style="margin-left: 4%;">MyPage</a>
           </c:if>
           </div>
         
   </div>





</body>
</html>