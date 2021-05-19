<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<script type="text/javascript">
function refundnExchange(payment_no,payment_date) {
	let refundnExchange_reason = $('input[name="refundnExchange_reason"]:checked').val();
	let refundnExchange_status = $('select[name="refundnExchange_status"]').val();
	let member_id = "${loginMember.member_id}";
	
	$.ajax({
		type : "POST",
		dataType : "text", // 받을 데이터
		//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
		url : "/myMall/myOrder/insertRefund",// 서블릿 주소
		data : {payment_no : payment_no, refundnExchange_reason : refundnExchange_reason, member_id : member_id, refundnExchange_status : refundnExchange_status, payment_date:payment_date},
		success : function(result) {
			
			location.reload();
			alert("환불, 교환 신청이 완료되었습니다.")
		}, // 통신 성공시
		error : function(result) {
			
		}, // 통신 실패시
		complete : function(result) {
			console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			console.log(result);
//			if(result != null){
				
//			}
			
			
		} // 통신 완료시
	});		
	
}

// 상품후기 작성 시, 해당 주문 건에 대해 이미 작성한 후기글인지 확인하는 함수
function checkReview(buyProduct_no, payment_serialNo, product_id) {

	$.ajax({
		type : "get",
		dataType : "text", // 받을 데이터
		//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
		url : "/myMall/myOrder/checkReview",// 서블릿 주소
		data : {member_id : member_id, buyProduct_no : buyProduct_no},
		success : function(result) {

			console.log("result:" + result);

			if (result == 'noValue'){
				location.href='/mall/prodDetail/writingProdReviews?payment_serialNo='
						+payment_serialNo +'&prodId='+product_id +'&buyProduct_no='+buyProduct_no;
			}else{
				alert("이미 작성한 리뷰입니다.");
			}
		}, // 통신 성공시
		error : function(result) {
			
		}, // 통신 실패시
		complete : function(result) {
			console.log(result);
		} // 통신 완료시
	});		
}

function check_date(date, idNum) {
	
	dateArr = date.split("-");
	day = dateArr[2];
	day = day.split(' ');
	console.log(day);
	date =+ new Date(dateArr[0], dateArr[1]-1, day[0]);
	
	
	let today =+ new Date();
	
	let dayAgo = (today - date) / 86400000;
	
	console.log(dayAgo);
	
	if(dayAgo > 7){
		let output = '<div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button>';
		output += '<h2 class="modal-title">교환 환불 신청</h2></div><div class="modal-body">7일이 지난 상품은 교환 환불이 불가능 합니다.</div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div></div>';
		
		$("#modalChange"+idNum).html(output);
	}

}

function purchaseSubmit(payInfo_no, payment_date, payment_no) {
	console.log(payment_date);
	let member_id = "${loginMember.member_id}";
	
	$.ajax({
		type : "get",
		dataType : "text", // 받을 데이터
		//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
		url : "/myMall/myOrder/purchaseSubmit",// 서블릿 주소
		data : {payInfo_no : payInfo_no, payment_date : payment_date, member_id : member_id, payment_no:payment_no},
		success : function(result) {
			console.log(result);
			location.reload();
		}, // 통신 성공시
		error : function(result) {
			
		}, // 통신 실패시
		complete : function(result) {
			console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			console.log(result);
			
			
		} // 통신 완료시
	});
}




$(document).ready(function(){
	// 글씨 색깔 효과
	let myPageUri = myMallAddress();
	myPageAsideBarDraw(myPageUri);
	$("body,html").animate({scrollTop: 300}, 1);
});

</script>


<style type="text/css">
.emptySpace{
	margin:20px;
}

