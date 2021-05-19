<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);

.\34 u {
	width: 100%;
	margin: 0px;
}

.pageBtn {
	justify-content: center;
	display: flex;
}

th.board-title {
	width: 60%;
}

p.category-title {
	font-weight: bold;
	text-align: center;
	font-size: 20px;
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
		<div id="content">
				 	<h1>유머글 작성</h1>
    <section class="product-details spad">
    
       
				<div class="col-lg-12">
					<form action="/board/humor/modi" method="post">
					
					<input type="hidden" value="${board.board_no }" name="board_no">
					<input type="hidden" id="member_id" name="member_id" value="${board.member_id }"/>
					
					<!-- name에 컬럼명을 제대로 적어줘야 한다. -->
					
					<div class="form-group">
		               	  
		            </div>
					<div class="form-group">
		                  <input type="text" class="form-control" id="board_title" name="board_title" value = "${board.board_title }" placeholder="제목을 입력해 주세요."/>
		            </div>
					  <textarea id="summernote" id="board_content" name="board_content" >${board.board_content }</textarea>
					  <div class="form-row float-right">
			                  <button type="submit" class="btn btn-success">저장하기</button>
			                  <button type="button" class="btn btn-primary" onclick="location.href='/board/humor/listAll?page=1'">목록</button>
		                  </div>
					</form>
				    <script>
				      $('#summernote').summernote({
				        placeholder: '내용을 입력하세요.',
				        tabsize: 2,
				        height: 450,
				        focus: true,
				        toolbar: [
				          ['style', ['style']],
				          ['font', ['bold', 'underline', 'clear']],
				          ['color', ['color']],
				          ['para', ['ul', 'ol', 'paragraph']],
				          ['table', ['table']],
				          ['insert', ['link', 'picture', 'video']],
				          ['view', ['fullscreen', 'codeview', 'help']]
				        ]
				      });
				    </script>
				    
				</div>
			
	</section>
	</div>
				
			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>
	
		<!-- Js Plugins -->
<script src="../resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="../resources/mallMain/js/bootstrap.min.js"></script>
<script src="../resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="../resources/mallMain/js/jquery-ui.min.js"></script>
<script src="../resources/mallMain/js/mixitup.min.js"></script>
<script src="../resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="../resources/mallMain/js/jquery.slicknav.js"></script>
<script src="../resources/mallMain/js/owl.carousel.min.js"></script>
<script src="../resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="../resources/mallMain/js/main.js"></script>
</body>
</html>