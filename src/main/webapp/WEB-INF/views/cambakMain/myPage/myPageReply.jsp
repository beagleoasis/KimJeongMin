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
<title>Cambark's</title>

<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/SHWtamplet.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageAside.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageTemplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/myPage.js"></script> <!-- 마이페이지 공동 js파일 -->

<script>
// let member_id = '${loginMember.member_id}'; // 페이지 로딩 시 로그인 아이디 가져오기  // 종진 생략 (중복)
let board_category;

$(document).ready(function() {
	
	MyReplyCategory(); // 내가 작성한 댓글 불러오기
    let myPageUri = searchMyPageUriAddress();
    myPageAsideBarDraw(myPageUri);
    $("body,html").animate({scrollTop: 300}, 1);
    
});

function contentTopCategory(board_category) {
	
	$("#totalBar").attr("class", "");
	$("#QABar").attr("class", "");
	$("#TipBar").attr("class", "");
	$("#noticeBar").attr("class", "");
	$("#CSBar").attr("class", "");
	
	$("#" + board_category + "Bar").attr("class", "topCategoryBar");
	
}

// 게시글, 댓글 길이가 20개를 넣을 시 21번째 글짜부터 ...으로로 변환
function textLimitBoard() {
	$(".replyPageContent").each(function() {
		var length = 20; //표시할 글자수 정하기

		$(this).each(function() {

			if ($(this).text().length >= length) {

				$(this).text($(this).text().substr(0, length) + '...')
				//지정할 글자수 이후 표시할 텍스트
			}
		});
	});
};

// 댓글 제목 글자수를 조절하는 함수
function textLimitReply() {
	$(".boardLine").each(function() {
		var length = 20; //표시할 글자수 정하기

		$(this).each(function() {

			if ($(this).text().length >= length) {

				$(this).text($(this).text().substr(0, length) + '...')
				//지정할 글자수 이후 표시할 텍스트
			}
		});
	});
};

// 로그인한 회원이 작성한 게시글, 댓글, 좋아요, 문의 개수 가져오기
function getTotalCount() {
	
	$.ajax({
		method: "POST",
		url: "/myPage/getMyCount",
		dataType: "json",
		data : {member_id : member_id},
		success : function(data) {
			let totalBoard = data.boardCnt;
			let totalReply = data.replyCnt;
			let totalLike = data.likeCnt;
			let totalQuestion = data.myQuestion;
			
			$("#totalBoard").text(totalBoard);
			$("#totalReply").text(totalReply);
			$("#totalLike").text(totalLike);
			$("#totalQuestion").text(totalQuestion);
			
		}, error : function(data) {
			
		}
		
	});
	
}


// 내가 작성한 댓글 불러오기
function MyReplyCategory(page, board_category) {

	if (page == null) {
		page = 1;
	}
	if (board_category == null) {
		board_category = 'total';
	}
	
	$.ajax({
		method: "POST",
		url: "/myPage/myReplyList",
		dataType: "json",
		data : {member_id : member_id, board_category : board_category, page : page},
		success : function(data) {
			
			let myReplyList = data.myReplyList;
			let paging = data.paging;
			
			$("#myPageBoardList").empty();
			
			if (data.myReplyList.length == 0) {
				
				let output = '<tr class="myPageBoard"><td colspan="10" style="padding-top: 185px; padding-bottom: 185px; text-align: center;">';
				output += '<p class="noReplyBar">작성한 댓글이 없습니다.</p></td></tr>';
				
				$("#replyPagingBtn").empty();
				$("#myPageBoardList").append(output);
				
			} else {
				
				for (let i = 0; i < myReplyList.length; i++) {
					
					let board_writeDate = myReplyList[i].board_writeDate;
					let replyBoard_writeDate = myReplyList[i].replyBoard_writeDate;
					let categorys = myReplyList[i].board_category;
					
					let output = '<tr class="myPageBoard">' + 
					'<td>' + myReplyList[i].board_no + '</td>' + 
					'<td>' + myReplyList[i].board_category + '</td>';
					
					if (categorys == "Tip") { // 캠핑팁
						output += '<td class="contentSize"><a class="replyPageContent" href="/board/campingTip/view.bo?id=Tip&no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					} else if (categorys == "notice") { // 공지사항
						output += '<td class="contentSize"><a class="replyPageContent" href="/board/notice/read?no=' + myReplyList[i].board_no + '&page=1">' + myReplyList[i].board_title + '</a></td>';
					} else if (categorys == "camping") { // 캠핑후기
						output += '<td class="contentSize"><a class="replyPageContent" href="/board/campingreview/detail?no=' + myReplyList[i].board_no + '&page=1">' + myReplyList[i].board_title + '</a></td>';
					} else if (categorys == "humor") { // 유머
						output += '<td class="contentSize"><a class="replyPageContent" href="/cambakMain/board/humor/read?no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					} else if (categorys == "QA") { // Q&A
						output += '<td class="contentSize"><a class="replyPageContent" href="/board/qa/detail.bo?no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					} else if (categorys == "Resell") { // 중고
						
					} else if (categorys == "CS") { // 고객센터
						output += '<td class="contentSize"><a class="replyPageContent" href="/board/cs/detail?no=' + myReplyList[i].board_no + '">' + myReplyList[i].board_title + '</a></td>';
					}
					
					output += '<td>' + getDateParam(board_writeDate) + '</td></tr>' + // 게시글 가져오기
					'<tr class="myPageBoard">' +
					'<td colspan="2" class="boardLine"><img src="/resources/cambak21/img/arrow.png" class="replyImgSize">작성한 댓글 :</td>' +
					'<td class="boardLine">' + myReplyList[i].replyBoard_content + '</td>' +
					'<td class="boardLine">' + getDateParam(replyBoard_writeDate) + '</td></tr>';
					
					$("#myPageBoardList").append(output);
				}
				
				// 페이징 부분 append
				
				$("#replyPagingBtn").empty();
				let pagingBtn = '<ul class="pagination">';
				
				if(paging.prev) {
					let prevPage = (Number(page) - 1);
					pagingBtn += '<li><a class="clickBtnHover" onclick="MyReplyCategory(' + prevPage + ",\'" + board_category +'\');">이전</a></li>';
				}
				
				for (let j = paging.startPage; j <= paging.endPage; j++) {
					pagingBtn += '<li id="paging' + j + '"><a class="clickBtnHover" onclick="MyReplyCategory(' + j + ",\'" + board_category +'\');">' + j + '</a></li>';
				}
				
				if (paging.next) {
					let nextPage = (Number(page) + 1);
					pagingBtn += '<li><a class="clickBtnHover" onclick="MyReplyCategory(' + nextPage + ",\'" + board_category +'\');">다음</a></li>';
				}
				
				pagingBtn += '</ul>';
				$("#replyPagingBtn").append(pagingBtn);
				getTotalCount(); // 내 총 개수 목록 새로고침
				textLimitBoard(); // 글 제목 글자수 20개 이상은 짤라주기
				textLimitReply(); // 댓글 내용 글자수 20개 이상은 짤라주기
				
				$("#paging" + page).attr("class", "active");
				
			}
			contentTopCategory(board_category);

			
		}, error : function(data) {
			
		}
		});
	
}


