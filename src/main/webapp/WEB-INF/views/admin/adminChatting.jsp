<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- Custom CSS -->
<link href="../resources/adminAssets/libs/flot/css/float-chart.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<script src="../resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>

<script type="text/javascript">
	//웹소켓 전역 변수 생성
	let webSocket;
	let member_id = "${param.id}";
	
	$(document).ready(function() {
		// 웹 소켓 초기화
		webSocketInit();
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
				url : "/chatting/img/admin/" + member_id,
				data : data,
				type : 'POST',
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				dataType : 'text',
				cache : false,
				success : function(data) {
					// 이미지 DB에 저장 성공하면 이미지 출력
					let output = '<div class="msgOutput user-msg-wrap">';
					output += '<span class="isRead">안읽음</span><span class="msg-date">' + new Date().getHours() + ":" + new Date().getMinutes() + '</span>';
					output += '<span class="user-msg"><img src="../resources/uploads/chatting/'+data+'"></span></div>';
					$(".chatting-content").append(output);
					
					// 채팅하면 스크롤 자동으로 맨밑
					let textBox = $(".chatting-content");
					$(".chatting-content").scrollTop(textBox[0].scrollHeight);
					
					// 유저 서버로 메시지 보냄
					webSocket.send('<img src="../resources/uploads/chatting/'+data+'">' + ":" + member_id);
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
		let hostname = $(location).attr("hostname");
		
		// 해당 주소로 웹소켓 객체 생성
		webSocket = new WebSocket("ws://"+hostname+"/adminChatting/"+ member_id);
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
		// 연결 할때 isRead컬럼 업데이트
		$.ajax({
			type : "post",
			dataType : "text", // 응답을 어떤 형식으로 받을지	
			url : "/isRead/admin/" + member_id, // 서블릿 주소
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
		// 운영자가 보내는 메시지 DB에 저장
		$.ajax({
			type : "post",
			dataType : "text", // 응답을 어떤 형식으로 받을지	
			url : "/fromAdmin/" + msg + "/" + member_id, // 서블릿 주소
			success : function(data) {
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
		// 유저 서버로 메시지 보냄
		webSocket.send(msg + ":" + member_id);
		// 본인 메시지 출력
		let output = '<div class="msgOutput user-msg-wrap">';
		output += '<span class="isRead">안읽음</span><span class="msg-date">'
				+ new Date().getHours() + ":" + new Date().getMinutes()
				+ '</span>';
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
		let fromUserData = event.data.split(":");
		// 유저가 보낸 메시지
		let msg = fromUserData[0];
		if (msg == "existSession") { // 운영자 세션이 존재한다면...
			$(".isRead").text("읽음");
			// 유저가 접속중일때 isRead 읽음으로 업데이트
			$.ajax({
				type : "post",
				dataType : "text", // 응답을 어떤 형식으로 받을지	
				url : "/isRead/admin/" + member_id, // 서블릿 주소
				success : function(data) {
				}, // 통신 성공시
				error : function(data) {
				}, // 통신 실패시
				complete : function(data) {
				} // 통신 완료시
			});
		} else if (msg != "noExistSession" && msg != "existSession") { // 유저 한테서 메시지가 왔다면 ...
			// 유저 메시지 출력
			let output = '<div class="userProfile"><img alt="" src="../resources/uploads/${loginMember.member_img }" style="width: 35px"></div>';
			output += '<div class="msgOutput admin-msg-wrap">';
			output += '<span class="admin-msg">' + msg + '</span>';
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
.template {
	float: left;
	border: 1px solid black;
}
/* 채팅 관련 */
.chatting-wrap {
	display: flex;
	justify-content: center;
}
.chatting-container {
	width: 100%;
	padding: 20px 50px 100px 50px;
}
.chatting-content {
	overflow: auto;
	max-height: 770px;
	background-color: white;
	min-height: 770px;
}
/* 메시지 하나하나 감싸는 부분 */
.msgOutput {
	margin: 10px 0;
}
/* 어드민 메시지 */
span.admin-msg {
	background-color: #f8f9fa;
	border-radius: 5px;
	padding: 5px;
	margin-left: 10px;
	word-break: break-all;
    max-width: 400px;
}
/* 유저 메시지 */
span.user-msg {
	background-color: #27a9e3;
	border-radius: 5px;
	padding: 5px;
	margin-right: 10px;
	color: white;
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
	border: 1px solid lightgray;
}
/* 읽음 안읽음 */
span.isRead {
	font-size: 15px;
	padding: 8px 0;
}
/* 유저 프로필 사진 출력 */
.userProfile {
	padding-left: 10px;
}
#btnSend {
	background-color: #27a9e3;
	border: 1px solid #27a9e3;
}
.img-submit {
	color: gray;
	display: inline-block;
}

.msgCnt {
    float: right;
    font-size: 20px;
}
</style>
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
						<h4 class="page-title">실시간 채팅 문의</h4>
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

			<div class="chatting-wrap">
				<div class="chatting-container">
					<div class="chatting-content">
						<!-- 메시지 출력 -->
						<c:forEach var="item" items="${chatting }">
							<!-- 운영자가 보낸 메시지 -->
							<c:if test="${item.member_id == 'admin' }">
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
							
							<!-- 유저 보낸 메시지 -->
							<c:if test="${item.member_id != 'admin' }">
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
						<input class="textInput" id="msg" type="text" style="width: 100%"
							placeholder="메시지를 입력해 주세요">
						<button type="button" id="btnSend" class="btn btn-primary"
							onclick="socketMsgSend()" style="border-radius: 0">전송하기</button>
					</div>
					<div class="img-submit">※ 이미지 파일을 채팅창에 끌어다 놓으면 보내실 수 있습니다.</div>
					<div class="msgCnt"><span class="count">0</span> / 200</div>
				</div>
			</div>

			<script type="text/javascript">
				//스크롤 자동으로 맨밑
				let textBox = $(".chatting-content");
				$(".chatting-content").scrollTop(textBox[0].scrollHeight);
			</script>
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
		<!-- 본문 작성 끝  -->
		<%@ include file="adminFooter.jsp"%>
		<%@ include file="adminJs.jsp"%>
	</div>
</body>
</html>