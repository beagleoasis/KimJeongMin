<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link href="../resources/adminDist/css/bootstrap.min.css" type="text/css">
<link href="../resources/adminDist/css/font-awesome.min.css" type="text/css">
<link href="../resources/adminDist/css/elegant-icons.css" type="text/css">
<link href="../resources/adminDist/css/jquery-ui.min.css" type="text/css">
<link href="../resources/adminDist/css/magnific-popup.css" type="text/css">
<link href="../resources/adminDist/css/owl.carousel.min.css" type="text/css">
<link href="../resources/adminDist/css/slicknav.min.css" type="text/css">
<link href="../resources/adminDist/css/style.css" type="text/css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css" href="../resources/adminAssets/libs/quill/dist/quill.snow.css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">

<!-- js -->
<script src="../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script src="../resources/adminAssets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="../resources/adminAssets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../resources/adminAssets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../resources/adminAssets/extra-libs/sparkline/sparkline.js"></script>
<script src="../resources/adminDist/js/waves.js"></script>
<script src="../resources/adminDist/js/sidebarmenu.js"></script>
<script src="../resources/adminDist/js/custom.min.js"></script>
<script src="../resources/adminAssets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="../resources/adminDist/js/pages/mask/mask.init.js"></script>
<script src="../resources/adminAssets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="../resources/adminAssets/libs/select2/dist/js/select2.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script src="../resources/adminAssets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script src="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script src="../resources/adminAssets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/adminAssets/libs/quill/dist/quill.min.js"></script>

<script>
	let pageNo = '${param.page}';
	
	function genderTotalCheckBoxCtl() {
		$("#genderTotal").change(function() {
			if($("#genderTotal").prop("checked")) {
	 			$("#female").prop("checked", true);
	 			$("#male").prop("checked", true);
	 		} else {
	 			$("#female").prop("checked", false);
	 			$("#male").prop("checked", false);
	 		}
		});
	}
	
	function eachGenderCheckBoxCtl() {
		$("#female").change(function() {
			if($("#male").prop("checked")) {
				$("#genderTotal").prop("checked", true);
			}
			
			if(!$("#female").prop("checked")) {
				$("#genderTotal").prop("checked", false);
			}
		});
		
		$("#male").change(function() {
			if($("#female").prop("checked")) {
				$("#genderTotal").prop("checked", true);
			} 
			
			if(!$("#male").prop("checked")) {
				$("#genderTotal").prop("checked", false);
			}
		});
	}
	
	function gradeTotalCheckBoxCtl() {
		$("#gradeTotal").change(function() {
			if($("#gradeTotal").prop("checked")) {
				$("#A").prop("checked", true);	
				$("#B").prop("checked", true);	
				$("#C").prop("checked", true);	
				
				$("#AResult").val("A");
				$("#BResult").val("B");
				$("#CResult").val("C");
			} else {
				$("#A").prop("checked", false);	
				$("#B").prop("checked", false);	
				$("#C").prop("checked", false);
				
// 				$("#AResult").val("");
// 				$("#BResult").val("");
// 				$("#CResult").val("");
			}
		});
	}
	
	function eachGradeCheckBoxCtl() {
		$("#A").change(function() {
			if($("#B").prop("checked") && $("#C").prop("checked")) {
				$("#gradeTotal").prop("checked", true);
			}
			
			if(!$("#A").prop("checked")) {
				$("#gradeTotal").prop("checked", false);
				$("#AResult").val("");
			} else {
				$("#AResult").val("A");
			}
		});
		
		$("#B").change(function() {
			if($("#A").prop("checked") && $("#C").prop("checked")) {
				$("#gradeTotal").prop("checked", true);
			}
			
			if(!$("#B").prop("checked")) {
				$("#gradeTotal").prop("checked", false);
				$("#BResult").val("");
			} else {
				$("#BResult").val("B");
			}
		});
		
		$("#C").change(function() {
			if($("#A").prop("checked") && $("#B").prop("checked")) {
				$("#gradeTotal").prop("checked", true);
			}
			
			if(!$("#C").prop("checked")) {
				$("#gradeTotal").prop("checked", false);
				$("#CResult").val("");
			} else {
				$("#CResult").val("C");
			}
		});
	}
	
	function changeUnit() {
		$("#PriceOption").change(function() {
			if($("#PriceOption").val() == "puchasePrice") {
				$("#unit").html("원");
			} else if($("#PriceOption").val() == "point") {
				$("#unit").html("point");
			}
		});
	}
