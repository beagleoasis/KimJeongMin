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
const date = new Date();
//console.log(date);

// 메인 카테고리 select 박스를 ajax 방식으로 출력
function selectMainCategories() {
	let output = '<select class="select form-control" id="checkOption" style="height:36px;" onchange="getMainCate(this);")><optgroup label="-검색항목선택-"><option value="mainCategory_id">- 카테고리 대분류 -</option>';
				
					$.ajax({
						method: "get",
					  url: "/admin/getMainCategories",
					  headers: {	// 요청하는 데이터의 헤더에 전송
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "GET"
					  },
					  success : function(data) {

					      //console.log(data);
					      
					      let mainCategory = data.mainCategories;
					      
					      console.log(mainCategory);
					      $(mainCategory).each(function(index, item) {
					    	  
					    	  output += '<option value="' + item.mainCategory_id + '">' + item.mainCategory_content + '</option>';
					    	  
					      }); // end of foreach

						  output += '</optgroup></select>';
						  $("#selectMainCategories").html(output);
					  }
					  
					}); // end of ajax
}




//메인카테고리의 셀렉트박스가 선택되었을 때, 해당 카테고리의 id로 미들 카테고리 출력
function getMainCate(obj) {
	let mainCategory_id = $("#checkOption option:selected").val();
	//console.log(mainCategory_id);
	let output1 = '<select class="select form-control" id="checkMidle" style="height:36px;" onchange="getMidCate(this);")><optgroup label="-검색항목선택-"><option value="middleCategory_id">- 카테고리 중분류 -</option>';
	$.ajax({
		method: "get",
	  	url: "/admin/getMiddleCategories",
	  	headers: {	// 요청하는 데이터의 헤더에 전송
		  "Content-Type" : "application/json",
		  "X-HTTP-Method-Override" : "GET"
	  }, 
	  data		:  {
  		'mainCategory_id' : mainCategory_id
		}, 
	  success : function(data) {

	      console.log(data);
	      
	      let middleCategory = data.middleCategories;
	      
	      console.log(middleCategory);
	      $(middleCategory).each(function(index, item) {
	    	  
	    	  output1 += '<option value="' + item.middleCategory_id + '">' + item.middleCategory_content + '</option>';
	    	  
	      }); // end of foreach
	      output1 += '</optgroup></select>';
		  $("#selectMiddleCategories").html(output1);
		  // body에 input type hidden 부분에 form태그 전송을 위한 value 넣기
		  $('input[name=mainCategory_id]').attr('value',mainCategory_id);
	  }
	  
	}); // end of ajax
}

// 하위 카테고리 가져오는 함수
function getMidCate(obj) {
	let middleCategory_id = $("#checkMidle option:selected").val();
	console.log(middleCategory_id);
	// body에 input type hidden 부분에 form태그 전송을 위한 value 넣기
	$('input[name=middleCategory_id]').attr('value',middleCategory_id);
}

// 문자열을 Date형으로 변환하는 함수
function stringToDate(date) {
	let sYear = date.substring(0,4);
    let sMonth = date.substring(5,7);
    let sDate = date.substring(8,10);

    //alert("sYear :"+sYear +"   sMonth :"+sMonth + "   sDate :"+sDate);
    return new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
}

// Date형을 문자열로 바꿔주는 함수
function getDateStr(myDate){
	var Year = myDate.getFullYear();
	var Month = (myDate.getMonth() + 1);
	var Day = myDate.getDate();
	
	Month = (Month < 10) ? "0" + String(Month) : Month;
	Day = (Day < 10) ? "0" + String(Day) : Day;
	
	return  Year + '-' + Month + '-' + Day;
}

// 현재시간으로부터 일주일 전 날짜 구하는 함수
function lastWeek() {
	  let d = new Date();
	  let dayOfMonth = d.getDate();
	  d.setDate(dayOfMonth - 7);
	  return getDateStr(d);
	}
	
// 현재시간으로부터 1달 전 날짜를 구하는 함수
function lastMonth() {
	  let d = new Date();
	  let monthOfYear = d.getMonth();
	  d.setMonth(monthOfYear - 1);
	  return getDateStr(d);
	}

// 현재시간으로부터 3달 전 날짜를 구하는 함수
function lastThreeMonth() {
	let d = new Date();
	  let monthOfYear = d.getMonth();
	  d.setMonth(monthOfYear - 3);
	  return getDateStr(d);
}

