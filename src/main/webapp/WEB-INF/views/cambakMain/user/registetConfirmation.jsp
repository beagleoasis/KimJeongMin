<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>

<!DOCTYPE HTML>
<html>
<head>

<meta charset="utf-8" />
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<title>Cambark's</title>

<!-- jquery -->
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="/resources/cambak21/css/SHWtamplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<!-- 게시판 공통 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>

<script src="https://www.google.com/recaptcha/api.js"></script>

<script>
   let emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
   let koreanJ = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //  한글 정규표현식
   let checkResultEmail = false;
   
   $(document).ready(function() {
	   let loginMember = '${loginMember}';
	   
	   if (loginMember != "") {
		   alert("잘못된 접근입니다.");
		   location.href="/index/main";
	   }
	   
   });
   
   function checkAndSendEmail() {
	   let userEmail = $("#userEmail").val();
	   
	   if (userEmail.length == 0) {
		   alert("이메일을 작성해주세요.");
		   return;
	   } else {
		   if (checkResultEmail) { // 중복이메일 확인
			   if (googleCapchaChk()) { // 구글 캡챠 통과 확인
				   if (emailJ.test(userEmail) && !koreanJ.test(userEmail)) { // 작성한 이메일 유효성 검사
					   if (sendEamil()) {
						   alert("작성해주신 주소로 메일이 전송되었습니다.");
						   location.reload();
					   } else {
						   alert("메일 전송을 실패했습니다. 다시 시도 후 실패 시 문의바랍니다.");
						   location.reload();
					   }
					   
				   }
			   }
		   } else {
			   alert("이메일을 확인해주세요.");
		   }
		   
	   }
	   
   }
   
   function sendEamil() {
	   let result = true;
	   let userEmail = $("#userEmail").val();
	   
		$.ajax({
            url: '/user/register/sendRegisterEmail',
            type: 'post',
            dataType: "text",
            data: { userEmail : userEmail },
            success: function(data) {
            	if (data == "sendOK") result = true;
            	else if (data == "sendFAIL") result = false;
            }
        });
		return result;
   }

   function googleCapchaChk() {
	   let result = false;
	   
		$.ajax({
            url: '/user/register/checkRecaptcha',
            type: 'post',
            dataType: "text",
            async: false,
            data: { recaptcha: $("#g-recaptcha-response").val() },
            success: function(data) {
            	
            	if (data == "success") {
            		result =  true;
            	} else if (data == "fail") {
            		alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
            		result =  false;
            	} else if (data == "error") {
            		alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다.");
            		result =  false;
                }
            }
            
        });
		return result;		
   }
   
   function checkUserEmail() {
	   let userEmail = $("#userEmail").val();
	   
	   if (emailJ.test(userEmail) && !koreanJ.test(userEmail)) {
		   
			$.ajax({
	            url: '/user/register/checkOverlapEmail',
	            type: 'post',
	            dataType: "text",
	            data: { userEmail : userEmail },
	            success: function(data) {
	            	if (data == "possibility") {
	            		checkResultEmail = true;
	            	} else if (data == "impossibility") {
	            		checkResultEmail = false;
	            		alert("이미 사용 중인 이메일입니다. 아이디 찾기를 이용해주세요.")
	            	}
	            }
	        });
			
	   } else {
		   alert("이메일 형식에 맞게 작성해주세요.");
	   }

   }
   
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap');

#content {
	font-family: 'Gothic A1', sans-serif;
}

.contentPlace{
	margin: 0 auto;
	width: 900px;
}

.registerTitle {
	border-bottom: 1px solid #dbdbdb;
}

.registerTitleHead {
	display: inline-block;
	font-size: 28px;
	font-weight: bold;
	padding-bottom: 10px;
}

.registerTitleBody {
	display: inline-block;
	font-size: 18px;
	float: left;
	padding-bottom: 5px;
}

