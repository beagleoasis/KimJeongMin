<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="/resources/cambak21js/skel-panels.min.js"></script>
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

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script>

<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
@import url(/resources/cambak21/css/SHWtamplet.css);
</style>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500,
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	});
	
	function sendFile(file, el) {
		let path = "/resources/uploads/boardCs";
		
	    var form_data = new FormData();
	    
	    form_data.append('file', file);
	    
	    $.ajax({
	      data: form_data,
	      type: "POST",
	      url: '/board/cs/image',
	      cache: false,
	      contentType: false,
	      enctype: 'multipart/form-data',
	      processData: false,
	      success: function(url) {
	    	  $(el).summernote('editor.insertImage', path + url);
	      }, // 통신 성공시
		  error : function(data) {
		    $("#modalText").text("이미지 파일이 아닙니다");
			$("#myModal").modal();
		  },
	   });
	}
</script>
</head>

<body>
	<%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- 사이드바 템플릿 -->
				<%@include file="../../cambak21Aside2.jsp"%>

				<div id="content">
					<div>
						<form action="../cs/write" method="post">
							<input type="text" class="form-control" id="usr"
								name="board_title">
							<textarea id="summernote" name="board_content"></textarea>
							<input type="hidden" name="member_id"
								value="${loginMember.member_id}"> <input type="hidden"
								name="board_category" value="CS">
								
							<c:if test="${param.searchType != null }">
								<a href="/board/cs/search?page=${param.page }&searchType=${param.searchType }&searchWord=${param.searchWord}"><button type="button" class="btn btn-danger" >취소</button></a>
							</c:if>
							<c:if test="${param.searchType == null }">
								<a href="/board/cs/list?page=${param.page }"><button type="button" class="btn btn-danger" >취소</button></a>
							</c:if>
							
							<button type="submit" class="btn btn-success">작성하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Main -->
	
	<!-- modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">알림</h4>
				</div>
				<div class="modal-body" id="modalText"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../../cambak21Footer.jsp"%>

</body>

</html>