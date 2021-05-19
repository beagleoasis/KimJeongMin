<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>Cambark's</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/resources/cambak21/js/skel.min.js"></script>
	<script src="/resources/cambak21/js/skel-panels.min.js"></script>
	<script src="/resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
	
    <link rel="stylesheet" type="text/css" href="/resources/lib/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/lib/slick/slick-theme.css"/>
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="/resources/lib/slick/slick.js"></script>  
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		
		.\34 u {
			width : 100%;
			margin : 0px;
		}
		#content{
			width: auto;
			height: auto;
		}
		#totallArray{
			width: 100%;
    		height: 100%;
			display: inline-block;
		}
		#imgBoard{
			width: 100%;
    		height: 100%;
			border: 1px solid black;
		}
		#imgArray{
			margin-right: 40px;
			width: 430px;
    		height: 430px;
    		display: inline-block;
    		float: left;
		}
		#textArray{
			color: black;
			display: inline-block;
		}
		.inputStyle{
			border: none;
			width: 80%
		}
		.inputStyle:focus, .detail:focus{
			outline: none;
		}
		.detail{
			width: 455px;
			height: 300px
		}
		#pageTitle{
			color : black;
			font-size: 24px;
		}
		.imges{
			width: 100%;
    		height: 100%;
			
		}
		#modifyBox {
		width: 750px;
		height: 500px;
		background-color: #EEE;	
		position: fixed;
		top: 35%;
		left: 50%;
		margin-top:-40px;
		margin-left:-300px;
		z-index: 999;
		display: none;
	}
		#modal-backdrop {
		position: fixed;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    z-index: 998;
	    background-color: #000;
	    opacity : 0.3;
	    display: none;
	  }
	</style>
	<script>

		function writeControll() {
			console.log("title : "+$("#title").val()+" price : "+$("#price").val()+" addr : "+$("#addr").val())
			let result = false
			if($("#title").val() ==  ""){
				result = false;
			}else{
				if($("#price").val() ==  ""){
					result = false;
				}else{
					if($("#addr").val() ==  ""){
						result = false;
					}else{
						result = true;
					}
				}
			}
			return result;
		}
		function imgReformCloce() {
			$("#modifyBox").hide();
			$("#modal-backdrop").hide();
		}
		$(function(){
			  	
			$(".fDrop").on("dragenter dragover", function(evt){
				evt.preventDefault();
			});
			$(".fDrop").on("drop", function(evt) {
				evt.preventDefault();
				let files = evt.originalEvent.dataTransfer.files; 
				var uploadData = new FormData();
				for (var i =0; i < files.length;i++){
					uploadData.append("uploadFile",files[i])	
				}
				
				console.log(uploadData.getAll('uploadFile'))
				
				$.ajax({
					url : '/board/resell/uploadAjax',
					data : uploadData,  // 응답 받는 형식
					type : 'post',
					processData : false, // 전송하는 데이터를 쿼리 스트링 형태로 변환하는지를 결정
					contentType: false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
					success : function(result) {
						for (i =0; i <result.length;i++){
							console.log(i)
							$("#imgBoard").append("<img src='"+result[i]+"' class='imges'/>")
							$("#imgArray").append('<input type="text" style="display: none;" value="'+result[i]+' "  name="resellBoard_img'+(i+1)+'"/>')
						}
	
					}, 
					fail : function(result) {
						alert(result);
					}
				});
				
			})
			$("#imgBoard").dblclick(function () {
				$("#modifyBox").show();
				$("#modal-backdrop").show();
				
		    });
			$("#modal-backdrop").click(function() {
				$("#modifyBox").hide();
				$("#modal-backdrop").hide();
			});
         
		})
		
	</script>
</head>

<body>
    <%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">
			
			<!-- 사이드바 템플릿 -->
			<%@include file="../../cambak21BoardAside.jsp"%>

				<!-- Content -->
				
				<div id="content" class="8u skel-cell-important">
						<h2 id="pageTitle">글 쓰기 페이지</h2>
						<hr style="margin: 10px 0;padding: 3px;"/>
						<div id="modifyBox">
							<div>이미지 수정</div>
							<div>
								<button type="button" id="replyModBtn" onclick="">저장</button>
								<button type="button" id="replyModBtn" onclick="imgReformCloce();">닫기</button>
							</div>
						</div>
						<div id="modal-backdrop">
    					</div>
						<form action="write" method="post" onsubmit="return writeControll();">
						
							<div id="totallArray">
								<!-- 이미지div -->
								<div id="imgArray">
									<div id="imgBoard" class="fDrop" ></div>
								</div>
								<!-- 텍스트div -->
								<div id="textArray">
									<input type="text" name="member_id" value="${loginMember.member_id }" style="display: none;">
									<div><span>제목 : </span><input id="title" type="text" class="inputStyle" name="resellBoard_title" maxlength="100" ></div>
									<div><span>가격 : </span><input id ="price" type="text" class="inputStyle" name="resellBoard_price" maxlength="9"></div>
									<hr style="margin: 3px  0;padding: 3px;0"/>
									<div id="detail"><span style="display: block;">상세글 : </span><textarea name="resellBoard_content" class="detail"></textarea></div>
									<div><span>거래지역 : </span><input id="addr" type="text" class="inputStyle" name="resellBoard_addr" maxlength="100"></div>
								</div>
									<hr style="margin: 30px 0;padding: 3px;"/>
								<!-- 버튼div -->
								<div>
									<div style="float: right;">						
										<input type="submit" class="btn btn-success" value="작성하기">
										<button type="button" class="btn btn-danger"
										onclick="location.href='/board/resell/list?perPageNum=9';">취소</button>
									</div>	
								</div>
							</div>
						</form>
						
						
				</div>
				
			</div>
		</div>
	</div>
	<!-- /Main -->

    <%@include file="../../cambak21Footer.jsp"%>
	
</body>

</html>