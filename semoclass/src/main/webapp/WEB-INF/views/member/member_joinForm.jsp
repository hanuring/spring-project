<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 클래스(세모클)</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/hnet.com-image.ico" />

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">

//현재 문서가 브라우저로 로딩 될 때 문서에 본문을 읽고 난 후 jquery를 실행 
$(function() {
	// 회원가입 폼 중에서 아이디중복체크 라는 버튼에 마우스가
	// 올라갔을 때 호출되는 무명함수
	$("#idcheck_btn").click(function() {
		$("#idcheck").hide(); 	// span 태그 영역을 숨겨라.
		
		var userId = $('#member_id').val();	
		
		// 입력 길이 체크
		if($.trim($('#member_id').val()).length < 4) {
			var warningTxt = '<font color="red" size="2px">아이디는 4자리 이상이여야 합니다.</font>';
			$("#idcheck").text('');		// idcheck 영역 초기화
			$("#idcheck").show();		// span 태그를 보여주어라
			$("#idcheck").append(warningTxt);
			$("#member_id").val("").focus();
			return false;
		}
	
		else if($.trim($("#member_id").val()).length > 16) {
		var warningTxt = '<font color="red" size="2px">아이디는 16자 미만이어야 합니다.</font>';
		$("#idcheck").text('');		// idcheck 영역 초기화
		$("#idcheck").show();		// span 태그를 보여주어라
		$("#idcheck").append(warningTxt);
		$("#member_id").val("").focus();
		return false;
	}
		
		// 아이디 중복 여부 확인 - Ajax 기술(비동기 통신)
		$.ajax({
			type : "post",		// 데이터 전송 방식(get, post)
			url : "member_idCheck.do", // 파일 주소와 경로
			data : {"userId" : $("#member_id").val()}, 	
			datatype : "jsp",		// 통신할 문서의 데이터 타입
			// 통신이 성공할 경우 결과 값을 data라는 변수에 저장
			success : function(data) {
				if(data >= 1) {		// 값이 있으면(id가 존재하는 경우)
					var warningTxt = '<font color="red" style="bold" size="2">중복된 아이디 입니다.</font>';
					$("#idcheck").text('');		// idcheck 영역 초기화
					$("#idcheck").show();		// span 태그를 보여주어라
					$("#idcheck").append(warningTxt);
					$("#member_id").val("").focus();
					return false;
				}else {				// id 중복이 되지 않는경우
					var warningTxt = '<font color="darkgreen" size="2">사용가능한 아이디 입니다.</font>';
					$("#idcheck").text('');		// idcheck 영역 초기화
					$("#idcheck").show();		// span 태그를 보여주어라
					$("#idcheck").append(warningTxt);
					return false;
				}
			}
		
		});	// ajax end 부분
		
	});
	
	
});

</script>

<script type="text/javascript">
		
		function categoryChange(e) {
			var cate_100 = ["미술", "공예", "디지털드로잉", "라이프스타일"];
			var cate_101 = ["101", "102", "103", "104"];
			var cate_200 = ["비즈니스/생산성", "영상/디자인", "데이터/개발", "글쓰기/콘텐츠"];
			var cate_201 = ["201", "202", "203", "204"];
			var cate_300 = ["부동산/주식/제테크", "온라인쇼핑몰", "SNS/콘텐츠", "창업"];
			var cate_301 = ["301", "302", "303", "304"];
			
			var target = document.getElementById("member_category");
		
			if(e.value == "100") {
				var d_a = cate_100;
				var d_b = cate_101;
			}
			else if(e.value == "200") {
				var d_a = cate_200;
				var d_b = cate_201;
			}
			else if(e.value == "300") {
				var d_a = cate_300;
				var d_b = cate_301;
			}
		
			target.options.length = 0;
		
			for (x in d_a) {
				var opt = document.createElement("option");
				opt.innerHTML = d_a[x];
				opt.value = d_b[x];
				target.appendChild(opt);
			}	
		}
		
		/* function addCategory() {
			
			var target = document.getElementById("category_td");
			
			var sel = document.createElement("select");
			var opt1 = document.createElement("option");
			var opt2 = document.createElement("option");
			var opt3 = document.createElement("option");
			
			sel.onchage = "categoryChange(this)";
			
			opt1.value = "100"; opt1.text = "크리에이티브";
			opt2.value = "200"; opt2.text = "커리어";
			opt3.value = "300"; opt3.text = "머니";
			
			sel.add(opt1, null);
			sel.add(opt2, null);
			sel.add(opt3, null);
			
			target.appendChild(sel);
			
		}
		 */
		</script>

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

