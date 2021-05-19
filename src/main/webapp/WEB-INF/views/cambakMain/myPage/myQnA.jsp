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
<script src="../../../resources/cambak21/js/SHWtamplet.js"></script>
<script src="../../../resources/cambak21/js/bbskJS.js"></script>

<script src="/resources/cambak21/js/myPage.js"></script> <!-- 마이페이지 공동 js파일 -->
<script>
	$(document).ready(function() {
		textLimit(25);
		
		// 글씨 색깔 효과
    	let myPageUri = myMallAddress();
        myPageAsideBarDraw(myPageUri);
        $("body,html").animate({scrollTop: 300}, 1);
	});
	
	function showQa(no) {
		let prodQA_no = "#" + no;
		
		console.log(no);
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/myMall/answer/" + no, // 서블릿 주소
			success : function(data) {
				answerOuput(data);
				console.log(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 답변창 열기
	function answerOuput(data) {
		let output = "<tr id='ans"+data.prodQA_ref+"'>";
		output += "<td colspan='3' class='answer-content'>";
		output += "<div class='answer-comment-wrap'><img src='../resources/cambak21/img/arrow.png' width='20px' style='margin:0 30px 0 20px'></div>";
		output += "<div class='answer-comment-wrap'><span>"+data.prodQA_content+ "</span><div>";
		output += "</td>"
		output += "<td>"+date_to_str(new Date(data.prodQA_date));+"</td>";
		output += '<td><a href="../mall/prodDetail/main?prodId='+data.product_id+'"><button type="button" class="btn btn-primary" id="qa-check">보러 가기</button></a></td>';
		output += "</tr>";

		let ref = "." + data.prodQA_ref;
		$(ref).after(output);
	
		let refId = "#" + data.prodQA_ref;
		$(refId).attr("onclick", "closeAns('"+data.prodQA_ref+"')");
		$(refId).text("답변 닫기");
	}
	
	// 답변창 닫기
	function closeAns(no) {
		
		let refId = "#" + no;
		let answer = "#ans" + no;
		
		$(refId).attr("onclick", "showQa('"+no+"')");
		$(refId).text("답변 보기");
		
		$(answer).attr("style", "display:none");
	}
	
	// 작성시간 format
	function date_to_str(format) {
		// 댓글 달린 날짜
		let year = format.getFullYear();
		
		// 월
		let month = format.getMonth() + 1;
		if (month < 10) {
			month = '0' + month;
		}
		
		// 일
		let date = format.getDate();
		if (date < 10) {
			date = '0' + date;
		}
		
		return year + "." + month + "." + date;
	};
</script>

<style type="text/css">
.myLikePageBtn:hover {
	cursor: pointer;
}

th.myPageThead {
	height: 40px;
}

#qa-check {
	padding: 0px 10px;
}

.answer-comment-wrap {
    display: inline-block;
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
<!-- 						<div class="myActivity"> -->
<!-- 							<p class="myPost"> -->
<!-- 								보유 포인트 : <a href="" class="myPostCnt">0 </a>Point -->
<!-- 							</p> -->
<!-- 							<p class="myPost"> -->
<!-- 								주문 목록 : <a href="" class="myPostCnt">0</a> 개 -->
<!-- 							</p> -->
<!-- 							<p class="myPost"> -->
<!-- 								취소 / 반품 : <a href="" class="myPostCnt">0</a> 개 -->
<!-- 							</p> -->
<!-- 							<p class="myPost"> -->
<!-- 								상품 문의 : <a href="" class="myPostCnt">0</a> 개 -->
<!-- 							</p> -->
<!-- 						</div> -->
						<!-- 위에 카테고리 -->
						<div class="small-category">
							<nav class="navbar navbar-default" id="bsk-nav">
								<div class="container-fluid" id="bsk-smallCat">
									<ul class="nav navbar-nav">
										<li class="catagory-name"><a class="mini-category"
											href="../myMall/myQnA?page=1">상품 문의</a></li>
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
											<th class="myPageThead">상품번호</th>
											<th class="myPageThead">상품명</th>
											<th class="myPageThead" style="width: 370px">문의 내용</th>
											<th class="myPageThead">작성일</th>
											<th class="myPageThead">답변</th>
										</tr>
									</thead>
									<tbody class="list-content">
										<c:forEach var="item" items="${QaList }">
											<tr class="myPageBoard ${item.prodQA_no}">
												<th class="myPageThead">${item.product_id }</th>
												<th class="myPageThead">${item.product_name }</th>
												<th class="myPageThead" style="width: 370px"><a
													class="board-title-a"
													href="../mall/prodDetail/main?prodId=${item.product_id }">${item.prodQA_content }</a></th>
												<th class="myPageThead"><fmt:formatDate
														value="${item.prodQA_date }" pattern="yyyy.MM.dd"
														type="DATE" /></th>
												<c:if test="${item.prodQA_completed == 'Y'}">
													<th class="myPageThead">
													<button type="button" class="btn btn-primary" style="padding:0px 10px" id="${item.prodQA_no}" onclick="showQa('${item.prodQA_no}')">답변
														보기
													</button>
													</th>
												</c:if>
												<c:if test="${item.prodQA_completed == 'N'}">
													<th class="myPageThead">답변 미완료</th>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<!-- 페이징 -->
						<div class="myPagePagingBtn">
							<ul class="pagination">
								<!-- 이전 버튼 -->
								<c:if test="${pp.prev }">
									<li><a href="/myMall/myQnA?page=${param.page - 1 }">이전</a></li>
								</c:if>

								<!-- 페이징 버튼 -->
								<c:forEach begin="${pp.startPage }" end="${pp.endPage }"
									var="pageNo">
									<li><a href="/myMall/myQnA?page=${pageNo }">${pageNo }</a></li>
								</c:forEach>

								<!-- 다음 버튼 -->
								<c:if test="${pp.next }">
									<li><a href="/myMall/myQnA?page=${param.page + 1 }">다음</a></li>
								</c:if>
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