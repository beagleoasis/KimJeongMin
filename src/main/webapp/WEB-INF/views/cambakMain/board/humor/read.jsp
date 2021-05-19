<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);
</style>

<script>

// 댓글 수정
function modiProc(){
	$("#modifyBox").hide();
	let no = $("#replyno").val();
	let replytext = $("#replytext").val();
	
	$.ajax({
		  method: "PUT",
		  url: "/cambakMain/board/humor/replies/" + no,
		  headers : { // 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "PUT"
		  },
		  dataType: "text", // 응답 받는 데이터 타입
		  data : JSON.stringify({ // 요청하는 데이터
			replyBoard_no : no,
			replyBoard_content : replytext
		  }),
		  success : function(result){
			  if(result == "success"){
				  alert('댓글 수정 완료');
				  
			  }
			  callReplyList();
		  }
		});
	
}

// 댓글 수정창 띄우기
function gomodify(no) {
	
	$("replyno").val(no);
	$("#modifyBox").show();
}

function goDel(replyBoard_no){
	let board_no = ${param.no};
	
	$.ajax({
		  method: "DELETE",
		  url: "/cambakMain/board/humor/replies/" + replyBoard_no+ "/" + board_no,
		  headers : { // 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "DELETE"
		  },
		  dataType: "text", // 응답 받는 데이터 타입
		  data : {replyBoard_no : replyBoard_no, board_no : board_no},
		  success : function(result){
			  if(result == "success"){
				  alert("삭제완료");
				  
			  }
			  callReplyList();
		  }
		});
	
}

function showReplyBox() {
	$("#inputReplyBox").show();
}

// 댓글 쓰기
function addReply(){
	
	let member_id = $("#newReplyWriter").val();
	let replyBoard_content = $("#replyBoard_content").val();
	let board_no = ${param.no};
	$.ajax({
		  method: "POST",
		  url: "/cambakMain/board/humor/replies",
		  headers : { // 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "POST"
		  },
		  dataType: "text", // 응답 받는 데이터 타입
		  data : JSON.stringify({ // 요청하는 데이터
			board_no : board_no,
			member_id : member_id,
			replyBoard_content : replyBoard_content
		  }),
		  success : function(result){
			  if(result == "Success"){
				  alert('댓글 등록 완료');
				  
			  }
			  callReplyList();
		  }
		});


}