.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
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
							<h2>주문 목록</h2>
							<span class="byline" id="rollNot"><a href="/board/notice/listCri">공지사항 상세페이지</a></span>
						</header>
				
				
    <!-- 요 안에 작성하시오 Main -->
	<div>
		<div>
			<div>
				
				<div><form action="/myMall/searchOrder" method="post"><input type="text" name="searchWord" style="width:80%;" placeholder="주문한상품을 검색할 수 있어요"><input type="submit" class="btn btn-info" value="검색"></form></div>
			<!-- 	<div class="emptySpace"></div> -->
									<div class="btn-group">
								<!-- 	<div style="font-size:20px;font-weight: bold;">검색기간</div> -->
									<!-- <div class="emptySpace"></div>
										<button type="button" class="btn btn-default">1개월</button>
										<button type="button" class="btn btn-default">3개월</button>
										<button type="button" class="btn btn-default">6개월</button>
										<button type="button" class="btn btn-default">1년</button>
										<button type="button" class="btn btn-default">3년</button> -->
									</div>
									<div class="emptySpace"></div>
									<div id="output">
									
									<c:forEach var="order" items="${order }">
									
									
										<c:choose>
											<c:when test="${order.payment_isComit == '결제완료' and order.payment_isChecked eq 'N' }">
											<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">${order.payment_serialNo }</strong></td>
														
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
																
																<img
																	src= ${order.product_img1 }
																	width="100" height="100" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<span>주문일자 : ${order.payment_date }</span><br>
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.buyProduct_totPrice }" /><em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																<button type="button" id="check_date${order.payment_serialNo }" onclick="check_date('${order.payment_date}',${order.payment_serialNo } )" class="btn btn-info" data-toggle="modal" data-target="#myModal${order.payment_serialNo }">교환
																	반품 신청</button>

																	<button type="button" class="btn btn-info" data-toggle="modal" data-target="#purchase${order.payment_serialNo }">구매확정</button>


																

															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
												<!-- Modal 환불 모달 -->
												<div class="modal fade" id="myModal${order.payment_serialNo }" role="dialog">
													<div class="modal-dialog" id="modalChange${order.payment_serialNo }">

														<!-- Modal content-->
														
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h2 class="modal-title">교환 환불 신청</h2>
															</div>
															<div class="modal-body">
																<p>교환 환불 선택</p>
																<select name="refundnExchange_status">
																	<option value="교환요청">교환</option>
																	<option value="환불요청">환불</option>
																</select>
																<p>사유를 선택해 주세요</p>
																<input type="radio" value="단순변심" checked="checked" name="refundnExchange_reason">단순변심
																<input type="radio" value="배송문제" name="refundnExchange_reason">배송문제
																<input type="radio" value="상품문제" name="refundnExchange_reason">상품문제
																
															</div>
															<div class="modal-footer">
																<button type="submit" class="btn btn-default"
																	data-dismiss="modal" onclick="refundnExchange(${order.payment_no}, '${order.payment_date }');">교환, 환불신청</button>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>
														
													</div>
												</div>
												<!-- Modal 주문확정 모달 -->
												<div class="modal fade" id="purchase${order.payment_serialNo }" role="dialog">
													<div class="modal-dialog" id="purchase${order.payment_serialNo }">

														<!-- Modal content-->
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h2 class="modal-title">주문확정</h2>
															</div>
															<div class="modal-body">
																<p>주문확정시 같은 주문건에 대해 모두 주문확정이 됩니다 주문확정 하시겠습니까??</p>
																
															</div>
															<div class="modal-footer">
															<button type="button" class="btn btn-default"
																	data-dismiss="modal" onclick='purchaseSubmit(${order.payInfo_no },"${order.payment_date}", ${order.payment_no });'>주문확정</button>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>

													</div>
												</div>
											</div>
											</c:when>
											<c:when test="${order.payment_isChecked eq 'Y' and order.payment_isComit eq '결제완료'}">
											<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">${order.payment_serialNo }(주문확정)</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
															
																<img
																	src= ${order.product_img1 }
																	width="100" height="100" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<span>주문일자 : ${order.payment_date }</span><br>
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.buyProduct_totPrice }" /><em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																
																
																<button type="button" class="btn btn-info" onclick="checkReview(${order.buyProduct_no }, ${order.payment_serialNo }, ${order.product_id });">리뷰작성하기</button>
																
																

															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
												
											</div>
											</c:when>
											<c:when test="${order.payment_isComit == '주문취소' }">
												<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">주문 취소</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
																<img
																	src= ${order.product_img1 }
																	width="110" height="110" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<span>주문일자 : ${order.payment_date }</span><br>
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.buyProduct_totPrice }" /><em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																

															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
												
											</div>
											</c:when>
											<c:when test="${order.payment_isComit == '환불요청' or order.payment_isComit == '환불완료'}">
												<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">${order.payment_serialNo }(환불)</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
																<img
																	src= ${order.product_img1 }
																	width="110" height="110" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.buyProduct_totPrice }" /><em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																

															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
												
											</div>
											</c:when>
										
										<c:when test="${order.payment_isComit == '교환요청' or order.payment_isComit == '교환완료'}">
										<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left; margin: 10px;">

											<table style="margin-left: 10px">
												<thead>
													<tr>
														<td><span style="font-size: 25px; font: normal;font-weight: bold;">주문번호  </span><strong style="font-size: 25px;font-weight: bold; font: normal;color: gray">${order.payment_serialNo }(교환)</strong></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td>
															<div style="float: left; width: 120px; margin-top: 15px">
															
																<img
																	src= ${order.product_img1 }
																	width="110" height="110" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<span>주문일자 : ${order.payment_date }</span><br>
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.buyProduct_totPrice }" /><em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<div class="btn-group-vertical"
																style="float: right; margin-left: 60px; margin-bottom: 35px">
																<button type="button" class="btn btn-info" onclick="location.href='detail/${order.payment_serialNo }'">주문상세
																	보기</button>
																
																
															</div>
														</td>
													</tr>

												</tbody>
											</table>
											
											</div>
										</c:when>
										</c:choose>
									</c:forEach>
									</div>
								</div>	
								<div class="pageBtn">
							<ul class="pagination">
							<c:choose>
							<c:when
								test="${param.searchType == null && param.searchWord == null }">
							<c:if test="${pagingParam.prev }">
									<li class="page-item"><a class="page-link"
										href="myOrder?page=${param.page -1}">prev</a></li>
								</c:if>
								<c:forEach begin="${pagingParam.startPage }"
									end="${pagingParam.endPage }" var="pageNo">
									<li class="page-item"><a class="page-link"
										href="myOrder?page=${pageNo}">${pageNo }</a></li>
								</c:forEach>
							<c:if test="${pagingParam.next }">
									<li class="page-item"><a class="page-link"
										href="myOrder?page=${param.page +1}">next</a></li>
								</c:if>
								</c:when>
								<c:otherwise>
								<c:if test="${pagingParam.prev }">
									<li class="page-item"><a class="page-link"
										href="search?page=${param.page -1}&searchWord=${param.searchWord}">prev</a></li>
								</c:if>
								<c:forEach begin="${pagingParam.startPage }"
									end="${pagingParam.endPage }" var="pageNo">
									<li class="page-item"><a class="page-link"
										href="search?page=${pageNo}&searchWord=${param.searchWord}">${pageNo }</a>
									</li>
								</c:forEach>

								<c:if test="${pagingParam.next }">
									<li class="page-item"><a class="page-link"
										href="search?page=${param.page +1}&searchWord=${param.searchWord}">next</a>
									</li>
								</c:if>
							</c:otherwise>
							
								</c:choose>
							</ul>
						</div>	
		</div>
	</div>

	<!-- 요 까지 작성하시오 /Main -->
				
				
				
        </section>   
    
   
      </div>
  
	</div>
	</div>
	</div>
	
    <%@include file="../cambak21Footer.jsp"%>
	
</body>
</html>