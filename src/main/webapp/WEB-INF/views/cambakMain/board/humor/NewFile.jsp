<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  거시기 -->
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
						<%@include file="../../cambak21Search&Write.jsp"%>
					</section>

					<!-- 컨텐츠 시작 -->
					<div class="detail-wrap">
						<div class="detail-top">
							<div class="detail-top-title">
								<p>${board.board_title }</p>
								<p>
									<fmt:formatDate value="${board.board_writeDate }"
										pattern="yyyy-MM-dd HH:mm:ss" type="DATE" />
								</p>
							</div>
							<div class="detail-top-author">
								<p>${board.member_id }</p>
								<p class="view">
									조회수 <span>${board.board_viewCnt }</span>
								</p>
								<p class="like">
									추천수 <span>${board.board_likeCnt }</span>
								</p>
								<p class="reply">
									댓글 <span>${board.replyCnt }</span>
								</p>
							</div>
						</div>
						<div class="detail-content">${board.board_content }</div>
						<div class="recommend-btn">
							<button type="button" class="btn btn-danger">추천</button>




							<!-- if문 로그인한 회원과 작성자와 비교 -->
							<button type="button" class="btn btn-danger"
								onclick="location.href='../cs/delete?no=${board.board_no}'">삭제하기</button>
							<!-- if문 로그인한 회원과 작성자와 비교 -->
							<button type="button" class="btn btn-danger"
								onclick="location.href='../cs/modi?no=${board.board_no}'">수정하기</button>



							

						</div>
						<div class="detail-bottom-comment-write">
							<p>댓글 작성</p>
							<!-- 댓글 작성 Ajax -->
							<div class="form-group">
								<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="replyBoard_content" name="replyBoard_content">
								<button type="button" class="btn btn-success" onclick="replyWrite();" >댓글 작성</button>
							</div>
						</div>
						<div class="detail-bottom">
							<div class="detail-bottom-comment-wrap">
								<ul class="detail-bottom-comment">
								</ul>
							</div>

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
				<div class="modal-body" id="modalText">
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