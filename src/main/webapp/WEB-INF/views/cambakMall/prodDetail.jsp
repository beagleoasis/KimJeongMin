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
</head>
<script type="text/javascript">
	let loginUser = '${loginMember.member_id}'; // 로그인한 유저의 아이디 값 저장
	let userGrade = '${loginMember.grade_name}';
	let prodId = '${param.prodId}'; // 유저가 접속한 상세 페이지의 상품 아이디 값 저장
	let page = '${param.page}'; // 현재 페이지 값 저장
	let cate = '${param.cate}'; // 카테고리 값 저장
	let restProdQty = 0; // 해당 페이지의 상품 재고 수량 초기화
	let ssid = '${ssid}';
	
	console.log('${topReviews}');
	console.log('${loginMember.grade_name}')
	console.log('${prodDetail.mainCategory_id}');
	console.log('${prodDetail.middleCategory_id}');
	
	console.log(ssid);
	
	let orderList;
	
	// ajax페이지 고침을 위한 전역변수 (정민)
    let currentPage;
	let prodReviewNo;
	let prodReview_likeCnt;
	
	// 원댓글 작성자 이름 가져오기 (정민)
	let replyMember_id;
	let replyProdReview_no1;

	$(function() {
		console.log(loginUser);
		if(page.length == 0) {
			page = 1;
		}
		
		if(cate.length == 0) {
			cate = "*";
		}
		
		// 상품평 리스트 출력
		showProdList(prodId);
		
		futurePoints(); // 예상 적립급 계산 함수 호출
		
		totProdQACnt(prodId); // 해당 페이지의 상품 문의글 총 개수 호출하는 함수
		
		prodQAListAll(prodId, page, 0, cate); // 페이지 호출될 때 상품 문의 목록 함수 호출하는 함수
		
		getRestofProducts(); // 해당 페이지의 상품 재고 수량 불러오는 함수
				
		
		// 상품 문의 카테고리가 변경될 때마다 상품 문의 목록 및 페이징 함수 다시 호출하는 함수
		$("#prodQA_category").change(function(){ 
        	let cate = $("#prodQA_category").val();
        	console.log(cate)
        	
        	prodQAListAll(prodId, 1, 0, cate);
        	
        });
		
		// ******************* '주문하기' & '장바구니' 버튼 클릭시 MODAL창 띄우는 함수들 ***************************************
		
		// '주문하기' 버튼을 클릭하면 장바구니에 이미 있는 상품인지 확인하는 함수 호출
		$("#buyingBtn").click(function(){
		    buying("1");
		});
		
		// '장바구니' 버튼을 클릭하면 장바구니에 이미 있는 상품인지 확인하는 함수 호출
		$("#bucketBtn").click(function(){
		    buying("2");
		});
		
		// 만약 이미 장바구니에 존재하는 상품이고 '추가하기'버튼을 클릭했을때, 장바구니의 개수 추가하는 함수 호출
		$("#updateBtn1").click(function() {
			alert("!");
		});
		
		// 만약 이미 장바구니에 존재하는 상품이고 '변경하기'버튼을 클릭했을때, 장바구니의 개수 변경하는 함수 호출		
		$("#updateBtn2").click(function() {
			updateBucket("2");
		});
		
		
		// prodDetail 상단의 평균 별점과 총 리뷰 개수를 가져오기 위한 함수 호출
		getStarRating();
	});
	
	// ------------------------------------- 정민 오빠 js--------------------------------------------------------------------------
	// prodDetail 상단의 평균 별점을 가져오기 위한 함수
	function getStarRating() {
		let getStarRating;
		let output;
		
		$.ajax({
			  method: "post",
			  url: "/mall/prodDetail/getStarRating/" + prodId,
			  headers: {	// 요청하는 데이터의 헤더에 전송
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "json", // 응답 받는 데이터 타입
			  success : function(data) {
			      console.log(data);
			      getStarRating = data.getStarRating;
			      console.log(getStarRating);
			      output = showStars(getStarRating);
			      console.log(output);

				  $("#getStarRating").html(output);
			  }
			}); // end of ajax
	}
	
	// prodDetail 상단의 총 리뷰 개수를 가져오기 위한 함수
	
	
	
	// 작성한 게시글 삭제 전 확인을 하는 함수
	function checkDelete(prodReview_no) {
		if(confirm("해당 게시물을 삭제하시겠습니까?")) {
			console.log("삭제 확인");
			location.href='prodReviewsDelete?prodReview_no=' + prodReview_no + "&prodId=" + prodId;
		}
	}
	
	
	// 상품평 배너 클릭시 ajax로 기본 게시글 호출
    function showProdList(prodId, pageNum, checkPoint, orderList) {
		if(prodId == 0){
			prodId = '${param.prodId}';
		}
    	// 유저의 등급
    	let grade_name = "${loginMember.grade_name}";
    	// 넘겨준 페이지 번호가 없을 때,
    	if(pageNum == null){
    		pageNum =1;
    	}
    	if(checkPoint == null){
    		checkPoint = 0;
    	}
    	//console.log(checkPoint);
    	// 정렬 순서 선택을 나타내는 부분
    	if(orderList == null){
    		// 기본 설정은 최신순 정렬
    		orderList = "latest";
    	} else{ // 선택한 카테고리가 있을 때,
    		orderList = orderList;
    	}
     	console.log(orderList);
//     	console.log(prodId);
//     	console.log(pageNum);

		// 총 리뷰 개수 가져오기
		let totalReviews;
    	// ------------------게시판 리스트 출력-------------------------------
    	let output = '<div>';
        output += '<table class="table table-hover"><thead><tr><th>글번호</th><th>글제목</th><th>만족도</th><th>작성자</th><th>작성일</th></tr></thead>';
        
    	$.ajax({
	        type		: "get",
	        url 		: "/mall/prodDetail/prodReviews/" + prodId,
	        data		:  {
	        		'page' : pageNum,
	        		'orderList' : orderList
	        }, 
	        contentType : "application/json",
	        success 	: function(data) {
// 	        	console.log(data);
	        	let prodList = data.prodList;
	        	console.log(prodList);
	        	let pagingParam = data.pagingParam;
	        	
	        	totalReviews = data.pagingParam.totalCount;
	        	currentPage = pagingParam.cri.page;
	        	
	        	console.log(totalReviews);
	        	//console.log(currentPage);
	        	//console.log(prodList);
	        	console.log(pagingParam.cri);
	        	console.log(pagingParam);
	        	
	        	// 날짜 출력 방식 변경을 위한 변수 설정
	        	let showDate;
	        	let showThisDate;
	        	
	        	// 기본 게시글 출력 부분
	        	// ----------------------------prodList ---------------------------------
	        	 $(prodList).each(function(index, item) {
	        		 // 날짜 출력 포맷 변경 부분
	        		 showDate = new Date(item.prodReview_postDate);
	                 showThisDate = showDate.toLocaleString();
	                 
	                 // 게시글 내용 출력 부분
	                
	                 output += '<tr id=' + item.prodReview_no + ' onclick="showContent(' + item.prodReview_no + "," + item.prodReview_likeCnt +');"><td>' + item.prodReview_no + '</td><td><div>' + item.prodReview_title; + '</div></td>';
	                 output += '<td class="stars" id="star">' + showStars(item.prodReview_grade) + '<div class="starrr1"></div></td>';
	                 output += '<td>' + item.member_id + '</td><td><span class="sendTime">' + showThisDate + '</span></td>';
	                 output += '</tr>';
	                 output += '<tr id="content' + item.prodReview_no +'" style="display: none">';
	                 output += '<td colspan="6">';
	                 
	                 if("${loginMember.member_id}" == item.member_id || grade_name =='M'){
	                	 output += '<div class="form-row float-right"><button type="button" class="btn btn-primary" onclick="location.href=\'prodReviewsModify?prodReview_no=' + item.prodReview_no + '&member_id=' + item.member_id + '\'">수정하기</button>';
	                	 output += '<button type="button" class="btn btn-info" onclick="checkDelete(' + item.prodReview_no + ');">삭제하기</button></div>';
	                 }
	                 
	                 // display:none 되어있는 Content 내용
	                 output += '<div>' + item.prodReview_content + '</div><div class="likeProdReviews">';
	                 // --------------상품후기 좋아요 표시 부분-----------------
	                 if(loginUser != null){
	                	 output += '<span id="likeProd' + item.prodReview_no + '"><img src=\'../../resources/img/heartProdReviewsEmpty.png\' onclick="clickLike('+ item.prodReview_no +')";/>' + item.prodReview_likeCnt + '</span>';  
						 }
					 else{
						 output += '<span id="likeProd' + item.prodReview_no + '"><img src=\'../../resources/img/heartProdReviewsEmpty.png\' />' + item.prodReview_likeCnt + '</span>';
						}
	                 
	                 output += '</div><div class="likeProdReviews">상품후기가 도움이 되었어요!</div>'
	                 // display:none 되어있는 댓글 내용
	                 output += '<div class="replyBox" id="replyBox' + item.prodReview_no + '"></div>';
	                  
	                 // 부모 댓글 작성을 위한 양식 출력 부분
	                 if(${loginMember.member_id != null}){ // 로그인되어 있는 경우에만 댓글 작성을 보여준다.
	                	 output += '<div class="card mb-2"><div class="card-header bg-light">댓글 작성</div>';
	                	 output += '<div class="card-body"><ul class="list-group list-group-flush"><li class="list-group-item"><div class="form-inline mb-2"><label for="replyId"></label></div>';
	                	 output += '<div><p class="card-text"><textarea id="replyProdReview_content' + item.prodReview_no + '" name="replyProdReview_content" placeholder="댓글을 입력해주세요." ></textarea><div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="addReplyProdReviews(' + item.prodReview_no + ');">댓글등록</button></div></p></li></ul></div>';
	                	 output += '</td>';
	                 }
	                 
	        	  });// end of foreach prodList

	              output += '</tr></table></div>';
	              
	              
	              // ------------페이징 처리 부분-------------------------
	              let startPage;
	              let endPage;
	              let tempEndPage;
	              let totalCount;
	              let prev;
	              let next;
	              let pageOutput = '<div class="text-center"><ul class="pagination"><li class="page-item">';
            	  pageOutput += '<a class="page-link" onclick="showProdList(' + prodId + ',' + 1 + ',' + 0 + ',\'' + orderList +'\');">처음페이지로</a></li>';
            	  
	              $(pagingParam).each(function(index, item) {
	            	  startPage = item.startPage;
	            	  endPage = item.endPage;
	            	  tempEndPage = item.tempEndPage;
	            	  totalCount = item.totalCount;
	            	  
	            	  if(pageNum > 1){
	            		  prev = pageNum - 1;
	            	  } else if(pageNum = 1){
	            		  prev = 1;
	            	  }
	            	  if(pageNum < tempEndPage){
	            		  next = pageNum + 1; 
	            	  } 
	            	  else if (pageNum = tempEndPage){
	            		  next = tempEndPage;
	            	  }

	            	  pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + prodId + ',' + prev + ',' + 0 + ',\'' + orderList + '\'); return false;">prev</a></li>';
	            	  
	              });
	              //console.log(startPage);
	              //console.log(endPage);

	              for(var num = startPage; num <=endPage; num++){
	            	  pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + prodId + ',' + num + ',' + 0 + ',\'' + orderList + '\'); return false;">' + num + '</a></li>';
            	  }
	              
	              pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + prodId + ',' + next + ',' + 0 + ',\'' + orderList + '\'); return false;">next</a></li>';
	              pageOutput += '<li class="page-item"><a class="page-link" onclick="showProdList(' + prodId + ',' + tempEndPage + ',' + 0 + ',\'' + orderList + '\');">마지막페이지로</a></li>';
	            	  
	              
	              pageOutput += '</ul></div></div>';
	              $("#prodBoardList").html(output);
	              $("#prodBoardListPage").html(pageOutput);
	              $("#prodReviewsCnt").html("상품평(" + totalCount + ")");
	              
	              // prodDetail의 상단 리뷰수 출력 부분
	              $("#totalReviews").html(totalReviews);
	              
	              // --------열어놨던 페이지를 열어준 채로 로딩하는 부분-------------
	              // showContent 를 이용해서 열어주면 가능할 수도
	              if(checkPoint == 1){
	            	  showContent(prodReviewNo);
	            	 // $("#content" + prodReviewNo).show();
	              }
	              
	        }, // end of Success
	        error		: function(error) {
// 	        	console.log(error);
	        	
	        }, complete : function(data) { // 게시글 부분이 모두 출력되고 난 후에 이루어지는 작업 부분=complete
	            let prodList = data.responseJSON.prodList;
	        	let grade_name = "${loginMember.grade_name}";
// 	            console.log(prodList);
	            
	            
            	//대댓글 작성을 위한 파트
	            $(prodList).each(function(index, item) {
	            	prodReview_no = item.prodReview_no;
	            	
	            	$.ajax({
						  type: "post",
						  url: "/mall/prodDetail/getProdReviewReply/"+prodReview_no,
						  contentType : "application/json",
						  success : function(result) {
							  //console.log(result);

						  $(result).each(function(index, item) {
// 							  console.log(result);
							  
							  let replyOutput;
							  if(item.replyProdReview_no == item.replyProdReview_ref){// 부모 댓글인 경우,
								  replyOutput = '<div class="card mb-2" ><div class="card-header bg-light">';
							  }else{// 대댓글인 경우에는 왼쪽으로부터 10% 떨어지게 하는 효과를 적용
								  replyOutput = '<div class="card mb-2" style="margin-left:10%"><div class="card-header bg-light">';
							  }
								  

							  if(item.replyProdReview_no != item.replyProdReview_ref){ // 대댓글인 경우, 화살표 이미지를 적용
					        	  replyOutput += '<img src="/resources/cambak21/img/replyimg.png" width="20px" height="15px">';
					          }
							  
							  //댓글의 날짜 형식 변경을 위한 부분
					          let showDate = new Date(item.replyProdReview_date);
					          let showThisDate = showDate.toLocaleString();
					          
					          //-----------------댓글 및 대댓글 생성 부분--------------------
				              replyOutput += '<i class="fa fa-user-circle-o fa-2x"></i>' + item.member_id + '<div>' + showThisDate + ' replyProdReview_no : ' + item.replyProdReview_no +'</div></div><div class="card-body"><ul class="list-group list-group-flush">';
				              replyOutput += '<li class="list-group-item"><div class="form-inline mb-2"><label for="replyId"></label></div>';
				              replyOutput += '<div><span id="replyName' + item.replyProdReview_no + '"></span><span id="replyMemberName' + item.replyProdReview_no + '"></span><p class="card-text">';
				              //삭제된 댓글인 경우 '삭제된 댓글입니다' 표시를 위한 처리 부분
				              if(item.replyProdReview_isDelete == 'Y'){
				            	  replyOutput += '<span>삭제된 댓글입니다.</span></p><div>'
				              } else{
				            	  // 대댓글인 경우, 부모 댓글의 이름을 가져와서 출력
				            	  if(item.replyProdReview_repMember_id != null){
				            		  replyOutput += '<span><strong>@' + item.replyProdReview_repMember_id + ' </strong></span><span id="replyContents' + item.replyProdReview_no + '">' + item.replyProdReview_content + '</span></p><div>';
				            	  }else{// 대댓글이 아닌 경우에는, 부모 댓글 이름 가져오는 부분을 생략
				            		  replyOutput += '<span id="replyContents' + item.replyProdReview_no + '">' + item.replyProdReview_content + '</span></p><div>';  
				            	  }
				            	  
				              }
				          	  // 삭제된 글인 경우 답글 및 수정 불가
			            	  if(item.replyProdReview_isDelete != 'Y'){
				              //답글 버튼(로그인한 회원에게만 보이도록 처리)
				              if(${loginMember.member_id != null}){
				            	  replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="javascript:showReply(' + item.replyProdReview_no +');">답글</button>';
				              }
				              
				              if(item.member_id == "${loginMember.member_id}" || grade_name =='M'){ // 로그인 아이디와 동일한 경우, 운영진인 경우에만 수정/삭제 표시
				            	  
				              //수정 버튼
				              replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="openModifyReply(' + item.replyProdReview_no +');">수정</button>';
				              //삭제 버튼
				              replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="deleteReply(' + item.replyProdReview_no +');">삭제</button>';
				             	 }
				            	  
			            	  }
				              replyOutput += '</li></ul></div>'; // 닫아주는 부분
				              
				              // ------------------------대댓글 등록 부분--------------------------
				              replyOutput += '<div class="replies" id="reply' + item.replyProdReview_no + '" style="display: none"><p class="card-text"><div class="card"><span><strong>' + item.member_id + ' 님에게 댓글 남기기...</strong></span><div class="card-body"><textarea class="reReply" id="replyContent' + item.replyProdReview_no + '" name="replyProdReview_content" placeholder="대댓글을 입력해주세요." ></textarea></div></div></p>';
				              replyOutput += '<div id="get' + item.replyProdReview_no + '" value="' + item.replyProdReview_ref + '"></div>';
				              replyOutput += '<div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="addReply(' + item.replyProdReview_no+ "," + item.replyProdReview_ref + "," + item.prodReview_no + ",\'" + item.member_id +'\');">대댓글등록</button></div></div>';
								
				              // 대댓글 수정 작성 부분
				              replyOutput += '<div class="repliesModi" id="replyModify' + item.replyProdReview_no + '" style="display: none"><p class="card-text"><div class="card"><span><strong>' + item.member_id + ' 님의 댓글 수정하기...</strong></span><div class="card-body"><textarea class="reReply" id="replyContentModi' + item.replyProdReview_no + '" name="replyProdReview_content" placeholder="대댓글을 입력해주세요." ></textarea></div></div></p>';
				              replyOutput += '<div id="get' + item.replyProdReview_no + '" value="' + item.replyProdReview_ref + '"></div>'
				              replyOutput += '<div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="modifyReply(' + item.replyProdReview_no +');">댓글 수정</button></div></div>';

				              // end of </div>
				              replyOutput += '</div>';
				              
							  $("#replyBox" + item.prodReview_no).append(replyOutput);

						 	 });
						  }
	            }); // ajax
	            	
	            
	            }); // end of each.function
	            
	            	
				
	        }// end of complete
									//		

	    });


		
	} // end of showProdList
	

	
	 // ajax 방식 onclick 시 content 및 댓글을 보여주는 부분
	 function showContent(prodReview_no, prodReview_likeCnt) {
// 			console.log(prodReview_likeCnt);
			let showLike;
		 	prodReviewNo = prodReview_no;
		 	
		 		$("#content" + prodReview_no).toggle();
		 		// 로그인 안 한 유저 초기화
		 		console.log(typeof(loginUser));
		 		if(loginUser == ""){
		 			loginUser = "a";
		 		}
		 		
				// 좋아요 표시 가져오기
				$.ajax({
					  method: "post",
					  url: "/mall/prodDetail/getProdReviewsLike/" + prodReview_no + "/" + loginUser,
					  headers: {	// 요청하는 데이터의 헤더에 전송
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "POST"
					  },
					  dataType: "json", // 응답 받는 데이터 타입
					  success : function(data) {
					      	let myLike = data.myLike;
					      	console.log("myLike : " + myLike);
					      	let likeCnt = data.likeCnt;
					      // 좋아요를 클릭 안 했으면,
					      if(myLike==0){
					    	  if(loginUser != "a"){
					    		  // 로그인한 경우, 빈 하트를 보여준다.
					    		  showLike = '<img src=\'../../resources/img/heartProdReviewsEmpty.png\' onclick="clickLike('+ prodReview_no +')";/>' + likeCnt;  
					    	  }else{
					    		  // 로그인 하지 않은 경우에도 빈 하트를 보여준다.
					    		  showLike = '<img src=\'../../resources/img/heartProdReviewsEmpty.png\' />' + likeCnt;
					    	  }
					    	  
					    	  $("#likeProd" + prodReview_no).html(showLike);
					      }else{
					    	  //해당 글에 좋아요를 클릭했으면
					    	  showLike = '<img src=\'../../resources/img/heartProdReviews.png\' onclick="clickLike('+ prodReview_no +')";/>' + likeCnt;
					    	  $("#likeProd" + prodReview_no).html(showLike);
					      }
					      
					  }
					  
					}); // end of ajax
					
		}
	
	 // 별점에 따른 별 개수를 표현하는 부분
	 function showStars(grade) {
		var output1 = '';
		if(grade == 0){
			output1 = '<span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>'
		}
		else if(grade == 1){
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
		} else if(grade == 2){
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
		} else if (grade == 3){
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
		} else if (grade == 4){
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span>';
		} else {
			output1 = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span>';
		}
		 
		return output1;
	}
	 
	//addReplyProdReviews 댓글 처리 부분
		function addReplyProdReviews(prodReview_no) {
// 					console.log("prodReview_no : " + prodReview_no);
					// 댓글 작성 시 필요한 변수들
					let page = $("#page").val();
					let replyProdReview_content = $("#replyProdReview_content" + prodReview_no).val();
					prodReview_no = prodReview_no;
					let replyProdReview_ref = 0;
					
					$.ajax({
						  method: "post",
						  url: "/mall/prodDetail/insertProdReviewReply",
						  headers: {	// 요청하는 데이터의 헤더에 전송
							  "Content-Type" : "application/json",
							  "X-HTTP-Method-Override" : "POST"
						  },
						  dataType: "text", // 응답 받는 데이터 타입
						  data : JSON.stringify({ // 보내는 데이터 타입(JSON형식으로 직렬화 해서 보낸다.)
							  replyProdReview_content :  replyProdReview_content,
							  member_id : loginUser,
							  prodReview_no : prodReview_no,
							  replyProdReview_ref : replyProdReview_ref
						  }),
						  success : function(result) {
							  console.log(result);

							  //$("#content" + prodReview_no).hide();
							  
							  
							  
						  }, complete : function (result) {
							  //showContent(prodReview_no, result);
							 showProdList(prodId, currentPage, 1, orderList);
							//$("#replyBox" + prodReview_no).load(document.URL + "#replyBox" + prodReview_no);
						}
						  
						});

		};
		
		//댓글 작성란 보여주기
		function showReply(replyProdReview_no) {

			$(".repliesModi").hide();
			$(".replies").hide();
			$("#reply" + replyProdReview_no).toggle();
			let checkReforder = $("#get" + replyProdReview_no).val();
// 			console.log(checkReforder);
		}
		
		//addReply 대댓글 처리 부분
		function addReply(replyProdReview_no, replyProdReview_ref, prodReview_no, replyProdReview_repMember_id) {

			let replyProdReview_content = $("#replyContent" + replyProdReview_no).val();
			$.ajax({
				  method: "post",
				  url: "/mall/prodDetail/insertProdReviewReply",
				  headers: {	// 요청하는 데이터의 헤더에 전송
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // 응답 받는 데이터 타입
				  data : JSON.stringify({ // 보내는 데이터 타입(JSON형식으로 직렬화 해서 보낸다.)
					  replyProdReview_content :  replyProdReview_content,
					  member_id : loginUser,
					  prodReview_no : prodReview_no,
					  replyProdReview_ref : replyProdReview_ref,
					  replyProdReview_repMember_id : replyProdReview_repMember_id
				  }),
				  success : function(result) {
// 					  console.log(result);

				      console.log("#checkcheck" + replyProdReview_no);
					  //$("#replyName" + replyProdReview_no).html(replyMember_id);
					  showProdList(prodId, currentPage, 1, orderList);
					  console.log("prodReview_no : " + prodReview_no);
				  }, complete : function (result) {
					  
				}
				  
				});// end of Ajax
			//$("#replyMemberName" + replyProdReview_no).html(replyMember_id);
			console.log(replyProdReview_no);
				
			// 동적으로 생성된 태그의 id값에 접근해서 text를 삽입하고 싶다
		      //$('#checkcheck' + replyProdReview_no).append("체크체크");
		      
			
		}
		
		// 댓글 및 대댓글을 삭제하는 함수
		function deleteReply(replyProdReview_no) {
			console.log(replyProdReview_no);
			//replyProdReview_no = replyProdReview_no;
			
			if(confirm("해당 게시물을 삭제하시겠습니까?")) {

			$.ajax({
				  method: "post",
				  url: "/mall/prodDetail/deleteProdReviewReply/" + replyProdReview_no,
				  headers: {	// 요청하는 데이터의 헤더에 전송
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // 응답 받는 데이터 타입
				  success : function(deleteResult) {
// 					  console.log(deleteResult);
					  if(deleteResult=="true"){
						  alert("삭제 성공");
					  }
					  
					  //삭제 후 리스트를 다시 출력하라
					  showProdList(prodId, currentPage, 1, orderList);
					  
				  }
				  
				});
			}
		}
			
		
		// 댓글 및 대댓글을 수정하는 content를 보여주는 함수
		function openModifyReply(replyProdReview_no) {

			$(".repliesModi").hide();
			$("#replyModify" + replyProdReview_no).toggle();
			$(".replies").hide();
			// 수정하려는 댓글 및 대댓글 read
			$.ajax({
				  method: "get",
				  url: "/mall/prodDetail/readProdReviewReply/" + replyProdReview_no,
				  contentType : "application/json",
				  dataType: "text", // 응답 받는 데이터 타입
				  success : function(readResult) {
					  // 한글의 경우 ??로 나오는 것 해결 필요
 					  console.log(typeof(readResult));
					 $("#replyContentModi" + replyProdReview_no).html(readResult);
				  }
				});
		}
			
		// 댓글 및 대댓글을 수정하는 함수
		function modifyReply(replyProdReview_no) {
			let replyProdReview_content = $("#replyContentModi" + replyProdReview_no).val();
// 			console.log(replyProdReview_content);
			$.ajax({
				  method: "post",
				  url: "/mall/prodDetail/modifyProdReviewReply/" + replyProdReview_no + "/" + replyProdReview_content,
				  headers: {	// 요청하는 데이터의 헤더에 전송
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // 응답 받는 데이터 타입
				  success : function(modifyResult) {
// 					  console.log(modifyResult);
					  if(modifyResult=="true"){
						  alert("수정 성공");
					  }
					  
					  //수정 후 리스트를 다시 출력하라
					  showProdList(prodId, currentPage, 1, orderList);
					  console.log(prodReviewNo);
				  }
				  
				});
			
		}

		// ----------상품후기 좋아요 클릭시 처리 부분-------------
		function clickLike(prodReview_no) {
				console.log(prodReview_no);
				$.ajax({
					  method: "post",
					  url: "/mall/prodDetail/insertLikeProdReviews/" + loginUser + "/" + prodReview_no,
					  headers: {	// 요청하는 데이터의 헤더에 전송
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "POST"
					  },
					  success : function(result) {
 						  console.log(result);
						  $("#content" + prodReview_no).hide();
						  showContent(prodReview_no, result);
						 //showProdList(product_id, currentPage, 1, orderList);

						  
					  }, complete : function(result) {
					}
					  
					});// end of Ajax
				
		}
	
	// 주문 완료 처리한 상품에 대해서만 상품후기를 쓸 수 있도록 확인하는 메서드
	/*function writingReviewCheck() {
		
		$.ajax({
			  method: "post",
			  url: "/mall/prodDetail/confirmBuyingCheck/" + loginUser + "/" + prodId,
			  headers: {	// 요청하는 데이터의 헤더에 전송
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  success : function(result) {
				  console.log(result);
			  }, complete : function(result) {
			}
			  
			});// end of Ajax
	}*/	
		
	//----------------------------------------------------------------------------정민오빠 js 끝!!!---------------------------------------------------------------------
	
	// **************************************************************************** 도연 상품 문의 js ******************************************************************
	//
// 	function checkProductImg() {
// 		let imgUrl = '${prodDetail.product_img1}';
// 		console.log(imgUrl);
		
// 		if(imgUrl.substr(0,3) == "htt") {
// 			$("#productImg").html('<img id="prodImg" data-hash="product-1" class="product__big__img" src="${prodDetail.product_img1 }" alt="${prodDetail.product_name }">');
// 		}
		
// 	}
	// 해당 상품의 판매가를 불러와 등급별 예상 적립금을 구하는 함수
	function futurePoints() { 
		let sellPrice = '${prodDetail.product_sellPrice}';
		
// 		console.log(sellPrice);
		
		let pointA = Number(sellPrice) * 0.15;
		let pointB = Number(sellPrice) * 0.1;
		let pointC = Number(sellPrice) * 0;
		
		console.log(pointA.toLocaleString());
		
		$("#A").html("<label> A : " + pointA.toLocaleString() + " 원 </label>");
		$("#B").html("<label> B : " + pointB.toLocaleString() + " 원 </label>");
		$("#C").html("<label> C : " + pointC.toLocaleString() + " 원 </label>");
	}
	
	// 상품 문의글의 총 글 개수를 세는 함수
	function totProdQACnt(prodId) {
		$.ajax({
			url: '/mall/prodDetail/totProdQACnt?prodId=' + prodId,
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
// 				console.log(result);
				$("#totprodQACnt").html(result);	
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	// 페이지 호출될 때 상품 문의 목록 호출 함수
	function prodQAListAll(product_Id, pageNum, flag, category, no) {
	    $.getJSON("/mall/prodDetail/prodQAList?prodId=" + product_Id  + "&cate=" + category + "&page=" + pageNum, function(data){
	    	prodId = product_Id;
	    	page = pageNum;
	    	cate = category;
	    	
	    	console.log(product_Id + ", " + category + ", " + pageNum);
	    	console.log(data);
	    	
	    	let output = "";
	    	let cOutput = "";
	    	$("#prodQA_category").val(cate).prop("selected",true); // 호출된 상품문의 글들의 해당 분류 고정
	    		
	    	if(data.length == 0) { // 해당 카테고리에서 등록된 상품 문의가 없다면,  
	    		console.log("데이터 없음");
	    		output += '<tr><td colspan="6" id="nodata">상품 문의사항이 없습니다</td></tr>';
	    		
	    		if(loginUser.length != 0) {
	    			cOutput += '</ul><button type="button" class="btn btn-info" style="float: right;" onclick="goWrite(\'1\');">글쓰기</button>';	
	    		}
	    		
	    		$("#pagingParamTb").html(cOutput);
	    		
	    	} else { // 해당 카테고리에서 등록된 상품 문의가 있다면,		
	    	
	    		prodQAPagingParam(product_Id, pageNum, category); // 페이지 호출될 때 상품 문의 페이징 함수 호출하는 함수
	    		
	    		$(data).each(function(index, item){
	    			addReplyCnt(item.prodQA_no);
	    			
		        	let date = new Date(item.prodQA_date);
		        	let dateFormat = date.toLocaleString(); // 날짜 형식 변환
		        	
		        	let result = "";
		        	if(item.prodQA_isComplet == "Y") {
		        		result = "답변완료";
		        	} else {
		        		result = "답변대기";
		        	}
		        	
		        	output += '<tr id="prodQA' + item.prodQA_no + '"><td><input type="hidden" id="produQA_no" value="' + item.prodQA_no + '"/>' + item.prodQA_category + '</td>';
		        	output += '<td>';
		        	
		        	if(item.prodQA_isSecret == 'N') { // 비밀글이 아닐 경우,
		        		output += '<div id="' + item.prodQA_no + '" onclick="updateView(' + item.prodQA_no + ',\'' + category + '\');"><span class="isComplete" id="isComplete' + item.prodQA_no + '">' + result + '</span>' + item.prodQA_title + ' <span id="replyCnt' + item.prodQA_no + '"></span></div>';
		        	} else if((loginUser == item.member_id && item.prodQA_isSecret == 'Y') || userGrade == 'M') { // 비밀글이지만, 로그인한 유저와 글쓴이가 같거나, 관리자일 경우
		        		output += '<div id="' + item.prodQA_no + '" onclick="updateView(' + item.prodQA_no + ',\'' + category + '\');"><span class="isComplete" id="isComplete' + item.prodQA_no + '">' + result + '</span><span class="lockImg"><img src="../../resources/img/unlock.png" width="18px" height="18px"/></span>' + item.prodQA_title + ' <span id="replyCnt' + item.prodQA_no + '"></span></div>';
		        	} else if(loginUser != item.member_id && item.prodQA_isSecret == 'Y') { // 비밀글인데, 로그인한 유저와 글쓴이가 다를 경우
		        		output += '<div id="' + item.prodQA_no + '" ><span class="isComplete" id="isComplete' + item.prodQA_no + '">' + result + '</span><span class="lockImg"><img src="../../resources/img/lock.png" width="18px" height="18px"/></span>비밀글입니다</div>';
		        	}
		        	
		        	output += '</td>';
	                output += '<td id="writer' + item.prodQA_no + '">' + item.member_id + '</td>';
	                output += '<td>' + dateFormat + '</td>';
	                output += '<td>' + item.prodQA_likeCnt + '</td>';
	                output += '<td>' + item.prodQA_viewCnt + '</td></tr>';
	                
	                output += '<tr class="content" id="content' + item.prodQA_no + '" style="display: none">';
	                output += '<td colspan="6"><div id="imgs">';
	                if(item.prodQA_img1 != '' && item.prodQA_img1 != null) { // img1에 데이터가 있다면,
	                	output += '<img class= "contentImg" src="' + item.prodQA_img1 + '" width:"120px" height:"100px"/>';
	                }
	                if(item.prodQA_img2 != '' && item.prodQA_img2 != null) { // img2에 데이터가 있다면,
	                	output += '<img class="contentImg" src="' + item.prodQA_img2 + '" width:"120px" height:"100px"/>';
	                }
	                if(item.prodQA_img3 != '' && item.prodQA_img3 != null) {// img3에 데이터가 있다면,
	                	output += '<img class="contentImg" src="' + item.prodQA_img3 + '" width:"120px" height:"100px"/>';
	                }
	                
	                output += '<div class="contentDiv">' + item.prodQA_content + '</div>';
	                
	                if(loginUser == item.member_id) { // 로그인 유저와 글쓴이가 같아면, 수정/삭제 가능한 버튼 보여주도록
	                	output += '</div><div><input type="button" id="modi" value="수정" onclick="goModi(\'1\',' + item.prodQA_no + ');"/>';
		                output += '<input type="button" id="del" onclick="showHiddenSecret(this);" value="삭제"/>';
		                output += '<span id="likeCnt' + item.prodQA_no + '"><img src="../../resources/img/emptyHeart2.png" width="30px" height="30px" onclick="updateLike(' + item.prodQA_no + ',\'' + category + '\');"/></span>';
		                output += '<div class="hiddenSecretDiv" id="' + item.prodQA_no + '"><input type="password" class="hiddenSecret"  placeholder="비밀번호"/>'; 
		                output += '<input type="button" class="hiddenSecret" id="checkSecretPwd" onclick="chcekSecretPwd(this);" value="확인"/></div></div></td></tr>';
	                } else if(userGrade == 'M') {
	                	output += '<input type="button" class="replyBtn" id="replyBtn" onclick="goWrite(\'2\','+ item.prodQA_no +');" value="답글"/>';
		                output += '<input type="button" id="del" onclick="showHiddenSecret(this);" value="삭제"/>';
	                }
	                
	                output += '<span id="likeCnt' + item.prodQA_no + '"><img src="../../resources/img/emptyHeart2.png" width="30px" height="30px" onclick="updateLike(' + item.prodQA_no + ',\'' + category + '\');"/></span></div></td></tr>';
	    		});
			    
	    	}
	    	
	    	$("#prodQATbody").html(output); 
	    	
	    	if(flag == 1) { // 글 제목을 클릭했을때, 해당 내용을 보여줌
	        	$("#content" + no).show();
	        	if(loginUser.lenght != 0) { // 이미 로그인이 되어있는 경우, 과거에 좋아요 누른 게시글 좋아요 표시된 채로 고정 시키는 함수 호출
	    			getLike(loginUser);
	    		}
	        	getReply(no, flag);
	        } else if(flag == 2) { // 좋아요 누를 경우, 좋아요 표시 변경(채워진 하트로)
	        	$("#content" + no).show();
	        	getReply(no, flag);
	        	$("#likeCnt" + no).html('<img src="../../resources/img/heart2.png" width="30px" height="30px" onclick="deleteLike(' + no + ',\'' + cate + '\');"/>');
	        } else { // 좋아요를 풀 경우, 좋아요 표시 변경(빈 하트로)
	        	$("#content" + no).show();
	        	getReply(no, flag);
	        	$("#likeCnt" + no).html('<img src="../../resources/img/emptyHeart2.png" width="30px" height="30px" onclick="updateLike(' + no + ',\'' + cate + '\');"/>');
	        }
	    });
	}
	
	// 페이징 처리하는 함수
	function prodQAPagingParam(prodId, page, cate) {
		$.getJSON("/mall/prodDetail/prodQAPP?prodId=" + prodId + "&cate=" + cate, function(data){
	    	if(data.length == 0) { // 데이터가 없다면,
	    		console.log("데이터 없음")
	    	} else { // 데이터가 있다면
	    		console.log(prodId + ", " + cate + ", " + page);
	    		console.log(data);
	    		let prev = Number(page) - 1;
	    		let next = Number(page) + 1;
	    		
	    		let output = '<ul class="pagination">';
	    		
	    		if(page > 1) { // 2페이지 이상으로 넘어갈 경우, 전으로 돌아가는 버튼 생성
	    			output += '<li><a href="javascript:void(0);" onclick="prodQAListAll(' + prodId + ',' + 1 + ',0,\'' + cate + '\');"> << </a></li>';
	    			output += '<li><a href="javascript:void(0);" onclick="prodQAListAll(' + prodId + ',' + prev + ',0,\'' + cate + '\');"> < </a></li>';
	    		}
	    		
	    		for(let i = 1; i < data.endPage + 1; i++) { // 페이지 번호별 버튼 생성
	    			output += '<li><a href="javascript:void(0);" onclick="prodQAListAll(' + prodId + ',' + i + ',0,\'' + cate + '\');">' + i + '</a></li>';
	    		}
	    		
	    		if(page < data.endPage) { // 다음 페이지가 있을 경우, 다음으로 가기 버튼 생성
	    			output += '<li><a href="javascript:void(0);" onclick="prodQAListAll(' + prodId + ',' + next + ',0,\'' + cate + '\');"> > </a></li>';
	    			output += '<li><a href="javascript:void(0);" onclick="prodQAListAll(' + prodId + ',' + data.endPage + ',0,\'' + cate + '\');"> >> </a></li>';
	    		}
	    		
	    		output += '</ul>';
	    		if(loginUser.length != 0) {
	    			output += '<button type="button" class="btn btn-info" style="float: right;" onclick="goWrite(\'1\');">글쓰기</button>';	
	    		}
	    		
	    		$("#pagingParamTb").html(output);

	    	}
	     });
	}
	
	// 게시글 댓글수 가져오는 함수
	function addReplyCnt(no) {
		$.ajax({
			url: '/mall/prodDetail/addReplyCnt',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: no,
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				if(result != 0) {
					$("#replyCnt" + no).html("(" + result + ")");	
				}
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	// 댓글 내용 가져오는 함수
	function getReply(no, flag) {		
		$.ajax({
			url: '/mall/prodDetail/prodQAReplyList',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: no
				}),
			dataType : 'json', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				if(result.length == 0) { // 데이터가 없다면
		    		console.log("데이터 없음")
		    	} else { // 데이터가 있다면,
					let output = '';
					
					$(result).each(function(index, item){	
						let date = new Date(item.prodQA_date);
			        	let dateFormat = date.toLocaleString(); // 날짜 형식 변환
			        	
						let writer = $("#writer" + item.prodQA_ref).text();
						
						if(item.prodQA_category == '답변') {
							output += '<tr id="reply' + item.prodQA_no + '" class="reply' + item.prodQA_ref + '" style="display: none">';
		                } else {
		                	output += '<tr id="reply' + item.prodQA_no + '" class="reply' + item.prodQA_ref + ' content" style="display: none">';
		                }
			    		
						
		                output += '<td colspan="6"><div><p>';
		                
		                if(item.prodQA_category == '답변') {
		                	output += '[cambak21 관리자]'
		                } else {
		                	output += '[' + item.member_id + ']'	
		                }		  
		                
		                output += '<span class="replyDate">' + dateFormat + '</span></p></div>';
		      
		                output +='<div class="imgs">';
		                if(item.prodQA_img1 != '' && item.prodQA_img1 != null) {
		                	output += '<img class="contentImg" src="' + item.prodQA_img1 + '" />';
		                }
		                if(item.prodQA_img2 != '' && item.prodQA_img2 != null) {
		                	output += '<img class="contentImg" src="' + item.prodQA_img2 + '" />';
		                }
		                if(item.prodQA_img3 != '' && item.prodQA_img3 != null) {
		                	output += '<img class="contentImg" src="' + item.prodQA_img3 + '" />';
		                }
		                output += '</div>';
		                
		                output += '<div class="contentDiv">';
		                output += '<p><b>' + item.prodQA_title + '</b></p>';
		                output += '<p>' + item.prodQA_content + '</p></div>';
		                
		                output += '<div>';
		                if(item.prodQA_category == '답변' && loginUser == writer) {
		                	output += '<input type="button" class="replyBtn" id="replyBtn" onclick="goWrite(\'2\','+ item.prodQA_no +');" value="답글"/>';
		                }
		                
		                if(loginUser == item.member_id || userGrade == 'M') {
	                		output += '<input type="button" class="replyBtn" id="replyBtn" onclick="goModi(\'2\','+ item.prodQA_no +');" value="수정"/></div>';
	                	}
		                
		                output += '</td></tr>';
		               
		                
					});	
					$(output).insertAfter("#content"+no);	
					
					if(flag == 1 || flag == 2 || flag == 3) {
						$('.reply' + result[0].prodQA_ref ).show();
					}
				}
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	
	// 상품 문의글 작성하는 페이지로 이동시켜주는 함수
	function goWrite(flag, no) {
		console.log(flag);
		let url = '';
		let name = '';
		
		if(flag == 1) { // flag가 1이면 새 글 쓴느 페이지로 이동
			url = '../prodDetail/prodQAForm?prodId=' + prodId + '&page=' + page;
			name = 'writeBoard';
		} else if(flag == 2) { // flag가 2면 댓글 작성 페이지로 이동
			url = '../prodDetail/prodQAForm?prodId=' + prodId + '&page=' + page + '&no=' + no;
			name = 'writeReply';
		}
		
		window.open(url, name, 'width=750, height=600, left=400, top=80, resizable = yes');
	}
	
	// 작성 글 수정하는 페이지로 이동시켜주는 함수
	function goModi(flag, no) {
		let url ='../prodDetail/prodQAModiForm?prodId=' + prodId + '&page=' + page + '&no=' + no;
		let name = '';
		
		if(flag == 1) {// flag가 1이면, 새 창 이름 modiBoard로 변경 (글 수정 페이지)
			name = 'modiBoard';
		} else if(flag == 2) { // flag가 2이면, 새 창 이름 modiReply로 변경 (댓글 수정 페이지)
			name = 'modiReply';
		}
		
		window.open(url, name, 'width=750, height=600, left=400, top=80, resizable = yes');
	}
	
	// 조회수 증가 함수
	function updateView(prodQA_no, cate) {
		console.log(prodId);
		console.log(page);
		
		$.ajax({
			url: '/mall/prodDetail/updateViewCnt',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: prodQA_no,
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
// 				console.log(result);
				
				prodQAListAll(prodId, page, 1, cate, prodQA_no);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	// 로그인 한 경우 유저가 이미 좋아요한 글의 좋아요 상태를 고정시키는 함수
	function getLike(userId) {
		$.getJSON("/mall/prodDetail/getLike?userId=" + userId, function(data){
			if(data.length != 0) {
				console.log(data);
				$(data).each(function(index, item){
					$("#likeCnt" + item.prodQA_no).html('<img src="../../resources/img/heart2.png" width="30px" height="30px" onclick="deleteLike(' + item.prodQA_no + ',\'' + cate + '\');"/>');
				});
			}
		});
	}
	
	// 좋아요 하트 상태 변경 및 좋아요 수 증가
	function updateLike(prodQA_no, cate) {
		console.log(prodId);
		
		if(loginUser.length == 0) {
			alert("로그인이 필요합니다");
		} else {
			$.ajax({
				url: '/mall/prodDetail/updateLikeCnt',
				headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
						},
				data : JSON.stringify({	// 요청하는 데이터
					prodQA_no: prodQA_no,
					member_id: loginUser
					}),
				dataType : 'text', // 응답 받을 형식
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(result);
					prodQAListAll(prodId, page, 2, cate, prodQA_no);
				},
				fail : function(result) {
					alert(result);
				}
			});	
		}
	}
	
	// 좋아요 상태변경(빈하트) & 좋아요 수 감소 함수
	function deleteLike(prodQA_no, cate) {
		console.log(prodId);
		
		if(loginUser.length == 0) {
			alert("로그인이 필요합니다");
		} else {
			$.ajax({
				url: '/mall/prodDetail/deleteLike',
				headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
						},
				data : JSON.stringify({	// 요청하는 데이터
					prodQA_no: prodQA_no,
					member_id: loginUser
					}),
				dataType : 'text', // 응답 받을 형식
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(result);
					prodQAListAll(prodId, page, 3, cate, prodQA_no);
				},
				fail : function(result) {
					alert(result);
				}
			});	
		}
	}
	
	// '삭제' 버튼 누를 경우 비밀번호 창 보여주는 함수
	function showHiddenSecret(obj) {
		let hiddenSecretAddr = $(obj).next().next();
		console.log(hiddenSecretAddr);
		$(hiddenSecretAddr).show()
	}
	
	// 비밀번호 입력 후, 비밀번호 일치 확인 하는 함수 
	function chcekSecretPwd(obj) {
		
		let checkSecretPwd = $(obj).prev().val();
		console.log(checkSecretPwd);
		
		let no = $(obj).prev().parent().attr("id");
		console.log(no);
		
		$.ajax({
			url: '/mall/prodDetail/checkSecretPwd',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				prodQA_no: no,
				prodQA_secretPassword : checkSecretPwd
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				prodQAListAll(prodId, page, 0, cate);
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	// ***********************************************도연 상품 상세 js **********************************************************************************************
	
	// 상품 재고 수량 가져오는 함수
	function getRestofProducts() {
		$.getJSON("/mall/prodDetail/restProd?prodId=" + prodId, function(data){
			restProdQty = data;
			
			if(data == 0) { // 재고가 0일 경우 'sold out' 표시 & '주문하기' + '장바구니' 버튼 비활성화
				let output ='Sold Out';
				$("#quantity").html(output);
				$("#buyingBtn").attr("disabled", "disabled");
				$("#bucketBtn").attr("disabled", "disabled");
			}
		});
	}
	
	// '주문하기' & '장바구니' 버튼 클릭시, 이미 장바구니에 있는 상품인지 확인하는 함수
	function buying(flag) {		
		console.log(prodId);
		console.log(loginUser);
		console.log(flag);
		
		let prodQty = $("#prodQty").val();
		console.log(prodQty);
		
		if(prodQty == 0) { // 장바구니 넣는 수량이 0인 경우,
			alert("수량을 0 이상으로 선택해주세요!");
		} else if(prodQty > restProdQty) { // 장바구니 넣는 수량이 재고보다 많을 경우
			alert("재고 수량보다 많습니다. 주문 가능 수량 : " + restProdQty + " 개");
		} else if(prodQty > 100) { // 장바구니 넣는 수량이 최대 수량(100개)보다 많을 경우
			alert("최대 주문 수량은 100개입니다.");
		} else if(loginUser.length == 0){
			$.ajax({
				url: '/mall/prodDetail/checkNonUserBucket',
				headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
						},
				data : JSON.stringify({	// 요청하는 데이터
					product_id: prodId,
					nonUserBucket_ssid : ssid
					}),
// 				dataType : 'json', // 응답 받을 형식
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(result.nonUserBucket_no);
	 				if(result.length == 0) {
	 					console.log(flag);
	 					insertNonUserBucket(flag);
	 				} else if(result.bucket_buyQty == 11) { // 장바구니에 이미 들어있는 상품 종류가 10가지가 넘을 경우, 장바구니 상품 추가 안됨
	 					$("#myModal").modal();
	 					goBucket("over");
	 				} else { // 이미 장바구니에 있는 상품일 경우
	 					$("#myModal").modal();
	 					addAlreadyItem(flag, result);
	 				}
				},
				fail : function(result) {
					alert(result);
				}
			});		
		} else {
			$.ajax({
				url: '/mall/prodDetail/checkBucket',
				headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
						},
				data : JSON.stringify({	// 요청하는 데이터
					pruduct_id: prodId,
					member_id : loginUser
					}),
//					dataType : 'json', // 응답 받을 형식
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(result);
					if(result.length == 0) {
						console.log(flag);
						insertBucket(flag);
					} else if(result.bucket_buyQty == 11) { // 장바구니에 이미 들어있는 상품 종류가 10가지가 넘을 경우, 장바구니 상품 추가 안됨
						$("#myModal").modal();
						goBucket("over");
					} else { // 이미 장바구니에 있는 상품일 경우
						$("#myModal").modal();
						addAlreadyItem(flag, result);
					}
				},
				fail : function(result) {
					alert(result);
				}
			});			
		}
	}
	
	// 장바구니로 갈지, 현재 페이지에 머무를지 묻는 Modal 띄우는 함수
	function goBucket(flag) {
		let output ='';
		let url = '';
		
		if(loginUser.length == 0) {
			url = "../cart/no";
		} else {
			url = "../cart";
		}
		
		if(flag == "over") {
			output += '<p>장바구니에 추가할 수 있는 상품 수량을 초과하였습니다</p>';
		} else if(flag == "stay") {
			output += '<p>변경이 완료되었습니다</p>';	
		}
		
		output += '<div class="modal-footer" >';
		
		if(loginUser.length == 0) {
			output += '<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href=\'../cart/no\'">장바구니로 가기</button>';
		} else {
			output += '<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href=\'../cart\'">장바구니로 가기</button>';
		}
		
		output += '<button type="button" class="btn btn-default" data-dismiss="modal">취소</button></div>';
		
		$("#alreadyItem").html(output);
	}
	
	// 이미 장바구니에 들어있는 상품이 아닐 경우, 장바구니에 상품을 추가하는 함수
	function insertBucket(flag) {
		let sellPrice = Number('${prodDetail.product_sellPrice}');
		let prodQty = Number($("#prodQty").val());
		let totBuyPrice = sellPrice * prodQty;
		
		$.ajax({
			url: '/mall/prodDetail/insertBucekt',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				product_id: prodId,
				member_id : loginUser,
				bucket_sellPrice : sellPrice,
				bucket_buyQty : prodQty,
				bucket_totBuyPrice : totBuyPrice
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				if(flag == 1) { // '주문하기' 버튼을 클릭 했을 경우, 장바구니 페이지로 이동
					location.href="../cart";	
				} else if(flag == 2) { // '장바구니' 버튼을 클릭 했을 경우, 알람 띄우기
					alert("장바구니에 담기 완료!");
				}				
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	function insertNonUserBucket(flag) {
		let sellPrice = Number('${prodDetail.product_sellPrice}');
		let prodQty = Number($("#prodQty").val());
		let totBuyPrice = sellPrice * prodQty;
		console.log(sellPrice);
		
		$.ajax({
			url: '/mall/prodDetail/insertNonUserBucket',
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				product_id: prodId,
				nonUserBucket_ssid : ssid,
				nonUserBucket_sellPrice : sellPrice,
				nonUserBucket_buyQty : prodQty,
				nonUserBucket_totBuyPrice : totBuyPrice
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				if(flag == 1) { // '주문하기' 버튼을 클릭 했을 경우, 장바구니 페이지로 이동
					location.href="../cart/no";	
				} else if(flag == 2) { // '장바구니' 버튼을 클릭 했을 경우, 알람 띄우기
					alert("장바구니에 담기 완료!");
				}				
			},
			fail : function(result) {
				alert(result);
			}
		});	
	}
	
	// 장바구니에 있는 상품일 경우, 이미 장바구니에 있음을 알리고 수량을 추가할지, 변경할지 묻는 Modal의 내용 추가 함수
	function addAlreadyItem(flag, obj) {
		let isMoveFlag = '';
		let output = '';
		
		console.log(flag);
		console.log(obj.nonUserBucket_buyQty);
		
		if(loginUser.length == 0) {
			url = "../cart/no";
		} else {
			url = "../cart";
		}
		
		output += '<div>';
		output += '<p>이미 장바구니에 들어있는 상품입니다.</p>';
		output += '<p><span id="bucketQty"></span></p>';
		output += '<input type="hidden" id="isMoveFlag"  />';
		output += '<input type="hidden" id="bucket_no" />';
		output += '<input type="hidden" id="bucket_buyQty" />';
		output += '</div>';
		output += '<div class="modal-footer" >';
		output += '<button type="button" class="btn btn-default" id="updateBtn1" onclick="updateBucket(\'1\');">추가하기</button>';
		output += '<button type="button" class="btn btn-default" id="updateBtn2" onclick="updateBucket(\'2\');">변경하기</button>';
		if(loginUser.length == 0) {
			output += '<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href=\'../cart/no\'">장바구니로 가기</button>';
		} else {
			output += '<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href=\'../cart\'">장바구니로 가기</button>';
		}
		output += '</div>';
		
		$("#alreadyItem").html(output);
		
		if(flag == 1) {
			$("#isMoveFlag").val("move");
		} else if(flag == 2) {
			$("#isMoveFlag").val("stay");
		}
		
		if(loginUser.length == 0) {
			$("#bucketQty").html("장바구니 수량 : " + obj.nonUserBucket_buyQty + " 개 ");
			$("#bucket_no").val(obj.nonUserBucket_no);
			$("#bucket_buyQty").val(obj.nonUserBucket_buyQty);
		} else {
			$("#bucketQty").html("장바구니 수량 : " + obj.bucket_buyQty + " 개");
			$("#bucket_no").val(obj.bucket_no);
			$("#bucket_buyQty").val(obj.bucket_buyQty);
		}	
		
	}
	
	
	// 추가하기/변경하기 누를 경우, 선택에 따라 변경하는 함수
	function updateBucket(flag) {
		let isMoveFlag = $("#isMoveFlag").val();
		let bucket_no = $("#bucket_no").val();
		let sellPrice = Number('${prodDetail.product_sellPrice}');
		let prodQty = Number($("#prodQty").val());
		let alreadyProdQty = Number($("#bucket_buyQty").val());
		let resultProdQty = 0;
		let totBuyPrice = 0;
		
		
		if(flag == 1) {
			resultProdQty = alreadyProdQty + prodQty;
			totBuyPrice = sellPrice * (prodQty + alreadyProdQty);
		} else if(flag == 2) {
			resultProdQty = prodQty;
			totBuyPrice = sellPrice * prodQty;
		}
		
		console.log(resultProdQty);
		console.log(totBuyPrice);
		
		if(loginUser.length == 0) {
			$.ajax({
				url: '/mall/prodDetail/updateNonUserBucekt',
				headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
						},
				data : JSON.stringify({	// 요청하는 데이터
					nonUserBucket_no : bucket_no,
					product_id: prodId,
					nonUserBucket_ssid : ssid,
					nonUserBucket_sellPrice : sellPrice,
					nonUserBucket_buyQty : resultProdQty,
					nonUserBucket_totBuyPrice : totBuyPrice
					}),
				dataType : 'text', // 응답 받을 형식
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(isMoveFlag);
					if(isMoveFlag == "move") { // 주문하기 버튼이었을 경우, 장바구니 페이지로 이동
						location.href="../cart/no";	
					} else if(isMoveFlag == "stay") { // '장바구니' 버튼이었을 경우, 페이지 이동할지 묻는 함수 호출
						changeModalButtons(isMoveFlag);
					}
				},
				fail : function(result) {
					alert(result);
				}
			});	
		} else {
			$.ajax({
				url: '/mall/prodDetail/updateBucekt',
				headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
						},
				data : JSON.stringify({	// 요청하는 데이터
					bucket_no : bucket_no,
					product_id: prodId,
					member_id : loginUser,
					bucket_sellPrice : sellPrice,
					bucket_buyQty : resultProdQty,
					bucket_totBuyPrice : totBuyPrice
					}),
				dataType : 'text', // 응답 받을 형식
				type : 'post',
				processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
				contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
				success : function(result) {
					console.log(isMoveFlag);
					if(isMoveFlag == "move") { // 주문하기 버튼이었을 경우, 장바구니 페이지로 이동
						location.href="../cart";	
					} else if(isMoveFlag == "stay") { // '장바구니' 버튼이었을 경우, 페이지 이동할지 묻는 함수 호출
						changeModalButtons(isMoveFlag);
					}
				},
				fail : function(result) {
					alert(result);
				}
			});		
		}
	}
</script>
<style>
	.pro-qty {
		width: 160px;
	}

	.fa {
	  color: grey;
	}
	.checked {
	  color: orange;
	}
	
	.replyBox{
	 margin-top: 27px;
	}
	
	textarea{
		width: 1070px; 
		height:200px; 
	    resize:none;/* 크기고정 */ 
	    margin-top: 30px;
	/*   resize: horizontal; // 가로크기만 조절가능 
		resize: vertical;  세로크기만 조절가능  */
	}
	/*대댓글 textarea 부분*/
	.reReply{
	    border: none;
	}
	
	.orderList{
		float: left;
		list-style-type: none;
		margin-left: 10px;
	}
	.likeProdReviews{
		text-align: center;
	}
	.product__details__widget {
		padding-top : 0px;
	}

 	#product_detail { 
 		text-align : center; 
 	}
	
	.hiddenSecretDiv {
		display : none;
	}
	
	.nav-tabs {
		border-bottom : none;
	}
	
	.nav-tabs .nav-item {
		background-color: white;
		z-index : 999;
	}
	
	.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
		border : none;
		color : #ca1515;
	}
	
	.show {
		opacity: 1;
	}
	
	.modal-header {
 		display: inline;
	}
	
	.product__details__widget {
		padding-top : 35px;
	}
	
	#prodImg {
		width : 100%;
		height : 100%;
	}
	
	#prodQATb {
		min-height : 338px;
	}
	
	.contentImg {
		margin : 3px;
		width: 120px;
    	height: 100px;
	}
	
	.contentDiv {
		margin : 20px 3px;
	}
	
	.lockImg {
		margin : 0px 5px;
	}
	
	.content {
		background : #f8f9fa;
	}
	
	.replyDate {
		margin-left : 20px;
		font-size: 7px;
		font-style: italic;
	}
	
	#pageP {
		text-align : center;
	}
	
	.isComplete {
		margin-right : 20px;
		padding : 3px;
		background : slateblue;
		color : white;		
	}

</style>
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
                        <a href="./main/"><i class="fa fa-home"></i> Home</a>
                        <c:choose>
	                        <c:when test="${prodDetail.mainCategory_id == 1 and prodDetail.middleCategory_id == 1}">
	                        	<a href="#">텐트/타프</a><span>텐트</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 1 and prodDetail.middleCategory_id == 2}">
	                        	<a href="#">텐트/타프</a><span>타프</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 2 and prodDetail.middleCategory_id == 1} ">
	                        	<a href="#">침낭/매트</a><span>침낭</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 2 and prodDetail.middleCategory_id == 2} ">
	                        	<a href="#">침낭/매트</a><span>매트</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 3 and prodDetail.middleCategory_id == 1} ">
	                        	<a href="#">테이블/체어/베트</a><span>경량 테이블</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 3 and prodDetail.middleCategory_id == 2} ">
	                        	<a href="#">테이블/체어/베트</a><span>체어</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 4 and prodDetail.middleCategory_id == 1} ">
	                        	<a href="#">랜턴</a><span>랜턴</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 5 and prodDetail.middleCategory_id == 1} ">
	                        	<a href="#">액세서리</a><span>담요</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 5 and prodDetail.middleCategory_id == 2} ">
	                        	<a href="#">액세서리</a><span>쿨러/아이스박스</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 6 and prodDetail.middleCategory_id == 1} ">
	                        	<a href="#">화로/히터</a><span>화로대</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 6 and prodDetail.middleCategory_id == 2} ">
	                        	<a href="#">화로/히터</a><span>착화제</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 7 and prodDetail.middleCategory_id == 1} ">
	                        	<a href="#">수납/케이스</a><span>수납</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 8 and prodDetail.middleCategory_id == 1} ">
	                        	<a href="#">수납/케이스</a><span>식기/일반</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 8 and prodDetail.middleCategory_id == 2} ">
	                        	<a href="#">키친/취사용품</a><span>설거지용품</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 8 and prodDetail.middleCategory_id == 3} ">
	                        	<a href="#">키친/취사용품</a><span>버너</span>
	                        </c:when>
	                        <c:when test="${prodDetail.mainCategory_id == 9 and prodDetail.middleCategory_id == 1} ">
	                        	<a href="#">기타</a><span>기타</span>
	                        </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__pic">
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel" id="productImg">
                                <c:choose>
                                	<c:when test="${prodDetail.product_id < 606}">
                                		<img id="prodImg" data-hash="product-1" class="product__big__img" src="${prodDetail.product_img1 }" alt="${prodDetail.product_name }">
                                	</c:when>
                                	<c:otherwise>
                                		<img id="prodImg" data-hash="product-1" class="product__big__img" src="../../resources/uploads/${prodDetail.product_img1 }" alt="${prodDetail.product_name }">
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <h3>${prodDetail.product_name }<span>${prodDetail.product_factory }</span></h3>
                        <!--  prodDetail 상단의 별점 및 후기 개수 표시 -->
                        <div class="stars" id="star">
                            <span id="getStarRating" style="margin-left: 0px;"></span>
                            <!-- 총 리뷰 개수 출력 -->
                            <span id="totalReviews">0</span><span>Reviews</span>
                        </div>
                        <div class="product__details__price" > <strong id="sellPrice"><fmt:formatNumber value="${prodDetail.product_sellPrice}" pattern="#,###" /></strong></div>
                        <div class="product__details__button">
                            <div class="quantity" >
                                <span>Quantity:</span>
                                <div class="pro-qty" id="quantity">
                                    <input type="text" id="prodQty" value="1">
                                </div>
                            </div>
                             <button type="button" class="cart-btn" id="buyingBtn" ><span class="icon_bag_alt" ></span> 주문하기</button>
                             <button type="button" class="cart-btn" id="bucketBtn" ><span class="icon_heart_alt" ></span></button>
                        </div>
                        <div class="product__details__widget">
                            <ul>
                                <li>
                                    <span>예상 적립금:</span>
                                    <div>
                                        <label id="A">
                                        </label>
                                        / 
                                        <label id="B">
                                        </label>
                                        /
                                        <label id="C">
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>예상 적립일:</span>
                                    <div>
                                        <label>
                                            구매확정일 / 구매일로부터 7일 후
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>사이즈:</span>
                                    <div class="size__btn">
                                        <label for="xs-btn" class="active">
                                            Free
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>배송비:</span>
                                    <label><fmt:formatNumber value="${prodDetail.product_shipPrice}" pattern="#,###" /> 원</label>
                                </li>
                            </ul>
                        </div>
                        <!-- Modal -->
								  <div class="modal" id="myModal" role="dialog">
								    <div class="modal-dialog">
								    
								      <!-- Modal content-->
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">주문하기</h4>
								        </div>
								        <div class="modal-body" id="alreadyItem">
								        	
								       </div>
								      
								    </div>
								  </div>
							</div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품 상세</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" onclick="showProdList(0,1,0,'latest');" id="prodReviewsCnt">상품평</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">상품 문의(<span id="totprodQACnt"></span>)</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">배송/교환/반품 안내</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <h6>상품 상세</h6>
                                <p id="product_detail"><img src="${prodDetail.product_detail }" /></p>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <h6>상품평</h6>
                                <!-- *********아래부터 상품평 정렬순서 넣는 곳(정민) *************************************************************-->	
                            	<ul>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'latest'); return false;" >최신순</a></li>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'grades'); return false;">별점순</a></li>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'replies'); return false;">좋아요순</a></li>
                            	</ul>
                                <!-- *********아래부터 상품평 내용 넣는 곳(정민) *************************************************************-->
                                <div>
                                
						     	<div>
						     	<div class="form-row float-right" id="writingProdReviews">
						     		<!-- 로그인을 했으면, -->
						     		<c:if test="${loginMember.member_id != null}">
						        	<button type="button" class="btn btn-success" onclick="location.href='/myMall/myOrder';">글쓰기</button>
						        	</c:if>
						        </div>
						     	<div id="prodBoardList"></div>
								<div id="prodBoardListPage"></div>
								
								
								</div>
                                
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <h6>상품 문의</h6>
                                <!-- *********아래부터 상품문의 내용 넣는 곳 *************************************************************-->
						     	
						     	<div class="container" id="prodQATb">
						     		<table class="table table-hover">
						     			<thead>
						     				<tr>
						     					<th>
						     					<select id="prodQA_category" name="prodQA_category">
						     						<option value="*">분류</option>
						     						<option value="상품">상품</option>
						     						<option value="배송">배송</option>
						     						<option value="환불">환불</option>
						     						<option value="교환">교환</option>
						     						<option value="기타">기타</option>
						     					</select>
						     					</th>
						     					<th>글제목</th>
						     					<th>작성자</th>
						     					<th>작성일</th>
						     					<th>좋아요</th>
						     					<th>조회수</th>
						     				</tr>
						     			</thead>
						     			<tbody id="prodQATbody">
						     			
						     			
						     			</tbody>
						     		</table>
						              
								</div>
								<div class="container" id="pagingParamTb">
									
						    	</div>
						    	
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <h6>배송/교환/반품 안내</h6>
                                <!-- *********아래부터 배송/교환/반품 안내 내용 넣는 곳 *************************************************************-->
                                <div style="text-align:center">
                                	<img src="../../resources/img/refundnExchangeImg.jpg" />
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="related__title">
                        <h5>TOP REIVEWS PRODUCTS</h5>
                    </div>
                </div>
                <c:forEach var="review" items="${topReviews}">
                	<div class="col-lg-3 col-md-4 col-sm-6">
                		<div class="product__item">
	                        <a href="../prodDetail/main?prodId=${review.product_id }"><div class="product__item__pic set-bg" data-setbg="${review.product_img1 }">
<!-- 	                            <div class="label new">hot</div> -->
	                        </div></a>
	                        <div class="product__item__text">
	                            <h6><a href="../prodDetail/main?prodId=${review.product_id }">${review.product_name }</a></h6>
	                            <div class="rating">
	                            	<c:forEach var="i" begin="1" end="${review.star }" step="1" >
	                            		<i class="fa fa-star"></i>
	                            	</c:forEach>
	                            </div>
	                            <div class="product__price"><fmt:formatNumber value="${prodDetail.product_sellPrice}" pattern="#,###" /> 원</div>
	                        </div>
	                    </div>
                	</div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

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
<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>


</body>
</html>