// 	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 체크박스 유효성^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	let date = new Date();
	let todayDate = date.toISOString().substring(0,10);
	
	function today() {
		$("#checkLowDate").val(todayDate);
		$("#checkHighDate").val(todayDate);
	}
	
	function yesterday() {
		let yesterdayMili = new Date(date.setDate(date.getDate() -1));
		let yesterday = yesterdayMili.toISOString().substring(0,10);
		$("#checkLowDate").val(yesterday);
		$("#checkHighDate").val(todayDate);
	}
	
	function threeDaysAgo() {
		let threeDaysMili = new Date(date.setDate(date.getDate() -3));
		let threeDaysAgo = threeDaysMili.toISOString().substring(0,10);
		$("#checkLowDate").val(threeDaysAgo);
		$("#checkHighDate").val(todayDate);
	}
	
	function sevenDaysAgo() {
		let sevenDaysMili = new Date(date.setDate(date.getDate() -7));
		let sevenDaysAgo = sevenDaysMili.toISOString().substring(0,10);
		$("#checkLowDate").val(sevenDaysAgo);
		$("#checkHighDate").val(todayDate);
	}
	
	function halfMonthAgo() {
		let halfMonthMili = new Date(date.setDate(date.getDate() -15));
		let halfMonthAgo = halfMonthMili.toISOString().substring(0,10);
		$("#checkLowDate").val(halfMonthAgo);
		$("#checkHighDate").val(todayDate);
	}
	
	function monthAgo() {
		let monthMili = new Date(date.setMonth(date.getMonth() -1));
		let monthAgo = monthMili.toISOString().substring(0,10);
		$("#checkLowDate").val(monthAgo);
		$("#checkHighDate").val(todayDate);
	}
	
	function threeMonthAgo() {
		let threeMonthMili = new Date(date.setMonth(date.getMonth() -3));
		let threeMonthAgo = threeMonthMili.toISOString().substring(0,10);
		$("#checkLowDate").val(threeMonthAgo);
		$("#checkHighDate").val(todayDate);
	}
	
	function sixMonthAgo() {
		let sixMonthMili = new Date(date.setMonth(date.getMonth() -6));
		let sixMonthAgo = sixMonthMili.toISOString().substring(0,10);
		$("#checkLowDate").val(sixMonthAgo);
		$("#checkHighDate").val(todayDate);
	}
	
	function checkAll() {
		console.log($("#memberOption").val());
		console.log($("#memberOptionSearchWord").val());
		
		console.log($("#dateOption").val());
		console.log($("#checkLowDate").val());
		console.log($("#checkHighDate").val());
		
		console.log($("#PriceOption").val());
		console.log($("#checkHighNum").val());
		console.log($("#checkLowNum").val());
		
		if($("#female").prop("checked") && !$("#male").prop("checked")) {
			$("#genderResult").val("여");
		} else if(!$("#female").prop("checked") && $("#male").prop("checked")){
			$("#genderResult").val("남");
		} else {
			$("#genderResult").val("all");
		}
		console.log($("#genderResult").val());

		console.log($("#AResult").val());
		console.log($("#BResult").val());
		console.log($("#CResult").val());
		
		return true;
	}
	
// 	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 검색 유효성 검사^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	$(document).ready(function() {
		console.log('${paging}');
		
		genderTotalCheckBoxCtl();
		eachGenderCheckBoxCtl();
		
		gradeTotalCheckBoxCtl();
		eachGradeCheckBoxCtl();
		
		changeUnit();
	});
	
