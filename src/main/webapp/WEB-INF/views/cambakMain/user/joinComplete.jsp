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

<script>

$(document).ready(function() {
	let result = '${result}';
	let loginMember = '${loginMember}';
	   
	if (loginMember != "") {
	   alert("잘못된 접근입니다.");
	   location.href="/index/main";
	}
	
	if (result == "fail") {
		alert("회원가입을 실패했습니다. 다시 시도 후 실패 시 문의바랍니다.");
		location.href="/index/main";
	}
	
});

document.onkeydown = noEvent;
function noEvent() { 
	if (event.keyCode == 116) { 
		location.href="/index/main";
		alert('만료된 페이지입니다');
		return false;
	} 
	else if (event.ctrlKey && event.keyCode == 82) { 
		location.href="/index/main";
		alert('만료된 페이지입니다');
		return false;
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
    margin-bottom: 40px;
    display: block;
    text-align: center;
    background-color: #fafafa;
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
}

.kakaoInfo {
    margin: 15px 0 0;
    padding: 0 0 0 19px;
    color: #999;
    line-height: 20px;
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

.informationBar {
	margin: 17px 0 0;
	padding: 53px 54px 59px;
	border: 1px solid #dcdcdc;
}

.informationSite {
	width: 579px; margin: 0 auto; padding: 60px 0;
}

.welcomeInfo {
    text-align: center;
    color: #222;
    font-size: 20px;
    padding-top: 10px;
    font-weight: bold;
}

.welcomeMsg {
	margin: 0 0 27px;
    padding: 15px 0 15px;
    border-bottom: 1px solid #dbdbdb;
    line-height: 20px;
    text-align: center;
}

.linkSite {
	padding-left: 60px;
    padding-right: 60px;
}

.moveHome {
    position: relative;
    background: #fff;
    color: #333;
    height: 62px;
    line-height: 60px;
    border: 1px solid #888;
    font-size: 17px;
    margin-bottom: 40px;
    display: inline-block;
    text-align: center;
    background-color: #fafafa;
    width: 152px;
    margin-right: 20px;
}

.movelogin {
    position: relative;
    height: 62px;
    line-height: 60px;
    font-size: 17px;
    margin-bottom: 40px;
    display: inline-block;
    text-align: center;
    width: 152px;
    background: #3e3d3c;
    border: 1px solid #3e3d3c;
    color: #fff;
    margin-left: 20px;
}

.linkSite a:hover {
	text-decoration: none;
}

.userInfo {
	margin-bottom: 5px;
}

.userProfile {
	margin: 0 200px;
    border-radius: 50%;
}

</style>

</head>

<body>
	<%@include file="../cambak21Header.jsp"%>


	<div id="main">
		<div id="content" class="container">
			<div class="contentPlace">
				<div>
					<div class="registerTitle">
							<h2 class="registerTitleHead">회원가입 - 가입완료</h2>
					</div>
					<div class="informationSite">
						<div class="informationBar">
							<div><img src="/resources/uploads/${joinMember.member_img }" class="userProfile" /></div>
							<div class="welcomeInfo">회원가입이 완료 되었습니다.</div>
							<div class="welcomeMsg">
								<p class="userInfo"><strong style="font-weight: bold;">${joinMember.member_name }</strong>님의 회원가입을 축하드립니다.</p>
								<p class="userInfo">아이디 : ${joinMember.member_id }</p>
								<p style="margin-bottom: 0px;">이메일 : ${joinMember.member_email }</p>
							</div>
							<div class="linkSite">
								<a href="/index/main" class="moveHome">홈으로</a>
								<a href="/user/login/yet" class="movelogin">로그인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>
</html>

