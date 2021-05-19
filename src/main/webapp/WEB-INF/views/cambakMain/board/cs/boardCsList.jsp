<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

th.board-title {
    width: 500px;
}
</style>

<script>
	$(document).ready(function() {
		// 말 줄임 ...
		textLimit(35);

		// 공지사항 롤링
		rolling();

		// 글 삭제 알림창 띄우기
		deleteOk();
		
		// 사이드바 현재 카테고리 표시
		asideBarDraw(searchUriAddress());
	});
	
	// 글 삭제되면 리스트 페이지로 이동하면서, 삭제 알림창 띄우기
	function deleteOk() {
		
		if(${status == "deleteOk"}) {
			$("#modalText").text("게시글이 삭제 되었습니다");
			$("#myModal").modal();
		}
	}

	function checkMember() {
		if(${loginMember.member_id == null}) {
			$("#modalText").text("로그인 후에 이용해 주세요");
			$(".modal-footer").html('<a href="/user/login"><button type="button" class="btn btn-default">로그인하러 가기</button></a>');
			$("#myModal").modal();
			return false;
		}
		
		return true;
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
					<section>
						<header>
							<h2>고객센터</h2>
							<span class="byline" id="rollNot"><a
								href="../notice/listCri">공지가 들어갈 자리입니다.</a></span>
						</header>
						<form action="/board/cs/search" method="get">
							<div class="research">
								<!-- <form> -->
								<select class="searchType" name="searchType">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="write">작성자</option>
									<option value="title+content">제목+내용</option>
								</select> <input type="text" class="form-control" size="50"
									placeholder="Search" onkeypress="enterKey();" name="searchWord"
									id="searchWord">
								<button type="submit" class="btn btn-danger search">Search</button>
							</div>
						</form>
					</section>
					<div>
						<div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th class="board-title">제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
										<th>추천수</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="item" items="${boardList }">
										<c:if test="${item.board_isDelete != 'Y' }">
											<tr>
												<td>${item.board_no }</td>
												<td><c:choose>
														<c:when test="${param.searchType == null }">
															<a
																href="/board/cs/detail?no=${item.board_no }&page=${param.page}"
																class="board-title-a">${item.board_title }</a>
														</c:when>
														<c:otherwise>
															<c:if test="${param.page == null }">
																<a
																	href="/board/cs/detail?no=${item.board_no }&page=1&searchType=${param.searchType }&searchWord=${param.searchWord}"
																	class="board-title-a">${item.board_title }</a>
															</c:if>
															<c:if test="${param.page != null }">
																<a
																	href="/board/cs/detail?no=${item.board_no }&page=${param.page }&searchType=${param.searchType }&searchWord=${param.searchWord}"
																	class="board-title-a">${item.board_title }</a>
															</c:if>
														</c:otherwise>
													</c:choose> <!-- 댓글 수 --> <c:if test="${item.replyCnt > 0 }">
													(${item.replyCnt })
												</c:if></td>

												<td>${item.member_id }</td>
												<td class="writeDate"><fmt:formatDate
														value="${item.board_writeDate }"
														pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
												<td>${item.board_viewCnt }</td>
												<td>${item.board_likeCnt }</td>
											</tr>
										</c:if>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<div class="pageBtn">
							<ul class="pagination">
								<c:choose>
									<c:when test="${param.searchType == null }">
										<!-- 이전 버튼 -->
										<c:if test="${pp.prev }">
											<li><a href="/board/cs/list?page=${param.page - 1 }">이전</a></li>
										</c:if>

										<!-- 페이징 버튼 -->
										<c:forEach begin="${pp.startPage }" end="${pp.endPage }"
											var="pageNo">
											<li><a href="/board/cs/list?page=${pageNo }">${pageNo }</a></li>
										</c:forEach>

										<!-- 다음 버튼 -->
										<c:if test="${pp.next }">
											<li><a href="/board/cs/list?page=${param.page + 1 }">다음</a></li>
										</c:if>
									</c:when>

									<c:otherwise>
										<!-- 이전 버튼 -->
										<c:if test="${searchPP.prev }">
											<li><a
												href="/board/cs/search?page=${param.page - 1 }&searchType=${param.searchType}&searchWord=${param.searchWord}">이전</a></li>
										</c:if>

										<!-- 페이징 버튼 -->
										<c:forEach begin="${searchPP.startPage }"
											end="${searchPP.endPage }" var="pageNo">
											<li><a
												href="/board/cs/search?page=${pageNo }&searchType=${param.searchType}&searchWord=${param.searchWord}">${pageNo }</a></li>
										</c:forEach>

										<!-- 다음 버튼 -->
										<c:if test="${searchPP.next }">
											<c:if test="${param.page == null }">
												<li><a
													href="/board/cs/search?page=${param.page + 2 }&searchType=${param.searchType}&searchWord=${param.searchWord}">다음</a></li>
											</c:if>
											<c:if test="${param.page != null }">
												<li><a
													href="/board/cs/search?page=${param.page + 1 }&searchType=${param.searchType}&searchWord=${param.searchWord}">다음</a></li>
											</c:if>
										</c:if>
									</c:otherwise>
								</c:choose>

							</ul>

						</div>


						<div class="writeBtn">
							<c:choose>
								<c:when test="${param.searchType == null }">
									<a
										href="/board/cs/write?page=${param.page}"
										onclick="return checkMember();">
										<button class="btn btn-danger write">글쓰기</button>
									</a>
								</c:when>
								<c:otherwise>
									<c:if test="${param.page == null }">
										<a
											href="/board/cs/write?page=1&searchType=${param.searchType }&searchWord=${param.searchWord}"
											onclick="return checkMember();">
											<button class="btn btn-danger write">글쓰기</button>
										</a>
									</c:if>
									<c:if test="${param.page != null }">
										<a
											href="/board/cs/write?page=${param.page }&searchType=${param.searchType }&searchWord=${param.searchWord}"
											onclick="return checkMember();">
											<button class="btn btn-danger write">글쓰기</button>
										</a>
									</c:if>
								</c:otherwise>
							</c:choose>
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