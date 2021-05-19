<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CambakMall</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/style.css" type="text/css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	
  	<script>
  	
  	$(document).ready(function() {
  		
  		orderResult();
  		
  		
  	});
  	
  	function orderResult() {
  		let result = '${param.result}';
  		
  		if (result == "success") alert("주문이 성공적으로 완료되었습니다.");
  	}
  	
  	</script>
  	
</head>
<body>
<%@include file="mallHeader.jsp" %>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Breadcrumb Begin -->
  
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="/mall/main/"><i class="fa fa-home"></i> Home</a>
                        <a href="/mall/cart">Shopping cart </a>
                        <a href="/mall/prodOrder">Order</a>
                        <span>Order completed</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
      <section class="shop-cart spad">
      <div class="container">
      <!-- 본문 시작 -->
      <!-- 주문완료 안내 start -->
      <h2>주문이 성공적으로 완료되었습니다.</h2>
      <div>주문번호 : <a href="/myMall/myOrder">${orderInfo.payment_no }</a></div>
     
      <!-- 주문완료 안내 end -->
      <!-- 배송지 정보 start -->
       <div>
    
    <div class="tbl_wrap" style="margin-top:50px">
    
    	<table class="table table-bordered">
    	<colgroup>
    		<col style="width:160px;">
    		<col>
    	</colgroup>
    	<tbody id="table_in">
    	<tr>
    		<th colspan="2" >배송지 정보</th>
    	</tr>
    	
    		
    		<tr>
    			<td>이름</td>
    			<td id="user_name">${orderInfo.destination_toUser }</td>
    			
    		</tr>
    		<tr>
    			<td>연락처</td>
    			<td id="user_number">${orderInfo.destination_mobile }</td>
    		</tr>
    		<tr>
    			<td>주소</td>
    			<td id = "user_dest">(${orderInfo.destination_zipCode }) ${orderInfo.destination_address } ${orderInfo.destination_addressDetail }</td>
    			
    		</tr>
    		<tr>
    			<th colspan="2">결제정보</th>
    			
    		</tr>
    		<tr>
    			<td>결제 수단</td>
    			<td id="user_name">${orderInfo.payInfo_way }</td>
    			
    		</tr>
    		<tr>
    			<td>결제시간</td>
    			<td id="user_number"><fmt:formatDate value="${orderInfo.payInfo_date }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
    		</tr>
    		
    		<tr>
    		<th colspan="2" >금액정보</th>
    	</tr>
    	<tr>
    			<td>금액</td>
    			<td id="totBuyPrice"><fmt:formatNumber value="${orderInfo.totPrice }" pattern="#,###" />원</td>
    		</tr>
    		
    	</tbody>
    	</table>
    	<input type="hidden" name="destination_no" value="" id="destination_no">
    </div>
     <div style="text-align:right">
      	<a href="main/" class="btn btn-info" role="button">메인화면으로</a>
      </div>
    </div>
    <!-- 배송지 선택 테이블 end -->
    
      <div>
   
  
    </div>
      
      
      
      
      <!-- 본문 END  -->
      
      
      </div>
	</section>
	   <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->
	<%@include file="mallFooter.jsp" %>
	<!-- Js Plugins -->
<script src="../../resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="../../resources/mallMain/js/bootstrap.min.js"></script>
<script src="../../resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="../../resources/mallMain/js/jquery-ui.min.js"></script>
<script src="../../resources/mallMain/js/mixitup.min.js"></script>
<script src="../../resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="../../resources/mallMain/js/jquery.slicknav.js"></script>
<script src="../../resources/mallMain/js/owl.carousel.min.js"></script>
<script src="../../resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="../../resources/mallMain/js/main.js"></script>
<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>

</body>
</html>