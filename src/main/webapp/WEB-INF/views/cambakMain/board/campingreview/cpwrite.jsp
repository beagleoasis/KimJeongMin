<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공지사항</title>

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
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

<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet"
	href="../../resources/cambak21/css/style-desktop.css" />

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

<script>
	function chechSearchInput() {
		console.log("!");
		console.log($("select[name=searchType]").val())
		if ($("#searchWord").val() == "") {
			alert("검색어를 입력해주세요.");
		} else if ($("select[name=searchType]").val() == "n") {
			alert("검색 카테고리를 선택해주세요.");
		} else {
			$("#searchFormGo").submit();
		}

	}

	$(document).ready(function() {

		let boardUri = searchUriAddress();
		asideBarDraw(boardUri);

	});
</script>






<style>
@import url(/resources/cambak21/css/SHWtamplet.css);
</style>

</head>

<body>

	<%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- 사이드바 템플릿 -->
				<%@include file="../../cambak21Aside2.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>캠핑후기 페이징 리스트</h2>
							<span class="byline" id="rollNot"><a href="#">캠핑후기 페이징
									리스트</a></span>
						</header>

					</section>


					<div>
						<div>
						
						<form action="/board/campingreview/write" method="post">
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="member_id">작성자 :</label>
		               <div class="col-sm-10">
		                  <input type="text" class="form-control" id="member_id" name="member_id" value="${loginMember.member_id}">
		               </div>
		            </div>
		            <div class="form-group">
		               
		               <div class="col-sm-10">
		                  <input type="hidden" class="form-control" id="board_category" name="board_category" value="camping">
		               </div>
		            </div>
		          
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="board_title">제 목 :</label>
		               <div class="col-sm-10">
		                  <input type="text" class="form-control" id="board_title" name="board_title" >
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="board_content">내 용 :</label>
		               <div class="col-sm-10">
		                  <textarea rows="10" cols="30" class="form-control" id="board_content" name="board_content"></textarea>
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="file1">파 일1 :</label>
		               <div class="col-sm-10">
		                  <input type="file" class="form-control" id="file1" name="file1">
		               </div>
		           
		           
		            <div class="form-group">
		               <div class="col-sm-offset-2 col-sm-10">
		                  <button type="submit" class="btn btn-success">저장</button>
		                  <button type="button" class="btn btn-danger" onclick="location.href='' + ${param.no}">취소</button>
		               </div>
		            </div>
		         </form>
						
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>


</body>

</html>