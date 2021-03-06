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
		    resize:none;/* ???????????? */ 
		    margin-top: 30px;
		/*   resize: horizontal; // ??????????????? ???????????? 
			resize: vertical;  ??????????????? ????????????  */
		}
		/*????????? textarea ??????*/
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
    
	// ajax????????? ????????? ?????? ????????????
    let currentPage;
	let prodReviewNo;
	let prodReview_likeCnt;
	
	// ????????? ????????? ?????? ????????????
	let replyMember_id;
	let replyProdReview_no1;
	
	 // ajax ?????? onclick ??? content ??? ????????? ???????????? ??????
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
			// ????????? ????????????
				//$("#content" + prodReview_no).toggle();
			
				// ????????? ?????? ????????????
				$.ajax({
					  method: "post",
					  url: "/cambakMall/getProdReviewsLike/" + member_id + "/" + prodReview_no,
					  headers: {	// ???????????? ???????????? ????????? ??????
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "POST"
					  },
					  dataType: "text", // ?????? ?????? ????????? ??????
					  success : function(data) {

					      console.log(data);
					      
					      // ???????????? ?????? ??? ?????????,
					      if(data==0){
					    	  showLike = '<img src=\'../../resources/img/heartProdReviewsEmpty.png\' onclick="clickLike('+ prodReview_no +')";/>' + prodReview_likeCnt;
					    	  $("#likeProd" + prodReview_no).html(showLike);
					      }else{// ???????????? ???????????????
					    	  showLike = '<img src=\'../../resources/img/heartProdReviews.png\' onclick="clickLike('+ prodReview_no +')";/>' + prodReview_likeCnt;
					    	  $("#likeProd" + prodReview_no).html(showLike);
					      }
					      
					  }
					  
					}); // end of ajax
					
		}


	 // ????????? ?????? ??? ????????? ???????????? ??????
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


    // ????????? ?????? ????????? ajax??? ?????? ????????? ??????
    function showProdList(product_id, pageNum, checkPoint, orderList) {
    	product_id = 4;
    	member_id = "${loginMember.member_id}";
    	// ????????? ??????
    	let grade_name = "${loginMember.grade_name}";
    	// ????????? ????????? ????????? ?????? ???,
    	if(pageNum == null){
    		pageNum =1;
    	}
    	if(checkPoint == null){
    		checkPoint = 0;
    	}
    	console.log(checkPoint);
    	// ?????? ?????? ????????? ???????????? ??????
    	if(orderList == null){
    		// ?????? ????????? ????????? ??????
    		orderList = "latest";
    	} else{ // ????????? ??????????????? ?????? ???,
    		orderList = orderList;
    	}
    	console.log(orderList);
    	
    	console.log(pageNum);
    	// ------------------????????? ????????? ??????-------------------------------
    	let output = '<div>';
        output += '<table class="table table-hover"><thead><tr><th>?????????</th><th>?????????</th><th>?????????</th><th>?????????</th><th>?????????</th></tr></thead>';
        
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
	        	
	        	// ?????? ?????? ?????? ????????? ?????? ?????? ??????
	        	let showDate;
	        	let showThisDate;
	        	
	        	// ?????? ????????? ?????? ??????
	        	// ----------------------------prodList ---------------------------------
	        	 $(prodList).each(function(index, item) {
	        		 // ?????? ?????? ?????? ?????? ??????
	        		 showDate = new Date(item.prodReview_postDate);
	                 showThisDate = showDate.toLocaleString();
	                 
	                 // ????????? ?????? ?????? ??????
	                
	                 output += '<tr id=' + item.prodReview_no + ' onclick="showContent(' + item.prodReview_no + "," + item.prodReview_likeCnt +');"><td>' + item.prodReview_no + '</td><td><div>' + item.prodReview_title; + '</div></td>';
	                 output += '<td class="stars" id="star">' + showStars(item.prodReview_grade) + '<div class="starrr1"></div></td>';
	                 output += '<td>' + item.member_id + '</td><td><span class="sendTime">' + showThisDate + '</span></td>';
	                 output += '</tr>';
	                 output += '<tr id="content' + item.prodReview_no +'" style="display: none">';
	                 output += '<td colspan="6">';
	                 
	                 if(member_id == item.member_id || grade_name =='M'){
	                	 output += '<div class="form-row float-right"><button type="button" class="btn btn-primary" onclick="location.href=\'prodReviewsModify?prodReview_no=' + item.prodReview_no + '&member_id=' + item.member_id + '\'">????????????</button>';
	                	 output += '<button type="button" class="btn btn-info" onclick="location.href=\'prodReviewsDelete?prodReview_no=' + item.prodReview_no + '\'">????????????</button></div>';
	                 }
	                 
	                 // display:none ???????????? Content ??????
	                 output += '<div>' + item.prodReview_content + '</div>';
	                 // --------------???????????? ????????? ?????? ??????-----------------
	                 output += '<div class="likeProdReviews"><span id="likeProd' + item.prodReview_no + '"></span></div>';
	                 
	                 output += '<div class="likeProdReviews">??????????????? ????????? ????????????!</div>'
	                 // display:none ???????????? ?????? ??????
	                 output += '<div class="replyBox" id="replyBox' + item.prodReview_no + '"></div>';
	                  
	                 // ?????? ?????? ????????? ?????? ?????? ?????? ??????
	                 if(member_id != null){ // ??????????????? ?????? ???????????? ?????? ????????? ????????????.
	                	 output += '<div class="card mb-2"><div class="card-header bg-light">?????? ??????</div>';
	                	 output += '<div class="card-body"><ul class="list-group list-group-flush"><li class="list-group-item"><div class="form-inline mb-2"><label for="replyId"></label></div>';
	                	 output += '<div><p class="card-text"><textarea id="replyProdReview_content' + item.prodReview_no + '" name="replyProdReview_content" placeholder="????????? ??????????????????." ></textarea><div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="addReplyProdReviews(' + item.prodReview_no + ');">????????????</button></div></p></li></ul></div>';
	                	 output += '</td>';
	                 }
	                 
	        	  });// end of foreach prodList

	              output += '</tr></table></div>';
	              
	              
	              // ------------????????? ?????? ??????-------------------------
	              let startPage;
	              let endPage;
	              let tempEndPage;
	              let totalCount;
	              let prev;
	              let next;
	              let pageOutput = '<div class="text-center"><ul class="pagination"><li class="page-item">';
            	  pageOutput += '<a class="page-link" onclick="showProdList(' + product_id + ',' + 1 + ',' + 0 + ',\'' + orderList +'\');">??????????????????</a></li>';
            	  
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
	              pageOutput += '<li class="page-item"><a class="page-link" onclick="showProdList(' + product_id + ',' + tempEndPage + ',' + 0 + ',\'' + orderList + '\');">?????????????????????</a></li>';
	            	  
	              
	              pageOutput += '</ul></div></div>';
	              $("#prodBoardList").html(output);
	              $("#prodBoardListPage").html(pageOutput);
	              $("#prodReviewsCnt").html("?????????(" + totalCount + ")");
	              
	              
	              // --------???????????? ???????????? ????????? ?????? ???????????? ??????-------------
	              if(checkPoint == 1){
	            	  $("#content" + prodReviewNo).show();
	              }
	              
	        }, // end of Success
	        error		: function(error) {
	        	console.log(error);
	        	
	        }, complete : function(data) { // ????????? ????????? ?????? ???????????? ??? ?????? ??????????????? ?????? ??????=complete
	            let prodList = data.responseJSON.prodList;
	        	let grade_name = "${loginMember.grade_name}";
	            //console.log(prodList);
	            
	            
            	//????????? ????????? ?????? ??????
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
							  if(item.replyProdReview_no == item.replyProdReview_ref){// ?????? ????????? ??????,
								  replyOutput = '<div class="card mb-2" ><div class="card-header bg-light">';
							  }else{// ???????????? ???????????? ?????????????????? 10% ???????????? ?????? ????????? ??????
								  replyOutput = '<div class="card mb-2" style="margin-left:10%"><div class="card-header bg-light">';
							  }
								  

							  if(item.replyProdReview_no != item.replyProdReview_ref){ // ???????????? ??????, ????????? ???????????? ??????
					        	  replyOutput += '<img src="/resources/cambak21/img/replyimg.png" width="20px" height="15px">';
					          }
							  
							  //????????? ?????? ?????? ????????? ?????? ??????
					          let showDate = new Date(item.replyProdReview_date);
					          let showThisDate = showDate.toLocaleString();
					          
					          //-----------------?????? ??? ????????? ?????? ??????--------------------
				              replyOutput += '<i class="fa fa-user-circle-o fa-2x"></i>' + item.member_id + '<div>' + showThisDate + ' replyProdReview_no : ' + item.replyProdReview_no +'</div></div><div class="card-body"><ul class="list-group list-group-flush">';
				              replyOutput += '<li class="list-group-item"><div class="form-inline mb-2"><label for="replyId"></label></div>';
				              replyOutput += '<div><span id="replyName' + item.replyProdReview_no + '"></span><span id="replyMemberName' + item.replyProdReview_no + '"></span><p class="card-text">';
				              //????????? ????????? ?????? '????????? ???????????????' ????????? ?????? ?????? ??????
				              if(item.replyProdReview_isDelete == 'Y'){
				            	  replyOutput += '<span>????????? ???????????????.</span></p><div>'
				              } else{
				            	  // ???????????? ??????, ?????? ????????? ????????? ???????????? ??????
				            	  if(item.replyProdReview_repMember_id != null){
				            		  replyOutput += '<span><strong>@' + item.replyProdReview_repMember_id + ' </strong></span><span id="replyContents' + item.replyProdReview_no + '">' + item.replyProdReview_content + '</span></p><div>';
				            	  }else{// ???????????? ?????? ????????????, ?????? ?????? ?????? ???????????? ????????? ??????
				            		  replyOutput += '<span id="replyContents' + item.replyProdReview_no + '">' + item.replyProdReview_content + '</span></p><div>';  
				            	  }
				            	  
				              }
				              //?????? ??????(???????????? ??????????????? ???????????? ??????)
				              if(${loginMember.member_id != null}){
				            	  replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="javascript:showReply(' + item.replyProdReview_no +');">??????</button>';
				              }
				              
				              if(item.member_id == "${loginMember.member_id}" || grade_name =='M'){ // ????????? ???????????? ????????? ??????, ???????????? ???????????? ??????/?????? ??????
				              //?????? ??????
				              replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="openModifyReply(' + item.replyProdReview_no +');">??????</button>';
				              //?????? ??????
				              replyOutput += '<button type="button" class="btn btn-dark" style="cursor:pointer" onClick="deleteReply(' + item.replyProdReview_no +');">??????</button>';
				              }
				          
				              replyOutput += '</li></ul></div>'; // ???????????? ??????
				              
				              // ------------------------????????? ?????? ??????--------------------------
				              replyOutput += '<div class="replies" id="reply' + item.replyProdReview_no + '" style="display: none"><p class="card-text"><div class="card"><span><strong>' + item.member_id + ' ????????? ?????? ?????????...</strong></span><div class="card-body"><textarea class="reReply" id="replyContent' + item.replyProdReview_no + '" name="replyProdReview_content" placeholder="???????????? ??????????????????." ></textarea></div></div></p>';
				              replyOutput += '<div id="get' + item.replyProdReview_no + '" value="' + item.replyProdReview_ref + '"></div>';
				              replyOutput += '<div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="addReply(' + item.replyProdReview_no+ "," + item.replyProdReview_ref + "," + item.prodReview_no + ",\'" + item.member_id +'\');">???????????????</button></div></div>';
								
				              // ????????? ?????? ?????? ??????
				              replyOutput += '<div class="repliesModi" id="replyModify' + item.replyProdReview_no + '" style="display: none"><p class="card-text"><div class="card"><span><strong>' + item.member_id + ' ?????? ?????? ????????????...</strong></span><div class="card-body"><textarea class="reReply" id="replyContentModi' + item.replyProdReview_no + '" name="replyProdReview_content" placeholder="???????????? ??????????????????." ></textarea></div></div></p>';
				              replyOutput += '<div id="get' + item.replyProdReview_no + '" value="' + item.replyProdReview_ref + '"></div>'
				              replyOutput += '<div class="form-row float-right"><button class="btn btn-success" id="replyAddBtn" onclick="modifyReply(' + item.replyProdReview_no +');">?????? ??????</button></div></div>';

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

	
	//addReplyProdReviews ?????? ?????? ??????
	function addReplyProdReviews(prodReview_no) {
				console.log("prodReview_no : " + prodReview_no);
				// ?????? ?????? ??? ????????? ?????????
				let product_id = 4;
				let page = $("#page").val();
				let replyProdReview_content = $("#replyProdReview_content" + prodReview_no).val();
				let member_id = "${loginMember.member_id}";
				prodReview_no = prodReview_no;
				let replyProdReview_ref = 0;
				
				$.ajax({
					  method: "post",
					  url: "/cambakMall/insertProdReviewReply",
					  headers: {	// ???????????? ???????????? ????????? ??????
						  "Content-Type" : "application/json",
						  "X-HTTP-Method-Override" : "POST"
					  },
					  dataType: "text", // ?????? ?????? ????????? ??????
					  data : JSON.stringify({ // ????????? ????????? ??????(JSON???????????? ????????? ?????? ?????????.)
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
	
	//?????? ????????? ????????????
	function showReply(replyProdReview_no) {

		$(".repliesModi").hide();
		$(".replies").hide();
		$("#reply" + replyProdReview_no).toggle();
		let checkReforder = $("#get" + replyProdReview_no).val();
		console.log(checkReforder);
	}
	
	//addReply ????????? ?????? ??????
	function addReply(replyProdReview_no, replyProdReview_ref, prodReview_no, replyProdReview_repMember_id) {
		// replyProdReview_content ?????? ??????
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
			  headers: {	// ???????????? ???????????? ????????? ??????
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "text", // ?????? ?????? ????????? ??????
			  data : JSON.stringify({ // ????????? ????????? ??????(JSON???????????? ????????? ?????? ?????????.)
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
			
		// ???????????? ????????? ????????? id?????? ???????????? text??? ???????????? ??????
	      //$('#checkcheck' + replyProdReview_no).append("????????????");
	      
		
	}
	
	// ?????? ??? ???????????? ???????????? ??????
	function deleteReply(replyProdReview_no) {
		console.log(replyProdReview_no);
		//replyProdReview_no = replyProdReview_no;
		let product_id = 4;
		
		$.ajax({
			  method: "post",
			  url: "/cambakMall/deleteProdReviewReply/" + replyProdReview_no,
			  headers: {	// ???????????? ???????????? ????????? ??????
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "text", // ?????? ?????? ????????? ??????
			  success : function(deleteResult) {
				  console.log(deleteResult);
				  if(deleteResult=="true"){
					  alert("?????? ??????");
				  }
				  
				  //?????? ??? ???????????? ?????? ????????????
				  showProdList(product_id, currentPage, 1, orderList);
				  
			  }
			  
			});
	}
		
	
	// ?????? ??? ???????????? ???????????? content??? ???????????? ??????
	function openModifyReply(replyProdReview_no) {

		let product_id = 4;

		$(".repliesModi").hide();
		$("#replyModify" + replyProdReview_no).toggle();
		$(".replies").hide();
		// ??????????????? ?????? ??? ????????? read
		$.ajax({
			  method: "post",
			  url: "/cambakMall/readProdReviewReply/" + replyProdReview_no,
			  headers: {	// ???????????? ???????????? ????????? ??????
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "text", // ?????? ?????? ????????? ??????
			  success : function(readResult) {
				  console.log(readResult);
				 $("#replyContentModi" + replyProdReview_no).html(readResult);
				 // ?????? ?????? ?????????.
			  }
			});
	}
		
	// ?????? ??? ???????????? ???????????? ??????
	function modifyReply(replyProdReview_no) {
		let product_id = 4;
		let replyProdReview_content = $("#replyContentModi" + replyProdReview_no).val();
		console.log(replyProdReview_content);
		$.ajax({
			  method: "post",
			  url: "/cambakMall/modifyProdReviewReply/" + replyProdReview_no + "/" + replyProdReview_content,
			  headers: {	// ???????????? ???????????? ????????? ??????
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "text", // ?????? ?????? ????????? ??????
			  success : function(modifyResult) {
				  console.log(modifyResult);
				  if(modifyResult=="true"){
					  alert("?????? ??????");
				  }
				  
				  //?????? ??? ???????????? ?????? ????????????
				  showProdList(product_id, currentPage, 1, orderList);
				  
			  }
			  
			});
		
	}

	// ----------???????????? ????????? ????????? ?????? ??????-------------
	function clickLike(prodReview_no) {
			let member_id = "${loginMember.member_id}";
			console.log(member_id);
			console.log(prodReview_no);
			$.ajax({
				  method: "post",
				  url: "/cambakMall/insertLikeProdReviews/" + member_id + "/" + prodReview_no,
				  headers: {	// ???????????? ???????????? ????????? ??????
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override" : "POST"
				  },
				  dataType: "text", // ?????? ?????? ????????? ??????
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
			// ?????? ????????? ??????
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
                        <a href="#">Women???s </a>
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
                            <a href="#" class="cart-btn"><span class="icon_bag_alt"></span> ???????????? </a>
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
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">?????? ??????</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" onclick="showProdList();" id="prodReviewsCnt">?????????</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">?????? ??????</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">??????/??????/?????? ??????</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <h6>?????? ??????</h6>
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
                           		<!-- *********???????????? ????????? ???????????? ?????? ??? *************************************************************-->	
                            	<ul>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'latest'); return false;" >?????????</a></li>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'grades'); return false;">?????????</a></li>
                            	<li class="orderList"><a href="" onclick="showProdList(0,1,0,'replies'); return false;">????????????</a></li>
                            	</ul>
                                <!-- *********???????????? ????????? ?????? ?????? ??? *************************************************************-->
                                <div>
                                
						     	<div>
						     	<div class="form-row float-right">
						        <button type="button" class="btn btn-success" onclick="location.href='/cambakMall/writingProdReviews'">?????????</button>
						        </div>
						     	<div id="prodBoardList"></div>
								<div id="prodBoardListPage"></div>
								
								
								</div>
                                
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <h6>?????? ??????</h6>
                                <!-- *********???????????? ???????????? ?????? ?????? ??? *************************************************************-->
                                <div>
                                
                                </div>
                                <!-- ******************************************************************************************** -->
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <h6>??????/??????/?????? ??????</h6>
                                <!-- *********???????????? ??????/??????/?????? ?????? ?????? ?????? ??? *************************************************************-->
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