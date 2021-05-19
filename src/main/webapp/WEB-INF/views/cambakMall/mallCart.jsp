<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>캠박몰 :: 장바구니</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../../resources/mallMain/css/style.css"
	type="text/css">
<link rel="stylesheet" href="../../resources/mallMain/css/cambakMallCommon.css" type="text/css">

<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>
<script src="../../../resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<style type="text/css">
button.btn.btn-default.cntCh {
	background: lightgrey;
}

.cntChBtn-wrap {
	padding-left: 7px;
}

.totCnt-wrap {
    margin-bottom: 20px;
    font-size: 20px;
    font-weight: 600;
    margin-left: 85%;
}

.col-lg-6.col-md-6.col-sm-6.cart-btn {
	margin-left: 51%;
}

.shop__cart__table tbody tr .cart__total {
    font-size: 16px;
    color: #ca1515;
    font-weight: 600;
    width: 100px;
}

.shop__cart__table tbody tr .cart__close {
    padding: 0 30px;
}

.choiceDelete {
    padding-left: 3.5%;
    margin-top: 10px;
}
.allDelete {
    float: left;
}

.modal-sm {
	max-width: 400px;
}

</style>

<script type="text/javascript">
	let ssid = '${ssid}';
	let sameBucketLst = '${sameBucketLst}';
	let bucketQty = '${bucketQty}';
	console.log(ssid);
	
	function updateBucket(flag, prodId) {
		let member_id = "${loginMember.member_id}";
		
		let bucket_buyQty = $("#buyQty" + prodId).text();
		let bucket_sellPrice = $("#sellPrice" + prodId).val();
		let bucket_totBuyPrice = $("#totBuyPrice" + prodId).val();
		
		console.log(bucket_buyQty);
		console.log(bucket_sellPrice);
		console.log(bucket_totBuyPrice);
		
		$.ajax({
			url: '/mall/cart/updateBucekt?status=' + flag,
			headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
					},
			data : JSON.stringify({	// 요청하는 데이터
				product_id: prodId,
				member_id : member_id,
				bucket_sellPrice : bucket_sellPrice,
				bucket_buyQty : bucket_buyQty,
				bucket_totBuyPrice : bucket_totBuyPrice
				}),
			dataType : 'text', // 응답 받을 형식
			type : 'post',
			processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
			contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
			success : function(result) {
				console.log(result);
				if(result == "modiSuccess") {
					$("#statusBtns" + prodId).html("변경 완료");
				} else if(result == "addSuccess") {
					$("#statusBtns" + prodId).html("추가 완료");
				}
			},
			fail : function(result) {
				alert(result);
			},
			complete : function(result) {
				cartList();
			}
		});		
	}
	
	$(document).ready(function() {
		console.log(sameBucketLst);
		console.log(sameBucketLst.length);
		console.log(bucketQty);
		
		
		if(bucketQty == 11) {
			$("#overQty").modal();
		} else if(sameBucketLst.length == 0) {
			cartList();	
		} else if(bucketQty != 11 && sameBucketLst.length != 0){
			$("#checkModal").modal();
		}
	})
	
	// 게시글 가져오기 ajax
	function cartList() {
		let member_id = "${loginMember.member_id}"
		
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/mall/cart/" + member_id, // 서블릿 주소
			success : function(data) {
				listOutput(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 장바구니 리스트 출력
	function listOutput(data) {
		let output = "";
		let totPrice = 0;
		
		$.each(data, function(index, item) {
			console.log(item);
			output += "<tr>";
			if (item.bucket_isChecked == "Y") {
				totPrice += item.bucket_totBuyPrice;
				output += '<td><label class="checkbox-inline"><input type="checkbox" onclick="checkClick('+item.product_id+')" checked></label></td>';
			} else {
				output += '<td><label class="checkbox-inline"><input type="checkbox" onclick="checkClick('+item.product_id+')"></label></td>';
			}
			
			// 606 보다 작은거는 크롤링한 상품들
			if (item.product_id > 605) {
				output += '<td class="cart__product__item"><img src="../resources/uploads/'+item.product_img1+'" alt="" style="width: 120px">';
			} else {
				output += '<td class="cart__product__item"><img src="'+item.product_img1+'" alt="" style="width: 120px">';
			}
			output += '<div class="cart__product__item__title"><h6><a href="../mall/prodDetail/main?prodId='+item.product_id+'">'+item.product_name+'</a></h6>';
			
			// 상품 별 찍기
			output += '<div class="rating">';
			for(var i = 0; i < item.star; i++) {
				output += '<i class="fa fa-star" style="margin-right:0px"></i>';
			}
			output += '</div></td>';
			
			output += '<td class="cart__price">￦ '+item.bucket_sellPrice.toLocaleString()+'</td>';
			output += '<td class="cart__quantity"><div class="pro-qty"><span class="dec qtybtn" onclick="changeQty('+item.product_id+', -1)">-</span><input type="text" value="'+item.bucket_buyQty+'" id="'+item.product_id+'" readonly><span class="inc qtybtn" onclick="changeQty('+item.product_id+', 1)">+</span></div>';
			output += '<div class="cntChBtn-wrap"><button type="button" class="btn btn-default cntCh" onclick="change('+item.product_id+')">수량변경</button></div><div class="choiceDelete"><button type="button" class="btn btn-default cntCh choiceCtn" onclick="openBox('+item.product_id+', 1)">상품삭제</button></div></td>';
			output += '<td class="cart__total">￦ '+item.bucket_totBuyPrice.toLocaleString()+'</td>'
			output += "</tr>";
		});
		$(".cart_list").html(output);
		$(".totPrice-value").text(totPrice.toLocaleString());
	}
	
	// 수량 변경 함수
	function changeQty(no, click) {
		let product_id = "#" + no;
		
		let qty = $(product_id).val();
		
		// -1이면 빼기
		if(click == -1) {
			if (qty > 1) {
				qty--;
				$(product_id).val(qty);
			}	
		} else {
			// 수량 더하기
			qty++;
			if(qty > 10) {
				qty--;
				alert("최대 10개 까지만 가능합니다")
			} 
			$(product_id).val(qty);
		}
	}
	
	// 수량 변경 ajax
	function change(product_id) {
		let prodId = "#" + product_id;
		
		// 회원 아이디
		let member_id = "${loginMember.member_id}";
		// 변경할 수량
		let qty = $(prodId).val();
		
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/mall/cart/" + member_id + "/" + product_id + "/" + qty, // 서블릿 주소
			success : function(data) {
				if(data == 1) {
					cartList();
				}
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 장바구니 아이템 삭제 시 알림창 띄우기
	function openBox(product_id, del) {
		// del : 1이면 개별 상품 삭제, 2면 전체 상품 삭제
		if(del == 2) {
			// 전체 상품 삭제
			$("#piece").attr("onclick", "deleteItemAll()");
			$("#bsk-modal-text").text("상품 전체 삭제 하시겠습니까?");
			$("#bsk-cart-madal").modal();
		} else {
			// 개별 상품 삭제
			$("#piece").attr("onclick", "deleteItem("+product_id+")");
			$("#bsk-modal-text").text("해당 상품을 삭제 하시겠습니까?");
			$("#bsk-cart-madal").modal();
		}
	}
	
	// 장바구니에서 개별 아이템 삭제
	function deleteItem(no) {
		let product_id = no;
		let member_id = "${loginMember.member_id}";
		
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/mall/cart/delete/" + member_id + "/" + product_id, // 서블릿 주소
			success : function(data) {
				if(data == 1) {
					cartList();
				}
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 장바구니 아이템 전체 삭제
	function deleteItemAll() {
		let member_id = "${loginMember.member_id}";
		
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/mall/cart/delete/all/" + member_id, // 서블릿 주소
			success : function(data) {
				if(data == 1) {
					cartList();
				}
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 주문하기
	function goOrder() {
		let member_id = "${loginMember.member_id}";
		
		let totPrice = $(".totPrice-value").text();
		
		if(totPrice != 0) {
			$.ajax({
				type : "get",
				dataType : "json", // 응답을 어떤 형식으로 받을지	
				url : "/mall/cart/order/" + member_id, // 서블릿 주소
				success : function(data) {
					if(data == 1 || data == 0) {
						location.href="../mall/prodOrder"
					}
				}, // 통신 성공시
				error : function(data) {
				}, // 통신 실패시
				complete : function(data) {
				} // 통신 완료시
			});
		} else {
			$(".modal-footer").html('<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>');
			$("#bsk-modal-text").text("선택된 상품이 없습니다");
			$("#bsk-cart-madal").modal();
		}

	}
	
	// 체크 on off
	function checkClick(product_id) {
		let member_id = "${loginMember.member_id}";
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/mall/cart/check/" + member_id + "/" + product_id, // 서블릿 주소
			success : function(data) {
				if(data == 1) {
					cartList();
				}
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
</script>
</head>

<body>
	<%@include file="mallHeader.jsp"%>

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>Shopping
							cart</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shop__cart__table">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>Product</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody class="cart_list">
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div>
				
				<div class="allDelete"><button type="button" class="btn btn-default cntCh allDelete" onclick="openBox(-1, 2)">전체삭제</button></div>
				<div class="totCnt-wrap">합계 : ￦ <span class="totPrice-value"></span></div>
			</div>

			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 cart-btn">
					<div class="cart__btn update__btn">
						<button type="button" class="btn btn-default cntCh" onclick="window.history.back()">계속
							쇼핑하기</button>
						<button type="button" class="btn btn-default cntCh" onclick="goOrder()">주문하기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Cart Section End -->

	<!-- Instagram Begin -->
	<!--     <div class="instagram"> -->
	<!--         <div class="container-fluid"> -->
	<!--             <div class="row"> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-1.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-2.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-3.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-4.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-5.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--                 <div class="col-lg-2 col-md-4 col-sm-4 p-0"> -->
	<!--                     <div class="instagram__item set-bg" data-setbg="../../resources/mallMain/img/instagram/insta-6.jpg"> -->
	<!--                         <div class="instagram__text"> -->
	<!--                             <i class="fa fa-instagram"></i> -->
	<!--                             <a href="#">@ ashion_shop</a> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--             </div> -->
	<!--         </div> -->
	<!--     </div> -->
	<!-- Instagram End -->

	<%@include file="mallFooter.jsp"%>

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
	<!-- modal -->
	<div id="bsk-cart-madal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="bsk-modal-title"></h4>
				</div>
				<div class="modal-body" id="bsk-modal-text"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="piece">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- modal -->
	<div id="checkModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">장바구니</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" id="modalText">
					<p>이미 장바구니에 존재하는 상품입니다!</p>
					<ul>
						<c:forEach var="item" items="${sameBucketLst }">
							<li style="list-style: none;">
								<div>
								<span id="${item.product_id }">${item.product_name }</span>
								<span id="buyQty${item.product_id }">${item.bucket_buyQty }</span> 개
								<input type="hidden" id="sellPrice${item.product_id }" value="${item.bucket_sellPrice }" />
								<input type="hidden" id="totBuyPrice${item.product_id }" value="${item.bucket_totBuyPrice }" />
								<span id="statusBtns${item.product_id }">
								<button type="button" class="btn btn-default" onclick="updateBucket('add','${item.product_id }');">추가하기</button>
								<button type="button" class="btn btn-default" onclick="updateBucket('modi','${item.product_id }');">변경하기</button>
								</span>
								</div>								
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="cartList();">장바구니로</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- modal -->
	<div id="overQty" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">장바구니</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" id="modalText">
					<p>장바구니에 등록 가능한 수량은 최대 10개 입니다!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="cartList();">장바구니 보기</button>
				</div>
			</div>

		</div>
	</div>
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
</body>

</html>