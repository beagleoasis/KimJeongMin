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
	$(document).ready(function() {
		// 말 줄임 ...
		textLimit();

		// 공지사항 롤링
		rolling();

// 		let boardUri = searchUriAddress();
		asideBarDraw(searchUriAddress());

		// 글 삭제 알림창 띄우기
		deleteOk();
	});
	
	// 글 삭제되면 리스트 페이지로 이동하면서, 삭제 알림창 띄우기
	function deleteOk() {
		
		if(${status == "deleteOk"}) {
			$("#myModal").modal();
		}
	}

	// 게시판 uri 접속 시 board/ 뒤에 오는 게시판이름 가져오는 기능
	function searchUriAddress() {
		var url = location.href; //url주소
		var params = url.slice(url.indexOf("board") + 6, url.length).split("/"); // board/ 뒤부터 "/"로 잘라서 배열에 넣기
		return params[0]; // board/OO/??/??  OO만 반환
	}

	// 전달받은 boardUri 변수로 사이드바 색깔 변경해주는 기능
	function asideBarDraw(boardUri) {
		$("#" + boardUri + "Aside").attr("class", "active");
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
							<h2>캠핑 후기 게시판</h2>
							<span class="byline" id="rollNot"><a href="#">공지가 들어갈
									자리입니다.</a></span>
						</header>
						<%@include file="../../cambak21Search&Write.jsp"%>
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
									</tr>
								</thead>
								<tbody>

									<c:forEach var="item" items="${boardList }">
										<tr>
											<td>${item.board_no }</td>
											<td><a href="../campingreview/detail?no=${item.board_no }"
												class="board-title-a">${item.board_title }</a> <c:if
													test="${item.board_replyCnt > 0 }">
													(${item.board_replyCnt })
												</c:if></td>
											<td>${item.member_id }</td>
											<td><fmt:formatDate value="${item.board_writeDate }"
													pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
											<td>${item.board_viewCnt }</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<div class="pageBtn">
							<ul class="pagination">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
							</ul>
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