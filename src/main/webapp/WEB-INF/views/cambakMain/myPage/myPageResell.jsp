<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

function contentTopCategory(category) {
	
	$("#myWritingBar").attr("class", "");
	$("#myReplyBar").attr("class", "");
	$("#myLikeBar").attr("class", "");
	
	$("#" + category + "Bar").attr("class", "topCategoryBar");
	
}

// 카테고리를 위한 전역변수 선언
let category;
let member_id = "${loginMember.member_id}";

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
function showCambakMarketList(pageNum, category) {
	// 페이지 번호가 null이 아닌 경우, 1
	if(pageNum == null){
		pageNum =1;
	}
	
	// 보드 카테고리
	if(category == null){
		// 선택한 카테고리가 없을 때,
		category = "myWriting";
	} else { // 선택한 카테고리가 있을 때,
		category = category;
	}
	//console.log(category);

	
	
	
	// 게시판 리스트 출력 부분
	$.ajax({
	    type		: "get",
	    url 		: "/myPage/myPageResellList",
	    data		:  {
	    		'page' : pageNum,
	    		'member_id' : member_id,
	    		'category' : category
	    }, 
	    contentType : "application/json",
	    success 	: function(data) {
	    	console.log(data);
	    	console.log(category);
	    	let boardList = data.boardList;
	    	//console.log(boardList);
	    	let nullCheck = data.boardList.length;
	    	//let replyList = data.replyList;
	    	//console.log(replyList);
        	let pagingParam = data.pagingParam;
        	//console.log(pagingParam);
	    	let currentPage = pagingParam.cri.page;
	    	let output;
	    	// 날짜 출력 방식 변경을 위한 변수 설정
        	let showDate;
        	let showThisDate;
        	
        	// 리스트가 없는 경우
        	if(nullCheck == 0)
        	{
        		output = "<div style='text-align: center;'>게시물이 존재하지 않습니다.</div>";
        	}
        	else
        	{
        	
        	// 카테고리가 myReply인 경우,
        	if(category == "myReply"){
        		output = '<table class="table table-hover"><thead><tr><th>댓글번호</th><th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr></thead><tbody>';
    	    	
            	//기본 게시글 출력 부분
    	    	$(boardList).each(function(index, item) {
           		 // 날짜 출력 포맷 변경 부분
           		 	showDate = new Date(item.replyResell_writeDate);
                    showThisDate = showDate.toLocaleString();
                    
                    // 게시글 내용 출력 부분
                    
                    output += '<tr id=' + item.resellBoard_no + ' onclick="location.href=\'/board/resell/detail?&no=' + item.resellBoard_no  + '\'"><td>' + item.replyResell_no + '</td><td>' + item.resellBoard_no + '</td><td>' + item.replyResell_content +'</td>';
    	    	
                    
                    output += '<td>' + item.member_id + '</td><td><span class="sendTime">' + showThisDate + '</span></td>';
                	output += '</tr>'; 
    	    	});
        		
        	}
        	// 그외의 카테고리인 경우
        	else{
        		
        	
        	output = '<table class="table table-hover"><thead><tr><th>글번호</th><th>제목</th><th>가격</th><th>작성자</th><th>작성일</th><th>좋아요</th></tr></thead><tbody>';
	    	
        	//기본 게시글 출력 부분
	    	$(boardList).each(function(index, item) {
       		 // 날짜 출력 포맷 변경 부분
       		 	showDate = new Date(item.resellBoard_postDate);
                showThisDate = showDate.toLocaleString();
                
                // 게시글 내용 출력 부분
                
                output += '<tr id=' + item.resellBoard_no + ' onclick="location.href=\'/board/resell/detail?&no=' + item.resellBoard_no  + '\'"><td>' + item.resellBoard_no + '</td><td>' + item.resellBoard_title +'</td><td class="board-title-a">' + item.resellBoard_price + '원</td>';
	    	
                
                output += '<td>' + item.member_id + '</td><td><span class="sendTime">' + showThisDate + '</span></td>';
            	output += '<td>' + item.resellBoard_likeCnt + '</td></tr>'; 
	    	}); // end of for each
        	}
	    	// 테이블 닫아주기
	    	output += '</tbody></table>';
	    	
        	}// end of else
        	
        	
	    	$("#myWritingList").html(output);
	    	
	    	// ------------페이징 처리 부분-------------------------
            let startPage;
            let endPage;
            let tempEndPage;
            let totalCount;
            let prev;
            let next;
            let pageOutput = '<div class="text-center"><ul class="pagination"><li class="page-item">';	
      	  		pageOutput += '<a class="page-link" onclick="showCambakMarketList(1,\'' + category + '\' );  return false;">처음페이지로</a></li>';
      	  
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

          	  pageOutput += '<li class="page-item"><a class="page-link" href="" onclick="showCambakMarketList(' + prev + ",\'" + category +'\'); return false;">prev</a></li>';
          	  
            });
            //console.log(startPage);
            //console.log(endPage);

            for(var num = startPage; num <=endPage; num++){
          	  pageOutput += '<li class="page-item"><a class="page-link" href="" onclick="showCambakMarketList(' + num + ",\'" + category +'\'); return false;">' + num + '</a></li>';
      	  }
            
            pageOutput += '<li class="page-item"><a class="page-link" href="" onclick="showCambakMarketList(' + next + ",\'" + category +'\'); return false;">next</a></li>';
            pageOutput += '<li class="page-item"><a class="page-link" onclick="showCambakMarketList(' + tempEndPage + ",\'" + category +'\');  return false;">마지막페이지로</a></li>';
          	  
            
            pageOutput += '</ul></div></div>';
            $("#myWritingListPage").html(pageOutput);
            console.log(category);
            contentTopCategory(category);
	    	
	    }// end of Success
	    , complete : function(data) {
		
	    	textLimit();
		}  
		});
	
}

	//상단 탭 카운트 가져오는 부분
	function getTotalCntMyPage(member_id) {
		$.ajax({
		    type		: "get",
		    url 		: "/myPage/myPageResellCnt",
		    data		:  {
		    		'member_id' : member_id
		    }, 
		    contentType : "application/json",
		    success 	: function(data) {
		    	console.log(data);
		    	$("#myLikeCnt").html(data.resellBoardLikeCnt);
		    	$("#myWriteCnt").html(data.resellBoardWriteCnt);
		    	$("#myReplyCnt").html(data.resellBoardReplyCnt);
		    	
		    	
		    }
	});
	}
    	
    	
    	
    $(function() {
    	// 내가 쓴 글 리스트 출력
    	showCambakMarketList();
    	
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
							<span class="bsk-owner">${loginMember.member_id } </span>
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
								작성한 게시글 : <a href="" id="myWriteCnt" class="myPostCnt" onclick="showCambakMarketList(1, 'myWriting'); return false;"></a>개
							</p>
							<p class="myPost">
								작성한 댓글 : <a href="" id="myReplyCnt" class="myPostCnt" onclick="showCambakMarketList(1, 'myReply'); return false;"></a>개
							</p>
							<p class="myPost">
								좋아요 누른 글 : <a href="" id="myLikeCnt" class="myPostCnt" onclick="showCambakMarketList(1, 'myLike'); return false;"></a>개
							</p>
						</div>
						<!-- 위에 카테고리 -->
						<div class="small-category">
							<nav class="navbar navbar-default" id="bsk-nav">
								<div class="container-fluid" id="bsk-smallCat">
									<ul class="nav navbar-nav">
										<li id="myWritingBar" class="catagory-name"><a href="#" onclick="showCambakMarketList(1, 'myWriting'); return false;">나의 게시글</a></li>
										<li id="myReplyBar" class="catagory-name"><a href="#" onclick="showCambakMarketList(1, 'myReply'); return false;">나의 댓글</a></li>
										<li id="myLikeBar" class="catagory-name"><a href="#" onclick="showCambakMarketList(1, 'myLike'); return false;">나의 좋아요글</a></li>
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