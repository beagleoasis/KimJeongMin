<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 화면 너비 자동반응 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<title>Cambak's - Admin Pages</title>

<!-- css -->
<link href="../../resources/adminDist/css/bootstrap.min.css" type="text/css">
<link href="../../resources/adminDist/css/font-awesome.min.css" type="text/css">
<link href="../../resources/adminDist/css/elegant-icons.css" type="text/css">
<link href="../../resources/adminDist/css/jquery-ui.min.css" type="text/css">
<link href="../../resources/adminDist/css/magnific-popup.css" type="text/css">
<link href="../../resources/adminDist/css/owl.carousel.min.css" type="text/css">
<link href="../../resources/adminDist/css/slicknav.min.css" type="text/css">
<link href="../../resources/adminDist/css/style.css" type="text/css">
<link href="../../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/adminAssets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="../../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css" href="../../resources/adminAssets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link href="../../resources/adminDist/css/style.min.css" rel="stylesheet">

<!-- js -->
<script src="../../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script src="../../resources/adminAssets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="../../resources/adminAssets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../../resources/adminAssets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../../resources/adminAssets/extra-libs/sparkline/sparkline.js"></script>
<script src="../../resources/adminDist/js/waves.js"></script>
<script src="../../resources/adminDist/js/sidebarmenu.js"></script>
<script src="../../resources/adminDist/js/custom.min.js"></script>
<script src="../../resources/adminAssets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="../../resources/adminDist/js/pages/mask/mask.init.js"></script>
<script src="../../resources/adminAssets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="../../resources/adminAssets/libs/select2/dist/js/select2.min.js"></script>
<script src="../../resources/adminAssets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script src="../../resources/adminAssets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script src="../../resources/adminAssets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script src="../../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script src="../../resources/adminAssets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

$(document).ready(function() {
let member_isAdmin = '${loginMember.member_isAdmin}';

if (member_isAdmin != 'Y') {
	alert("잘못된 접근입니다.");
	location.href="/index/main";
}

destinationModiResult();

});

function destinationModiResult() {
	let destinationModi = '${destinationModi}';
	let orderStatusModi = '${orderStatusModi}';
	
	if (destinationModi == "success") alert("배송지 정보가 수정되었습니다.");
	else if (destinationModi == "fail") alert("배송지 정보 수정을 실패했습니다.");
	
	if (orderStatusModi == "success") alert("주문 정보가 수정되었습니다.");
	else if (orderStatusModi == "fail") alert("주문 정보 수정을 실패했습니다.");
}

function csStatusModi() {
	$("#csStatusSelect").css("display", "");
}

function purchaseStatusModi() {
	$("#purchaseStatus").css("display", "none");
	$("#purchaseStatusSelect").css("display", "");
}

function deliveryInfoModi() {
	$("#deliveryInfo").css("display", "none");
	$("#deliveryInfoSelect").css("display", "");
}

function destinationMemoModi() {
	$("#destinationMemo").css("display", "none");
	$("#destinationMemoText").css("display", "");
}

function destinationAddrModi() {
	$("#destinationAddr").css("display", "none");
	$("#destinationAddrText").css("display", "");
}

function destinationPhoneModi() {
	$("#deliveryPhone").css("display", "none");
	$("#deliveryPhoneText").css("display", "");
}

function toUserModify() {
	$("#destinationToUser").css("display", "none");
	$("#destinationToUserText").css("display", "");
}

