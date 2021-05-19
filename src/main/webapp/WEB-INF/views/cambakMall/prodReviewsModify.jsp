<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Ashion | Template</title>

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
    
    <!-- Kim Jeong Min board editor -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<!-- <script src="/resources/js/summernote-ko-KR.js"></script> -->
	
	<!-- Kim Jeong Min star rating bootStrap -->
 	<meta name="description" content="">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../resources/mallMain/css/starrr.css" type="text/css">
    <script src="../../resources/mallMain/css/starrr.js"></script>
    
	<script type="text/javascript">

	</script>
	
</head>
<body>


	<%@include file="mallHeader.jsp" %>


	<!-- 게시판 글작성 부분 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
		       <div class="related__title">
		       	  <div class="my-5">
		          	<h3>상품후기 작성</h3>
		          	<div class="form-group">
		               	  <div class="text-center">
							    <div class='starrr' id='star1'></div>
							    <div>&nbsp;
							      <span class='your-choice-was' style='display: none;'>
							        당신의 평가는 별 <span class='choice'></span>개 입니다.
							      </span>
							      <span class='your-choice-is'>
							        상품후기 점수를 선택해주세요!
							      </span>
							    </div>					  
							  <!-- 별점 표시 적용 부분 -->
							  <script>
							    $('#star1').starrr({
							      change: function(e, value){
							        if (value) {
							          $('.your-choice-is').hide();
							          $('.your-choice-was').show();
							          $('.choice').text(value);
							          $('#prodReview_grade').val(value);
							        } else {
							          $('.your-choice-was').hide();
							        }
							      }
							    });
							  </script>
		                  </div>
		              </div>
		          	
		          </div>
		       </div>
		    </div>
	    </div>
    </div>
	<!-- 상품후기 작성 Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
				<div class="col-lg-12">
					<form action="/mall/prodDetail/prodReviewsModify" method="post">
					
					<input type="hidden" id="product_id" name="product_id" value="${board.product_id }"/>
					<input type="hidden" id="member_id" name="member_id" value="${loginMember.member_id }"/>
					<input type="hidden" id="buyProduct_no" name="buyProduct_no" value="${board.buyProduct_no }"/>
					<input type="hidden" id="prodReview_no" name="prodReview_no" value="${board.prodReview_no}"/>
					<!-- name에 컬럼명을 제대로 적어줘야 한다. -->
					<input type="hidden" id="prodReview_grade" name="prodReview_grade" class='rating' value="${board.prodReview_grade }"/>
					<div class="form-group">
		               	  <div class="form-row float-right">
			                  <button type="submit" class="btn btn-success">저장하기</button>
			                  <button type="button" class="btn btn-primary" onclick="location.href='/mall/prodDetail/main?prodId=' + ${board.product_id}">목록</button>
		                  </div>
		            </div>
					<div class="form-group">
		                  <input type="text" class="form-control" id="prodReview_title" name="prodReview_title" value="${board.prodReview_title }"/>
		            </div>
					  <textarea id="summernote" name="prodReview_content" >${board.prodReview_content }</textarea>
					</form>
				    <script>
				      $('#summernote').summernote({
				        placeholder: '내용을 입력하세요.',
				        tabsize: 2,
				        height: 450,
				        focus: true,
				        toolbar: [
				          ['style', ['style']],
				          ['font', ['bold', 'underline', 'clear']],
				          ['color', ['color']],
				          ['para', ['ul', 'ol', 'paragraph']],
				          ['table', ['table']],
				          ['insert', ['link', 'picture', 'video']],
				          ['view', ['fullscreen', 'codeview', 'help']]
				        ]
				      });
				    </script>
				    
				</div>
			</div>
		</div>
	</section>
	
<%@include file="mallFooter.jsp" %>


<!-- Js Plugins -->
<script src="../resources/mallMain/js/jquery-3.3.1.min.js"></script>
<script src="../resources/mallMain/js/bootstrap.min.js"></script>
<script src="../resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="../resources/mallMain/js/jquery-ui.min.js"></script>
<script src="../resources/mallMain/js/mixitup.min.js"></script>
<script src="../resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="../resources/mallMain/js/jquery.slicknav.js"></script>
<script src="../resources/mallMain/js/owl.carousel.min.js"></script>
<script src="../resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="../resources/mallMain/js/main.js"></script>


</body>
</html>