// 현재시간으로부터 1년 전 날짜를 구하는 함수
function lastYear() {
	let d = new Date();
	let lastOfYear = d.getFullYear();
	d.setFullYear(lastOfYear - 1);
	  return getDateStr(d);
}

// 날짜 유효성 검사
function checkDate(Date, obj) {
	console.log(obj);
	//스트링 형식의 날짜를 잘라서 비교하기 위한 변수 선언
	let lowDate = $("#checkLowDate").val();
	console.log(typeof("lowDate : " + lowDate));
	let lowDateCheck = stringToDate(lowDate);
	console.log(lowDateCheck);
	
	let highDate = $("#checkHighDate").val();
	console.log("highDate : " + highDate);
	let highDateCheck = stringToDate(highDate);
	console.log(highDateCheck);
	
	let dateDiff = Math.ceil(lowDateCheck.getTime() - highDateCheck.getTime());
	console.log("dateDiff : " + dateDiff);
	
	
	
	
	// 버튼 형식의 날짜지정 처리 부분
	let today = $("#today").val(); 
	console.log(today);
	
	if(dateDiff >= 0){
		//alert("날짜를 올바르게 설정해주세요.");
		//location.reload();
	}
	
	// 날짜 범위에 따른 분류
	if(Date == "checkLowDate"){
		//alert("checkLowDate");
		$("#checkLowDateSave").val(getDate(lowDateCheck));
	}
	else if(Date == "checkHighDate"){
		//alert("checkHighDate");
		$("#checkHighDateSave").val(getDate(highDateCheck));
	}else if(Date =="today"){
		//alert("today");
		 $("#checkLowDateSave").val(getDate(date)); 
	}else if(Date =="week"){
		//alert("week");
		$("#checkLowDateSave").val(lastWeek());
	}else if(Date =="month"){
		//alert("month");
		$("#checkLowDateSave").val(lastMonth());
	}else if(Date =="threeMonth"){
		//alert("threeMonth");
		$("#checkLowDateSave").val(lastThreeMonth());
	}else if(Date =="oneYear"){
		//alert("oneYear");
		$("#checkLowDateSave").val(lastYear());
	}
}

