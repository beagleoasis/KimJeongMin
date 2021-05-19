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
<script src="/resources/cambak21/js/cambakBoard.js"></script>
<style>
	@import url(/resources/cambak21/css/SHWtamplet.css);

	.viewPageLinkReply {
		color : #ff2f3b;
		font-weight: bold;
		font-size: 13px;
	}

</style>

<script>
	$(document).ready(function() {
		// 말 줄임
		textLimit();
		
		// 공지사항 롤링
		rolling();
		
		// 사이드바 현재 카테고리 표시
		asideBarDraw(searchUriAddress());
		
		// 글 삭제 알림창
		deleteOk();
		
		pageNumWrite();
		
	});
	
	function pageNumWrite() {
		var param = '${param.page }';
		$("#pageNum" + param).attr("class", "active");
	}
	
	// 글 삭제(리스트 페이지로 이동)
	function deleteOk() {
		
		if(${status == "deleteOk"}) {
			$("#myModal").modal();
		}
	}
	// uri 게시판이름 가져오는 기능
	function searchUriAddress() {
		var url = location.href; //url주소
		var params = url.slice(url.indexOf("board") + 6, url.length).split("/"); // board/ 뒤부터 "/"로 잘라서 배열에 넣기
		return params[0]; // board/??/
	}
// 	// 전달받은 boardUri 변수로 사이드바 색깔 변경해주는 기능
// 	function asideBarDraw(boardUri) {
// 		$("#QnAAside" + boardUri + "Aside").attr("class", "active");
// 	}
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
					<section>
						<header>
							<h2>Q&A 게시판</h2>
							<span class="byline" id="rollNot"><a
								href="../notice/listCri">공지사항</a></span>
						</header>
					</section>
					<div>
						<div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="text-align: center;">번호</th>
										<th class="board-title" style="width: 400px; text-align: center;">제목</th>
										<th style="text-align: center;">작성자</th>
										<th style="text-align: center;">작성일</th>
										<th style="text-align: center;">추천수</th>
										<th style="text-align: center;">조회수</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="item" items="${boardList }">
										<tr>
											<td style="text-align: center;">${item.board_no }</td>
											<td style="text-align: center;">
												<c:choose>
													<c:when test="${param.searchType == null }">
														<a href="/board/qa/detail?no=${item.board_no }&page=${param.page}" class="board-title-a">${item.board_title }</a>
													</c:when>
													<c:otherwise>
														<c:if test="${param.page == null }">
															<a href="/board/qa/detail?no=${item.board_no }&page=1&searchType=${param.searchType }&searchWord=${param.searchWord}" class="board-title-a">${item.board_title }</a>
														</c:if>
														<c:if test="${param.page != null }">
															<a href="/board/qa/detail?no=${item.board_no }&page=${param.page }&searchType=${param.searchType }&searchWord=${param.searchWord}" class="board-title-a">${item.board_title }</a>
														</c:if>
													</c:otherwise>
												</c:choose>
