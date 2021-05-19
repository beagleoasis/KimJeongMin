<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 공지사항 수정 </title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />

<link rel="stylesheet" href="../../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/notice.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script>

<!-- include summernote css/js -->
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>

	function checkModiForm(){
		
		if($(".boardtextArea").val() == $("#prevBoardContext").val() && $("input[name=board_title]").val() == $("#prevBoardTitle").val()){
			alert("수정할 내용이 없습니다.");
		}else {
			$("#modiBoardNotice").submit();
		}	
	}

	$(function(){
		
		checkPage();
		
		if('${noticeBoard.member_id}' != '${loginMember.member_id}'){
			alert("잘못된 경로입니다.");
			location.href='/board/notice/listCri?page=1';
		}
				
		$('#summernote').summernote({
			height : 500
		});
		
		
		
		$("#prevBoardContext").val($(".boardtextArea").val());
	  	$("#prevBoardTitle").val($("input[name=board_title]").val());
	  
	  	rolling();
	    let boardUri = searchUriAddress();
	    asideBarDraw(boardUri);
		 
		
	});

</script>

<style>
@import url(/resources/cambak21/css/SHWtamplet.css);

#modifyBox{
	width: 400px;  		height: 100px;
	background-color: lightgray;;
	top: 50%;  		left: 50%;
	margin: -50px 0p 0px -150px;
	z-index: 999;
	padding: 15px;
	}

.formContent{

	margin: 40px;

}

input:focus {outline:none;}
textarea:focus {outline: none;}

form, form input{
	
	color:black;
	font-weight: 500;
} 


.boardtextArea{
    resize:none;
    margin: 5px;
    font-weight: 500;
    color: black;
    resize: none;
    padding: 11px;
    border: solid 1px;
}
   	
#replyWindow{

    width: 900px;
    height: 400px;
    margin: 40px;
    overflow-x: hidden;

}

#buttonWindow{

	margin: -45px 40px -15px;
}


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
							<h2>최근 공지사항</h2>
							<span class="byline" id="rollNot">공지사항 수정페이지</span>
						</header>
					
					</section>
				<!--  게시판 상세내용  -->	
					<section>
					<form id="modiBoardNotice" action="/board/notice/user/modi/${param.page }" method="post">
						<input type="hidden" name="board_no" value="${noticeBoard.board_no }" /> 
						<input type="text" class="form-control" id="usr" name="board_title" value="${noticeBoard.board_title }">
						<textarea id="summernote" name="board_content">${noticeBoard.board_content }</textarea>
						
						<input type="hidden" name="member_id" value="${loginMember.member_id }"> 
						<input	type="hidden" name="board_category" value="notice">
						<button type="button" style="float:right; margin-top:10px; margin-left:10px;" class="btn btn-warning" id="rewriteBoard" onclick="location.href='/board/notice/read?no=${noticeBoard.board_no }&page=${param.page }'">수정 취소</button>
						<button type="submit" style="float:right; "class="btn btn-success">수정 완료</button>
		     </form>
        </section>   
			</div>
		</div>
	</div>
</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>

	<input type="hidden" id="prevBoardTitle" />
	<input type="hidden" id="prevBoardContext" />

</body>

</html>