function destinationNameModify() {
	$("#destinationName").css("display", "none");
	$("#destinationNameText").css("display", "");
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            document.getElementById("address").value = addr;
            
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("address").value += extraAddr;
            
            } else {
                document.getElementById("address").value += '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            $("#destinationAddr").css("display", "none");
            $("#destinationAddrModify").css("display", "");
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
<style>



</style>
</head>
<body>
<div class="preloader">
   <div class="lds-ripple">
      <div class="lds-pos"></div>
      <div class="lds-pos"></div>
   </div>
</div>
<div id="main-wrapper">
<%@ include file="adminAside.jsp"%>
<div class="page-wrapper">
   <div class="page-breadcrumb">
      <div class="row">
         <div class="col-12 d-flex no-block align-items-center">
            <h4 class="page-title">주문목록 - 주문 상세 정보</h4>
            <div class="ml-auto text-right">
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="#"style="color: #6c757d;">홈</a></li>
                     <li class="breadcrumb-item active" aria-current="page"><a href="/admin/orderManagement" style="color: #6c757d;">주문목록</a></li>
                     <li class="breadcrumb-item active" aria-current="page">주문 상세 정보</li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </div>
   <div class="container-fluid">
      <div class="row">
         <div class="col-md-6">
            <form action="destinationModi" method="post">
            <div class="card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title m-b-0">주문자 정보</h4>
					</div>
					<ul class="list-style-none">
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">주문자</label>
							<div>
								<span>${buyProdInfo.buyerInfo.member_name } (${buyProdInfo.buyerInfo.member_id })</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<button type="button" class="btn btn-info btn-sm" onclick="window.open('/admin/memberSearch?memberOption=id&memberOptionSearchWord=${buyProdInfo.buyerInfo.member_id}&dateOption=birth&checkLowDate=&checkHighDate=&PriceOption=puchasePrice&checkLowNum=&checkHighNum=&genderResult=all&AResult=&BResult=&CResult=')">회원관리</button>
								</div>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">생년월일</label>
							<div>
								<span>${buyProdInfo.buyerInfo.member_birth }</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">회원등급</label>
							<div>
								<span>${buyProdInfo.buyerInfo.grade_name }</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">연락처</label>
							<div>
								<span>${buyProdInfo.buyerInfo.member_mobile }</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">이메일</label>
							<div>
								<span>${buyProdInfo.buyerInfo.member_email }</span>
							</div>
						</li>
						<li class="d-flex no-block card-body">
							<h4 class="card-title m-t-15" style="margin-top: 20px; margin-bottom: 20px;">배송지 정보</h4>
							<input type="hidden" name="destination_no" value="${buyProdInfo.destinationInfo.destination_no }"/>
							<input type="hidden" name="prodNo" value="${param.prodNo }"/>
						</li>
						<li class="d-flex no-block card-body border-top">
							<label class="col-md-2 m-t-15">배송지명</label>
							<div>
								<span id="destinationName">${buyProdInfo.destinationInfo.destination_nickname }</span>
								<input type="text" class="form-control" name="destination_nickname" id="destinationNameText" value="${buyProdInfo.destinationInfo.destination_nickname }" style="display: none; width:250px;" maxlength="20"/>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<button type="button" class="btn btn-warning btn-sm" onclick="destinationNameModify();">수정</button>
								</div>
							</div>
						</li>
						<li class="d-flex no-block card-body border-top">
							<label class="col-md-2 m-t-15">수령인</label>
							<div>
								<span id="destinationToUser">${buyProdInfo.destinationInfo.destination_toUser }</span>
								<input type="text" class="form-control" name="destination_toUser" id="destinationToUserText" value="${buyProdInfo.destinationInfo.destination_toUser }" style="display: none; width:250px;" maxlength="30"/>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<button type="button" class="btn btn-warning btn-sm" onclick="toUserModify();">수정</button>
								</div>
							</div>
						</li>
						<li class="d-flex no-block card-body border-top">
							<label class="col-md-2 m-t-15">배송지 연락처</label>
							<div>
								<span id="deliveryPhone">${buyProdInfo.destinationInfo.destination_mobile }</span>
								<input type="text" class="form-control" name="destination_mobile" id="deliveryPhoneText" value="${buyProdInfo.destinationInfo.destination_mobile }" style="display: none; width:250px;" maxlength="13"/>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<button type="button" class="btn btn-warning btn-sm" onclick="destinationPhoneModi();">수정</button>
								</div>
							</div>
						</li>
						<li class="d-flex no-block card-body border-top">
							<label class="col-md-2 m-t-15">배송지</label>
							<div>
								<span id="destinationAddr">(${buyProdInfo.destinationInfo.destination_zipCode }) ${buyProdInfo.destinationInfo.destination_address } ${buyProdInfo.destinationInfo.destination_addressDetail }</span>
								<div id="destinationAddrModify" style="display:none;">
									<input type="text" class="form-control" id="postcode" name="destination_zipCode" style="width:150px;" placeholder="우편번호" value="${buyProdInfo.destinationInfo.destination_zipCode }" readonly><br>
									<input type="text" class="form-control" id="address" name="destination_address" style="width:450px;" placeholder="주소" value="${buyProdInfo.destinationInfo.destination_address }" readonly><br>
									<input type="text" class="form-control" id="detailAddress" name="destination_addressDetail" placeholder="상세주소" value="${buyProdInfo.destinationInfo.destination_addressDetail }" maxlength="45">
								</div>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<button type="button" class="btn btn-warning btn-sm" onclick="sample6_execDaumPostcode();">수정</button>
								</div>
							</div>
						</li>
						<li class="d-flex no-block card-body border-top">
							<label class="col-md-2 m-t-15">배송메모</label>
							<div>
								<span id="destinationMemo">${buyProdInfo.destinationInfo.payment_deliveryMsg }</span>
								<input type="text" class="form-control" name="payment_deliveryMsg" id="destinationMemoText" value="${buyProdInfo.destinationInfo.payment_deliveryMsg }" style="display: none; width:450px;" maxlength="13"/>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<button type="button" class="btn btn-warning btn-sm" onclick="destinationMemoModi();">수정</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
               <div class="border-top">
                  <div class="card-body">
                     <span style="margin-right: 5px;">
                     <button type="submit" class="btn btn-success">변경사항저장</button>
                     </span>
                     <span style="margin-left: 5px;">
                     <button type="button" class="btn btn-light" onclick="location.reload();">취소</button>
                     </span>
                  </div>
               </div>
            </div>
            </form>
         </div>
         <div class="col-md-6">
            <form action="orderStatusModi" method="post">
            <div class="card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title m-b-0">주문/결제 금액 정보</h4>
					</div>
					<ul class="list-style-none">
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">주문번호</label>
							<div>
								<span>${buyProdInfo.payInfo.payment_no }</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">총 주문 금액</label>
							<div>
								<span><fmt:formatNumber value="${buyProdInfo.payInfo.buyProduct_totPrice }" pattern="#,###" />원</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">배송비</label>
							<div>
								<span><fmt:formatNumber value="${buyProdInfo.payInfo.buyProduct_deliveriPay }" pattern="#,###" />원</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">포인트 사용</label>
							<div>
								<span><fmt:formatNumber value="${buyProdInfo.payInfo.point_usedPoint }" pattern="#,###" />P</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">적립포인트</label>
							<div>
								<span><fmt:formatNumber value="${buyProdInfo.payInfo.point_futurePoint }" pattern="#,###" />P</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">결제방법</label>
							<div>
								<span>${buyProdInfo.payInfo.payInfo_way }</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">결제상태</label>
							<div>
								<span>${buyProdInfo.payInfo.payment_isComit }</span>
							</div>
						</li>
						<li class="d-flex no-block card-body border-bottom">
							<label class="col-md-2 m-t-15">주문일(결제일)</label>
							<div>
								<span><fmt:formatDate value="${buyProdInfo.payInfo.payment_date }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></span>
							</div>
						</li>
						<li class="d-flex no-block card-body">
							<h4 class="card-title m-t-15" style="margin-top: 20px; margin-bottom: 20px;">주문 정보 변경</h4>
							<input type="hidden" name="prodNo" value="${param.prodNo }"/>
						</li>
						<li class="d-flex no-block card-body border-top">
							<label class="col-md-2 m-t-15">배송 상태</label>
							<div>
								<span id="deliveryInfo">${buyProdInfo.orderStatusInfo.delivery_status }</span>
								<c:choose>
									<c:when test="${buyProdInfo.orderStatusInfo.delivery_status == '배송전' }">
										<select class="select form-control" name="deliveryInfo" id="deliveryInfoSelect" style="display : none;">
											<option value="orderDeliveryReady" selected>배송전</option>
											<option value="orderOnDelivery">배송중</option>
											<option value="orderDeliveryCompleted">배송완료</option>
		                        		</select>
									</c:when>
									<c:when test="${buyProdInfo.orderStatusInfo.delivery_status == '배송중' }">
										<select class="select form-control" name="deliveryInfo" id="deliveryInfoSelect" style="display : none;">
											<option value="orderDeliveryReady">배송전</option>
											<option value="orderOnDelivery" selected>배송중</option>
											<option value="orderDeliveryCompleted">배송완료</option>
		                        		</select>
									</c:when>
									<c:when test="${buyProdInfo.orderStatusInfo.delivery_status == '배송완료' }">
										<select class="select form-control" name="deliveryInfo" id="deliveryInfoSelect" style="display : none;">
											<option value="orderDeliveryReady">배송전</option>
											<option value="orderOnDelivery">배송중</option>
											<option value="orderDeliveryCompleted" selected>배송완료</option>
		                        		</select>
									</c:when>
									<c:otherwise>
										<select class="select form-control" name="deliveryInfo" id="deliveryInfoSelect" style="display : none;">
											<option value="orderDeliveryReady">배송전</option>
											<option value="orderOnDelivery">배송중</option>
											<option value="orderDeliveryCompleted">배송완료</option>
		                        		</select>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<button type="button" class="btn btn-warning btn-sm" onclick="deliveryInfoModi();">변경</button>
								</div>
							</div>
						</li>
						<li class="d-flex no-block card-body border-top">
							<label class="col-md-2 m-t-15">구매 확정</label>
							<div>
							<c:choose>
								<c:when test="${buyProdInfo.orderStatusInfo.payment_isComit == '결제완료' and buyProdInfo.orderStatusInfo.payment_isChecked == 'Y' }">
										<span id="purchaseStatus">구매확정완료</span>
								</c:when>
								<c:when test="${buyProdInfo.orderStatusInfo.payment_isComit != '결제완료' and buyProdInfo.orderStatusInfo.payment_isChecked == 'Y' }">
										<span id="purchaseStatus">구매취소</span>
								</c:when>
								<c:when test="${buyProdInfo.orderStatusInfo.payment_isComit != '결제완료' and buyProdInfo.orderStatusInfo.payment_isChecked != 'Y' }">
										<span id="purchaseStatus">구매취소</span>
								</c:when>
								<c:otherwise>
										<span id="purchaseStatus">구매확정전</span>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${buyProdInfo.orderStatusInfo.payment_isComit == '결제완료' and buyProdInfo.orderStatusInfo.payment_isChecked != 'Y' }">
									<select class="select form-control" name="purchaseStatus" id="purchaseStatusSelect" style="display : none;">
										<option value="purchaseConfirmationBefore" selected>구매확정전</option>
										<option value="purchaseConfirmation">구매확정완료</option>
	                        		</select>
								</c:when>
								<c:when test="${buyProdInfo.orderStatusInfo.payment_isComit == '결제완료' and buyProdInfo.orderStatusInfo.payment_isChecked == 'Y' }">
									<select class="select form-control" name="purchaseStatus" id="purchaseStatusSelect" style="display : none;">
										<option value="purchaseConfirmationBefore">구매확정전</option>
										<option value="purchaseConfirmation" selected>구매확정완료</option>
	                        		</select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="purchaseStatus" value="noChange" />
								</c:otherwise>
							</c:choose>
							</div>
							<c:choose>
								<c:when test="${buyProdInfo.orderStatusInfo.payment_isComit == '결제완료' and buyProdInfo.orderStatusInfo.payment_isChecked == 'Y' }">
									<div class="ml-auto">
										<div class="tetx-right">
											<button type="button" class="btn btn-warning btn-sm" onclick="purchaseStatusModi();">변경</button>
										</div>
									</div>
								</c:when>
								<c:when test="${buyProdInfo.orderStatusInfo.payment_isComit == '결제완료' and buyProdInfo.orderStatusInfo.payment_isChecked != 'Y' }">
									<div class="ml-auto">
										<div class="tetx-right">
											<button type="button" class="btn btn-warning btn-sm" onclick="purchaseStatusModi();">변경</button>
										</div>
									</div>
								</c:when>
							</c:choose>
						</li>
						<c:choose>
							<c:when test="${buyProdInfo.orderRequestInfo == 'noRequest' }">
								<li class="d-flex no-block card-body border-top">
									<label class="col-md-2 m-t-15">고객요청</label>
									<div>
										<span>없음</span>
										<input type="hidden" name="csStatus" value="noRequest" />
									</div>
								</li>
							</c:when>
							<c:otherwise>
								<li class="d-flex no-block card-body border-top">
									<label class="col-md-2 m-t-15">고객요청</label>
									<div>
										<c:choose>
											<c:when test="${buyProdInfo.orderRequestInfo.refundnExchange_status == '주문취소요청'}">
											<p>
											<select class="select form-control" name="csStatus" id="csStatusSelect" style="display : none;">
												<option value="noRequest">---선택---</option>
												<option value="csCancelCompleted">주문취소완료</option>
												<option value="csChangeCompleted">교환완료</option>
												<option value="csRefundCompleted">환불완료</option>
			                        		</select>
			                        		</p>
											</c:when>
											<c:when test="${buyProdInfo.orderRequestInfo.refundnExchange_status == '교환요청'}">
											<p>
											<select class="select form-control" name="csStatus" id="csStatusSelect" style="display : none;">
												<option value="noRequest">---선택---</option>
												<option value="csCancelCompleted">주문취소완료</option>
												<option value="csChangeCompleted">교환완료</option>
												<option value="csRefundCompleted">환불완료</option>
			                        		</select>
			                        		</p>
											</c:when>
											<c:when test="${buyProdInfo.orderRequestInfo.refundnExchange_status == '환불요청'}">
											<p>
											<select class="select form-control" name="csStatus" id="csStatusSelect" style="display : none;">
												<option value="noRequest">---선택---</option>
												<option value="csCancelCompleted">주문취소완료</option>
												<option value="csChangeCompleted">교환완료</option>
												<option value="csRefundCompleted">환불완료</option>
			                        		</select>
			                        		</p>
											</c:when>
											<c:otherwise>
												<input type="hidden" name="csStatus" value="noRequest" />
											</c:otherwise>
										</c:choose>
										<p><strong>요청사항 / 처리결과 : </strong></p>
										<p>${buyProdInfo.orderRequestInfo.refundnExchange_status }</p>
										<p><strong>사유 : </strong></p>
										<p>${buyProdInfo.orderRequestInfo.refundnExchange_reason }</p>
										<p><strong>요청날짜 : </strong></p>
										<p><fmt:formatDate value="${buyProdInfo.orderRequestInfo.refundnExchange_date }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></p>
										<p><strong>처리날짜 : </strong></p>
										<p>
										<c:choose>
											<c:when test="${buyProdInfo.orderRequestInfo.refundnExchange_isChecked == 'Y' }">
												<fmt:formatDate value="${buyProdInfo.orderRequestInfo.refundnExchange_checkedDate }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" />
											</c:when>
											<c:otherwise>
												0000-00-00 00:00:00
											</c:otherwise>
										</c:choose>
										</p>
									</div>
									<c:if test="${buyProdInfo.orderRequestInfo.refundnExchange_status == '주문취소요청'}">
										<div class="ml-auto">
											<div class="tetx-right">
												<button type="button" class="btn btn-warning btn-sm" onclick="csStatusModi();">요청처리</button>
											</div>
										</div>
									</c:if>
									<c:if test="${buyProdInfo.orderRequestInfo.refundnExchange_status == '교환요청'}">
										<div class="ml-auto">
											<div class="tetx-right">
												<button type="button" class="btn btn-warning btn-sm" onclick="csStatusModi();">요청처리</button>
											</div>
										</div>
									</c:if>
									<c:if test="${buyProdInfo.orderRequestInfo.refundnExchange_status == '환불요청'}">
										<div class="ml-auto">
											<div class="tetx-right">
												<button type="button" class="btn btn-warning btn-sm" onclick="csStatusModi();">요청처리</button>
											</div>
										</div>
									</c:if>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
               <div class="border-top">
                  <div class="card-body">
                     <span style="margin-right: 5px;">
                     <button type="submit" class="btn btn-success">변경사항저장</button>
                     </span>
                     <span style="margin-left: 5px;">
                     <button type="button" class="btn btn-light" onclick="location.reload();">취소</button>
                     </span>
                  </div>
               </div>
            </div>
            </form>
         </div>
         <div class="col-md-12">
         	<div class="card">
               <div class="card-body">
                  <div class="table-responsive">
                     <div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                        <div class="row">
                           <div class="col-sm-12">
                              <h4 class="page-title">주문 상품 내역</h4>
                              <table class="table table-striped table-bordered dataTable" style="font-size: 13px;">
                              <thead>
                                 <tr role="row">
                                    <th style="font-weight: bold; width: 50px;">상품번호</th>
                                    <th style="font-weight: bold; width: 80px;">카테고리</th>
                                    <th style="font-weight: bold; width: 100px;">상품명</th>
                                    <th style="font-weight: bold; width: 100px;">제조사</th>
                                    <th style="font-weight: bold; width: 50px;">주문수량</th>
                                    <th style="font-weight: bold; width: 80px;">상품가격</th>
                                    <th style="font-weight: bold; width: 80px;">총 금액</th>
                                    <th style="font-weight: bold; width: 50px;">상품관리</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach var="orderInfo" items="${buyProdInfo.orderProductInfo }">
                                 <tr role="row">
                                    <td>${orderInfo.product_id }</td>
                                    <td>${orderInfo.mainCategory_content } - ${orderInfo.middleCategory_content }</td>
                                    <td>${orderInfo.product_name }</td>
                                    <td>${orderInfo.product_factory }</td>
                                    <td>${orderInfo.buyProduct_qty }</td>
                                    <td><fmt:formatNumber value="${orderInfo.product_sellPrice }" pattern="#,###" />원</td>
                                    <td><fmt:formatNumber value="${orderInfo.buyProduct_totPrice }" pattern="#,###" />원</td>
                                    <td><button type="button" class="btn btn-secondary btn-sm" onclick="window.open('/admin/productModify?product_id=${orderInfo.product_id}')">상품 관리 이동</button></td>
                                 </tr>
                                 </c:forEach>
                              </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<%@ include file="adminFooter.jsp"%>
</div>
</body>
</html>