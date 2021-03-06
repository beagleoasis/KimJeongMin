<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>

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
    <link rel="stylesheet" href="../../resources/mallMain/css/cambakMallCommon.css" type="text/css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>

<script type="text/javascript">
let commaJ = /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g;
let numberJ= /^[0-9]/g;
let usePointVar = 0;
let savePointVar = 0;

console.log('${prodInfo }');

//??????????????? ????????? ?????????
 $(function(){
	console.log($("#finalPay").html());
	 default_addr();
	 myAllPoint(); // ????????? ?????? ???, ????????? ????????? ????????????
	 addPoint();  // ????????? ?????? ???, ????????? ?????? ????????????
	 
});

//????????? script start
//????????? ???????????? ?????? ?????????
function destList(){
	
	let member = "${loginMember.member_id}"
	console.log(member);
	let output ="";
	$.getJSON("/mall/prodOrder/" + member, function(data) {
		console.log(data);
		 $(data).each(function(index, item){
			output += "<div>" + this.destination_nickname + "</div>"
			output += "<div>" + this.destination_address + " " + this.destination_addressDetail + "</div>"
			output += "<div>" + this.destination_mobile + "</div><button type='button' class='btn btn-default' data-dismiss='modal' onclick='selectDest(" + this.destination_no + ")'>????????????</button><hr/>"
		});
		 
		 
		 $("#destList").html(output); 
	});
	
}
// ????????? ???????????? ?????????
function selectDest(destination_no){
	$.ajax({
		  method: "GET",
		  url: "/mall/prodOrder/select/" + destination_no ,
		  headers : { // ???????????? ???????????? ????????? ??????
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "GET"
		  },
		  dataType: "JSON", // ?????? ?????? ????????? ??????
		  destination_no : destination_no,
		  success : function(result){
			  $("#user_name").html(result.destination_nickname);
			  $("#user_number").html(result.destination_mobile);
			  $("#user_dest").html(result.destination_address + " " + result.destination_addressDetail);
			  $("#destination_no").val(result.destination_no);
		  }
		});
	
}

function shownoAccount() {
	$("#creditCard").hide();
	$("#creditCardBank").attr('disabled', 'true');
	$("#creditCardInstallments").attr('disabled', 'true');
	$("#transfer").hide();
	$("#transferBank").attr('disabled', 'true');
	$("#noAccount").show();
	$("#noAccountBank").removeAttr('disabled'); 
	
}

function showcreditCard(){
	$("#noAccount").hide();
	$("#noAccountBank").attr('disabled', 'true');
	$("#transfer").hide();
	$("#transferBank").attr('disabled', 'true');
	$("#creditCard").show();
	$("#creditCardBank").removeAttr('disabled'); 
	$("#creditCardInstallments").removeAttr('disabled'); 
}

function showtransfer() {
	$("#creditCard").hide();
	$("#creditCardBank").attr('disabled', 'true');
	$("#creditCardInstallments").attr('disabled', 'true');
	$("#noAccount").hide();
	$("#noAccountBank").attr('disabled', 'true');
	$("#transfer").show();
	$("#transferBank").removeAttr('disabled'); 
}

function goCart() {
	
	alert("????????? ???????????????.");
	location.href='http://localhost:8081/mall/cart';
}

