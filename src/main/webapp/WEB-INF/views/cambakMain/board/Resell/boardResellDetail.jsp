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
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/resources/cambak21/js/skel.min.js"></script>
	<script src="/resources/cambak21/js/skel-panels.min.js"></script>
	<script src="/resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
	
    <link rel="stylesheet" type="text/css" href="/resources/lib/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/lib/slick/slick-theme.css"/>
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="/resources/lib/slick/slick.js"></script>  
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		
		.\34 u {
			width : 100%;
			margin : 0px;
		}
		#content{
			width: 1000px;
    		height: auto;
		}
		#totallArray{
			width: 100%;
    		height: 100%;
			display: inline-block;
			margin-bottom: 40px;
		}
		#imgBoard{
			width: 100%;
    		height: 100%;
			border: 1px solid black;
		}
		#imgArray{
			margin-right: 40px;
			width: 430px;
    		height: 430px;
    		display: inline-block;
    		float: left;
		}
		#textArray{
			color: black;
			height: 400px;

		}
		.inputStyle{
			border: none;
			width: 80%
		}
		.inputStyle:focus, .detail:focus{
			outline: none;
		}
		.detail{
			width: 455px;
			height: 300px
		}
		#pageTitle{
			color : black;
			font-size: 24px;
		}
		.imges{
			height: 430px;
			
		}
		#likeBtn{
	    	width: 50px;
  			height: 40px;
		}
		#likeBtn:focus {
			outline: none;
		}
}
	</style>
	
	<script>
	
	function showReplyBox() {
		$("#inputReplyBox").show();
	}
	
	function callReplyList() {

		let bno = ${board.resellBoard_no};
		console.log(bno);
		$("#replyBox").empty();
		$.getJSON("/utile/reply/all/" + bno, function(data) {
			let output = "<ul class='list-group'>";
			console.log(data);
			$(data).each(
					function(index, item) {
						console.log(item.replyResell_no)
						output += "<li class='list-group-item'>"
						output += "<div>작성자 : " + item.member_id + "</div>"
						output += "<div>" + item.replyResell_content + "</div>"
						output += "<div>작성날짜 : "
								+ new Date(item.replyResell_updateDate).toLocaleString()
								+ "</div>"
						output += "</li>"
						output += '<li class="list-group-item"><span id="' + item.no 
						+ '" onclick="goModify(' + item.replyResell_no + ')">댓글 수정</span>';
						output += "<span  onclick='goDelete(" +item.replyResell_no+ ");' style='margin-left: 20px'>댓글 삭제</span></li>";
						
					})
			output += "</ul>";

			$("#replyBox").html(output);
		});
	}
	function goDelete(no) {
		let mamberid = "${loginMember.member_id}"
		if (mamberid != null){
			if(mamberid == ${board.member_id}){
				$.ajax({
					  method: "delete",
					  url: "/utile/replies/"+no,
					  headers : {
						"Content-Type" : "application/json", // 요청하는 데이터의 헤더에 전송
						"X-HTTP-Method-Override" : "delete"
					  },
					  dataType: "text", // 응답 받는 데이터 타입
					  data : JSON.stringify({ // 요청하는 데이터
						  no : no,
					  }),
					  success : function(result) {
						if(result == "Success") {
							alert("댓글 삭제 완료");
							callReplyList();
						}	
					  }
					});
			}
			
		}

	}
	$(function() {
		openLike();	
		callReplyList();
	      $('.single-item').slick({
	    	  autoplay : true,
              autoplaySpeed : 8000,    
              dots:true,
              arrows : true
          });
	      

	});
	function openLike(){
		let member_id= "${loginMember.member_id}";
	
		if (member_id != null){
			let resellBoard_no = ${param.no};
		
		      $.ajax({
					type : "post",
					dataType : "text",
					contentType : "application/json",
					url : "/utile/openLike", 
					data : JSON.stringify({
						resellBoard_no : resellBoard_no,
						member_id : member_id
					}),
					success : function(data) {
						$("#likeArray").html('<img id="likeBtn"src="'+data+'"/>')
					}, // 통신 성공시
					error : function(data) {
					}, // 통신 실패시
					complete : function(data) {
					} // 통신 완료시
				});
		}
	}
	
	
	function addReply() {
		let member_id = $("#newReplyWriter").val();
		let resellReplyBoard_content = $("#newReplyText").val();
		let resellBoard_no = ${param.no};
		console.log(member_id+" : "+resellReplyBoard_content+" : "+resellBoard_no)
		$.ajax({
			type : "post",
			dataType : "text",
			contentType : "application/json",
			url : "/utile", 
			data : JSON.stringify({
				resellBoard_no : resellBoard_no,
				member_id : member_id,
				resellReplyBoard_content : resellReplyBoard_content
			}),
			success : function(data) {
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	function like() {		
		let member_id ="${loginMember.member_id}";
		if (member_id != null){
			console.log(member_id);
			let resellBoard_no = ${board.resellBoard_no};
			$.ajax({
				type : "post",
				dataType : "text",
				contentType : "application/json",
				url : "/utile/like", 
				data : JSON.stringify({
					resellBoard_no : resellBoard_no,
					member_id : member_id
				}),
				success : function(data) {
					$("#likeArray").html('<img id="likeBtn"src="'+data+'"/>')
				}, // 통신 성공시
				error : function(data) {
				}, // 통신 실패시
				complete : function(data) {
				} // 통신 완료시
			});
		}
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

				<!-- Content -->
			<div id="content" class="8u skel-cell-important">
			<c:choose>
			<c:when test="${board.resellBoard_isDelete != 'Y'}">
			<div>
			<div>
				<hr style="margin: 10px 0;padding: 3px;"/>
				<div id="totallArray">
					<!-- 이미지div -->
					<div id="imgArray">
						<div id="imgBoard" class="fDrop single-item" >

							<c:if test="${not empty board.resellBoard_img2}">
								<img src='${board.resellBoard_img2}'/>
							</c:if>
							<c:if test="${not empty board.resellBoard_img1}">
								<img src='${board.resellBoard_img1}'/>
							</c:if>
						</div>
					</div>
					<!-- 텍스트div -->
					
					
					<div id="textArray">
						<div><h1 style="font-size: 25px;color: black;">${board.resellBoard_title}</h1></div>
						<hr style="margin: 3px  0;padding: 3px;0"/>
						<div id="detail"><span class="detail">${board.resellBoard_content	}</span></div>
						<div style="margin-bottom: 15px">
						<c:choose>
                  			<c:when test='${not empty loginMember.member_id}'>
								<button id="likeArray" onclick="like();" 
								style="width: auto;display: inline-block;height: auto; background: none; border: none;">
									
								</button>
							</c:when>
							<c:otherwise>
								<div style="width: auto;display: inline-block;height: auto;">
									<img id="likeBtn" src="/resources/img/emptyHeart.png"/>
								</div>
							</c:otherwise>
						</c:choose>
						<span style="margin-left: 20px">조회수 : ${board.resellBoard_viewCnt}</span></div>
						<div><span style="margin-bottom: 15px">${board.resellBoard_addr }</span></div>
					
						
					
					</div>
					<!-- 버튼div -->
					<div>
					<c:if test="${loginMember.member_id == board.member_id}">
						<hr style="margin: 10px 0;padding: 3px;"/>
						<button type="button" class="btn btn-success" id="rewriteBoard"
							onclick="location.href='/board/resell/modi?no=${board.resellBoard_no}'">수정하기</button>
						<button type="button" class="btn btn-info" id="deleteBoard"
							onclick="location.href='/board/resell/remove?no=${board.resellBoard_no}'">삭제하기</button>
					</c:if>
						<button type="button" class="btn btn-primary"
							onclick="location.href='/board/resell/list?page=${param.page}'">리스트페이지로</button>
						<c:if test="${not empty loginMember.member_id }">
							<button type="button" class="btn btn-primary"
								onclick="showReplyBox();">댓글달기</button>
						</c:if>
					</div>
				</div>
				<div id="inputReplyBox"
					style="padding: 15px; border: 1px dotted gray; display: none;">
					
						작성자 : <input type="text" name="replyer" id="newReplyWriter" "/> 
						댓글 입력 : <input type="text" name="replytext" id="newReplyText" />

						<button id="replyAddBtn" onclick="addReply(); window.location.reload();">ADD Reply</button>
					
					</div>
				<div id="replyBox"
						style="padding: 10px 0; border-bottom: 1px solid gray;">
						
				</div>
			</div>
			</div>
			</c:when>
			<c:otherwise>
				<div style="margin: auto;display: table;">
					<h1 style="font-size: 30px;color: black;margin-bottom: 20px">지워진 페이지 입니다</h1>
					<button type="button" class="btn btn-primary" style="margin: auto;display: table;"
							onclick="location.href='/board/resell/list?page=${param.page}'">리스트페이지로</button>
				</div>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
		
	</div>
	</div>
	<!-- /Main -->

    <%@include file="../../cambak21Footer.jsp"%>
	
</body>
</html>