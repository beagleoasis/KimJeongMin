<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script src="/resources/cambak21/js/skel-panels.min.js"></script>
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

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/resources/cambak21/js/cambakBoard.js"></script> 

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
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
</style>

<script>
	$(document).ready(function() {
		rolling();
		
		let boardUri = searchUriAddress();
	      asideBarDraw(boardUri);


	});
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
							<h2>유머게시판</h2>
							<span class="byline" id="rollNot"><a href="#">공지가 들어갈
									자리입니다.</a></span>
						</header>
						<div class="research">
							<!-- <form> -->
							<div class="input-group">
								<!-- 검색버튼 -->
								<form action="/board/humor/search" method="GET">
								<input type="text" name="searchWord" class="form-control" size="50"
									placeholder="Search" onkeypress="enterKey();">
								<div class="input-group-btn">
									<input class="btn btn-danger" type="submit" id="goSearch" value="검색" />
								
									<button class="btn btn-danger write">
								
										<a href="/board/humor/write">글쓰기</a>
									</button>
								</div>
								</form>
							</div>
							<!-- <div class="input-group-btn write">
		                        <button class="btn btn-danger write"><a href="SHW_board.html">글쓰기</a></button>
		                    </div> -->
							<!-- </form> -->
						</div>
					</section>
					<div>
						<div>
							<table class="table table-hover" style="width:120%;max-width:120%">
								<thead>
									<tr>

										<th class="board-title">제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>추천수</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="board" items="${boardList }">
										<c:choose>
											<c:when test="${board != null }">
												<tr>

													<td><a href = "/board/humor/read?no=${board.board_no }&page=${param.page}">${board.board_title }</a><span>[${board.board_replyCnt }]</span></td>
													<td>${board.member_id }</td>
													<td><span><fmt:formatDate
																pattern="yyyy-MM-dd HH:mm:ss"
																value="${board.board_writeDate }" /></span></td>
													<td>${board.board_likeCnt }</td>
													<td>${board.board_viewCnt }</td>
												</tr>
											</c:when>
										</c:choose>
									</c:forEach>


								</tbody>
							</table>
						</div>
						<div class="pageBtn">
							<ul class="pagination">
							<c:choose>
							<c:when
								test="${param.searchType == null && param.searchWord == null }">
							<c:if test="${pagingParam.prev }">
									<li class="page-item"><a class="page-link"
										href="listAll?page=${param.page -1}">prev</a></li>
								</c:if>
								<c:forEach begin="${pagingParam.startPage }"
									end="${pagingParam.endPage }" var="pageNo">
									<li class="page-item"><a class="page-link"
										href="listAll?page=${pageNo}">${pageNo }</a></li>
								</c:forEach>
							<c:if test="${pagingParam.next }">
									<li class="page-item"><a class="page-link"
										href="listAll?page=${param.page +1}">next</a></li>
								</c:if>
								</c:when>
								<c:otherwise>
								<c:if test="${pagingParam.prev }">
									<li class="page-item"><a class="page-link"
										href="search?page=${param.page -1}">prev</a></li>
								</c:if>
								<c:forEach begin="${pagingParam.startPage }"
									end="${pagingParam.endPage }" var="pageNo">
									<li class="page-item"><a class="page-link"
										href="search?page=${pageNo}&searchType=${param.searchType}&searchWord=${param.searchWord}">${pageNo }</a>
									</li>
								</c:forEach>

								<c:if test="${pagingParam.next }">
									<li class="page-item"><a class="page-link"
										href="search?page=${param.page +1}&searchType=${param.searchType}&searchWord=${param.searchWord}">next</a>
									</li>
								</c:if>
							</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<div>
						<!-- 
					<form action="/cambakMain/board/humor/search" method="GET">
						<select name="searchType">
							<option value="board_title">제목</option>
							<option value="board_content">내용</option>
							<option value="member_id">작성자</option>
						</select> <input type="text" name="searchWord" placeholder="검색어 입력.." /> 
					</form>
					 -->
				</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>

</body>

</html>