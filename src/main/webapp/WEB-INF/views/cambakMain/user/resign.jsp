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
<title>Cambark's</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak/21js/skel-panels.min.js"></script>
<script src="/resources/cambak21/js/init.js"></script>

<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />

<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);
</style>

    <!-- 템플릿 js, css 파일 -->
    <script src="js/SHWtamplet.js"></script>
   <style>
		@import url(css/SHWMypageTamplet.css);

		/* 김정민 CSS 적용 부분 */
		#chkBoxComment {
			color: red;
		}

		#list1 {
			list-style-image: url(img/checkbox1.png);
		}

		#list2 {
			list-style-image: url(img/checkbox1.png);
		}

		#container {
			margin-left: 20%;
		}
	</style>
	<script>
		function withdrawal() {
			let chkBox = document.getElementById("chkBox");
			if (chkBox.checked == false) {
				document.getElementById('chkBoxComment').innerHTML = "※안내 사항 확인여부에 동의해주세요."
				return false
			} 
		}

		function prevPg() {
			location.href = "http://zinsimi.cafe24.com/1_project/Do_main5.html";
		}
	</script>


</head>

<body>

	<!-- Header -->
	<div id="header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="http://zinsimi.cafe24.com/1_project/Do_main5.html">Logo</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">MENU<span
									class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="glory-login.html" id="loginBtn">로그인
									</a></li>
								<li><a href="Do_bbsList.html">게시판</a></li>
								<li><a href="SHW_myCamping.html">마이페이지</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>


		<div class="container">

			<!-- Logo -->
			<div id="logo">
				<h1>캠박이일</h1>
				<span class="tag">We are specialized in camping</span>
			</div>
		</div>
	</div>
	<!-- Header -->

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">
				
				<!-- Content -->
				
				<div id="content" class="8u skel-cell-important" style="padding-bottom: 200px;">
				<c:choose>
				<c:when test="${loginMember != null }">
					<section>
						<header>
							<h2>회원탈퇴 안내</h2>
							<span class="byline">회원탈퇴를 신청하시기 전에 안내 사항을 꼭 확인해주세요.</span>
						</header>
						<div>
							<ul>
								<li id="list1">사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</li>
								<li id="list2">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</li>
								<li>
									<br />
									<br />
									<br />
									<input type="checkbox" id="chkBox">안내 사항을 모두 확인하였으며, 이에 동의합니다.
									<span id="chkBoxComment"></span>
								</li>
							</ul>
							
						</div>
						<div>
						<form action="/user/resignStep2" method="POST" onsubmit="return withdrawal();">
						<input type="submit" class="btn btn-info" value="회원탈퇴">
							<input type="button" class="btn btn-info" value="되돌아가기" onclick="history.back()">
							
						</form>
							
						</div>

					</section>
					</c:when>
				<c:otherwise>
				
				
				
				<div>로그인이 필요한 서비스 입니다.</div>
				<br/>
				
				<input type="button" onclick="location.href='/user/login'" value="로그인페이지로 이동하기">
				
				</c:otherwise>
				</c:choose>
</div>
			</div>
		</div>
	</div>
	<!-- /Main -->

	
	<!-- Footer -->
	<%@include file="../cambak21Footer.jsp"%>
	<!-- /Footer -->
</body>

</html>