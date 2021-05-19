<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 
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
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
		
	@media (min-width: 768px) {
			#fDrop {
				width : 80.7%;
				height :200px;
				border : 1px dotted gray;
			}
		.col-sm-2  {
			width : 14.5%;
			text-align: right
			}
	}
	
	@media (min-width: 576px){
		.col-sm-2 {
		    -ms-flex: 0 0 16.666667%;
		    flex: 0 0 16.666667%;
		    max-width: 18%;
		    text-align: right
		}
	}
	
	.col-sm-10 {
		margin-bottom : 10px;
	}
	
	#fDrop {
		display: block;
	    width: 100%;
	    height: 200px;
/* 	    padding: 6px 12px; */
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #555;
	    background-color: #fff;
	    background-image: none;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	}
</style>
<script>
	
	let loginUser = '${loginMember.member_id}';
	let userGrade = '${loginMember.grade_name}';
	console.log(userGrade);
	
	$(function() {

		if(loginUser.length == 0) {
			location.href="../user/login";
		}
		
		checkCategory();
		
		$("#fDrop").on("dragenter dragover", function(evt) {
			evt.preventDefault();
		});
		
		$("#fDrop").on("drop", function(evt) {
			evt.preventDefault();
			
			let formData = new FormData();
			
			let files = evt.originalEvent.dataTransfer.files; // 드래그 이벤트의 파일 데이터 전송 기능은 처리되도록
			console.log(files);			
			for(let i = 0; i < files.length; i++) {
				formData.append("files", files[i]); // "file"(key)이란 이름으로, file(value)을 전송
				encodingBase64(i, files[i]);
			}
			
			for (let value of formData.values()) {
				  console.log(value);
				}
			
			$.ajax({
				url: '/mall/prodDetail/uploadFile',
				data : formData,
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(result);
					
					let output = '';
					$(result).each(function(index, item){
						if(checkImgType(item)) {
							output += "<img id='img" + item + "' src='displayFile?fileName=" + item + "'/>";
							output += "<span id='" + item + "' onclick='deleteFile(this)'>X</span>"; 
						}		
					});
					
					$("#fDrop").append(output);
				},
				fail : function(result) {
					alert(result);
				}
			});
		});
	});
	
	function checkCategory() {
		let output ='';
		
		if(window.name == "writeBoard") {
			output += '<select id="prodQA_category" name="prodQA_category" class="form-control">';
			output += '<option value="상품">상품</option>';
			output += '<option value="배송">배송</option>';
			output += '<option value="환불">환불</option>';
			output += '<option value="교환">교환</option>';
			output += '<option value="기타">기타</option>';
			output += '</select>';
		} else if(window.name == "writeReply" && userGrade == "M"){
			output += '<input type="text" class="form-control" id="prodQA_category" name="prodQA_category" value="답변" readonly>';
		} else if(window.name == "writeReply") {
			output += '<input type="text" class="form-control" id="prodQA_category" name="prodQA_category" value="문의" readonly>';
		} 
		
		$("#prodQA_categoryDiv").html(output);
	}
	
	// 파일 이름을 넘겨 받아 확장자가 패턴에 있는지 없는지 참/거짓 반환
	function checkImgType(fileName) {
		let imgPattern = /jpg$|gif$|png$|jpeg$/i; // /i = 앞의 것이면 무엇이든
		
		return fileName.match(imgPattern);
	}
	
	function encodingBase64(num, file) {
		let FR = new FileReader();
		
		FR.onload = function(file) {
			console.log(file);
			$("#prodQA_img" + num).attr("value", file.target.result);
		};
		
		FR.readAsDataURL(file);
	}
	
	function deleteFile(obj) {
		let fileName = $(obj).attr('id');
		
		console.log(fileName);
		
		$.ajax({
			url: '/mall/prodDetail/deleteFile',
			data : {"fileName" : fileName},
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			success : function(result) {
				if(result == 'success') {
					$(obj).prev().hide();
					$(obj).hide();
					$("#prodQA_img" + pordQA_imgNum).attr("value", null)
				}
			},
			fail : function(result) {
				alert(result);
			}
		});
	}
	
	function checkStatus() {
		let title = $("#prodQA_title").val();
		let content = $("#prodQA_content").val();
		let secretPasswd = $("#prodQA_secretPassword").val();
		let form = $("#prodQAForm").serialize();
		
		console.log(window.name);
		
		if(title.length == 0 || title.lenght > 100) {
			alert("수정 부탁드림다");
		} else if(content.length == 0) {
			alert("내용 입력 부탁드림다");
		} else if(secretPasswd.length == 0 || secretPasswd.length > 5) {
			alert("숫자 4자 이하 비밀번호를 입력해주세요");
		} else {
			let url = '';
			if(window.name == "writeBoard") {
				url = '/mall/prodDetail/prodQAForm?prodId=' + ${param.prodId } + '&page=' + ${param.page };
			} else if(window.name == "writeReply") {
				let no = '${param.no}';
				url = '/mall/prodDetail/prodQAReplyForm?prodId=' + ${param.prodId } + '&page=' + ${param.page } + '&no=' + no;
			}
			
			$.ajax({
 				url: url,
 				data : form,
 				dataType : 'text', // 응답 받을 형식
 				type : 'post',
 				success : function(result) {
 					console.log(result);
	 				opener.document.location.reload();
	 				self.close();
 				},
 				fail : function(result) {
 					alert(result);
 				}
 			});
		}
	}