// Date 날짜 형식을 string(yyyy-mm-dd)으로 변환
function getDate(date){
    let year = date.getFullYear();
    let month = ("0" + (1 + date.getMonth())).slice(-2);
    let day = ("0" + date.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}

// 선택된 체크박스 리스트 가져온후 삭제 처리
function getCheckBoxList() {
	let size = document.getElementsByName("chk").length;
	console.log(typeof(size));
	console.log(size);
	let arr = [];
	
	let sum = 0;
	//check이름을 가진 check중에서 체크된 것만 값 가져오기
    for(var i = 0; i < size; i++){
        if(document.getElementsByName("chk")[i].checked == true){
            console.log(document.getElementsByName("chk")[i].value);
            // 배열에 해당하는 값 넣어주기
            arr.push(document.getElementsByName("chk")[i].value);
            
            // 총 개수 더해주기
            sum += 1;
        }
    }
	
	// 체크된 것이 있다면, 삭제 버튼을 눌렀을 때 확인한다.
	if(sum > 0){
	
	// 삭제 여부를 확인
	if(confirm("해당 게시물을 삭제하시겠습니까?")) {
	
	$.ajax({
		method: "get",
	  	url: "/admin/deleteProdList",
	  	headers: {	// 요청하는 데이터의 헤더에 전송
		  "Content-Type" : "application/json",
		  "X-HTTP-Method-Override" : "GET"
	  }, 
	  data		:  {
  		'prodList' : arr
		}, 
	  success : function(data) {

	      console.log(data);
	      
	      location.reload();
	  }
	  
	}); // end of ajax

	} // end of if
	
	}
	
}
// function status() {
//     let status = "${status}"
    
//     if(status == "insertOk") {
//        $("#modalText").text("상품이 등록 되었습니다.")
//        $("#productModal").show();
//     } else if(status == "insertFail") {
//        $("#modalText").text("상품 등록에 실패하였습니다.")
//        $("#productModal").show();
//     } else if(status == "modiOk") {
//        $("#modalText").text("상품이 수정 되었습니다.")
//        $("#productModal").show();
//     } else if(status == "modiFail") {
//        $("#modalText").text("상품 수정에 실패하였습니다.");
//        $("#productModal").show();
//     }
//  }
 
 
	//쿼리문에서 해당 항목 값을 찾아주는 함수
	function getParameter(param) {
		var returnVal; //리턴할 값을 저장하는 변수
		var url = location.href; //url주소
		// console.log(url);
		var params = url.slice(url.indexOf("?") + 1, url.length).split("&");
		// console.log(params);

		for (var i in params) {
			var paraName = params[i].split("=")[0]; // 매개변수명 얻음
			if (param.toLowerCase() == paraName.toLowerCase()) {
				returnVal = params[i].split("=")[1];
				return decodeURIComponent(returnVal);
			}
		}

		return -1; // 모든 배열 요소를 다 검색해도 매개변수가 없을때
	}

	// 파라미터를 가져오기 위한 변수 선언
	let page= getParameter("page");
	let searchType = getParameter("searchType");
	let searchWord = getParameter("searchWord");
	let mainCategory_id = getParameter("mainCategory_id");
	let middleCategory_id = getParameter("middleCategory_id");
	let checkLowDate = getParameter("checkLowDate");
	let checkHighDate = getParameter("checkHighDate");
	let product_show = getParameter("product_show");
	console.log(page, searchType, searchWord, mainCategory_id, middleCategory_id, checkLowDate, checkHighDate, product_show);

	
		// 위 파라메터로 검색 조건 버튼을 유지하는 함수
		function showSelected() {
			if(page == -1){
				page = 1;
				$("#page" + page).attr("class", "page-item active");
			}
			else {
				$("#page" + page).attr("class", "page-item active");
				console.log(page);
			}
			
		
		// 검색어 유지 부분
		if(searchWord != -1){
			console.log(searchWord);
			console.log(typeof(searchWord));

			$("#searchWord").val(searchWord);
		}
		
		// select option 유지 부분
		console.log(searchType);
		if(searchType != -1){
			console.log("전체보기가 아니다.");
			$("#searchType").val(searchType).prop("selected", true);
		}
		
		/*// 메인 카테고리 유지 부분
		if(mainCategory_id != -1){
			console.log(mainCategory_id);
			console.log(typeof(mainCategory_id));
			console.log("메인카테고리를 선택했다!");
			$("#checkOption").val(mainCategory_id).prop("selected", true);
		}*/
	}

	
	
$(document).ready(function() {
	
    //최상단 체크박스 클릭
    $("#allChecked").click(function(){
        //클릭되었으면
        if($("#allChecked").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    });
    
    //메인 카테고리 목록을 ajax로 호출
    selectMainCategories();
	console.log(lastWeek());
// 	status();
	showSelected();
});

</script>


<style>

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

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
				<h4 class="page-title"  onclick="location.href='/admin/prodList?page=1'" style="cursor: pointer;">상품목록 게시판</h4>
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
				<div class="card">
				<!-- 검색을 위한 form 태그 시작 부분 -->
					<form  action="/admin/searchProdList" method="GET">
					<div class="card-body">
						<div class="form-group row">
							<label class="col-md-1 m-t-15">검색어</label>
							
							
							
							<div class="col-md-1" style="padding-left: 0px;">
								<select class="select form-control" id="searchType" name="searchType" style="height:36px;">
											<option value="searchAll">전체</option>
											<option value="product_name">상품명</option>
											<option value="product_factory">제조사명</option>
								</select>
								
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control" name="searchWord" id="searchWord" placeholder="검색어를 입력해주세요.">
								<!-- ajax로 가져온 mainCategory_id, middleCategory_id 값을 넣어놓는 부분 -->
								<input type="hidden" id="mainCategory_id" name="mainCategory_id" value="mainCategory_id"/>
								<input type="hidden" id="middleCategory_id" name="middleCategory_id" value="middleCategory_id"/>
								<!-- ajax로 가져온 mainCategory_id, middleCategory_id 값을 넣어놓는 부분 -->
							</div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary" id="goSearch">검색</button>&nbsp;<button type="button" class="btn btn-light" onclick="location.href='/admin/prodList?page=1'">초기화</button>
							</div>
							<div class="col-md-7"></div>
						</div>
						<div class="form-group row">
						    <label class="col-md-1  m-t-15">상품분류</label>
						    <!-- 대분류 카테고리 ajax 삽입 부분 -->
							    <div class="col-md-1.5" id="selectMainCategories">
									
									
								</div>
							<!-- 중분류 카테고리 ajax 삽입 부분 -->
								<div class="col-md-1.5" id="selectMiddleCategories">
									
									
								</div>
								
						    <div class="col-md-4"></div>
						</div>
						<div class="form-group row">
						    <label class="col-md-1">상품등록일</label>
						    <div class="col-md-7"  style="padding-left: 0px;">
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="today" onclick="checkDate('today', this);" value="today">오늘</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="week" onclick="checkDate('week', this);" value="week">7일</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="month" onclick="checkDate('month', this);" value="month">1개월</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 5px;" id="threeMonth" onclick="checkDate('threeMonth', this);" value="threeMonth">3개월</button>
							    <button type="button" class="btn btn-light btn-sm" style="margin-right: 10px;" id="oneYear" onclick="checkDate('oneYear', this);" value="halfYear">1년</button>
							    <input type="date" id="checkLowDate" name="" onchange="checkDate('checkLowDate', this);" value=""/>
							    <span>~</span>
							    <input type="date" id="checkHighDate" name="" onchange="checkDate('checkHighDate', this);" value=""/>
							    <div id="checkOrderDate">
								    <!-- <input type="hidden" value="" name="checkDate"/> -->
								    <input type="hidden" value="0000-00-00" name="checkLowDate" id="checkLowDateSave"/>
								    <input type="hidden" value="9999-12-31" name="checkHighDate" id="checkHighDateSave"/>
							    </div>
						    </div>
						    <div class="col-md-4"></div>
						</div>
						
						
						<div class="form-group row">
							<label class="col-md-1 m-t-15">진열상태</label>
							<div class="col-md-3" style="padding-left: 0px;">
								<input type="radio" name="product_show" value="all" checked="checked">전체&nbsp;&nbsp;&nbsp;<input type="radio" name="product_show" value="Y">진열&nbsp;&nbsp;&nbsp;<input type="radio" name="product_show" value="N">진열안함
							</div>
						</div>
					</div>
					</form>
				<!-- 검색을 위한 form 태그 종료 부분 -->
					
				</div>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
									<!-- 글쓰기 버튼 -->
									<div>
										<input type="button" class="btn btn-primary" value="삭제" onclick="getCheckBoxList();" style="margin-left: 10px; margin-bottom: 20px;">
										<input type="button" class="btn btn-primary" value="상품등록" onclick="location.href='/admin/prodRegister'" style="margin-right: 10px; margin-bottom: 20px; float: right;">
									</div>
									
							<div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
							
									
								<div class="row">
									<div class="col-sm-12">
										<c:choose>
											<c:when test="${pagingParam.totalCount != 0}">
											
											<table class="table table-striped table-bordered dataTable" style="font-size: 13px;">
											<thead>
												<tr role="row">
													<th style="font-weight: bold; width: 100px;"><input type="checkbox" name="chk" id="allChecked" value="allChecked" onclick=""/></th>
													<th style="font-weight: bold; width: 100px;">상품번호</th>
													<th style="font-weight: bold; width: 100px;">메인카테고리</th>
													<th style="font-weight: bold; width: 100px;">하위카테고리</th>
													<th style="font-weight: bold; width: 150px;">상품명</th>
													<th style="font-weight: bold; width: 75px;">판매가</th>
													<th style="font-weight: bold; width: 75px;">진열상태</th>
													<th style="font-weight: bold; width: 100px;">구매수량</th>
													<th style="font-weight: bold; width: 100px;">판매수량</th>
													<th style="font-weight: bold; width: 100px;">총수량</th>
													<th style="font-weight: bold; width: 100px;">제조사</th>
													<th style="font-weight: bold; width: 150px;">상품등록일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="board" items="${boardList }" varStatus="status">
													<c:choose>
														<c:when test="${board.product_isDelete == 'N' }">
															<tr role="row" onclick="location.href='/admin/productModify?product_id=${board.product_id}'" style="cursor: pointer;">
																<td onclick='event.cancelBubble=true;'><input type="checkbox" name="chk" id="${board.product_id }" value="${board.product_id }" onclick=""/></td>
																<td>${board.product_id }</td>
																<td>${board.mainCategory_id }</td>
																<td>${board.middleCategory_id }</td>
																<td>${board.product_name }</td>
																<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${board.product_sellPrice }" />&#8361;</td>
																<td>${board.product_show }</td>
																<td>${board.product_purchaseQty }</td>
																<td>${board.product_saleQty }</td>
																<td>${board.product_totQty }</td>
																<td>${board.product_factory }</td>
																<td><fmt:formatDate value="${board.product_date }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /></td>
															</tr>
														</c:when>
													</c:choose>
												</c:forEach>
											</tbody>
	                                    </table>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<div style="text-align: center;"><h4>검색 결과가 없습니다.</h4></div>
	                                    </c:otherwise>
									</c:choose>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-4"></div>
									<div class="col-sm-12 col-md-7">
										<div>
											<ul class="pagination">
											<c:choose>
               									<c:when test="${SearchCriteria.searchType != null}">
												<c:if test="${pagingParam.prev }">
												<li class="page-item">
													<a class="page-link" href="searchProdList?page=${param.page -1 }&searchType=${SearchCriteria.searchType }&searchWord=${SearchCriteria.searchWord }&mainCategory_id=${dto.mainCategory_id}&middleCategory_id=${dto.middleCategory_id}&checkLowDate=${dto.checkLowDate}&checkHighDate=${dto.checkHighDate}&product_show=${dto.product_show}" aria-label="Previous">
														<span aria-hidden="true">«</span>
														<span class="sr-only">Previous</span>
													</a>
												</li>
												</c:if>
												<c:forEach begin="${pagingParam.startPage }" end="${pagingParam.endPage }" var="pageNo">
												<li id="page${pageNo }" class="page-item">
													<a href="searchProdList?page=${pageNo }&searchType=${SearchCriteria.searchType }&searchWord=${SearchCriteria.searchWord }&mainCategory_id=${dto.mainCategory_id}&middleCategory_id=${dto.middleCategory_id}&checkLowDate=${dto.checkLowDate}&checkHighDate=${dto.checkHighDate}&product_show=${dto.product_show}" class="page-link">${pageNo }</a>
												</li>
												</c:forEach>
												<c:if test="${pagingParam.next }">
												<li class="page-item">
													<a class="page-link" href="searchProdList?page=${param.page +1 }&searchType=${SearchCriteria.searchType }&searchWord=${SearchCriteria.searchWord }&mainCategory_id=${dto.mainCategory_id}&middleCategory_id=${dto.middleCategory_id}&checkLowDate=${dto.checkLowDate}&checkHighDate=${dto.checkHighDate}&product_show=${dto.product_show}" aria-label="Next">
														<span aria-hidden="true">»</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${pagingParam.prev }">
													<li class="page-item">
														<a class="page-link" href="prodList?page=${param.page -1 }&mainCategory_id=${dto.mainCategory_id}&middleCategory_id=${dto.middleCategory_id}&checkLowDate=${dto.checkLowDate}&checkHighDate=${dto.checkHighDate}&product_show=${dto.product_show}" aria-label="Previous">
															<span aria-hidden="true">«</span>
															<span class="sr-only">Previous</span>
														</a>
													</li>
													</c:if>
													<c:forEach begin="${pagingParam.startPage }" end="${pagingParam.endPage }" var="pageNo">
													<li id="page${pageNo }" class="page-item">
														<a href="prodList?page=${pageNo }&mainCategory_id=${dto.mainCategory_id}&middleCategory_id=${dto.middleCategory_id}&checkLowDate=${dto.checkLowDate}&checkHighDate=${dto.checkHighDate}&product_show=${dto.product_show}" class="page-link">${pageNo }</a>
													</li>
													</c:forEach>
													<c:if test="${pagingParam.next }">
													<li class="page-item">
														<a class="page-link" href="prodList?page=${param.page +1 }&mainCategory_id=${dto.mainCategory_id}&middleCategory_id=${dto.middleCategory_id}&checkLowDate=${dto.checkLowDate}&checkHighDate=${dto.checkHighDate}&product_show=${dto.product_show}" aria-label="Next">
															<span aria-hidden="true">»</span>
															<span class="sr-only">Next</span>
														</a>
													</li>
												</c:if>
											</c:otherwise>
											</c:choose>
											
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
<!-- modal -->
<!--    <div id="productModal" class="modal fade" role="dialog"> -->
<!--       <div class="modal-dialog modal-sm"> -->
<!--          Modal content -->
<!--          <div class="modal-content"> -->
<!--             <div class="modal-header"> -->
<!--                <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--                <h4 class="modal-title">알림</h4> -->
<!--             </div> -->
<!--             <div class="modal-body" id="modalText"></div> -->
<!--             <div class="modal-footer"> -->
<!--                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
<!--             </div> -->
<!--          </div> -->

<!--       </div> -->
<!--    </div> -->
<%@ include file="adminFooter.jsp"%>
</div>
</body>
</html>