function checkForm(){
	let member_id = "${loginMember.member_id}";
	let payInfo_way = "";
	agreement = $("#agreement").prop("checked");
	let result = true;
	console.log(agreement);
	
	let deliName = $("#user_name").text();
	let deliPhone = $("#user_number").text();
	let user_dest = $("#user_dest").text();
	
	if (deliName == "????????? ?????? ????????? ??????????????????" || deliPhone == "????????? ?????? ????????? ??????????????????" || user_dest == "????????? ?????? ????????? ??????????????????") {
		alert("???????????? ??????????????????.");
		return false;
	}
	
	if($("#account").prop("checked")) {
		payInfo_way = $("#account").val();
	} else if($("#card").prop("checked")) {
		payInfo_way = $("#card").val();
	} else {
		payInfo_way = $("#tranfer").val();
	}
	
	console.log(payInfo_way);
	console.log(member_id);
	
	if(agreement == false){
		alert("?????? ????????? ???????????????.");
		result = false;
	} else {
		$.ajax({
			  method: "POST",
			  url: "/mall/prodOrder/payInfo",
			  dataType: "JSON", // ?????? ?????? ????????? ??????
			  data : {member_id : member_id, payInfo_way : payInfo_way},
			  async: false,
			  success : function(data){
				  let no = Number(data);
				  console.log(typeof no);
				  $("#payinfo_no").attr("value", no);
				  
			  },
			  complete : function() {
				 result = true;
			  }
			});
	}
	
	if (result == true) {
		let totPriceNum = '${totPrice }';
		
		$("#savePointNum").val(savePointVar);
		$("#totPriceNum").val(Number(totPriceNum));
	}
	
	return result;
}

function default_addr() {
	let member_id = "${loginMember.member_id}";
	console.log(member_id);
	$.ajax({
		  method: "GET",
		  url: "/mall/prodOrder/default/" ,
		  headers : { // ???????????? ???????????? ????????? ??????
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "GET"
		  },
		  dataType: "JSON", // ?????? ?????? ????????? ??????
		  data : {member_id : member_id},
		  success : function(result){
			 if(result != null){
				 $("#user_name").html(result.destination_nickname);
				  $("#user_number").html(result.destination_mobile);
				  $("#user_dest").html(result.destination_address + " " + result.destination_addressDetail);
				  $("#destination_no").val(result.destination_no);
			
			 }
			
		  }
		});
	}	

//????????? script end

// ????????? script Start
function usedPoint() {
	alert("!");
	let member_id = "${loginMember.member_id}";
	let dis = parseInt($("#addPoint").val());
	let result = false;
	
	$.ajax({
		  method: "POST",
		  url: "/mall/usedPoint" ,
		  headers : { // ???????????? ???????????? ????????? ??????
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "POST)"
		  },
		  dataType: "JSON", // ?????? ?????? ????????? ??????
		  data : {member_id : member_id, dis : dis},
		  success : function(data){
			console.log(data);
		  }
		});

	return result;
}

function orderFin() {
// 	alert("????????????");
	let member_id = "${loginMember.member_id}";
	let dis = parseInt($("#myPoint").val().replace(',', ''));
	let totalPrice = '${totPrice }'
	let finallyPrice = totalPrice - dis + 2500;
	let payInfo_way = "";
	let result = false;
	
// 	alert("??????");
	
// 	console.log(member_id);
// 	console.log(dis);
// 	console.log(totalPrice);
// 	console.log(finallyPrice);

	$.ajax({
		  method: "POST",
		  url: "/mall/payInfo" ,
		  headers : { // ???????????? ???????????? ????????? ??????
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "POST)"
		  },
		  dataType: "JSON", // ?????? ?????? ????????? ??????
		  data : {finallyPrice : finallyPrice},
		  success : function(data){
// 			 if(result != null){
// 				 $("#totBuyPrice").html(result.finallyPrice);
// 			 }
			console.log(data);
		  }
		});

	return result;
	
	
	
}

function myAllPoint() {
	
	$("#myAllPoint").text('${loginMember.member_totPoint }'.replace(commaJ, ","));
	
}

function allPoint() {
	
	$("#myPoint").val('${loginMember.member_totPoint }');

}

