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
<title>Cambark's</title>

<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/SHWtamplet.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageAside.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageTemplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>

<script>

$(document).ready(function() {
    $("body,html").animate({scrollTop: 300}, 1);
    modifyResultMsg();
    kakaoInterlockMsg();
});

function modifyResultMsg() {
	if ('${result }' == "success") {
		   alert("회원정보 수정이 완료되었습니다.");
	   } else if ('${result }' == "fail") {
		   alert("회원정보 수정을 실패했습니다. 다시 시도 후 문의바랍니다.");
	   }
}

function kakaoInterlockMsg() {
	if ('${kakaoInterlock }' == "interlockSuccess") {
		   alert("카카오 로그인 연결이 완료되었습니다.");
	   } else if ('${kakaoInterlock }' == "interlockFail") {
		   alert("카카오 로그인 연결이 실패되었습니다. 다시 시도 후 관리자에게 문의바랍니다.");
	   } else if ('${kakaoInterlock }' == "releaseSuccess") {
		   alert("카카오 로그인 해제가 완료되었습니다.");
	   } else if ('${kakaoInterlock }' == "releaseFail") {
		   alert("카카오 로그인 해제를 실패했습니다. 다시 시도 후 관리자에게 문의바랍니다.");
	   }
}

// 로그인한 회원이 작성한 게시글, 댓글, 좋아요, 문의 개수 가져오기
function userCheck() {
	let userId = '${loginMember.member_id}';
	let userPwd = $("#userPwd").val();
	
	$.ajax({
		method: "GET",
		url: "/user/checkUser",
		dataType: "text",
		data : {userId : userId, userPwd : userPwd},
		success : function(data) {
			if (data == "userOk") $("#userPwdCheck").submit();
			else if (data == "userBad") alert("비밀번호를 정확하게 입력해 주세요.");
		}
	});
	
}



</script>
<style>
.userChkContent {
	margin:0 100px;
	padding: 100px 0;
}

.userChkBox {
	margin: 17px 0 0;
	padding: 53px 54px 59px;
	border: 1px solid #dcdcdc;
	text-align: center;
}

.pwdChkInfoMsg {
	font-size: 20px;
	font-weight: bold;
}

.pwdChkInfoContent {
	margin: 30px auto;
	line-height: 150%;
	color: #757575;
}

.pwdInputInfo {
	display: inline-block;
	margin: 0 0 5px;
	width: 100px;
	font-weight: normal;
	color: #2e2e2e;
}

.inputPwd {
	height: 25px;
	line-height: 20px;
	padding: 2px 4px;
	border: 1px solid #d5d5d5;
	color: #353535;
	font-size: 14px;
}

.checkBtnBox {
	padding: 10px 0;
	text-align: center;
}

#checkBtn {
	background-color: #5063e3;
	color: #ffffff;
	width: 100px;
}

</style>
</head>
<body>
	<%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<%@include file="myPageAside.jsp"%>

				<!-- Content -->
				
				<div id="content" class="8u skel-cell-important">
					<form action="modify" method="post" id="userPwdCheck">
					<div class="userChkContent">
						<div class="userChkBox">
							<h2 class="pwdChkInfoMsg">비밀번호 확인</h2>
							<div style="width: 420px; margin: 0 auto;">
								<p class="pwdChkInfoContent">
									<strong style="color: #008bcc;">${loginMember.member_id }</strong>님의 회원정보를 안전하게 보호하기 위해<br />비밀번호를 한번 더 확인해 주세요.
								</p>
								<p>
									<label class="pwdInputInfo">▶ 비밀번호</label>
									<input type="password" name="userPwd" id="userPwd" class="inputPwd"/>
								</p>
								<p class="checkBtn">
									<button type="button" class="btn btn-lg" id="checkBtn" onclick="userCheck();">확인</button>
								</p>
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>