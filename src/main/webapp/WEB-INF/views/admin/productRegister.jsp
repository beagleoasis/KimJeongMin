<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 화면 너비 자동반응 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- 아이콘 및 타이틀 -->
<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<title>Cambak's - Admin Pages</title>
<!-- css -->
<link href="../resources/adminDist/css/bootstrap.min.css"
	type="text/css">
<link href="../resources/adminDist/css/font-awesome.min.css"
	type="text/css">
<link href="../resources/adminDist/css/elegant-icons.css"
	type="text/css">
<link href="../resources/adminDist/css/jquery-ui.min.css"
	type="text/css">
<link href="../resources/adminDist/css/magnific-popup.css"
	type="text/css">
<link href="../resources/adminDist/css/owl.carousel.min.css"
	type="text/css">
<link href="../resources/adminDist/css/slicknav.min.css" type="text/css">
<link href="../resources/adminDist/css/style.css" type="text/css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../resources/adminAssets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="../resources/adminAssets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../resources/adminAssets/libs/quill/dist/quill.snow.css">


<!-- js -->
<script src="../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script
	src="../resources/adminAssets/libs/popper.js/dist/umd/popper.min.js"></script>
<script
	src="../resources/adminAssets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="../resources/adminAssets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../resources/adminAssets/extra-libs/sparkline/sparkline.js"></script>
<script src="../resources/adminDist/js/waves.js"></script>
<script src="../resources/adminDist/js/sidebarmenu.js"></script>
<script src="../resources/adminDist/js/custom.min.js"></script>
<script
	src="../resources/adminAssets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="../resources/adminDist/js/pages/mask/mask.init.js"></script>
<script
	src="../resources/adminAssets/libs/select2/dist/js/select2.full.min.js"></script>
<script
	src="../resources/adminAssets/libs/select2/dist/js/select2.min.js"></script>
<script
	src="../resources/adminAssets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script
	src="../resources/adminAssets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script
	src="../resources/adminAssets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script
	src="../resources/adminAssets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script
	src="../resources/adminAssets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/adminAssets/libs/quill/dist/quill.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		// quill 에디터 옵션
		var toolbarOptions = [
			  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
			  ['blockquote', 'code-block'],

			  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
			  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
			  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
			  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
			  [{ 'direction': 'rtl' }],                         // text direction

			  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
			  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

			  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
			  [{ 'font': [] }],
			  [{ 'align': [] }],
			  ['image', 'code-block'],
			  ['clean']                                         // remove formatting button
		];
			
		// quill 에디터 객체 생성
		var quill = new Quill('#editor', {
			modules: {
			  toolbar: toolbarOptions
			},
			theme: 'snow'
		});
		
		// quill에디터 데이터 보내기 위한 ...
		quill.on('text-change', function(delta, oldDelta, source) {
	        document.getElementById("product_detail").value = quill.root.innerHTML;
	    });
		
		// quill 에디터 이미지 핸들러 추가
		quill.getModule('toolbar').addHandler('image', function () {
			imgCallback(); // 이미지 업로드 콜백 함수 실행
		})
		
		// 메인카테고리 동적 출력
		outputMainCategory();
		
		//상품이름 글자 수 제한
		$("#product_title").keydown(function () {
			let len = $("#product_title").val()
			
			// 입력 숫자 출력
			if (len.length <= 250) {
				$(".cnt").text(len.length);
			} else {
				$("#product_title").val(len.substring(0, 250));
			}
		})
		
	})
	
		// quill 에디터 이미지 콜백 함수 실행
		function imgCallback() {
			// input 태그 생성
			let input = document.createElement('input');
			input.setAttribute('type', 'file');
			input.click();
			
			// product_detail 사진 웹서버에 저장하기 위한 ...
			input.onchange = function () {
				let formData = new FormData();
				let file = $(this)[0].files[0];
				formData.append("image", file);
				
				$.ajax({
					url : "/admin/productImage",
					data : formData,
					type : 'POST',
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					dataType : 'text',
					cache : false,
					success : function(data) {
						let imgSrc = "../resources/uploads/product/" + data // 웹서버에 저장한 이미지 경로
						let content = $("#product_detail").val(); // 기존 html 값들 가져오기
						content += '<img src="'+imgSrc+'">'; // 기존 html 값에다가 이미지 추가
						
						$(".ql-editor").append('<img src="'+imgSrc+'">'); // quill 에디터 창에도 이미지 출력
					},
					error : function(data) {
					}, 
					complete : function(data) {
					}
				});
			}
		}
	
	// 썸네일 이미지 업로드
	function ThumnailUpload() {
		let formData = new FormData();
		let file = $("#product_thumnail")[0].files[0];
		formData.append("image", file);
		
		$.ajax({
			url : "/admin/productImage",
			data : formData,
			type : 'POST',
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			dataType : 'text',
			cache : false,
			success : function(data) {
				let imgSrc = "../resources/uploads/product/" + data
				$(".preview-thumb").attr("src", imgSrc);
				$("#product_img1").val("product/" + data)
			},
			error : function(data) {
				console.log("실패!")
			}, 
			complete : function(data) {
			}
		});
	}
	
	function outputMainCategory() {
		let output = '<select name="mainCategory_id" onchange="outputMiddleCategory()" id="checkOption">';
		
		$.ajax({
		  method: "get",
		  url: "/admin/getMainCategories",
		  headers: {	// 요청하는 데이터의 헤더에 전송
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override" : "GET"
		  },
		  success : function(data) {
		      let mainCategory = data.mainCategories;
		      
		      $(mainCategory).each(function(index, item) {
		    	
		    	  output += '<option value="' + item.mainCategory_id + '">' + item.mainCategory_content + '</option>';
		    	  
		    	  
		      }); // end of foreach

			  output += '</select>';
			  $("#select-wrap").html(output);
			  
			  outputMiddleCategory();
		  }
		}); // end of ajax
	}
	
	function outputMiddleCategory() {
		let mainCategory_id = $("#checkOption option:selected").val();
		
		let output = "";
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
			  
		      let middleCategory = data.middleCategories;
		      $(middleCategory).each(function(index, item) {
		    	  output += '<option value="' + item.middleCategory_id + '">' + item.middleCategory_content + '</option>';
		      });
			  $("#middle-wrap").html(output);
		  }
		  
		}); // end of ajax
	}
	
	function inputCheck() {
// 		let thumb = $("#product_thumnail").val();
// 		let detail = $("#product_detail").val();
		
// 		if (thumb == "") {
// 			alert("대표 이미지를 설정해주세요!");
// 		} else if(detail == "") {
// 			alert("상세설명을 작성해 주세요.");
// 		} else if() {
			
// 		} 
// 		else {
// 			$("#formData").submit();
// 		}
	}