function usePoint() {
	let dis = $("#myPoint").val().replace(',', '');
	let totalPrice = '${totPrice }'
	let totalPoint = '${loginMember.member_totPoint }';
	
	dis = parseInt(dis);
// 	usePointVar = dis;
	console.log(Number.isInteger(dis * 0.01));
	
	if (!Number.isInteger(dis * 0.01)) {
		alert("????????? ????????? 100????????? ???????????????.");
		return;
	}
	
	if (dis <= totalPoint) {
		let finallyPrice = totalPrice - dis + 2500;
		$("#finalPay").text(String(finallyPrice).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")); // ????????? ??? ??????????????? ??????
		$("#disCnt").text(String(dis).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")); // ?????? ????????? ?????? ????????? ????????????
		let myPoint = $("#myPoint").val();
		$("#usePointNum").val(Number(myPoint));
	} else {
		alert("?????? ??????????????? ??????")
	}
}

function addPoint() {
	 
	console.log(parseInt('${totPrice * 0.05 }'.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")))
	console.log('${totPrice * 0.05 }');
	
	if ('${loginMember.grade_name}' == 'A' ) {
		let test = Math.ceil(parseInt('${totPrice * 0.1 }')); // 1500.0
		savePointVar = test;
		$("#addPoint").text(String(test).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
	} else if ('${loginMember.grade_name}' == 'B' ) {
		let test = Math.ceil(parseInt('${totPrice * 0.05 }')); // 1500.0
		savePointVar = test;
		$("#addPoint").text(String(test).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
	} else {
		$("#addPoint").text('0');
	}
}
	

//????????? script End




</script>
<style>
.tbl_wrap{
	vertical-align: middle;
}
</style>
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
                        <span>Order</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
      <section class="shop-cart spad">
      <div class="container">
      
    <!-- ????????? ?????? ????????? start -->
    <form action = "/mall/orderFin" method ="post" onsubmit="return checkForm();">
    <div>
    <h2>????????? ??????</h2>
    <div class="tbl_wrap">
    
    	<table class="table">
    	<colgroup>
    		<col style="width:160px;">
    		<col>
    	</colgroup>
    	<tbody id="table_in">
    		<tr>
    			<th>????????? ??????</th>
    			<td>
    			
    			<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="destList();">????????? ????????????</button>
    			
    			</td>
    		</tr>
    		<tr>
    			<th>??????</th>
    			<td id="user_name">????????? ?????? ????????? ??????????????????</td>
    			
    		</tr>
    		<tr>
    			<th>?????????</th>
    			<td id="user_number">????????? ?????? ????????? ??????????????????</td>
    		</tr>
    		<tr>
    			<th>??????</th>
    			<td id = "user_dest">????????? ?????? ????????? ??????????????????</td>
    			
    		</tr>
    		<tr>
    			<th>??????????????????</th>
    			<td id = ""><input type="text" name="payment_deliveryMsg" style="width: 400px;" /></td>
    		</tr>
    	</tbody>
    	</table>
    	<input type="hidden" name="destination_no" value="" id="destination_no">
    </div>
    </div>
    <!-- ????????? ?????? ????????? end -->

				<!-- ????????? ?????? modal start-->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">????????? ??????</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body" id="destList">
						
							</div>
							<div class="modal-footer">
								
									<button type="button" class="btn btn-default"
									onclick="location.href='/mall/destinationsList'">????????? ????????????</button>
									<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
				<!-- ????????? ?????? modal end -->

				<!-- ?????? ?????? ?????? ????????? start -->
    <div style="margin-top:50px">
    <h2>???????????? ??????</h2>
    <table class="table">
    	<thead>
    	<tr>
    		<th style="display: none">??????</th>
    		<th colspan="2">????????????</th>
    		<th>????????????</th>
    		<th>??????</th>
    		<th>????????????</th>
    	</tr>
    	</thead>
    	<tbody>
    	
    	
<!-- 		<tr> -->
<!-- 			<td style="display: none">??????</th> -->
<!--     		<td><img alt="" src="../../resources/img/test.jpg" style="width:100px"> </td> -->
<!--     		<td>?????????</td> -->
<!--     		<td>10,000<i>???</i></td> -->
<!--     		<td>1</td> -->
<!--     		<td>2500<i>???</i></td> -->
<!--     		<td>12,500<i>???</i></td> -->
<!--    		</tr> -->
    	
    	<c:forEach var="item" items="${prodInfo }" varStatus="status">
			<tr>
				<td style="display: none">${item.buyProduct_no }</td>
				<td><img alt="" src="${item.product_img1 }" style="width: 100px;"></td>
	    		<td style="text-align: center;">${item.product_name }</td>
	    		<td style="text-align: center;"><fmt:formatNumber value="${item.product_sellPrice}" pattern="#,##0" /></td>
	    		<td style="text-align: center;"><fmt:formatNumber value="${item.buyProduct_qty }" pattern="#,##0" /></td>
<%-- 	    		<td style="text-align: center;">${item.buyProduct_deliveriPay }</td> --%>
	    		<td style="text-align: center;"><fmt:formatNumber value="${item.buyProduct_totPrice }" pattern="#,##0" /></td>
    		</tr>
    		<input type="hidden" name="buyProduct_no${status.count}"  value="${item.buyProduct_no }" />
    	</c:forEach>
    	
    	
    	</tbody>
    	<tfoot>
    		<tr>
    			<td rowspan="2"><div style="">????????? ??????</div></td>
    		</tr>
    		<tr>
	   			<td colspan="6">
	   				<div>
	   					<ul style="float:right; margin-right:80px; font-style:normal; list-style:none;">
	   						<li>
	   							<em style="margin-right:10px; margin-bottom:10px;font-style:NORMAL">??????</em>
	   							<span><em id="myAllPoint"></em><i>???</i></span>
	   							<button type="button" class="btn btn-info" style="padding: 6px;" onclick="allPoint()">????????????</button>
	   						</li>
	   						<li>
	   							<em style="margin-right:10px; margin-bottom:10px;font-style:NORMAL">??????</em>
	   							<span><input type="number" id="myPoint" value="0"><i>???</i></span>
	   							<button type="button" class="btn btn-info" style="padding: 6px;" onclick="usePoint();">????????????</button>
	   							<div style="color: red; font-size: 13px; font-weight: 600;  padding: 0 40px;">* ????????? ????????? 100????????? ???????????????.</div>
	   						</li>
	   					</ul>
	   				</div>
	   			</td>
    		</tr>
    		<tr>
    			<td rowspan="2"><div style="">?????? ??????</div></td>
    		</tr>
    		<tr>
    			<td colspan="6">
    				<div>
    					<ul style="float:right; margin-right:80px; font-style:normal; list-style:none;">
    						<li>
    							<em style="margin-right:10px; margin-bottom:10px;font-style:NORMAL">?????? ??????</em>
    							<span>
    							<em><fmt:formatNumber value="${totPrice }" pattern="#,##0" /></em><i>???</i>
    							</span>
    						</li>
    						<li>
    							<em style="margin-right:10px;margin-bottom:10px;font-style:NORMAL">?????? ??????</em>
    							<span><em id="disCnt">0</em><i>???</i></span>
    						</li>
    						<li>
    							<em style="margin-right:10px;margin-bottom:10px;font-style:NORMAL">?????? ??????</em>
    							<span>
    							<em><fmt:formatNumber value="${prodInfo[0].buyProduct_deliveriPay }" pattern="#,##0" /></em><i>???</i>
    							</span>
    						</li>	
    					</ul>
    				</div>
    			</td>
    		</tr>
   			<tr>
   				<td rowspan="2"><div style="">?????? ?????? ??????</div></td>
   			</tr>
   			<tr>
	   			<td colspan="6">
	   				<div>
	   					<span style="text-align:right; float:right;margin-right:80px"><em id="addPoint"></em><i>???</i></span>
	   				</div>
	   			</td>
   			</tr>
   			<tr>
   				<td rowspan="2"><div style="">??? ?????? ??????</div></td>
   			</tr>
   			<tr>
	   			<td colspan="6">
	   				<div>
	   					<span style="text-align:right; float:right;margin-right:80px"><em id="finalPay"><fmt:formatNumber value="${totPrice + prodInfo[0].buyProduct_deliveriPay }" pattern="#,##0" /></em><i>???</i></span>
	   				</div>
	   			</td>
   			</tr>
    	</tfoot>
    	
    </table>
    
    
    </div>
	
    <!-- ?????? ?????? ?????? ????????? end -->
    <!-- ?????? ??????????????? ????????? start -->
    <div style="margin-top: 50px;">
    	<h2>?????? ?????? ??????</h2>
    	<div>
			<div>
				 <table class="table">
					<thead>
						<tr>
							<th>????????????</th>
							<th>
							<label class="radio-inline" for="account"><input type="radio" id="account" name="pay" value="???????????????" onclick="shownoAccount();" checked>???????????????</label>
							<label class="radio-inline" for="card"><input type="radio" id="card" name="pay" value="??????" onclick="showcreditCard();">??????</label>
							<label class="radio-inline" for="tranfer"><input type="radio" id="tranfer" name="pay" value="????????????" onclick="showtransfer();">????????????</label>
							</th>
							</tr>
							<tr>
							<td colspan="2">
								<div id="noAccount">
									<ul>
										<li>
										<div>
											<label>????????????</label>
												<select id="noAccountBank">
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>?????????</option>
												</select>
											</div>
										</li>	
										<li>
											<div>
												<span>????????????</span>
												<span>????????? 24??????</span>
											</div>
										</li>
									</ul>
								 </div>
								<div id="creditCard" style="display: none">
									<ul>
										<li>
										<div>
											<label>?????? ??????</label>
												<select id="creditCardBank">
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>???????????????</option>
												</select>
											</div>
										</li>	
										<li>
											<div>
												<span>????????????</span>
												<select id="creditCardInstallments">
													<option>?????????</option>
													<option>3??????</option>
													<option>6??????</option>
													<option>9??????</option>
													<option>12??????</option>
													
												</select>
												<span>*????????? 50,000????????? ???????????????.</span>
											</div>
										</li>
									</ul>
								</div>
								<div id="transfer" style="display: none">
									<ul>
										<li>
										<div>
											<label>????????????</label>
												<select id="transferBank">
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>????????????</option>
													<option>?????????</option>
												</select>
											</div>
										</li>	
									
									</ul>
								</div>
							</td>
							
							
						</tr>
					</thead>
				</table>
			</div>    
   		</div>
    </div>
    
    <!-- ?????? ??????????????? ????????? end -->
    <!-- ???????????? ????????? start -->
    <div style="margin-top: 50px;">
    	<h2>?????? ?????? ??????</h2>
    	<div>
    		<div>
    			<dl>
    				<dt>
    					 <label><input type="checkbox" value="" id="agreement">?????? ?????? ????????? ????????? ????????? ???????????????</label>
    				</dt>
    			</dl>
    		</div>
    	</div>
    </div>
    <div>
    	<input type="submit" class="btn btn-default" value="????????????"/>
    	<button class="btn btn-default" onclick="goCart()">??????</button>
    	<input type="hidden" name="member_id" id="member_id" value="${loginMember.member_id}" />
    	<input type="hidden" name="payInfo_no" id="payinfo_no" value="0" />
    	<input type="hidden" name="usePointNum" id="usePointNum" value="0"/>
		<input type="hidden" name="savePointNum" id="savePointNum" value=""/>
		<input type="hidden" name="totPriceNum" id="totPriceNum" value=""/>
    </div>
    </form>
        
    <!-- ???????????? ????????? end -->
    
<!--     ???????????? ????????? start -->
<!--     <form name="FinalOder" action="/orderFin.jsp" method="POST"> -->
		
<!-- 	</form> -->
<!-- 	<!-- ???????????? ????????? end --> 


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

</body>
</html>