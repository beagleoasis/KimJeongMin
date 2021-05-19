<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>404 error</title>

<!-- Google font -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<!-- 	<link href="https://fonts.googleapis.com/css?family=Muli:400" rel="stylesheet"> -->
<!-- 	<link href="https://fonts.googleapis.com/css?family=Passion+One" rel="stylesheet"> -->

<!-- Font Awesome Icon -->
<link type="text/css" rel="stylesheet"
	href="/resources/error/css/font-awesome.min.css" />

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="/resources/error/css/style.css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak21/js/skel-panels.min.js"></script>
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
<link rel="stylesheet" href="/resources/cambak21/css/SHWtamplet.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script>

</head>

<body>
	<div id="header" style="padding : 0">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/index/main" id="tampletHeaderTitle" style="color : black;">Cambark's</a>
					<span class="tampletHeaderBar"></span>
					<a class="navbar-brand" href="/mall/main/" id="tampletHeaderTitle" style="color : black;">CambakMall</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#" style="font-size: 17px;">MENU<span class="caret"></span></a>
							<ul class="dropdown-menu">
	                            
	                             <!-- 유저가 로그인 하지 않았다면 -->
	                            <c:if test="${loginMember == null }">
	                            	<li><a href="/user/login/yet" id="loginBtn">로그인</a></li>
	                            	<li><a href="/user/register">회원가입</a></li>
			                        <li><a href="/board/qa/list?page=1">게시판</a></li>
			                        <li><a href="/board/notice/listCri?page=1">공지사항</a></li>
			                        <li><a href="/board/cs/list?page=1">고객센터</a></li>
	                            </c:if>
	                            <!-- 로그인 한 경우 -->
	                            <c:if test="${loginMember != null }">
	                            	<!-- 로그인한 유저가 어드민인 경우 -->
	                            	<c:if test="${loginMember.member_isAdmin == 'Y' }">
	                            		<li><a href="/admin/productAnalysis">관리자 페이지</a></li>
			                            <li><a href="/board/qa/list?page=1">게시판</a></li>
			                            <li><a href="/board/notice/listCri?page=1">공지사항</a></li>
			                            <li><a href="/board/cs/list?page=1">고객센터</a></li>
			                            <li><a href="/user/logout" id="loginBtn">로그아웃</a></li>
	                            	</c:if>
	                            	<!-- 로그인한 유저가 일반 회원인 경우 -->
	                            	<c:if test="${loginMember.member_isAdmin == 'N' }">
	                            		<li><a href="/myPage/myPost">마이페이지</a></li>
			                            <li><a href="/board/qa/list?page=1">게시판</a></li>
			                            <li><a href="/board/notice/listCri?page=1">공지사항</a></li>
			                            <li><a href="/board/cs/list?page=1">고객센터</a></li>
			                            <li><a href="/user/logout" id="loginBtn">로그아웃</a></li>
	                            	</c:if>
	                            </c:if>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div id="notfound">
		<div class="notfound-bg"></div>
		<div class="notfound">
			<div class="notfound-404">
				<h1>404</h1>
			</div>
			<h2>Oops! Page Not Found</h2>
			<a href="${prevURL}">Back To Homepage</a>
		</div>
	</div>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
