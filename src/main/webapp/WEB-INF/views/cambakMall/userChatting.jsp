<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>캠박몰 :: 채팅</title>

<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />

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
<link rel="stylesheet"
	href="../../resources/mallMain/css/cambakMallCommon.css"
	type="text/css">

<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>
<script src="../../../resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	//웹소켓 전역 변수 생성
	let webSocket;
	let member_id = "${loginMember.member_id}";
	$(document).ready(function() {
		// 웹 소켓 초기화
		webSocketInit();
		// 오른쪽 최근 본 상품
		$("#main-sidebar").attr("style", "display:block; position: absolute; left:80%; top:240px");
		
		// 전송 Enter 이벤트
		$("#msg").keydown(function(key) {
			let msgLen = $("#msg").val();
			
			// 입력 숫자 출력
			if (msgLen.length <= 200) {
				$(".count").text(msgLen.length);
				$(".count").css("color", "black");
			} else {
				$(".count").text(msgLen.length);
				$(".count").css("color", "red");
			}
			
			// Enter 눌렀을 경우
			if (key.keyCode == 13) {
				if(msgLen.length < 200) {
					socketMsgSend();
					$("#msg").val("");
				} else {
					alert("최대 200자 까지만 입력 가능합니다.")
				}
			}
		});
		
		// 이미지 업로드, 드래그 앤 드롭 방식
		$(".chatting-content").on("dragenter", function(e) { //드래그 요소가 들어왔을떄
			$(this).addClass('drag-over');
		}).on("dragleave", function(e) { //드래그 요소가 나갔을때
			$(this).removeClass('drag-over');
		}).on("dragover", function(e) {
			e.stopPropagation();
			e.preventDefault();
		}).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
			e.preventDefault();
			// 드롭한 이미지 파일 정보들
			let files = e.originalEvent.dataTransfer.files;
			// FormData 객체 생성
			let data = new FormData();
			
			for (var i = 0; i < files.length; i++) {
				data.append("file", files[i]);
			}
			$.ajax({
				url : "/chatting/img/notAdmin/" + member_id,
				data : data,
				type : 'POST',
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				dataType : 'text',
				cache : false,
				success : function(data) {
					// 본인 메시지 출력
					let output = '<div class="msgOutput user-msg-wrap">';
					output += '<span class="isRead">안읽음</span><span class="msg-date">' + new Date().getHours() + ":" + new Date().getMinutes() + '</span>';
					output += '<span class="user-msg"><img src="../resources/uploads/chatting/'+data+'"></span></div>';
					$(".chatting-content").append(output);
					
					// 채팅하면 스크롤 자동으로 맨밑
					let textBox = $(".chatting-content");
					$(".chatting-content").scrollTop(textBox[0].scrollHeight);
					
					// 유저 서버로 메시지 보냄
					webSocket.send('<img src="../resources/uploads/chatting/'+data+'">');
				},
				error : function(data) {
					$("#notImg").modal();
				}, 
				complete : function(data) {
				}
			});
		});
	})
	function webSocketInit() {
		// 동적 주소 가져오기
		let hostname = $(location).attr("hostname");
		
		// 해당 주소로 웹소켓 객체 생성
		webSocket = new WebSocket("ws://"+hostname+"/userChatting/" + member_id);
		webSocket.onopen = function(event) {
			socketOpen(event);
		};
		webSocket.onclose = function(event) {
			socketClose(event);
		};
		webSocket.onmessage = function(event) {
			socketMessage(event);
		};
		webSocket.onerror = function(event) {
			socketError(event);
		};
	}
	//웹소켓 연결
	function socketOpen(event) {
		// 운영자가 접속중일때 isRead 읽음으로 업데이트
		$.ajax({
			type : "post",
			dataType : "text", // 응답을 어떤 형식으로 받을지	
			url : "/isRead/notAdmin/" + member_id, // 서블릿 주소
			success : function(data) {
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	//웹소켓 닫힘
	function socketClose(event) {
		// 웹소켓이 닫히면 연결을 재시도함
		webSocketInit();
	}
	//메시지를 보내는 메서드
	function socketMsgSend() {
		// 메시지 포맷
		let msg = $("#msg").val();
		// 메시지 DB저장		
		$.ajax({
			type : "post",
			dataType : "text", // 응답을 어떤 형식으로 받을지	
			url : "/fromUser/" + msg, // 서블릿 주소
			success : function(data) {
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
		// 운영자한테 메시지 전송
		webSocket.send(msg)
		// 본인 메시지 출력
		let output = '<div class="msgOutput user-msg-wrap">';
		output += '<span class="isRead">안읽음</span><span class="msg-date">' + new Date().getHours() + ":" + new Date().getMinutes() + '</span>';
		output += '<span class="user-msg">' + msg + '</span></div>';
		$(".chatting-content").append(output);
		// 입력창 비우기
		$("#msg").val("");
		
		// 채팅하면 스크롤 자동으로 맨밑
		let textBox = $(".chatting-content");
		$(".chatting-content").scrollTop(textBox[0].scrollHeight);
	}
	//메시지 받는 메서드
	function socketMessage(event) {
		if (event.data == "existSession") { // 운영자 세션이 존재한다면...
			$(".isRead").text("읽음");
			// 운영자가 접속중일때 isRead 읽음으로 업데이트
			$.ajax({
				type : "post",
				dataType : "text", // 응답을 어떤 형식으로 받을지	
				url : "/isRead/notAdmin/" + member_id, // 서블릿 주소
				success : function(data) {
				}, // 통신 성공시
				error : function(data) {
				}, // 통신 실패시
				complete : function(data) {
				} // 통신 완료시
			});
		} else if (event.data != "noExistSession" && event.data != "existSession") { // 운영자 한테서 메시지가 왔다면 ...
			// 운영자 메시지 출력
			let output = '<div class="userProfile"><img alt="" src="../resources/uploads/memberProfile/profileDefualt.png" style="width: 35px"></div>';
			output += '<div class="msgOutput admin-msg-wrap">';
			output += '<span class="admin-msg">' + event.data + '</span>';
			output += '<span class="msg-date">' + new Date().getHours() + ":" + new Date().getMinutes() + '</span></div>';
			$(".chatting-content").append(output);
		}
		// 채팅하면 스크롤 자동으로 맨밑
		let textBox = $(".chatting-content");
		$(".chatting-content").scrollTop(textBox[0].scrollHeight);
	}
	//웹소켓 에러
	function socketError(event) {
		alert("에러가 발생하였습니다.");
	}
	//웹소켓 종료
	function disconnect() {
		webSocket.close();
	}
</script>
<style type="text/css">
.chatting-wrap {
	display: flex;
	justify-content: center;
}
.chatting-container {
	width: 600px;
	margin-left: 50px;
}
.chatting-content {
	overflow: auto;
	max-height: 770px;
	background-color: #9bbbd4;
	min-height: 770px;
}
/* 메시지 하나하나 감싸는 부분 */
.msgOutput {
	margin: 10px 0;
}
/* 어드민 메시지 */
span.admin-msg {
	background-color: white;
	border-radius: 5px;
	padding: 5px;
	margin-left: 10px;
	word-break: break-all;
    max-width: 400px;
}
/* 유저 메시지 */
span.user-msg {
	background-color: #fef01b;
	border-radius: 5px;
	padding: 5px;
	margin-right: 10px;
	word-break: break-all;
    max-width: 400px;
}
/* 메시지 하나하나 감싸는 부분에서 유저만 */
.user-msg-wrap {
	display: flex;
	justify-content: flex-end;
}
/* 메시지 하나하나 감싸는 부분에서 어드민만 */
.admin-msg-wrap {
	display: flex;
	justify-content: flex-start;
}
/* 메시지 시간 */
span.msg-date {
	padding: 8px;
	font-size: 13px;
	color: dimgrey;
}
/* 메시지 입력창, 버튼 */
.msgText-wrap {
	display: flex;
}
/* input창 */
input.textInput {
	border: 1px solid gray;
}
/* 읽음 안읽음 */
span.isRead {
	font-size: 15px;
	padding: 8px 0;
}
.myProfile-wrap {
	margin-bottom: 50px;
}
.profile-content-wrap {
	padding-top: 20px;
}
.profile-content {
	margin-bottom: 10px;
}
.profile-content>a {
	color: black;
	font-size: 14px;
}
/* 운영자 프로필 사진 */
.userProfile {
	padding-left: 10px;
}
.img-submit {
    color: gray;
}
</style>
</head>

<body>
	<%@include file="mallHeader.jsp"%>
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="/mall/main/"><i class="fa fa-home"></i> Cambak's Mall</a>
						<span>1:1 채팅</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="myProfile-wrap">
						<c:choose>
							<c:when test="${userImg == 'memberProfile/profileDefualt.png' }">
								<img src="../resources/uploads/memberProfile/profileDefualt.png">
							</c:when>
							<c:otherwise>
								<img src="../resources/uploads/${userImg }">
							</c:otherwise>
						</c:choose>
						<div class="profile-content-wrap">
							<div class="profile-content">
								<a href="/user/Modify/${loginMember.member_id}">개인정보 수정</a>
							</div>
							<div class="profile-content">
								<a href="/mall/destinationsList">배송지관리</a>
							</div>
							<div class="profile-content">
								<a href="/board/cs/list?page=1">고객센터 바로가기</a>
							</div>
						</div>
					</div>
					<div class="shop__sidebar">
						<div class="sidebar__categories">
							<div class="section-title">
								<h4>카테고리</h4>
							</div>
							<div class="categories__accordion">
								<div class="accordion" id="accordionExample">
									<div class="card">
										<div class="card-heading active">
											<a href="/mall/categories">전체 상품</a>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse1">텐트/타프</a>
										</div>
										<div id="collapse1" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=1&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">텐트</a></li>
													<li><a
														href="/mall/categories?mainCategory_id=1&middleCategory_id=2&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">타프</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse2">침낭/매트</a>
										</div>
										<div id="collapse2" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=2&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">침낭</a></li>
													<li><a
														href="/mall/categories?mainCategory_id=2&middleCategory_id=2&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">매트</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse3">테이블/체어/배트</a>
										</div>
										<div id="collapse3" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=3&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">경량 테이블</a></li>
													<li><a
														href="/mall/categories?mainCategory_id=3&middleCategory_id=2&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">체어</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse4">랜턴</a>
										</div>
										<div id="collapse4" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=4&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">랜턴</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse5">액세서리</a>
										</div>
										<div id="collapse5" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=5&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">담요</a></li>
													<li><a
														href="/mall/categories?mainCategory_id=5&middleCategory_id=2&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">쿨러/아이스박스</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse6">화로/히터</a>
										</div>
										<div id="collapse6" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=6&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">화로대</a></li>
													<li><a
														href="/mall/categories?mainCategory_id=6&middleCategory_id=2&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">착화제</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse7">수납/케이스</a>
										</div>
										<div id="collapse7" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=7&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">수납/케이스</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse8">키친/취사용품</a>
										</div>
										<div id="collapse8" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=8&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">식기/일반</a></li>
													<li><a
														href="/mall/categories?mainCategory_id=8&middleCategory_id=2&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">설거지용품</a></li>
													<li><a
														href="/mall/categories?mainCategory_id=8&middleCategory_id=3&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">버너</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-heading">
											<a data-toggle="collapse" data-target="#collapse9">기타</a>
										</div>
										<div id="collapse9" class="collapse"
											data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a
														href="/mall/categories?mainCategory_id=9&middleCategory_id=1&prodRankOrder=cmRank&priceRangeOrder=all&ratingSorter=false&prodScore=&page=1&perPageNum=12"
														style="cursor: pointer;">기타</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="chatting-wrap">
					<div class="chatting-container">
						<div class="chatting-content">
							<!-- 메시지 출력 -->
							<c:forEach var="item" items="${chatting }">
								<!-- 유저가 보낸 메시지 -->
								<c:if test="${item.member_id != 'admin' }">
									<div class="msgOutput user-msg-wrap">
										<!-- 읽음 안읽음 -->
										<c:choose>
											<c:when test="${item.chatting_isRead == 'Y' }">
												<span class="isRead">읽음</span>
											</c:when>
											<c:otherwise>
												<span class="isRead">안읽음</span>
											</c:otherwise>
										</c:choose>
										<span class="msg-date"> <fmt:formatDate
												value="${item.chatting_date }" pattern="HH:mm" type="DATE" />
										</span> <span class="user-msg">${item.chatting_content }</span>
									</div>
								</c:if>

								<!-- 운영자가 보낸 메시지 -->
								<c:if test="${item.member_id == 'admin' }">
									<div class="userProfile">
										<img alt="" src="../resources/uploads/${item.member_img }"
											style="width: 35px">
									</div>
									<div class="msgOutput admin-msg-wrap">
										<span class="admin-msg">${item.chatting_content }</span><span
											class="msg-date"><fmt:formatDate
												value="${item.chatting_date }" pattern="HH:mm" type="DATE" /></span>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="msgText-wrap">
							<input class="textInput" id="msg" type="text" style="width: 85%"
								placeholder="메시지를 입력해 주세요">
							<button type="button" id="btnSend" class="btn btn-primary"
								onclick="socketMsgSend()" style="border-radius: 0">전송하기</button>
						</div>
						<div class="img-submit">※ 이미지 파일을 채팅창에 끌어다 놓으면 보내실 수 있습니다.</div>
					</div>
				</div>
				<script type="text/javascript">
					//스크롤 자동으로 맨밑
					let textBox = $(".chatting-content");
					$(".chatting-content").scrollTop(textBox[0].scrollHeight);
				</script>
			</div>

		</div>
	</section>

	<!-- Instagram Begin -->
	<div class="instagram">
		<div class="container-fluid">
			<div class="row">
				<c:forEach var="item" items="${popularList }">
					<div class="col-lg-2 col-md-4 col-sm-4 p-0"
						style="cursor: pointer;"
						onclick="location.href='/mall/prodDetail/main?prodId=${item.product_id }'">
						<div class="instagram__item set-bg"
							data-setbg="${item.product_img1 }">
							<div class="instagram__text">
								<a>More View</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- Instagram End -->

	<%@include file="mallFooter.jsp"%>

	<!-- modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" id="modalText"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="piece">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>
	
		<!-- modal -->
	<div id="notImg" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">알림</h4>
				</div>
				<div class="modal-body" id="modalText">이미지 파일이 아닙니다!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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