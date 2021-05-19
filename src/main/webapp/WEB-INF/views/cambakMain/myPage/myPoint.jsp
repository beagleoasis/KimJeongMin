<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 
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


<script>

// let member_id = "${loginMember.member_id}";   // 종진 생략(중복);
//console.log(member_id);
let pageNum;

let returnProdName ="";
// 글씨 수를 조절하는 메서드
function textLimitBoard(prodName) {
	//console.log("글자수 조절");
	console.log(prodName);
      var length = 20; //표시할 글자수 정하기

         if (prodName.length >= length) {
			//console.log(prodName.length);
			returnProdName = prodName.substr(0, length) + '...';
            //지정할 글자수 이후 표시할 텍스트
         } else{
        	 returnProdName = prodName;
         }
      
      return returnProdName;
};


// 포인트 리스트 보여주기
function showPointList(pageNum) {
	// 페이지 번호가 null인 경우, 1
	if(pageNum == null){
		pageNum =1;
	}
	
	let showDate;
	let showThisDate;
	let output="<table class='table table-hover' style='table-layout: fixed'>";
	$.ajax({
    type		: "post",
    url 		: "/myMall/myPoint/${loginMember.member_id}/" + pageNum,
    contentType : "application/json",
    success 	: function(data) {
    	console.log(data);
    	pointList = data.vo;
    	$(pointList).each(function(index, item) {
    		// 날짜 출력 포맷 변경 부분
   		 	showDate = new Date(item.payment_date);
            showThisDate = showDate.toLocaleString();
            //console.log(typeof(item.buyProduct_totPrice));
            // 사용한 포인트가 있는 경우
            //console.log(item.point_savingDate);
            //console.log(typeof(item.point_reason));
            //console.log(pointList);
            
        	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            //1.주문이 취소된 건인 경우,
            if(item.point_reason == "주문취소" || item.point_reason == "환불"){
            	
            	 //1-1.주문취소된 건이고, 구매시 포인트 사용한 경우이고,
            	 if(item.point_usedPoint != 0){
                 	//사용했던 포인트를 돌려준다.
                 	output += '<tr><td><img src="../../../resources/img/money-saving-dollar.png" class="pointImg" style="width: 50px;" /><div style="color: red;">사용취소</div></td>';
                 	output += '<td><div class="boldEffect">구매제품</div><div class="prodName">' + textLimitBoard(item.product_name) +'</div></td>';
                 	output += '<td><div class="boldEffect">사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div class="boldEffect">일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div class="boldEffect">포인트</div><div  style="color: red;">+' + item.point_usedPoint +'</div></td></tr>';
            	 
            	 if(item.point_savingDate == 978188400000 && item.point_futurePoint != 0) {
                	//주문취소된 건이고, 구매 포인트 적립 예정이고, 적립예정 포인트가 0이 아닌 경우
                 	//적립 예정 포인트의 회수를 표시
                 	
                 	output += '<tr><td><img src="../../../resources/img/red-x-line.png" class="pointImg" style="width: 50px;" /><div style="color: blue;"">적립예정포인트회수</div></td>';
                 	output += '<td><div class="boldEffect">구매제품</div><div class="prodName">' + textLimitBoard(item.product_name) +'</div></td>';
                 	output += '<td><div class="boldEffect">사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div class="boldEffect">일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div class="boldEffect">포인트</div><div  style="color: blue;">-' + item.point_futurePoint +'</div></td></tr>';
                 } 
            	 }// end of 1-1.주문취소 + 포인트 사용
                 
                 //1-2.주문취소이면서, 사용자가 포인트를 사용하지 않았을 경우
                 else
                 {
                	 	//주문 취소된 건이고, 포인트를 사용하지 않았고, 적립예정 포인트가 0이 아닌 경우
                      	//적립 예정 포인트 회수 표시
                      	if(item.point_savingDate == 978188400000 && item.point_futurePoint != 0) {
                      	output += '<tr><td><img src="../../../resources/img/red-x-line.png" class="pointImg" style="width: 50px;" /><div style="color: blue;">적립예정포인트회수</div></td>';
                      	output += '<td><div class="boldEffect">구매제품</div><div class="prodName">' + textLimitBoard(item.product_name) +'</div></td>';
                      	output += '<td><div class="boldEffect">사유</div><div>' + item.point_reason + '</div></td>';
                      	output += '<td><div class="boldEffect">일시</div><div>' + showThisDate +'</div></td>';
                      	output += '<td><div class="boldEffect">포인트</div><div  style="color: blue;">-' + item.point_futurePoint +'</div></td></tr>';
                      	}
    			}
            	 
            }// end of  1.주문이 취소된 건인 경우,
            

            // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          	// 2-1.상품 구매인 경우!
            else 
            {
            	if(item.point_usedPoint != 0){ //2-1.상품구매 + 포인트 사용o
                 	//사용 포인트 삭감
                 	output += '<tr><td><img src="../../../resources/img/bitcoin-color.png" class="pointImg" style="width: 50px;" /><div style="color: blue;">포인트사용</div></td>';
                 	output += '<td><div class="boldEffect">구매제품</div><div class="prodName">' + textLimitBoard(item.product_name) +'</div></td>';
                 	output += '<td><div class="boldEffect">사유</div><div>' + item.point_reason + '</div></td>';
                 	output += '<td><div class="boldEffect">일시</div><div>' + showThisDate +'</div></td>';
                 	output += '<td><div class="boldEffect">포인트</div><div  style="color: blue;">-' + item.point_usedPoint +'</div></td></tr>';

                 
	                 if(item.point_savingDate != 978188400000  && item.point_futurePoint != 0){//상품 구매이고, 포인트 적립 확정인 경우
	                 	//포인트 적립 적용
	                 	output += '<tr><td><img src="../../../resources/img/money-saving-dollar.png" class="pointImg" style="width: 50px;" /><div  style="color: green;">적립완료</div></td>';
	                 	output += '<td><div class="boldEffect">구매제품</div><div class="prodName">' + textLimitBoard(item.product_name) +'</div></td>';
	                 	output += '<td><div class="boldEffect">사유</div><div>' + item.point_reason + '</div></td>';
	                 	output += '<td><div class="boldEffect">일시</div><div>' + showThisDate +'</div></td>';
	                 	output += '<td><div class="boldEffect">포인트</div><div  style="color: green;">+' + item.point_futurePoint +'</div></td></tr>';
	                 } 
	                 else if(item.point_savingDate == 978188400000  && item.point_futurePoint != 0){
	                	//상품 구매 + 포인트 적립 예정인 경우
	                 	//적립 예정 포인트 표시
	                 	
	                 	output += '<tr><td><img src="../../../resources/img/piggy-saving.png" class="pointImg" style="width: 50px;" /><div>적립예정</div></td>';
	                 	output += '<td><div class="boldEffect">구매제품</div><div class="prodName">' + textLimitBoard(item.product_name) +'</div></td>';
	                 	output += '<td><div class="boldEffect">사유</div><div>' + item.point_reason + '</div></td>';
	                 	output += '<td><div class="boldEffect">일시</div><div>' + showThisDate +'</div></td>';
	                 	output += '<td><div class="boldEffect">포인트</div><div>+' + item.point_futurePoint +'</div></td></tr>';
	                 } 
                 }// end of 주문취소x + 포인트 사용
                 
                 //2-2.상품 구매이고, 사용자가 포인트를 사용x
                 else if(item.point_usedPoint == 0){
                      
                      if(item.point_savingDate != 978188400000 && item.point_futurePoint != 0){//상품 구매이고, 포인트 적립 확정이고, 적립예정 포인트가 0이 아닌 경우
                      	//적립 포인트 확정
                      	output += '<tr><td><img src="../../../resources/img/money-saving-dollar.png" class="pointImg" style="width: 50px;" /><div  style="color: green;">적립완료</div></td>';
                      	output += '<td><div class="boldEffect">구매제품</div><div class="prodName">' + textLimitBoard(item.product_name) +'</div></td>';
                      	output += '<td><div class="boldEffect">사유</div><div>' + item.point_reason + '</div></td>';
                      	output += '<td><div class="boldEffect">일시</div><div>' + showThisDate +'</div></td>';
                      	output += '<td><div class="boldEffect">포인트</div><div  style="color: green;">+' + item.point_futurePoint +'</div></td></tr>';
                      } 
                      //상품구매이고, 포인트 적립 예정이고, 적립예정 포인트가 0인 경우
                      else if(item.point_savingDate == 978188400000 && item.point_futurePoint != 0) {
                      	//적립 예정 포인트 표시
                      	
                      	output += '<tr><td><img src="../../../resources/img/piggy-saving.png" class="pointImg" style="width: 50px;" /><div>적립예정</div></td>';
                      	output += '<td><div class="boldEffect">구매제품</div><div class="prodName">' + textLimitBoard(item.product_name) +'</div></td>';
                      	output += '<td><div class="boldEffect">사유</div><div>' + item.point_reason + '</div></td>';
                      	output += '<td><div class="boldEffect">일시</div><div>' + showThisDate +'</div></td>';
                      	output += '<td><div class="boldEffect">포인트</div><div>+' + item.point_futurePoint +'</div></td></tr>';
                      } 
    			}
            	
            }
            
    		
    	});// end of foreach
    	output += "</table>";
    	
    	
    	$("#myPoint").append(output);
    	
    }// end of success
	, complete : function(data) {
		console.log(data.responseJSON.pagingParam);
		console.log(data.responseJSON.pagingParam.tempEndPage);
		

		//무한 스크롤 처리 부분
		$(window).scroll(function() {
			if(pageNum < data.responseJSON.pagingParam.tempEndPage){
		        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				          pageNum++;
				          showPointList(pageNum);
		        }
        	} 
			// 페이지 스크롤이 완료된 경우,
			else{
				let output1 = '<div style="float:right;"><a href="" onclick="goToTop(); return false;"><img src ="../../../resources/img/go-up.png" style="width: 70px;"/></a></div>';
        		$("#goUp").html(output1);
        	}
		});
	}// end of complete  
	});// end of ajax


}// end of showPointList(page)

