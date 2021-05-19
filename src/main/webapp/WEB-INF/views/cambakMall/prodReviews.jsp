<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

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
    
    <!-- Kim Jeong Min Table Css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Kim Jeong Min star rating bootStrap -->
 	<meta name="description" content="">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../resources/mallMain/css/starrr.css" type="text/css">
    <script src="../../resources/mallMain/css/starrr.js"></script>
    
    <!-- Kim Jeong Min star rating w3school -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
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
	</style>
	
    <script type="text/javascript">
    let product_id = 4;
    let orderList;
    let member_id = "&{loginMember.member_id}";
    
	// ajax페이지 고침을 위한 전역변수
    let currentPage;
	let prodReviewNo;
	let prodReview_likeCnt;
	
	// 원댓글 작성자 이름 가져오기
	let replyMember_id;
	let replyProdReview_no1;
	
	 // ajax 방식 onclick 시 content 및 댓글을 보여주는 부분
	 function showContent(prodReview_no, prodReview_likeCnt) {
			console.log(prodReview_likeCnt);
			let showLike;
		 	prodReviewNo = prodReview_no;
		 	
		 	prodReview_likeCnt = prodReview_likeCnt;
		 		/*if($('#content' + prodReview_no).is(':visible')==true){
		 			$("#content" + prodReview_no).hide();
		 		} else{
		 			$("#content" + prodReview_no).show();
		 		}*/
		 		$("#content" + prodReview_no).toggle();
		 	//console.log(member_id);
			// 접이식 보여주기
				//$("#content" + prodReview_no).toggle();
			
				// 좋아요 표시 가져오기
				$.ajax({
					  method: "post",
					  url: "/cambakMall/getProdReviewsLike/" + member_id + "/" + prodReview_no,
					  headers: {	// 요청하는 데이터의 헤더에 전송
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "POST"
					  },
					  dataType: "text", // 응답 받는 데이터 타입
					  success : function(data) {

					      console.log(data);
					      
					      // 좋아요를 클릭 안 했으면,
					      if(data==0){
					    	  showLike = '<img src=\'../../resources/img/heartProdReviewsEmpty.png\' onclick="clickLike('+ prodReview_no +')";/>' + prodReview_likeCnt;
					    	  $("#likeProd" + prodReview_no).html(showLike);
					      }else{// 좋아요를 클릭했으면
					    	  showLike = '<img src=\'../../resources/img/heartProdReviews.png\' onclick="clickLike('+ prodReview_no +')";/>' + prodReview_likeCnt;
					    	  $("#likeProd" + prodReview_no).html(showLike);
					      }
					      
					  }
					  
					}); // end of ajax
					
		}


	 // 별점에 따른 별 개수를 표현하는 부분
	 function showStars(grade) {
		var output1 = '';
		if(grade == 1){
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


    // 상품평 배너 클릭시 ajax로 기본 게시글 호출
    function showProdList(product_id, pageNum, checkPoint, orderList) {
    	product_id = 4;
    	member_id = "${loginMember.member_id}";
    	// 유저의 등급
    	let grade_name = "${loginMember.grade_name}";
    	// 넘겨준 페이지 번호가 없을 때,
    	if(pageNum == null){
    		pageNum =1;
    	}
    	if(checkPoint == null){
    		checkPoint = 0;
    	}
    	console.log(checkPoint);
    	// 정렬 순서 선택을 나타내는 부분
    	if(orderList == null){
    		// 기본 설정은 최신순 정렬
    		orderList = "latest";
    	} else{ // 선택한 카테고리가 있을 때,
    		orderList = orderList;
    	}
    	console.log(orderList);
    	
    	console.log(pageNum);
    	// ------------------게시판 리스트 출력-------------------------------
    	let output = '<div>';
        output += '<table class="table table-hover"><thead><tr><th>글번호</th><th>글제목</th><th>만족도</th><th>작성자</th><th>작성일</th></tr></thead>';
        
    	$.ajax({
	        type		: "get",
	        url 		: "/cambakMall/prodReviews/" + product_id,
	        data		:  {
	        		'page' : pageNum,
	        		'orderList' : orderList
	        }, 
	        contentType : "application/json",
	        success 	: function(data) {
	        	//console.log(data);
	        	let prodList = data.prodList;
	        	let pagingParam = data.pagingParam;
	        	currentPage = pagingParam.cri.page;
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
	                 
	                 if(member_id == item.member_id || grade_name =='M'){
	                	 output += '<div class="form-row float-right"><button type="button" class="btn btn-primary" onclick="location.href=\'prodReviewsModify?prodReview_no=' + item.prodReview_no + '&member_id=' + item.member_id + '\'">수정하기</button>';
	                	 output += '<button type="button" class="btn btn-info" onclick="location.href=\'prodReviewsDelete?prodReview_no=' + item.prodReview_no + '\'">삭제하기</button></div>';
	                 }
	                 
	                 // display:none 되어있는 Content 내용
	                 output += '<div>' + item.prodReview_content + '</div>';
	                 // --------------상품후기 좋아요 표시 부분-----------------
	                 output += '<div class="likeProdReviews"><span id="likeProd' + item.prodReview_no + '"></span></div>';
	                 
	                 output += '<div class="likeProdReviews">상품후기가 도움이 되었어요!</div>'
	                 // display:none 되어있는 댓글 내용
	                 output += '<div class="replyBox" id="replyBox' + item.prodReview_no + '"></div>';
	                  
	                 // 부모 댓글 작성을 위한 양식 출력 부분
	                 if(member_id != null){ // 로그인되어 있는 경우에만 댓글 작성을 보여준다.
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
            	  pageOutput += '<a class="page-link" onclick="showProdList(' + product_id + ',' + 1 + ',' + 0 + ',\'' + orderList +'\');">처음페이지로</a></li>';
            	  
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

	            	  pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + product_id + ',' + prev + ',' + 0 + ',\'' + orderList + '\'); return false;">prev</a></li>';
	            	  
	              });
	              //console.log(startPage);
	              //console.log(endPage);

	              for(var num = startPage; num <=endPage; num++){
	            	  pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + product_id + ',' + num + ',' + 0 + ',\'' + orderList + '\'); return false;">' + num + '</a></li>';
            	  }
	              
	              pageOutput += '<li class="page-item"><a class="page-link" href="#" onclick="showProdList(' + product_id + ',' + next + ',' + 0 + ',\'' + orderList + '\'); return false;">next</a></li>';
	              pageOutput += '<li class="page-item"><a class="page-link" onclick="showProdList(' + product_id + ',' + tempEndPage + ',' + 0 + ',\'' + orderList + '\');">마지막페이지로</a></li>';
	            	  
	              
	              pageOutput += '</ul></div></div>';
	              $("#prodBoardList").html(output);
	              $("#prodBoardListPage").html(pageOutput);
	              $("#prodReviewsCnt").html("상품평(" + totalCount + ")");
	              
	              
	              // --------열어놨던 페이지를 열어준 채로 로딩하는 부분-------------
	              if(checkPoint == 1){
	            	  $("#content" + prodReviewNo).show();
	              }
	              
	        }, // end of Success
	        error		: function(error) {
	        	console.log(error);
	        	
	        }, complete : function(data) { // 게시글 부분이 모두 출력되고 난 후에 이루어지는 작업 부분=complete
	            let prodList = data.responseJSON.prodList;
	        	let grade_name = "${loginMember.grade_name}";
	            //console.log(prodList);
	            
	            
            	//대댓글 작성을 위한 파트
	            $(prodList).each(function(index, item) {
	            	prodReview_no = item.prodReview_no;
	            	
	            	$.ajax({
						  type: "post",
						  url: "/cambakMall/getProdReviewReply/"+prodReview_no,
						  contentType : "application/json",
						  success : function(result) {
							  //console.log(result);

						  $(result).each(function(index, item) {
							  console.log(result);
							  
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

	
	//addReplyProdReviews 댓글 처리 부분
	function addReplyProdReviews(prodReview_no) {
				console.log("prodReview_no : " + prodReview_no);
				// 댓글 작성 시 필요한 변수들
				let product_id = 4;
				let page = $("#page").val();
				let replyProdReview_content = $("#replyProdReview_content" + prodReview_no).val();
				let member_id = "${loginMember.member_id}";
				prodReview_no = prodReview_no;
				let replyProdReview_ref = 0;
				
				$.ajax({
					  method: "post",
					  url: "/cambakMall/insertProdReviewReply",
					  headers: {	// 요청하는 데이터의 헤더에 전송
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "POST"
					  },
					  dataType: "text", // 응답 받는 데이터 타입
					  data : JSON.stringify({ // 보내는 데이터 타입(JSON형식으로 직렬화 해서 보낸다.)
						  replyProdReview_content :  replyProdReview_content,
						  member_id : member_id,
						  prodReview_no : prodReview_no,
						  replyProdReview_ref : replyProdReview_ref
					  }),
					  success : function(result) {
						  //console.log(prodReview_no);
						  console.log(product_id);
						  console.log(currentPage);
						  
						  showProdList(product_id, currentPage, 1, orderList);
						  
					  }, complete : function (result) {
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
		console.log(checkReforder);
	}
	
	//addReply 대댓글 처리 부분
	function addReply(replyProdReview_no, replyProdReview_ref, prodReview_no, replyProdReview_repMember_id) {
		// replyProdReview_content 수정 필요
		console.log(replyProdReview_repMember_id);
		let product_id = 4;
		let member_id = "${loginMember.member_id}";
		//console.log(member_id);
		/*if(replyProdReview_ref != 0){ 
			replyProdReview_ref = replyProdReview_no;
		}*/
		
		
		
		
		let replyProdReview_content = $("#replyContent" + replyProdReview_no).val();
		$.ajax({
			  method: "post",
			  url: "/cambakMall/insertProdReviewReply",
			  headers: {	// 요청하는 데이터의 헤더에 전송
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "text", // 응답 받는 데이터 타입
			  data : JSON.stringify({ // 보내는 데이터 타입(JSON형식으로 직렬화 해서 보낸다.)
				  replyProdReview_content :  replyProdReview_content,
				  member_id : member_id,
				  prodReview_no : prodReview_no,
				  replyProdReview_ref : replyProdReview_ref,
				  replyProdReview_repMember_id : replyProdReview_repMember_id
			  }),
			  success : function(result) {
				  console.log(result);

			      console.log("#checkcheck" + replyProdReview_no);
				  //$("#replyName" + replyProdReview_no).html(replyMember_id);
				  showProdList(product_id, currentPage, 1, orderList);
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
		let product_id = 4;
		
		$.ajax({
			  method: "post",
			  url: "/cambakMall/deleteProdReviewReply/" + replyProdReview_no,
			  headers: {	// 요청하는 데이터의 헤더에 전송
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "text", // 응답 받는 데이터 타입
			  success : function(deleteResult) {
				  console.log(deleteResult);
				  if(deleteResult=="true"){
					  alert("삭제 성공");
				  }
				  
				  //삭제 후 리스트를 다시 출력하라
				  showProdList(product_id, currentPage, 1, orderList);
				  
			  }
			  
			});
	}
		
	
	// 댓글 및 대댓글을 수정하는 content를 보여주는 함수
	function openModifyReply(replyProdReview_no) {

		let product_id = 4;

		$(".repliesModi").hide();
		$("#replyModify" + replyProdReview_no).toggle();
		$(".replies").hide();
		// 수정하려는 댓글 및 대댓글 read
		$.ajax({
			  method: "post",
			  url: "/cambakMall/readProdReviewReply/" + replyProdReview_no,
			  headers: {	// 요청하는 데이터의 헤더에 전송
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "text", // 응답 받는 데이터 타입
			  success : function(readResult) {
				  console.log(readResult);
				 $("#replyContentModi" + replyProdReview_no).html(readResult);
				 // 귀신 잡은 포인트.
			  }
			});
	}
		
	// 댓글 및 대댓글을 수정하는 함수
	function modifyReply(replyProdReview_no) {
		let product_id = 4;
		let replyProdReview_content = $("#replyContentModi" + replyProdReview_no).val();
		console.log(replyProdReview_content);
		$.ajax({
			  method: "post",
			  url: "/cambakMall/modifyProdReviewReply/" + replyProdReview_no + "/" + replyProdReview_content,
			  headers: {	// 요청하는 데이터의 헤더에 전송
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "text", // 응답 받는 데이터 타입
			  success : function(modifyResult) {
				  console.log(modifyResult);
				  if(modifyResult=="true"){
					  alert("수정 성공");
				  }
				  
				  //수정 후 리스트를 다시 출력하라
				  showProdList(product_id, currentPage, 1, orderList);
				  
			  }
			  
			});
		
	}

	// ----------상품후기 좋아요 클릭시 처리 부분-------------
	function clickLike(prodReview_no) {
			let member_id = "${loginMember.member_id}";
			console.log(member_id);
			console.log(prodReview_no);
			$.ajax({
				  method: "post",
				  url: "/cambakMall/insertLikeProdReviews/" + member_id + "/" + prodReview_no,
				  headers: {	// 요청하는 데이터의 헤더에 전송
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // 응답 받는 데이터 타입
				  success : function(result) {
					  console.log(result);
					  $("#content" + prodReview_no).hide();
					  showContent(prodReview_no, result);
					 //showProdList(product_id, currentPage, 1, orderList);

					  
				  }, complete : function(result) {
				}
				  
				});// end of Ajax
			
	}
	
		$(function() {
			// 화면 리스트 출력
			showProdList();
			
		});
    </script>
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
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Women’s </a>
                        <span>Essential structured blazer</span>
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
                        <div class="product__details__pic__left product__thumb nice-scroll">
                            <a class="pt active" href="#product-1">
                                <img src="../../resources/mallMain/img/product/details/thumb-1.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-2">
                                <img src="../../resources/mallMain/img/product/details/thumb-2.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-3">
                                <img src="../../resources/mallMain/img/product/details/thumb-3.jpg" alt="">
                            </a>
                            <a class="pt" href="#product-4">
                                <img src="../../resources/mallMain/img/product/details/thumb-4.jpg" alt="">
                            </a>
                        </div>
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-hash="product-1" class="product__big__img" src="../../resources/mallMain/img/product/details/product-1.jpg" alt="">
                                <img data-hash="product-2" class="product__big__img" src="../../resources/mallMain/img/product/details/product-3.jpg" alt="">
                                <img data-hash="product-3" class="product__big__img" src="../../resources/mallMain/img/product/details/product-2.jpg" alt="">
                                <img data-hash="product-4" class="product__big__img" src="../../resources/mallMain/img/product/details/product-4.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <h3>Essential structured blazer <span>Brand: SKMEIMore Men Watches from SKMEI</span></h3>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <span>( 138 reviews )</span>
                        </div>
                        <div class="product__details__price">$ 75.0 <span>$ 83.0</span></div>
                        <p>Nemo enim ipsam voluptatem quia aspernatur aut odit aut loret fugit, sed quia consequuntur
                        magni lores eos qui ratione voluptatem sequi nesciunt.</p>
                        <div class="product__details__button">
                            <div class="quantity">
                                <span>Quantity:</span>
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                            <a href="#" class="cart-btn"><span class="icon_bag_alt"></span> 주문하기 </a>
                            <ul>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__details__widget">
                            <ul>
                                <li>
                                    <span>Availability:</span>
                                    <div class="stock__checkbox">
                                        <label for="stockin">
                                            In Stock
                                            <input type="checkbox" id="stockin">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Available color:</span>
                                    <div class="color__checkbox">
                                        <label for="red">
                                            <input type="radio" name="color__radio" id="red" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="black">
                                            <input type="radio" name="color__radio" id="black">
                                            <span class="checkmark black-bg"></span>
                                        </label>
                                        <label for="grey">
                                            <input type="radio" name="color__radio" id="grey">
                                            <span class="checkmark grey-bg"></span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Available size:</span>
                                    <div class="size__btn">
                                        <label for="xs-btn" class="active">
                                            <input type="radio" id="xs-btn">
                                            xs
                                        </label>
                                        <label for="s-btn">
                                            <input type="radio" id="s-btn">
                                            s
                                        </label>
                                        <label for="m-btn">
                                            <input type="radio" id="m-btn">
                                            m
                                        </label>
                                        <label for="l-btn">
                                            <input type="radio" id="l-btn">
                                            l
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <span>Promotions:</span>
                                    <p>Free shipping</p>
                                </li>
                            </ul>
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
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" onclick="showProdList();" id="prodReviewsCnt">상품평</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">상품 문의</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">배송/교환/반품 안내</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <h6>상품 상세</h6>
                                <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed
                                    quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt loret.
                                    Neque porro lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim ipsam
                                    voluptatem quia voluptas sit aspernatur aut odit aut loret fugit, sed quia ipsu
                                    consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Nulla
                                consequat massa quis enim.</p>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget
                                    dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
                                    nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium
                                quis, sem.</p>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                           		<!-- *********아래부터 상품평 정렬순서 넣는 곳 *************************************************************-->	
                            	<ul>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'latest'); return false;" >최신순</a></li>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'grades'); return false;">별점순</a></li>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'replies'); return false;">좋아요순</a></li>
                            	</ul>
                                <!-- *********아래부터 상품평 내용 넣는 곳 *************************************************************-->
                                <div>
                                
						     	<div>
						     	<div class="form-row float-right">
						        <button type="button" class="btn btn-success" onclick="location.href='/cambakMall/writingProdReviews'">글쓰기</button>
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
                                <div>
                                
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <h6>배송/교환/반품 안내</h6>
                                <!-- *********아래부터 배송/교환/반품 안내 내용 넣는 곳 *************************************************************-->
                                <div>
                                
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
                        <h5>RELATED PRODUCTS</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-1.jpg">
                            <div class="label new">New</div>
                            <ul class="product__hover">
                                <li><a href="../resources/mallMain/img/product/related/rp-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Buttons tweed blazer</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-2.jpg">
                            <ul class="product__hover">
                                <li><a href="../resources/mallMain/img/product/related/rp-2.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Flowy striped skirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 49.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-3.jpg">
                            <div class="label stockout">out of stock</div>
                            <ul class="product__hover">
                                <li><a href="../resources/mallMain/img/product/related/rp-3.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Cotton T-Shirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../resources/mallMain/img/product/related/rp-4.jpg">
                            <ul class="product__hover">
                                <li><a href="../resources/mallMain/img/product/related/rp-4.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Slim striped pocket shirt</a></h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
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