</script>
<style type="text/css">
td.table_title {
	width: 190px;
}

td.table_title {
	font-size: 17px;
	font-weight: bold;
}

input[type="text"] {
	background-color: lightgrey;
	border: 1px;
	padding: 6px;
}

.btn-Wrap {
	display: flex;
	justify-content: center;
	padding: 50px 0;
}
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
		<!-- 헤더 -->
<%-- 		<%@ include file="adminTop.jsp"%> --%>
		<!-- 어사이드 -->
		<%@ include file="adminAside.jsp"%>

		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">상품 등록</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Library</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- 본문 작성  -->
			<div class="container-fluid">
				<div class="container">
					<form method="post" action="../admin/productInsert" id="formData">
						<table class="table table-bordered">
							<tr>
								<td class="table_title">제품이름</td>
								<td><input type="text" value="" style="width: 300px" name="product_name"
									class="input_style" required="required"></td>
							</tr>
							<tr>
								<td class="table_title">매입가</td>
								<td><input type="text" value="" style="width: 200px" name="product_purchPrice"
									class="input_style" required="required"></td>
							</tr>
							<tr>
								<td class="table_title">매입수량</td>
								<td><input type="text" value="" style="width: 200px" name="product_purchaseQty"
									class="input_style" required="required"></td>
							</tr>
							<tr>
								<td class="table_title">제조사</td>
								<td><input type="text" value="" style="width: 300px" name="product_factory"
									class="input_style" required="required"></td>
							</tr>
							<tr>
								<td class="table_title">상품 이름</td>
								<td><input type="text" value="" style="width: 600px" name="product_title"
									class="input_style" id="product_title" required="required"> [ <span class="cnt">0</span> / 250 ]</td>
							</tr>
						</table>
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Quill Editor</h4>
										<!-- Create the editor container -->
										<div id="toolbar">
										</div>
										<div id="editor" style="height: 300px;"></div>
										<input type="hidden" name="product_detail" id="product_detail" >
									</div>
								</div>
							</div>
						</div>

						<table class="table table-bordered">
							<tr>
								<td class="table_title">대표 이미지</td>
								<td><input type="file" value="" id="product_thumnail" onchange="ThumnailUpload()" required="required"> <br>- 권장 사이즈 : 412 x 412 / 10M 이하 / gif, png, jpg(jpeg)
								<input type="hidden" name="product_img1" id="product_img1" value="" >
								</td>
							</tr>
							<tr>
								<td class="table_title">미리보기</td>
								<td><img alt="" src="" class="preview-thumb" style="max-width: 412px;" id="checkImg"></td>
							</tr>
							<tr>
								<td class="table_title">대분류</td>
								<td id="select-wrap">
								</td>
							</tr>
							<tr>
								<td class="table_title">소분류</td>
								<td>
									<select id="middle-wrap" name="middleCategory_id" style="width: 130px;">
										<option>대분류를 선택해 주세요</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="table_title">판매가</td>
								<td><input type="text" value="" style="width: 200px"
									class="input_style" name="product_sellPrice" required="required"> [ 상품가 : 0원 / 과세금액 : 0원 / 과세상품 :
									10% ]</td>
							</tr>
							<tr>
								<td class="table_title">진열 여부</td>
								<td>
								<select name="product_show">
										<option value="Y">진열함</option>
										<option value="N">진열안함</option>
								</select>
								</td>
							</tr>
							<tr>
								<td class="table_title">인기 상품 진열 여부</td>
								<td>
								<select name="product_popularProduct">
										<option value="Y">진열함</option>
										<option value="N">진열안함</option>
								</select>
								<span> [ 쇼핑몰 하단에 랜덤으로 상품이 노출 됩니다. ] </span>
								</td>
							</tr>
							<tr>
								<td class="table_title">배송비</td>
								<td><input type="text" style="width: 200px" value=""
									class="input_style" name="product_shipPrice" required="required"></td>
							</tr>
						</table>
						<div class="btn-Wrap">
							<button type="submit" class="btn btn-primary" class="subBtn" >상품 등록</button>
						</div>
					</form>
				</div>
			</div>

			<!-- 본문 작성 끝  -->
			<%@ include file="adminFooter.jsp"%>

		</div>

	</div>

</body>
</html>