<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>Cambark's</title>

<link rel="icon" type="image/x-icon"
	href="../../resources/cambak21/assets/favicon.ico" />

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet"
	href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet"
	href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet"
	href="../../../resources/cambak21/css/SHWtamplet.css" />
<link rel="stylesheet"
	href="../../../resources/cambak21/css/myPageAside.css" />
<link rel="stylesheet"
	href="../../../resources/cambak21/css/myPageTemplet.css" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>

<script src="/resources/cambak21/js/myPage.js"></script> <!-- 마이페이지 공동 js파일 -->

<script>
	$(document).ready(function() {
		// 탭 눌러서 들어갈시 기본으로 보여주는 리스트
		getList("all", 1);
		
		// 텍스트 말줄임...
		textLimit(20);
		
		// 글씨 색깔 효과
    	let myPageUri = searchMyPageUriAddress();
        myPageAsideBarDraw(myPageUri);
        $("body,html").animate({scrollTop: 300}, 1);
	})

	// 리스트 출력 페이지
	function getList(category, page) {
		$.ajax({
			type : "post",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/myPage/myLike/" + category + "/" + page, // 서블릿 주소
			success : function(data) {
				if (data != null) {
					contentTopCategory(category);
					listOutput(data); // 컨트롤러 단에서 받아온 데이터로 리스트 출력
					pagingBtn(data, category); // 컨트롤러 단에서 받아온 데이터로 페이징 버튼 동적 생성
				} else {
					// 좋아요 누른글이 없다면...
					let output = "<tr>";
					output += "<td colspan='6' style='text-align: center;'>좋아요 누른글이 존재하지 않습니다</td></tr>";
					$(".list-content").html(output);
					
// 					$("#modalText").text("좋아요 누른 글이 존재하지 않습니다");
// 					$("#myModal").modal();
				}
				contentTopCategory(category);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}

	// 페이징 버튼 출력
	function pagingBtn(data, category) {
		
		let output = "";
		for (let i = data.pp.startPage; i <= data.pp.endPage; i++) {
			// 매개변수로 category와 i(page)를 던져줌
			output += "<li onclick='getList("+"\"" + category +"\"" + ", "+i+");' class='myLikePageBtn'><a>"+i+"</a></li>";
		}
		
		$(".pagination").html(output);
	}

	// 좋아요 누른 게시글 출력
	function listOutput(data) {

		let output = "";
		
		$.each(data, function(index, item) {
			
			if(item.board_no != null && item.board_isDelete == "N") {
				output += "<tr>";
				output += "<td>" + item.board_no + "</td>";
				output += "<td>" + item.board_category + "</td>";
				
				if(item.board_category == 'CS') {
					output += "<td><a href='../board/cs/detail?no="+item.board_no+"' class='board-title-a'>" + item.board_title + "</a></td>";
				} else if(item.board_category == 'camping') {
					output += "<td><a href='../board/campingreview/detail?no="+item.board_no+"' class='board-title-a'>" + item.board_title + "</a></td>";
				} else if(item.board_category == 'humor') {
					output += "<td><a href='../cambakMain/board/humor/read?no="+item.board_no+"' class='board-title-a'>" + item.board_title + "</a></td>";
				} else if(item.board_category == 'qa') {
					output += "<td><a href='../board/qa/detail.bo?no="+item.board_no+"' class='board-title-a'>" + item.board_title + "</a></td>";
				} else if(item.board_category == 'notice') {
					output += "<td><a href='../board/notice/read?no="+item.board_no+"' class='board-title-a'>" + item.board_title + "</a></td>";
				} else if(item.board_category == 'Tip') {
					output += "<td><a href='../board/campingTip/view.bo?id=Tip&no="+item.board_no+"' class='board-title-a'>" + item.board_title + "</a></td>";
				}
				
				output += "<td>" + item.member_id + "</td>";
				output += "<td>" + new Date(item.board_writeDate).toLocaleDateString() + "</td>";
				output += "<td>" + new Date(item.likeBoard_date).toLocaleDateString() + "</td>";
				output += "</tr>";
			}
		})

		$(".list-content").html(output);
	}
	
	function contentTopCategory(board_category) {
		$("#allBar").attr("style", "");
		$("#QnABar").attr("style", "");
		$("#tipBar").attr("style", "");
		$("#noticeBar").attr("style", "");
		$("#csBar").attr("style", "");
		
		$("#" + board_category + "Bar").attr("style", "background-color:#D3D3D3");
		
	}
</script>

<style type="text/css">
	.myLikePageBtn:hover {
		cursor: pointer;
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
							<span class="bsk-owner">${loginMember.member_name }</span>
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
								작성한 게시글 : <a href="../myPage/myPost" class="myPostCnt">${cnt.allCnt.boardCnt }</a>개
							</p>
							<p class="myPost">
								작성한 댓글 : <a href="../myPage/myReply.mp" class="myPostCnt">${cnt.allCnt.replyCnt }</a>개
							</p>
							<p class="myPost">
								좋아요 누른 글 : <a href="../myPage/myLike" class="myPostCnt">${cnt.allCnt.likeCnt }</a>개
							</p>
<!-- 							<p class="myPost"> -->
<%-- 								나의 문의 : <a href="" class="myPostCnt">${cnt.allCnt.myQuestion }</a>개 --%>
<!-- 							</p> -->
						</div>
						<!-- 위에 카테고리 -->
						<div class="small-category">
							<nav class="navbar navbar-default" id="bsk-nav">
								<div class="container-fluid" id="bsk-smallCat">
									<ul class="nav navbar-nav">
										<li class="catagory-name" onclick="getList('all', 1);" id="allBar"><a
											class="mini-category">전체보기</a></li>
<!-- 										<li class="catagory-name" onclick="getList('camping', 1);"><a -->
<!-- 											class="mini-category">캠핑 후기</a></li> -->
<!-- 										<li class="catagory-name" onclick="getList('humor', 1);"><a -->
<!-- 											class="mini-category">유머</a></li> -->
										<li class="catagory-name" onclick="getList('QnA', 1);" id="QnABar"><a
											class="mini-category">Q&A</a></li>
<!-- 										<li class="catagory-name" onclick="getList('resell', 1);"><a -->
<!-- 											class="mini-category">중고거래</a></li> -->
										<li class="catagory-name" onclick="getList('tip', 1);" id="tipBar"><a
											class="mini-category">캠핑Tip</a></li>
										<li class="catagory-name" onclick="getList('notice', 1);" id="noticeBar"><a
											class="mini-category">공지사항</a></li>
										<li class="catagory-name" onclick="getList('cs', 1);" id="csBar"><a
											class="mini-category">고객센터</a></li>
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
											<th class="myPageThead" style="width: 370px">제목</th>
											<th class="myPageThead">작성자</th>
											<th class="myPageThead">작성일</th>
											<th class="myPageThead">좋아요 누른 날짜</th>
										</tr>
									</thead>
									<tbody class="list-content">
										<c:forEach var="list" items="${LikeBoardList }">
											<tr class="myPageBoard">
												<td>${list.board_no }</td>
												<td>${list.board_category }</td>
												<td>${list.board_title }</td>
												<td>${list.member_id }</td>
												<td><fmt:formatDate value="${list.board_writeDate }"
														pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
												<td><fmt:formatDate value="${list.likeBoard_date }"
														pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
						<!-- 페이징 -->
						<div class="myPagePagingBtn">
							<ul class="pagination">
								
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

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

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>