.btn_blue  {
	background-color: #3A4CA8;
	width: 300px;
	height: 40px;
	color: #fff;
	letter-spacing: 0.1em;
	font-size: 14px;
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

.btn_new  {
	background-color: orange;
	width: 85px;
	height: 35px;
	padding-left: 10px;	
	padding-top: 3px;
	color: #fff;
	letter-spacing: 0.1em;
	font-size: 14px;
	font-weight: bold;
	border: none;
	margin-bottom: 3px;
	border-radius: 4px;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

.btn_new:hover {
	opacity: 80%;
}

img:nth-child(2) {
	padding-left: 150px;
}

</style>

</head>
<body>

<div align="center" style="margin-bottom: 30px">
	<img src="resources/img/login_logo.PNG" id="icon" alt="User Icon" />
</div>
<div class="container" style="margin-left: 24%">
	<div class="row">
    <div class="col-md-10">
      <section>
        <hr style="border:solid 1px #3A4CA8;">
       <!--  <h3 class="entry-title" align="center"><span><font color="#3A4CA8" style="font-weight: bolder;">세모클의 회원을 진심으로 축하합니다!</font></span> </h3> -->
       	<img src="resources/img/join.png" width="800" id="icon" alt="User Icon" />
        <hr style="border:solid 1px #3A4CA8;">
        <br><br>
        	<form action="<%=request.getContextPath() %>/member_join.do" method="post" name="signup" id="signup" class="form-horizontal">
        <div class="form-group" style="float: left">
          <label class="control-label col-sm-3" style="size: 15px">회원 ID <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="text" class="form-control" name="member_id" id="member_id" placeholder="아이디를 입력해 주세요." value=""> 
          </div>
            <br>
            <input type="button" value="중복체크" id="idcheck_btn" class="btn_new">&nbsp;<span id="idcheck"></span>
            <small> <span class="text-danger">*</span>회원 id를 입력 후 중복확인을 위해, 아이디 중복체크를 진행해 주세요. </small> </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="member_pwd" id="password" placeholder="유추하기 쉬운 비밀번호는 삼가해주세요." value="">
           </div>   
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="member_pwd_conf" id="cpassword" placeholder="동일한 비밀번호를 입력해주세요." value="">
            </div>  
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">회원 이름 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="member_name" id="member_name" placeholder="이름을 입력해주세요." value="">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">생년월일 <span class="text-danger">*</span></label>
          <div class="col-xs-8">
            <div class="form-inline">
              <div class="form-group">
              <input class="form-control" type="date" name="member_birth">
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">관심 카테고리 <span class="text-danger">*</span></label>
          <div class="col-xs-8">
            <div class="form-inline">
              <div class="form-group">
                <select onchange="categoryChange(this)" class="form-control" required>
               <option value="">관심 카테고리를 선택해주세요.</option>
               <option value="100">크리에이티브</option>
               <option value="200">커리어</option>
               <option value="300">머니</option>
            </select>
            <select id="member_category" name="member_category" class="form-control" required>
               <option value="">세부 카테고리 장르를 선택해주세요.</option>
            </select>
          </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">회원 유형 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <label>
            <input type="radio" name="member_grade" value="일반" selected>&nbsp;&nbsp;일반 </label>
            <label>
            <input type="radio" name="member_grade" value="강사">&nbsp;&nbsp;강사  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="text-muted"><span class="label label-danger">Note</span> 회원 유형은 추후 변경이 가능합니다.</span>
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input name="Submit" type="submit" value="회원가입" class="btn_blue">
          </div>
        </div>
      </form>
    </div>
</div>
</div>

</body>
</html>