// 나의 포인트 정보를 보여주는 함수
function showMyPointInfo() {
	// 내가 보유한 총 포인트
	let myTotPoint;
	// 적립 예정인 총 포인트
	let myTotFuturePoint;
	$.ajax({
	    type		: "post",
	    url 		: "/myMall/myPointInfo/${loginMember.member_id}",
	    contentType : "application/json",
	    success 	: function(data) {
	    	console.log(data);
	    	console.log(data.myTotPoint);
	    	console.log(typeof(data.myTotPoint));
	    	myTotPoint = String(data.myTotPoint);
	    	myTotFuturePoint = String(data.myTotFuturePoint);

	    	console.log(myTotPoint);
	    	console.log(myTotFuturePoint);
	    	console.log(typeof(myTotPoint));
	    	if(myTotFuturePoint =="undefined"){
	    		myTotFuturePoint="0";
	    	}
	    	// 포인트 출력
			$("#myTotAvlPoint").html(myTotPoint);
			$("#myFuturePoint").html(myTotFuturePoint);
	    	}
			
		});
	
	
}

// ajax로 리스트 출력 완료 후 마지막 페이지에서 클릭시 맨 위로 올라가는 함수
function goToTop() {
	$('body,html').animate({
	      scrollTop:300 
	    },400 );
}

$(function() {
	showPointList();
	showMyPointInfo();

	// 글씨 색깔 효과
	let myPageUri = myMallAddress();
	myPageAsideBarDraw(myPageUri);
	$("body,html").animate({scrollTop: 300}, 1);
});
</script>
<style>
	.boldEffect{
		font-weight: bold;
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
					<div>보유 포인트 : <span id="myTotAvlPoint"></span>점</div>
					<div>적립 예정 포인트 : <span id="myFuturePoint"></span>점</div>
					<div id="myPoint"></div>
					<div id="goUp"></div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>