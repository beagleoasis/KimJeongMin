<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>

<meta charset="UTF-8">
 
 <script>
 
 
// *********************** 종진 수정 부분 **************************//	
 $(window).on("scroll", function(){
	if($(window).scrollTop() > 500){
		$(".top").css("display","block");
// 		$("#main-sidebar").css("display","block");

	}else{
		$(".top").css("display","none");
// 		$("#main-sidebar").css("display","none");

	} 
	  
 });
 
 
 
 $(function(){
	
	 getRecentlyProduct();

 });
 
 function getRecentlyProduct(){
		let ChangeWon = /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g;
		let recentlyOutput = "";	
	 $.getJSON("/mall/main/getRecentlyProduct", function(data){
		
	
			$("#RecentlySection").html("");
	        isdata = data.length;
	        console.log(isdata + "is data는");
	   		$(data).each(function(index, item){
	   			let prevPrice = String(this.product_sellPrice);
	   		
	   			let changeSellPrice = prevPrice.replace(ChangeWon, ",");
	   		
	   			
				recentlyOutput += '<a href="/mall/prodDetail/main?prodId=' + this.product_id + '"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="' + this.product_img1 + '"/><span>' + this.product_name + '<br/>' + changeSellPrice + '</span></li></a>';
		
	   		});
			recentlyOutput += '</ul>';
			$("#RecentlySection").html(recentlyOutput);
			$("#recentlyCntOutput").text(isdata);
	 });
	 
	
 
 }

 
// *********************** 종진 수정 부분 **************************//	
 </script>
 
 
 <style>
 /* *********************** 종진 수정 부분 ************************** */	
 .top{
    left: 90%;
    width: 40px;
    position: fixed;
    bottom: 80px;
    display: none;
    cursor: pointer;
 }
 
 #main-sidebar{
 	left: 88%;
    width: 110px;
    position: fixed;
    top: 150px;
 
 }
 
 .recently-viewed-products, .side-cart{
    background-color: indigo;
    padding: 7px;
    font-size: 13px;
 }
 
  #main-sidebar strong{
		color:white;
 }

  #main-sidebar em{
		color:YELLOW;
 }


 .recently-viewed-page{
 	
 	border: solid 1px darkgray;
    font-size: 12px;
    display: block;
    font-weight: bold;
    list-style: none;
    min-height: 450px;
 }
 
 .no-item{
 text-align: center;
 padding: 150px 0px 0px;
 
 }
 
 .recently-item{
 padding: 3px;
 text-align: center;
 margin-top: 15px;
 color:black;
 }
 
 .radios{
    left: 77%;
    bottom: 75px;
    width: 165px;
	display: inline-block;
    position: fixed;
    right: 13px;
    height: 50px;
    padding: 0 20px 0 20px;
    border-radius: 25px;
    border: 1px solid #555;
    background-color: #fff;
    -webkit-box-shadow: 0 5px 14px 0 rgb(0 0 0 / 10%);
    box-shadow: 0 5px 14px 0 rgb(0 0 0 / 10%);
    font-size: 14px;
    line-height: 48px;
    letter-spacing: -.3px;
    color: #333;
    -webkit-transition: right .4s;
    transition: right .4s;
    z-index: 10;
    display:none;
    
 }

 
/* *********************** 종진 수정 부분 ************************** */
 
 </style>
 
</head>


		
		
		<section id="main-sidebar">
	            <div class="recently-viewed-products" >
		            <strong>최근본상품</strong>
		            <em class="total-element" id="recentlyCntOutput"> 0 </em>
		        </div>
		        <div class="recently-viewed-list">
		            <ul class="recently-viewed-page" id="RecentlySection" style="display: block;">
<%-- 		            <c:if test="${para.viewRecently0 == null }"> --%>
						 <li class="no-item">최근본 상품이<br>없습니다.</li>
<%-- 				    </c:if> --%>
				    
<%-- 				    <c:if test="${para.viewRecently0 != null }"> --%>
<%-- 						 <a href="/mall/prodDetail/main?prodId=${para.viewRecently0.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently0.product_img1 }"/><span>${para.viewRecently0.product_name }<br/><fmt:formatNumber value="${para.viewRecently0.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%-- 				    </c:if> --%>
<%-- 				    <c:if test="${para.viewRecently1 != null }"> --%>
<%-- 						 <a href="/mall/prodDetail/main?prodId=${para.viewRecently1.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently1.product_img1 }"/><span>${para.viewRecently1.product_name }<br/><fmt:formatNumber value="${para.viewRecently1.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%-- 				    </c:if> --%>
<%-- 				    <c:if test="${para.viewRecently2 != null }"> --%>
<%-- 						 <a href="/mall/prodDetail/main?prodId=${para.viewRecently2.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently2.product_img1 }"/><span>${para.viewRecently2.product_name }<br/><fmt:formatNumber value="${para.viewRecently2.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%-- 				    </c:if> --%>
				           
<!-- 		         </ul> -->
		           
	        </div>
	        
             <a onclick="window.scrollTo(0,0);" id="sideTop" class="top" title="맨 위로 가기" >
				<img src="/resources/img/pageUp.png" />
			</a>
   		 </section>
	  
