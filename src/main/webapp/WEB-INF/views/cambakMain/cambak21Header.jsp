<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Header -->
	<div id="header">
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
<%-- 	                        	<c:choose> --%>
<%-- 	                        		<c:when test="${loginMember != null }"> --%>
<!-- 			                            <li><a href="/myPage/myPost">마이페이지</a></li> -->
<!-- 			                            <li><a href="/board/campingreview/listcri?page=1">게시판</a></li> -->
<!-- 			                            <li><a href="/board/notice/listCri?page=1">공지사항</a></li> -->
<!-- 			                            <li><a href="/board/cs/list?page=1">고객센터</a></li> -->
<!-- 			                            <li><a href="/user/logout" id="loginBtn">로그아웃</a></li> -->
<%-- 	                            	</c:when> --%>
<%-- 	                            	<c:otherwise> --%>
<!-- 	                            		<li><a href="/user/login/yet" id="loginBtn">로그인</a></li> -->
<!-- 	                            		<li><a href="/user/register">회원가입</a></li> -->
<!-- 			                            <li><a href="/board/campingreview/listcri?page=1">게시판</a></li> -->
<!-- 			                            <li><a href="/board/notice/listCri?page=1">공지사항</a></li> -->
<!-- 			                            <li><a href="/board/cs/list?page=1">고객센터</a></li> -->
<%-- 	                            	</c:otherwise> --%>
<%-- 	                            </c:choose> --%>
	                            
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


		<div class="container">

			<!-- Logo -->
			<div id="logo">
				<h1>캠박이일</h1>
				<span class="tag">We are specialized in camping</span>
			</div>
		</div>
	</div>
