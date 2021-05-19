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


<div>

			<!--  효원이 디자인 시작 -->
				<div class="profile">
						<div>
							<div class="profileSize">
								<a href=""></a><img src="../../resources/cambak21/img/trip.jpg" class="userProfileImg">
								<h4>${loginMember.member_id }</h4>
								<div class="profileEmail">${loginMember.member_email }</div>
							</div>
							<div class="profileCategory">
								<ul>
									<li class="profileMenu1"><a href="#" class="profileMenu">마이 페이지</a></li>
									<li class="profileMenu2"><a href="#" class="profileMenu">회원 정보 수정</a></li>
								</ul>
							</div>
						</div>
					</div>
		<!--  효원이 디자인 끝  -->

	<!-- Sidebar top -->
	<div id="sidebar" class="4u">
		<div class="sidebar">
			<div class="panel panel-success">
				<div class="panel-heading">
					<p class="category-title" id="category-title" style="margin-bottom: 0px;">나의 캠박이일</p>
				</div>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li id="myPost"><a href="/myPage/myPost?member_id=${loginMember.member_id }&page=1">내가 쓴 글</a></li>
				<li id="humorAside"><a href="#">내 댓글</a></li>
				<li id="QnAAside"><a href="#">내 좋아요 글</a></li>
				<li id="resellAside"><a href="#">나의 문의</a></li>
		
			</ul>
		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar" class="4u">
		<div class="sidebar">
			<div class="panel panel-success">
				<div class="panel-heading">
					<p class="category-title" id="category-title"  style="margin-bottom: 0px;">캠박몰</p>
				</div>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li id="#"><a href="#">적립금 관리</a></li>
				<li id="#"><a href="#">주문 목록</a></li>
				<li id="#"><a href="#">취소 / 반품</a></li>
				<li id="#"><a href="#">구매 목록</a></li>
			</ul>
		</div>
	</div>




</div>
			
		
		<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>주문 목록</h2>
							<span class="byline" id="rollNot"><a href="/board/notice/listCri">공지사항 상세페이지</a></span>
						</header>
				
				
    <!-- 요 안에 작성하시오 Main -->
	<div>
	<h2>주문상품</h2>
	<div align="center"
											style="width: 90%; border: 1px solid gray; border-radius: 1em; text-align: left;">
											
										
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
																	width="110" height="110" />
															</div>
															<div
																style="float: left; width: 300px; margin-top: 15px; margin-left: 10px">
																<a href="http://localhost:8081/mall/prodDetail/main?prodId=${order.product_id }"><span style="font-size: 20px;color: gray;font-weight: bold;" >${order.product_name }</span></a>
																<div style="text-align: left">
																	<div class="emptySpace"></div>
																	<div style="margin-top: 60px">
																		<span style="font-size: 20px; font-weight: bold;">결제금액 ${order.buyProduct_totPrice }<em>원</em></span>
																	</div>
																</div>
															</div>
														</td>
														
													</tr>

												</tbody>
											</table>
											</div>
		<div>
				<h1 style="margin-top: 80px">배송지 정보</h1>
    <div class="tbl_wrap" >
    
    	<table class="table">
    	<colgroup>
    		<col style="width:160px;">
    		<col>
    	</colgroup>
    	<tbody id="table_in">
    		
    		<tr>
    			<th>이름</th>
    			<td id="user_name">${dest.destination_toUser }</td>
    			
    		</tr>
    		<tr>
    			<th>연락처</th>
    			<td id="user_number">${dest.destination_mobile }</td>
    		</tr>
    		<tr>
    			<th>주소</th>
    			<td id = "user_dest">${dest.destination_address } ${dest.destination_addressDetail }</td>
    			
    		</tr>
    	</tbody>
    	</table>
    	<input type="hidden" name="destination_no" value="" id="destination_no">
    </div>
									
		</div>
		
		<div>
				<h1 style="margin-top: 80px">결제</h1>
    <div class="tbl_wrap" >
    
    	<table class="table">
    	<colgroup>
    		<col style="width:160px;">
    		<col>
    	</colgroup>
    	<tbody id="table_in">
    		
    		<tr>
    			<th>결제수단</th>
    			<td id="user_name">${payInfo.payInfo_way }</td>
    			
    		</tr>
    		
    		<tr>
    			<th>결제시간</th>
    			<td id = "user_dest"><fmt:formatDate value="${payInfo.payInfo_date}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></td>
    			


    			
    		</tr>
    	</tbody>
    	</table>
    	<input type="hidden" name="destination_no" value="" id="destination_no">
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