.registerBtn {
	position: relative;
    background: #fff;
    color: #333;
    margin-top: 0;
    height: 62px;
    line-height: 60px;
    border: 1px solid #888;
    font-size: 17px;
    margin-bottom: 20px;
    display: block;
    text-align: center;
    background-color: #fafafa;
    cursor: pointer;
}

.kakaoRegisterBtn {
	position: relative;
    background: #fff;
    color: #333;
    margin: 12px 0 0;
    height: 62px;
    line-height: 60px;
    border: 1px solid #888;
    font-size: 17px;
    display: block;
    text-align: center;
    background-color: #fafafa;
    cursor: pointer;
}

.kakaoInfo {
    margin: 15px 0 0;
    padding: 0 0 0 19px;
    color: #999;
    line-height: 20px;
    font-size: 12px;
}

.modal-header, h4, .close {
  background-color: #8b9fc6;
  color:white !important;
  text-align: center;
  font-size: 25px;
}
.modal-footer {
  background-color: #f9f9f9;
}

.memberBtn {
	color: #3e3d3c;
    text-decoration: none;
}

.signIn {
	padding: 15px 0 0;
	color: #666;
	font-size: 12px;
}

.signInBtn {
	color: #3e3d3c;
	text-decoration: underline;
}

.registerBar {
	margin: 17px 0 0;
	padding: 53px 54px 59px;
	border: 1px solid #dcdcdc;
}

.registerSite {
	width: 579px; margin: 0 auto; padding: 60px 0;
}

.registerBar a:hover {
	text-decoration: none;
}

</style>

</head>

<body>
	<%@include file="../cambak21Header.jsp"%>


	<div id="main" ondragstart="return false">
		<div id="content" class="container">
			<div class="contentPlace">
				<div>
					<div class="registerTitle">
							<h2 class="registerTitleHead">회원가입</h2>
					</div>
					<div class="registerSite">
						<div class="registerBar">
							<a class="registerBtn" data-toggle="modal" data-target="#myModal">캠박's 통합 회원가입</a>
							<a href="#"><img src="/resources/cambak21/img/kakaoLogin.png" style="width: 470px;" /></a>
							<p class="kakaoInfo">
								* 카카오톡 로그인 연동 서비스는 아직 준비 중입니다. 이용에 불편드려 죄송합니다.
							</p>
							
							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog">
							  <div class="modal-dialog">
							  
								<!-- Modal content-->
								<div class="modal-content">
								  <div class="modal-header" style="padding:35px 50px;">
								    <button type="button" class="close" data-dismiss="modal">&times;</button>
								    <h4><span class="glyphicon glyphicon-lock"></span> 회원가입-이메일 본인 인증</h4>
								  </div>
								  <div class="modal-body" style="padding:40px 50px;">
								    <form role="form">
								      <div class="form-group">
								        <label for="userEmail"><span class="glyphicon glyphicon-user"></span> </label>
								        <input type="text" class="form-control" id="userEmail" placeholder="이메일을 작성해주세요." onblur="checkUserEmail();" autocomplete="off">
								      </div>
									  <div class="g-recaptcha" data-sitekey="6LcPSqIaAAAAAH_msgzY3LP3lNJ207FQ4ujognJW"></div>
								      <button type="button" id="join_button" style="margin-top: 15px;" class="btn btn-block" onclick="checkAndSendEmail();"><span class="glyphicon glyphicon-off"></span> 이메일 인증 요청</button>
								    </form>
								  </div>
								  <div class="modal-footer">
								    <button type="submit" class="btn btn-danger btn-default pull-left" style="margin-top: 21px;" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
								    <p>이미 캠박's 회원이세요? <br /><a href="login/yet" class="memberBtn">로그인</a> | <a href="find_idPwd" class="memberBtn">아이디/비밀번호 찾기</a></p>
								  </div>
								</div>
							    
							  </div>
							</div>
							
						</div>
						<div style="text-align: center;">
							<p class="signIn">
								이미 캠박's 회원이세요?
								<a href="/user/login/yet" class="signInBtn">로그인</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>
</html>