// 댓글 불러오기
function callReplyList(){
    
    let bno = "${param.no}";
    console.log(bno);
    let output = '<ul class="list-group">';
    $.getJSON("/cambakMain/board/humor/replies/all/" + bno, function(data){
       console.log(data);
       $(data).each(function(index, item){
          output += '<li><input type="hidden" id="replyno" value="'+this.replyBoard_no +'"/><div>' + this.replyBoard_content + '</div><div><span>' 
          + new Date(this.replyBoard_writeDate) + '</span>' + '<span>작성자' + this.member_id + '</span></div></li>';
          output += '<li><span id=""' + item.replyBoard_no + '" onclick="gomodify(' + item.replyBoard_no + ');"><img id=' + item.replyBoard_no + ' src = "../../../resources/img/modify.png" width="50px"  /></span>' 
          output +="<span id'"+ item.replyBoard_no+"' onclick='goDel("+ item.replyBoard_no +")'><img src='../../../resources/img/delete.png' width='50px'/> </span></li><hr/>"
          //output += '<div id="modifyBox"><div>댓글 수정</div><div><input type="text" id="replytext'+item.replyBoard_no +'" /><button type="button" id="replymodBtn" onclick="modiProc();">수정</button><button type="button" id="replyModClose" onclick="modiBoxClose();">	닫기</button>	</div>'
       });
       output += "</ul>";
       $("#replyBox").html(output);
    });
 }   
 
 //좋아요 
 
 function modiBoxClose(){
	 $("#modifyBox").hide();
 }
 function likeButton() {
	 let board_no = ${board.board_no};
		let member_id = "${loginMember.member_id}";
	console.log(member_id);
	if(member_id != ''){
		
		$.ajax({
			type : "post",
			dataType : "json", // 받을 데이터
			contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
			url : "/board/humor/like",// 서블릿 주소
			data : JSON.stringify({
				board_no : board_no,
				member_id : member_id
			}),
			success : function(data) {
				if(data.status == "on") {
					alert("추천완료");
					$("#likeButton").text("추천취소")
					$(".likeCnt").text(data.cnt);
					
				} else if (data.status == "off") {
					alert("추천취소");
					$("#likeButton").text("추천")
					$(".likeCnt").text(data.cnt);
					
				}
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
		
	}else if(member_id == ''){
		alert("로그인이 필요한 서비스입니다.")
	}
}

 function checkLike() {
	 let board_no = ${board.board_no};
		let member_id = "${loginMember.member_id}";
		
		$.ajax({
			type : "post",
			dataType : "json", // 받을 데이터
			//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
			url : "/board/humor/likeCheck",// 서블릿 주소
			data : {
				board_no : board_no,
				member_id : member_id
			},
			success : function(data) {
				if (data == 1) {
					$("#likeButton").text("추천취소")
				} else {
					
					$("#likeButton").text("추천")
				}
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
}
 
 $(function(){
	
	 callReplyList(); 
	 checkLike();
 });
</script>
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
#modifyBox{
		
		z-index: 999;
		display: none;
		padding: 15px;
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
							<h2>고객센터</h2>
							<span class="byline" id="rollNot"><a href="#">공지가 들어갈
									자리입니다.</a></span>
						</header>
						<!-- 검색창, 글쓰기 버튼 템플릿 -->
						
					</section>
			
			<div class="detail-wrap">
						<div class="detail-top">
							<div class="detail-top-title">
							
					<p>${board.board_title }</p>
					<p>
					<fmt:formatDate value="${board.board_writeDate }" type="both"
						pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</div>
					</div>
			
					<div class="detail-top-author">
								<p>${board.member_id }</p>
								<p class="view">
									조회수 <span>${board.board_viewCnt }</span>
								</p>
								<p class="like">
									추천수 <span class="likeCnt">${board.board_likeCnt }</span>
								</p>
								<!--  
								<p class="reply">
									댓글 <span>${board.board_replyCnt }</span>
								</p>
								-->
							</div>
				
						<div class="detail-content">${board.board_content }</div>
						<div class="recommend-btn">
						<button type="button" class="btn btn-danger" id="likeButton" onclick="likeButton();">추천</button>

<!-- if문 로그인한 회원과 작성자와 비교 -->
					<c:if test="${board.member_id == loginMember.member_id }">
							<button type="button" class="btn btn-danger"
								onclick="location.href='/board/humor/remove?no=${board.board_no}'">삭제하기</button>
							<!-- if문 로그인한 회원과 작성자와 비교 -->
							<button type="button" class="btn btn-danger"
								onclick="location.href='/board/humor/modi?no=${board.board_no}'">수정하기</button>
						</c:if>
							<button type="button" class="btn btn-primary"
						onclick="location.href='/board/humor/listAll?page=${param.page}'">리스트페이지로</button>
					


				</div>
							

						</div>
				<div class="detail-bottom-comment-write">
							<p>댓글 작성</p>
							<!-- 댓글 작성 Ajax -->
							<div class="form-group">
								<div id="replyBox"></div>
								작성자 : <input type="text" name="member_id" id="newReplyWriter" value="${loginMember.member_id}" />
								<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="replyBoard_content" name="replyBoard_content">
								<button type="button" class="btn btn-success" onclick="addReply();" >댓글 작성</button>
							</div>
						</div>
						
						
</div>

</div>

</div>
</div>




		
	

	<%@include file="../../cambak21Footer.jsp"%>
	
	
</body>
</html>