</script>
<body>
 		<div class="content-wrapper">
    		<div class="container">
		      <h1>게시판 글쓰기 페이지</h1><hr />
		      <div id="formContainer">
				 <form id="prodQAForm" action="/mall/prodDetail/prodQAForm?prodId=${param.prodId }&page=${param.page }" method="post" enctype="multipart/form-data" id="prodQAForm">	
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="member_id">작성자 :</label>
		               <div class="col-sm-10">
		                  <input type="text" class="form-control" id="member_id" name="member_id" value="${loginMember.member_id}" readonly>
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_title">분 류 :</label>
		               <div class="col-sm-10" id="prodQA_categoryDiv">
		                  
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_title">제 목 :</label>
		               <div class="col-sm-10">
		                  <input type="text" class="form-control" id="prodQA_title" name="prodQA_title">
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_content">내 용 :</label>
		               <div class="col-sm-10">
		                  <textarea rows="10" cols="30" class="form-control" id="prodQA_content" name="prodQA_content"></textarea>
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_secretPassword">비밀번호 :</label>
		               <div class="col-sm-10">
		                  <input type="password" class="form-control" id="prodQA_secretPassword" name="prodQA_secretPassword">
		               </div>
		            </div>
		            <div class="form-group">
		               <label class="control-label col-sm-2" for="file1">파 일 :</label>
		               <div class="col-sm-10">
		               	<div id="fDrop">
		               		
		               	</div>
		                  <input type="hidden" id="prodQA_img0" name="prodQA_img1" />
		                  <input type="hidden" id="prodQA_img1" name="prodQA_img2" />
		                  <input type="hidden" id="prodQA_img2" name="prodQA_img3" />
		               </div>
		            </div>
		           	<div class="form-group">
		               <label class="control-label col-sm-2" for="prodQA_isSecret">비밀글 :</label>
		               <div class="col-sm-10">
		                  <input type="checkbox" class="form-control" id="prodQA_isSecret" name="prodQA_isSecret">
		               </div>
		            </div>
		            <div class="form-group">
		               <div class="col-sm-offset-2 col-sm-10">
		                  <button type="button" class="btn btn-success" onclick="checkStatus();">저장</button>
		                  <button type="button" class="btn btn-danger" onclick="location.href='/mall/prodDetail/main?prodId=${param.prodId}&page=${param.page}'">취소</button>
		               </div>
		            </div>
		         </form>
		      </div>
		      </div>
		</div>

<!-- Js Plugins -->
<script src="resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="resources/mallMain/js/bootstrap.min.js"></script>
<script src="resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="resources/mallMain/js/jquery-ui.min.js"></script>
<script src="resources/mallMain/js/mixitup.min.js"></script>
<script src="resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="resources/mallMain/js/jquery.slicknav.js"></script>
<script src="resources/mallMain/js/owl.carousel.min.js"></script>
<script src="resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="resources/mallMain/js/main.js"></script>


</body>
</html>