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

function contentTopCategory(board_category) {
	
	$("#allBar").attr("class", "");
	$("#campingBar").attr("class", "");
	$("#humorBar").attr("class", "");
	$("#QABar").attr("class", "");
	$("#ResellBar").attr("class", "");
	$("#TipBar").attr("class", "");
	$("#noticeBar").attr("class", "");
	$("#CSBar").attr("class", "");
	
	$("#" + board_category + "Bar").attr("class", "topCategoryBar");
	
}

// 카테고리를 위한 전역변수 선언
let board_category;
// let member_id = "${loginMember.member_id}"; // 생략 종진(중복)

// 게시글 제목 글자수를 조절하는 함수
function textLimit() {
	$(".board-title-a").each(function() {
		var length = 15; //표시할 글자수 정하기

		$(this).each(function() {

			if ($(this).text().length >= length) {

				$(this).text($(this).text().substr(0, length) + '  ...  ')
				//지정할 글자수 이후 표시할 텍스트
			}
		});
	});
};

// 전체 내가 작성한 글 목록을 보여준다.
function showWritingList(pageNum, board_category) {
	// 페이지 번호가 null이 아닌 경우, 1
	if(pageNum == null){
		pageNum =1;
	}
	
	// 보드 카테고리
	if(board_category == null){
		// 선택한 카테고리가 없을 때,
		board_category = "all";
	} else { // 선택한 카테고리가 있을 때,
		board_category = board_category;
	}
	console.log(board_category);
	
	// 게시판 리스트 출력 부분
	let output = '<table class="table table-hover"><thead><tr><th>글번호</th><th>카테고리</th><th>글제목</th><th>작성자</th><th>작성일</th><th>좋아요</th></tr></thead><tbody>';
    
	$.ajax({
	    type		: "get",
	    url 		: "/myPage/myPost.mp",
	    data		:  {
	    		'page' : pageNum,
	    		'member_id' : member_id,
	    		'board_category' : board_category
	    }, 
	    contentType : "application/json",
	    success 	: function(data) {
	    	console.log(data);
	    	let boardList = data.boardList;
        	let pagingParam = data.pagingParam;
        	console.log(pagingParam);
	    	let currentPage = pagingParam.cri.page;
	    	
	    	// 날짜 출력 방식 변경을 위한 변수 설정
        	let showDate;
        	let showThisDate;
	    	
	    	//기본 게시글 출력 부분
	    	$(boardList).each(function(index, item) {
       		 // 날짜 출력 포맷 변경 부분
       		 	showDate = new Date(item.board_writeDate);
                showThisDate = showDate.toLocaleString();
                
                // 게시글 내용 출력 부분
               if(item.board_category == "CS"){
            	   console.log(item.board_category);
            	   output += '<tr id=' + item.board_no + ' onclick="location.href=\'/board/cs/detail?member_id=' + item.member_id + '&no=' + item.board_no  + '\'"><td>' + item.board_no + '</td><td>' + item.board_category +'</td><td class="board-title-a">' + item.board_title; + '</td>';
               } else if(item.board_category == "humor"){
            	   output += '<tr id=' + item.board_no + ' onclick="location.href=\'/cambakMain/board/humor/read?member_id=' + item.member_id + '&no=' + item.board_no  + '\'"><td>' + item.board_no + '</td><td>' + item.board_category +'</td><td class="board-title-a">' + item.board_title; + '</td>'; 
               } else if(item.board_category == "QA"){
            	   output += '<tr id=' + item.board_no + ' onclick="location.href=\'/board/qa/detail?id=' + item.member_id + '&no=' + item.board_no  + '\'"><td>' + item.board_no + '</td><td>' + item.board_category +'</td><td class="board-title-a">' + item.board_title; + '</td>';
               } else if(item.board_category == "camping"){
            	   output += '<tr id=' + item.board_no + ' onclick="location.href=\'/board/campingreview/detail?member_id=' + item.member_id + '&no=' + item.board_no  + '\'"><td>' + item.board_no + '</td><td>' + item.board_category +'</td><td class="board-title-a">' + item.board_title; + '</td>';
               } else if(item.board_category == "Resell"){
            	   output += '<tr id=' + item.board_no + ' onclick="location.href=\'/board/resell/detail?member_id=' + item.member_id + '&no=' + item.board_no  + '\'"><td>' + item.board_no + '</td><td>' + item.board_category +'</td><td class="board-title-a">' + item.board_title; + '</td>';
               } else if(item.board_category == "Tip"){
            	   output += '<tr id=' + item.board_no + ' onclick="location.href=\'/board/campingTip/view?id=Tip&no=' + item.board_no  + '\'"><td>' + item.board_no + '</td><td>' + item.board_category +'</td><td class="board-title-a">' + item.board_title; + '</td>';
               } else if(item.board_category == "notice"){
            	   output += '<tr id=' + item.board_no + ' onclick="location.href=\'/board/notice//read?member_id=' + item.member_id + '&no=' + item.board_no  + '\'"><td>' + item.board_no + '</td><td>' + item.board_category +'</td><td class="board-title-a">' + item.board_title; + '</td>';
               } 
               else{
            	   console.log(item.board_category);
            	   output += '<tr id=' + item.board_no + '><td>' + item.board_no + '</td><td>' + item.board_category +'</td><td class="board-title-a">' + item.board_title; + '</td>';
               }
               output += '<td>' + item.member_id + '</td><td><span class="sendTime">' + showThisDate + '</span></td>';
           	   output += '<td>' + item.board_likeCnt + '</td></tr>'; 

                
       	  });
	    	// 테이블 닫아주기
	    	output += '</tbody></table>';
	    	
	    	$("#myWritingList").html(output);
	    	
	    	
	    	// ------------페이징 처리 부분-------------------------
            let startPage;
            let endPage;
            let tempEndPage;
            let totalCount;
            let prev;
            let next;
            let pageOutput = '<div class="text-center"><ul class="pagination"><li class="page-item">';	
      	  		pageOutput += '<a class="page-link" onclick="showWritingList(1,\'' + board_category + '\' );  return false;">처음페이지로</a></li>';
      	  
            $(pagingParam).each(function(index, item) {
          	  startPage = item.startPage;
          	  endPage = item.endPage;
          	  tempEndPage = item.tempEndPage;
          	  totalCount = item.totalCount;
          	  
          	  if(pageNum > 1){
          		  prev = pageNum - 1;
          	  } else if(pageNum = 1){
          		  prev = 1;
          	  }
          	  if(pageNum < tempEndPage){
          		  next = pageNum + 1; 
          	  } 
          	  else if (pageNum = tempEndPage){
          		  next = tempEndPage;
          	  }

          	  pageOutput += '<li class="page-item"><a class="page-link" href="" onclick="showWritingList(' + prev + ",\'" + board_category +'\'); return false;">이전 페이지</a></li>';
          	  
            });
            //console.log(startPage);
            //console.log(endPage);

            for(var num = startPage; num <=endPage; num++){
          	  pageOutput += '<li id="page' + num + '" class="page-item"><a class="page-link" href="" onclick="showWritingList(' + num + ",\'" + board_category +'\'); return false;">' + num + '</a></li>';
      	  }
            
            pageOutput += '<li class="page-item"><a class="page-link" href="" onclick="showWritingList(' + next + ",\'" + board_category +'\'); return false;">다음 페이지</a></li>';
            pageOutput += '<li class="page-item"><a class="page-link" onclick="showWritingList(' + tempEndPage + ",\'" + board_category +'\');  return false;">마지막페이지로</a></li>';
          	  
            
            pageOutput += '</ul></div></div>';
            $("#myWritingListPage").html(pageOutput);
            contentTopCategory(board_category);
	    	
	    }// end of Success
	    , complete : function(data) {

	    	textLimit();
	    	
	    	if(pageNum == null){
	    		pageNum = 1;
				$("#page" + pageNum).attr("class", "page-item active");
			}
			else {
				$("#page" + pageNum).attr("class", "page-item active");
				console.log(page);
			}
		}  
		});
	
}

	// 로그인한 회원이 작성한 게시글, 댓글, 좋아요, 문의 개수 가져오기
	function getTotalCntMyPage(member_id) {
		
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
    	
    $(function() {
    	// 내가 쓴 글 리스트 출력
    	showWritingList();
    	// 카운트 가져오기
    	getTotalCntMyPage(member_id);
    	
    	// 글씨 색깔 효과
    	let myPageUri = searchMyPageUriAddress();
        myPageAsideBarDraw(myPageUri);
        $("body,html").animate({scrollTop: 300}, 1);
	});


</script>
<style>

.topCategoryBar {
	background-color: lightgrey;
    border-radius: 0%;
    text-decoration: underline;
    text-underline-position: under;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
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
										<li id="allBar" class="bsk-focus catagory-name"><a href="#" onclick="showWritingList(); return false;">전체보기</a></li>
										<li id="QABar" class="catagory-name"><a href="#" onclick="showWritingList(1, 'QA'); return false;">Q&A</a></li>
										<li id="TipBar" class="catagory-name"><a href="#" onclick="showWritingList(1, 'Tip'); return false;">캠핑Tip</a></li>
										<li id="noticeBar" class="catagory-name"><a href="#" onclick="showWritingList(1, 'notice'); return false;">공지사항</a></li>
										<li id="CSBar" class="catagory-name"><a href="#" onclick="showWritingList(1, 'CS'); return false;">고객센터</a></li>
									</ul>
								</div>
							</nav>
						</div>
						<!-- 메인 컨텐츠 -->
						<div class="main-wrap">
							<div class="main-content">
								<div class="main-content" id="myWritingList"></div>
								
						<!-- 페이징 -->
								<div id="myWritingListPage"></div>
							</div>
						</div>
						
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>