// 댓글 날짜, 시간 1자리 수면 0 붙여주기
function getDateParam(millisecond) {
	   let date = new Date(millisecond);
    let year = date.getFullYear();
    
    let month = (1 + date.getMonth());
    month = month >= 10 ? month : '0' + month;
    
    let day = date.getDate();
    day = day >= 10 ? day : '0' + day;
    
    let hour = date.getHours();
    hour = hour >= 10 ? hour : '0' + hour;
    
    let minute = date.getMinutes();
    minute = minute >= 10 ? minute : '0' + minute;
    
    return year + "-" + month  + "-" + day + " " + hour + ":" + minute;
}

</script>
<style>
.boardLine {
	font-weight: bold;
}

.replyImgSize {
	width: 16px;
	height: 16px;
	margin-right: 5px;
}

.clickBtnHover:hover {
	cursor: pointer;
}

.replyPageContent {
	color : #777;
}

.topCategoryBar {
	background-color: lightgrey;
    border-radius: 0%;
    text-decoration: underline;
    text-underline-position: under;
}

.contentSize {
	width: 330px;
}

.noReplyBar {
	font-weight: bold;
    font-size: 16px;
}


</style>
</head>
<body>
	<%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<%@include file="myPageAside.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<div class="welcome-wrap">
						<div class="welcome">
							<span class="bsk-owner">${loginMember.member_name } </span>
							<c:if test="${loginMember.grade_name == 'M'}">
								<img alt="" src="../../resources/cambak21/img/admin.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'A'}">
								<img alt="" src="../../resources/cambak21/img/gold.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'B'}">
								<img alt="" src="../../resources/cambak21/img/silver.png"
									class="gradeImg">
							</c:if>
							<c:if test="${loginMember.grade_name == 'C'}">
								<img alt="" src="../../resources/cambak21/img/bronze.png"
									class="gradeImg">
							</c:if>
						</div>
					</div>
					<div class="myActivity-wrap">
						<div class="myActivity">
							<p class="myPost">
								작성한 게시글 : <a href="/myPage/myPost" class="myPostCnt" id="totalBoard">0</a>개
							</p>
							<p class="myPost">
								작성한 댓글 : <a href="/myPage/myReply" class="myPostCnt" id="totalReply">0</a>개
							</p>
							<p class="myPost">
								좋아요 누른 글 : <a href="/myPage/myLike.mp" class="myPostCnt" id="totalLike">0</a>개
							</p>
						</div>
						<!-- 위에 카테고리 -->
						<div class="small-category">
							<nav class="navbar navbar-default" id="bsk-nav">
								<div class="container-fluid" id="bsk-smallCat">
									<ul class="nav navbar-nav">
										<li id="totalBar"><a class="clickBtnHover" onclick="MyReplyCategory(1, 'total')">전체보기</a></li>
										<li id="QABar"><a class="clickBtnHover" onclick="MyReplyCategory(1, 'QA')">Q&amp;A</a></li>
										<li id="TipBar"><a class="clickBtnHover" onclick="MyReplyCategory(1, 'Tip')">캠핑Tip</a></li>
										<li id="noticeBar"><a class="clickBtnHover" onclick="MyReplyCategory(1, 'notice')">공지사항</a></li>
										<li id="CSBar"><a class="clickBtnHover" onclick="MyReplyCategory(1, 'CS')">고객센터</a></li>
									</ul>
								</div>
							</nav>
						</div>
						<!-- 메인 컨텐츠 -->
						<div class="main-wrap">
							<div class="main-content">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="myPageThead">글번호</th>
											<th class="myPageThead">게시판</th>
											<th class="myPageThead">글제목</th>
											<th class="myPageThead">작성일</th>
										</tr>
									</thead>
									<tbody id="myPageBoardList">
									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<div class="myPagePagingBtn" id="replyPagingBtn"></div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>