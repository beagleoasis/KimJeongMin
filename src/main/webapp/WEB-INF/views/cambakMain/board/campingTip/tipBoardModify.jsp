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
<script src="/resources/cambak21/js/cambakBoard.js"></script>

<!-- include summernote css/js -->
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<script>
   $(document).ready(function() {

	  let boardUri = searchUriAddress();
      asideBarDraw(boardUri);
      
	  $('#summernote').summernote({
		  height : 550,
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
      
	  $("body,html").animate({scrollTop: 325}, 1);

   });
	
	$(document).ready(function() {
		memberCheck();
	});
   
	function memberCheck() {
		
		let member_id = '${modiBoard.member_id }';
		let entrerMember = '${loginMember.member_id}';
		let isAdmin = '${loginMember.member_isAdmin}';
		
		if (member_id != entrerMember && isAdmin != 'N') {
			alert("게시글 작성자만 수정이 가능합니다.");
			location.href='/board/campingTip/list?page=1';
		}
		
	}
	
	function sendFile(file, el) {
		let path = "/resources/uploads/CampingTip";
		
	    var form_data = new FormData();
	    
	    form_data.append('file', file);
	    
	    $.ajax({
	      data: form_data,
	      type: "POST",
	      url: '/board/campingTip/imgSave',
	      cache: false,
	      contentType: false,
	      enctype: 'multipart/form-data',
	      processData: false,
	      success: function(url) {
	    	  $(el).summernote('editor.insertImage', path + url);
	      }, // 통신 성공시
		  error : function(data) {
		    alert("이미지 파일만 첨부가능합니다.");
		  },
	   });
	}
	
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap');

#content {
	padding-right: 80px;
	padding-left: 80px;
	font-family: 'Gothic A1', sans-serif;
}

.infoBar {
	position: relative;
    text-align: left;
    border: 1px solid #C0C0C0;
    width: 100%;
    line-height: 150%;
    margin-bottom: 5px;
    border-radius: 4px;
}

.infoBar_title {
	padding: 0 15px;
    height: 33px;
    line-height: 29px;
    border-bottom: 1px solid #C1C1C1;
    background: #f5f5f5;
}

.infoBar_title h1 {
	font-weight: bold;
}

.infoBar_content {
	display: inline-block;
	padding: 10px 5px 10px 15px;
	color: #606060;
}

.form-control {
    margin: 30px 0 6px 0;

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

				<div id="content">
					<div class="infoBar">
						<div class="infoBar_title">
						<h1>캡핑팁 게시판 수정페이지입니다.</h1>
						</div>
						<div class="infoBar_content">
						더욱 더 자세하고 유용한 팁으로 수정 부탁드릴게요:)
						</div>
					</div>
					
					<div>
						<form action="/board/campingTip/modify" method="post">
							<input type="hidden" name="member_id" value="${modiBoard.member_id }">
							<input type="hidden" name="board_no" value="${modiBoard.board_no }">
							<input type="hidden" name="board_category" value="${modiBoard.board_category }">
							<input type="text" class="form-control" name="board_title" placeholder="제목을 입력해주세요." value="${modiBoard.board_title }">
							<textarea id="summernote" name="board_content">${modiBoard.board_content }</textarea>
							<button type="button" class="btn btn-default"style="float:right;" onclick="location.href='/board/campingTip/view?id=${modiBoard.board_category }&no=${modiBoard.board_no }'">취소</button>
							<button type="submit" class="btn btn-success" style="margin: 0 10px 0 0;float:right;">수정하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>

</body>

</html>