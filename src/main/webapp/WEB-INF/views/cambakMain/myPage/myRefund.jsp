<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>Cambark's</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	
	<link rel="icon" type="image/png" href="../../resources/cambak21/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="../../resources/cambak21/css/loginUtil.css">
	<link rel="stylesheet" type="text/css" href="../../resources/cambak21/css/login.css">
	
	
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../../resources/cambak21/js/skel.min.js"></script>
	<script src="../../resources/cambak21/js/skel-panels.min.js"></script>
	<script src="../../resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	
	<script src="/resources/cambak21/js/myPage.js"></script> <!-- 마이페이지 공동 js파일 -->
	<script>
	function loginOK(){
		if(document.getElementById('chkCookie').checked){
			alert("자동 로그인 기능은 공공장소에서는 사용하지 마세요!");
			return true;
		}
	}
	
	$(document).ready(function() {
		let item = "${refundList}";
		console.log(item.length);
		
		// 글씨 색깔 효과
		let myPageUri = myMallAddress();
		myPageAsideBarDraw(myPageUri);
		$("body,html").animate({scrollTop: 300}, 1);
	});
	</script>
	<style>
		@import url(../../resources/cambak21/css/SHWtamplet.css);
	
	
	.\34 u {
    width: 100%;
	}


	/* 효원이 CSS */ 

	.profile {
    box-sizing: border-box;
    width: 200px;
    text-align: center;
    border: 1px solid #F0F2F0;
    margin-bottom: 120px 50px 0px 0px;
        
	}

	.profileSize {
    background-color: #F0F2F0;
    padding: 20px 0px;
	}

	.userProfileImg {
	    width: 64px;
	    height: 64px;
	    border-radius: 70%;
	    overflow: hidden;	
	}

.profileEmail {
    font-size: 13px;
}

.nav-stacked>li{
	margin-top: -10px;
}

.nav>li>a {
    position: relative;
    display: block;
    padding: 5px 15px;
}

#category-title{

    text-align-last: center;
    
    }

.panel-success {
    margin-top: 25px;
    border-color: #d6e9c6;
}

.profileMenu1{
margin-top: 10px;
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
					<section>
						<header>
							<h2>내 반품/교환</h2>
							<span class="byline" id="rollNot"><a
								href="/board/notice/listCri">공지사항 상세페이지</a></span>
						</header>
						<!-- 요 안에 작성하시오 Main -->
						<div>
							<div>

								<!-- 게시물 리스트 출력 부분 -->
								<div>
								<c:choose>
									
									<c:when test="${refundList != null }">
								<c:forEach var="item" items="${refundList }">
									
										
									
									<table class="table">
									
										<thead>
											<tr>
												<th>취소접수일</th>
												<th>주문일</th>
												<th>사유</th>
												<th class="board-title">주문번호</th>
												<th>취소현황</th>
												
											</tr>
											
										</thead>
										<tbody>
											
												<tr style="border: 2px">
													<td ><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value ="${item.refundnExchange_date }"/></td>
													<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value ="${item.payment_date }"/></td>
													<td>${item.refundnExchange_reason }</td>
													<td>${item.payment_serialNo }</td>
													<c:if test="${item.refundnExchange_isChecked == 'Y' }">
													<td>처리완료</td>
													</c:if>
													<c:if test="${item.refundnExchange_isChecked == 'N' }">
													<td>처리중</td>
													</c:if>
													
												
												</tr>
												<tr>
													<td colspan="3" style="text-align:center">
														제품명
													</td>
													<td colspan="2" style="text-align:center">
														금액 합계
													</td>
												</tr>
												<tr>
													<td colspan="3" style="text-align:center">
														${item.product_name }
													</td>
													<td colspan="2" style="text-align:center">
														<fmt:formatNumber value="${item.buyProduct_totPrice}" pattern="#,###"/><span>원</span>
													</td>
												</tr>
										
										</tbody>
									</table>
									</c:forEach>
									</c:when>
									<c:when test="${refundList == null }">
											환불, 교환 신청한 상품이 없습니다.
									</c:when>
										
										</c:choose>
										
								</div>
							</div>
							
							<!-- 페이징 -->
						<div class="myPagePagingBtn" style="text-align: center">
							<ul class="pagination">
								<!-- 이전 버튼 -->
								<c:if test="${pp.prev }">
									<li><a href="/myMall/myRefund?page=${param.page - 1 }">이전</a></li>
								</c:if>

								<!-- 페이징 버튼 -->
								<c:forEach begin="${pp.startPage }" end="${pp.endPage }"
									var="pageNo">
									<li><a href="/myMall/myRefund?page=${pageNo }">${pageNo }</a></li>
								</c:forEach>

								<!-- 다음 버튼 -->
								<c:if test="${pp.next }">
									<li><a href="/myMall/myRefund?page=${param.page + 1 }">다음</a></li>
								</c:if>
							</ul>
						</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>
</html>