<%-- 												<c:if test="${item.board_replyCnt != 0 }"> --%>
<%-- 													<a href="/board/qa/detail?no=${item.board_no }&page=${param.page}&replyFocus=true" class="viewPageLinkReply">[${item.board_replyCnt }]</a> --%>
<%-- 												</c:if> --%>
<%-- 												<c:if test="${item.board_replyCnt == 0 }"> --%>
<%-- 													<a href="/board/qa/detail?no=${item.board_no }&page=${param.page}" class="board-title-a">${item.board_title }</a> --%>
<%-- 												</c:if> --%>
												
												<!-- 댓글 수 -->
												<c:if test="${item.board_replyCnt > 0 }">
													(${item.board_replyCnt })
												</c:if>
											</td>
											<td style="text-align: center;">${item.member_id }</td>
											<td style="text-align: center;"><fmt:formatDate value="${item.board_writeDate }"
													pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
											<td style="text-align: center;">${item.board_likeCnt }</td>
											<td style="text-align: center;">${item.board_viewCnt }</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<div class="text-center">
							<div style="display: inline-block;">
								<form action="/board/qa/search" method="GET">
									<select name="searchType"
										style="font-size: 15px; height: 30px;">
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">작성자</option>
									</select> <input type="text" name="searchWord" placeholder="검색어 입력" />
									<input type="submit" id="goSearch"
										class="btn btn-danger search" value="검색" />
								</form>
							</div>
							<c:if test="${loginMember.member_id != null}">
								<c:if test="${param.page != null}">
									<button class="btn btn-danger write" onclick="location.href='/board/qa/write?page=${param.page}'">글쓰기</button>
								</c:if>
								<c:if test="${param.page == null}">
									<button class="btn btn-danger write" onclick="location.href='/board/qa/write?page=1'">글쓰기</button>
								</c:if>
							</c:if>
							
							<div class="pageBtn">
							<ul class="pagination">
								<c:choose>
									<c:when test="${param.searchWord == null }">
										<!-- 이전 버튼 -->
										<c:if test="${pagingParam.prev }">
											<li><a href="/board/qa/list?page=${param.page - 1 }">이전</a></li>
										</c:if>

										<!-- 페이징 버튼 -->
										<c:forEach begin="${pagingParam.startPage }" end="${pagingParam.endPage }" var="pageNo">
											<li id="pageNum${pageNo }"><a href="/board/qa/list?page=${pageNo }">${pageNo }</a></li>
										</c:forEach>

										<!-- 다음 버튼 -->
										<c:if test="${pagingParam.next }">
											<li><a href="/board/qa/list?page=${param.page + 1 }">다음</a></li>
										</c:if>
									</c:when>

									<c:otherwise>
										<!-- 이전 버튼 -->
										<c:if test="${pagingParam.prev }">
											<li><a href="/board/qa/search?page=${param.page - 1 }&searchType=${search.searchType}&searchWord=${search.searchWord}">이전</a></li>
										</c:if>

										<!-- 페이징 버튼 -->
										<c:forEach begin="${pagingParam.startPage }" end="${pagingParam.endPage }" var="pageNo">
											<li id="pageNum${pageNo }"><a href="/board/qa/search?page=${pageNo }&searchType=${search.searchType}&searchWord=${search.searchWord}">${pageNo }</a></li>
										</c:forEach>

										<!-- 다음 버튼 -->
										<c:if test="${pagingParam.next }">
											<c:if test="${param.page == null }">
												<li><a href="/board/qa/search?page=${param.page + 2 }&searchType=${search.searchType}&searchWord=${search.searchWord}">다음</a></li>
											</c:if>
											<c:if test="${param.page != null }">
												<li><a href="/board/qa/search?page=${param.page + 1 }&searchType=${search.searchType}&searchWord=${search.searchWord}">다음</a></li>
											</c:if>
										</c:if>
									</c:otherwise>
								</c:choose>

							</ul>

						</div>
							
<!-- 							<div class="pageBtn"> -->
<!-- 								<ul class="pagination"> -->
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${param.searchWord == null }"> --%>
<%-- 											<c:if test="${pagingParam.prev }"> --%>
<!-- 												<li class="page-item"><a class="page-link" -->
<%-- 													href="?page=${param.page - 1}">prev</a> --%>
<!-- 												</li> -->
<%-- 											</c:if> --%>
<%-- 											<c:forEach begin="${pagingParam.startPage }" --%>
<%-- 												end="${pagingParam.endPage }" var="pageNo"> --%>
<!-- 												<li class="page-item"><a class="page-link" -->
<%-- 													href="?page=${pageNo }">${pageNo }</a></li> --%>
<%-- 											</c:forEach> --%>
<%-- 											<c:if test="${pagingParam.next}"> --%>
<!-- 												<li class="page-item"><a class="page-link" -->
<%-- 													href="?page=${param.page + 1}">next</a></li> --%>
<%-- 											</c:if> --%>
<%-- 										</c:when> --%>
<%-- 										<c:when test="${param.searchWord != null }"> --%>
<%-- 											<c:if test="${pagingParam.prev }"> --%>
<!-- 												<li class="page-item"> -->
<%-- 													<a class="page-link" href="?page=${param.page - 1}&searchType=${param.searchType}&searchWord=${param.searchWord}">prev</a> --%>
<!-- 												</li> -->
<%-- 											</c:if> --%>
<%-- 											<c:forEach begin="${pagingParam.startPage }" --%>
<%-- 												end="${pagingParam.endPage }" var="pageNo"> --%>
<!-- 												<li class="page-item"> -->
<%-- 													<a href="/board/qa/search?page=${pageNo }&searchType=${param.searchType}&searchWord=${param.searchWord}">${pageNo }</a> --%>
<!-- 												</li> -->
<%-- 											</c:forEach> --%>
<%-- 											<c:if test="${pagingParam.next}"> --%>
<!-- 												<li class="page-item"><a class="page-link" -->
<%-- 													href="?page=${param.page + 1}">next</a></li> --%>
<%-- 											</c:if> --%>
<%-- 										</c:when> --%>
<%-- 									</c:choose> --%>
<!-- 								</ul> -->
<!-- 							</div> -->
							
						</div>
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
				<div class="modal-body">
					<p>글이 삭제 되었습니다</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../../cambak21Footer.jsp"%>

</body>

</html>