// 	vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv 회원 리스트 수정/삭제 vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
	
	function showBtns(obj) {
		let no = $(obj).attr("id");
		
		$("#btns" + no).toggle();
	}
	
	function delMember(member_id) {
		
		$.ajax({
			url: '/admin/deleteMember/' + member_id,
			data : {member_id : member_id},
			dataType : 'text', // 응답 받을 형식
			type : 'get',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				
				if(pageNo.length == 0) {
					pageNo = 1;
				}
				
				location.href="./memberList?page=" + pageNo; 
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function showModi(no) {
		$("#spName" + no).hide();
		$("#spTotPoint" + no).hide();
		$("#inputName" + no).show();
		$("#inputTotPoint" + no).show();
		
		$("#btns" + no).hide();
		$("#modiBtns" + no).show();		
	}
	
	function modiMember(no) {
		console.log(no);
		
		let member_name = $("#member_name" + no).val();
		let member_totPoint = $("#member_totPoint" + no).val();
		let member_id = $("#id" + no).html();
		
		console.log(member_name);
		console.log(member_totPoint);
		console.log(member_id);
		
		$.ajax({
			url: '/admin/modifyMember',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({
				member_id : member_id, 
				member_name : member_name,
				member_totPoint : member_totPoint
			}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				
				if(pageNo.length == 0) {
					pageNo = 1;
				}
				
				location.href="./memberList?page=" + pageNo; 
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function chagneModi(no) {
		$("#spName" + no).show();
		$("#spTotPoint" + no).show();
		$("#inputName" + no).hide();
		$("#inputTotPoint" + no).hide();
		
		$("#modiBtns" + no).hide();		
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
<%-- <%@ include file="adminTop.jsp"%> --%>
<%@ include file="adminAside.jsp"%>
<div class="page-wrapper">
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">회원 관리</h4>
				<div class="ml-auto text-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">홈</a></li>
							<li class="breadcrumb-item active" aria-current="page">주문목록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<form action="memberSearch?page=${param.page }" method="get">
				<div class="card">
					<div class="card-body">
						<div class="form-group row">
							<label class="col-md-1 m-t-15">회원 검색</label>
							<div class="col-md-1">
								<select class="select form-control" name="memberOption"  id="memberOption" style="height:36px;">
									<optgroup label="-검색항목선택-">
										<option value="name">이름</option>
										<option value="id">아이디</option>
										<option value="email">이메일</option>
										<option value="mobile">휴대전화</option>
									</optgroup>
								</select>
							</div>
							<div class="col-md-3">
							    <input type="text" class="form-control" name="memberOptionSearchWord" id="memberOptionSearchWord">
							</div>
							<div class="col-md-7"></div>
						</div>
						<div class="form-group row">
						    <label class="col-md-1">생년월일 / 가입일</label>
						    <div class="col-md-1">
								<select class="select form-control" name="dateOption" id="dateOption" style="height:36px;">
									<optgroup label="-검색항목선택-">
										<option value="birth">생년월일</option>
										<option value="registDate">가입일</option>
									</optgroup>
								</select>
							</div>
						    <div class="col-md-7">
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="today();">오늘</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="yesterday();">어제</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="threeDaysAgo();">3일</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="sevenDaysAgo();">7일</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="halfMonthAgo();">15일</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="monthAgo();">1개월</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" onclick="threeMonthAgo();">3개월</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" onclick="sixMonthAgo();">6개월</button>
							    <input type="date" id="checkLowDate" name="checkLowDate" />
							    <span>~</span>
							    <input type="date" id="checkHighDate" name="checkHighDate" />
<!-- 							    <div id="checkOrderDate"> -->
<!-- 								    <input type="hidden" value="" name="checkDate"/> -->
<!-- 								    <input type="hidden" value="" name="checkLowDate"/> -->
<!-- 								    <input type="hidden" value="" name="checkHighDate"/> -->
<!-- 							    </div> -->
						    </div>
						    <div class="col-md-4"></div>
						</div>
						<div class="form-group row">
						    <label class="col-md-1">누적 금액 / 포인트</label>
						    <div class="col-md-1">
								<select class="select form-control" name="PriceOption" id="PriceOption" style="height:36px;">
									<optgroup label="-검색항목선택-">
										<option value="puchasePrice">누적 금액</option>
										<option value="point">포인트</option>
									</optgroup>
								</select>
							</div>
						    <div class="col-md-7">
							    <input type="number" id="checkLowNum" name="checkLowNum" onchange="" placeholder="최소 금액"/>
							    <span>~</span>
							    <input type="number" id="checkHighNum" name="checkHighNum" onchange="" placeholder="최대 금액"/> <span id="unit">원</span>
<!-- 							    <div id="checkOrderDate"> -->
<!-- 								    <input type="hidden" value="" name="checkNum"/> -->
<!-- 								    <input type="hidden" value="" name="checkLowNum"/> -->
<!-- 								    <input type="hidden" value="" name="checkHighNum"/> -->
<!-- 							    </div> -->
						    </div>
						    <div class="col-md-4"></div>
						</div>
						<div class="form-group row">
							<label class="col-md-1 m-t-15">성별</label>
							<input type="hidden" name="genderResult" id="genderResult" value="all">
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" id="genderTotal">
								    <label class="custom-control-label" for="genderTotal">전체</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" id="female">
								    <label class="custom-control-label" for="female">여성</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" id="male">
								    <label class="custom-control-label" for="male">남성</label>
								</div>
							</div>
							<div class="col-md-9"></div>
						</div>
						<div class="form-group row">
							<label class="col-md-1 m-t-15">회원 등급</label>
							<input type="hidden" name="AResult" id="AResult" value="">
							<input type="hidden" name="BResult" id="BResult" value="">
							<input type="hidden" name="CResult" id="CResult" value="">
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" id="gradeTotal">
								    <label class="custom-control-label" for="gradeTotal">전체</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" id="A">
								    <label class="custom-control-label" for="A">A등급</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" id="B">
								    <label class="custom-control-label" for="B">B등급</label>
								</div>
							</div>
							<div class="col-ms" style="margin-right: 15px;">
								<div class="custom-control custom-checkbox">
								    <input type="checkbox" class="custom-control-input" id="C">
								    <label class="custom-control-label" for="C">C등급</label>
								</div>
							</div>
							<div class="col-md-6"></div>
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<span style="margin-right: 5px;">
							<button type="submit" class="btn btn-primary" onclick="return checkAll();">검색</button>
							</span>
							<span style="margin-left: 5px;">
							<button type="button" class="btn btn-light" onclick="location.href='/admin/memberList?page=1'">초기화</button>
							</span>
						</div>
					</div>
				</div>
				</form>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped table-bordered dataTable" style="font-size: 13px;">
										<thead>
											<tr role="row">
												<th style="font-weight: bold; width: 100px;">이름</th>
												<th style="font-weight: bold; width: 150px;">아이디</th>
												<th style="font-weight: bold; width: 150px;">등급</th>
												<th style="font-weight: bold; width: 150px;">생년월일</th>
												<th style="font-weight: bold; width: 150px;">주소</th>
												<th style="font-weight: bold; width: 150px;">이메일</th>
												<th style="font-weight: bold; width: 150px;">휴대번호</th>
												<th style="font-weight: bold; width: 150px;">누적사용금액</th>
												<th style="font-weight: bold; width: 75px;">보유 포인트</th>
												<th style="font-weight: bold; width: 180px;">회원 등록일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="memberList" items="${members }" varStatus="status">
											<tr role="row" >
												<td id="name${status.index }">
													<span id="spName${status.index }"><a href="javascript:void(0);" id="${status.index }" onclick="showBtns(this);">${memberList.member_name }</a></span>
													<span id="inputName${status.index }" style="display:none"><input type='text' id='member_name${status.index }' value='${memberList.member_name }' /></span>
												</td>
												<td id="id${status.index }">${memberList.member_id }</td>
												<td>${memberList.grade_name }</td>
												<td><fmt:formatDate value="${memberList.member_birth }" pattern="yyyy-MM-dd" /></td>
												<td>(${memberList.member_postCode}) <br/> ${memberList.member_addr }</td>
												<td>${memberList.member_email }</td>
												<td>${memberList.member_mobile }</td>
												<td>
												<fmt:formatNumber value="${memberList.member_payment }" type="number" maxFractionDigits="3" /> 원
												</td>
												<td>
													<span id="spTotPoint${status.index }"><fmt:formatNumber value="${memberList.member_totPoint }" type="number" maxFractionDigits="3" /></span>
													<span id="inputTotPoint${status.index }" style="display:none"><input type='number' id='member_totPoint${status.index }' value='${memberList.member_totPoint }' /></span>
													Point
												</td>
												<td><fmt:formatDate value="${memberList.member_registerDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											</tr>
											<tr role="row" style="display:none" id="btns${status.index }">
												<td colspan="10">													
													<input type="submit" value="수정" onclick="showModi('${status.index}')" />
													<input type="button" value="삭제" onclick="delMember('${memberList.member_id }');">
												</td>
											</tr>
											<tr role="row" style="display:none" id="modiBtns${status.index }">
												<td colspan="10">													
													<input type="submit" value="저장" onclick="modiMember('${status.index}')" />
													<input type="button" value="취소" onclick="chagneModi('${status.index}');">
												</td>
											</tr>
											
											</c:forEach>
										</tbody>
                                    </table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5"></div>
									<div class="col-sm-12 col-md-7">
										<div>
											<ul class="pagination">
												<c:if test="${paging.prev }">
												<li class="page-item">
													<a class="page-link" href="./memberList?page=${paging.cri.page - 1}" aria-label="Previous">
														<span aria-hidden="true">«</span>
														<span class="sr-only">Previous</span>
													</a>
												</li>
												</c:if>
												<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNo">
												<li class="page-item active">
													<a href="./memberList?page=${pageNo}" class="page-link">${pageNo }</a>
												</li>
												</c:forEach>
												<c:if test="${paging.next }">
												<li class="page-item">
													<a class="page-link" href="./memberList?page=${paging.cri.page + 1}" aria-label="Next">
														<span aria-hidden="true">»</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
												</c:if>
											</ul>
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
</div>
<%@ include file="adminFooter.jsp"%>
</div>
</body>
</html>