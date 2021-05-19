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
	<script src="/resources/cambak/21js/skel-panels.min.js"></script>
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
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		hr {
			margin : 0px;
			padding : 0px;
		}
		
		.email {
			display : block;
		}
		
		#id_member_email {
			width : 80%;
			display : inline-block;
			margin-right : 2%;
			margin-bottom : 3%;
		}
		
		#pwd_member_email {
			width : 80%;
			display : inline-block;
			margin-right : 2%;
			margin-bottom : 3%;
		}
		
		.userUUID {
			width : 30%;
			display : inline-block;
			margin-right : 2%;
		}
	</style>
	<script>
		function showCheckbox(where) {
			if(where == "id") {
				let output = '<input type="text" id="id_userUUID" class="form-control userUUID" />';
				output += '<input type="button" id="id_checkUUID" value="확인" onclick="checkUuid(\'id\');" />'
				output += '<span id="id_timer"></span>';
				output += '<input type="hidden" id="id_hiddenUUID" />';
				output += '<input type="hidden" id="id_status" />';
				
				$("#id_hiddenCheckbox").html(output);
				$("#id_hiddenCheckbox").show();
			      	
			} else if(where == "pwd") {
				let output = '<input type="text" id="pwd_userUUID" class="form-control userUUID" />';
				output += '<input type="button" id="pwd_checkUUID" value="확인" onclick="checkUuid(\'pwd\');" />'
				output += '<span id="pwd_timer"></span>';
				output += '<input type="hidden" id="pwd_hiddenUUID" />';
				output += '<input type="hidden" id="pwd_status" />';
				
				$("#pwd_hiddenCheckbox").html(output);
				$("#pwd_hiddenCheckbox").show();
			}
			
		}
		
		function sendMail(where) {
			let userName = null;
			let userId = null;
			let userEmail = null;
			
			console.log(where);
			
			if(where == 'id') {
				userName = $("#id_member_name").val();
				userEmail = $("#id_member_email").val();
			} else if(where == 'pwd') {
				userId = $("#pwd_member_id").val();
				userEmail = $("#pwd_member_email").val();
			}
			
			console.log(userName, userEmail, userId);
			
			if(where == 'id' && userName.length == 0 || where == 'id' && userEmail.length == 0) {
				alert("이름 또는 이메일을 입력해주세요");
			} else if(where == 'pwd' && userEmail.length == 0 || where == 'pwd' && userId.length == 0) {
				alert("아이디 또는 이메일을 입력해주세요");
			} else {
				
				$.ajax({
					url: '/user/find_idPwd',
					headers: {	// 요청 하는 데이터의 헤더에 전송
						"Content-Type" : "application/json"
							},
					data : JSON.stringify({	// 요청하는 데이터
						member_id : userId,
						member_name : userName,
						member_email : userEmail,
						}),
					dataType : 'text', // 응답 받을 형식
					type : 'post',
					processData : false, // 전송 데이터를 쿼리 스트링 형태로 변환하는지를 결정
					contentType : false, // 기본 값 : application/x-www-form-urlencoded (form 태그의 인코딩 기본값)
					success : function(result) {
						if(result == "fail") {
							alert("저장되지 않은 이름 또는 이메일입니다. 다시 확인해 주세요");
						} else if(result == "sendFail") {
							alert("이메일이 전송되지 않았습니다");
						} else {
							alert("입력해 주신 메일로 인증번호를 전송했습니다");
							showCheckbox(where);
							setTimer(where);
							
							console.log(result);
							$("#" + where + "_hiddenUUID").html(result);
							$("#" + where + "_checkEmail").val("재인증");
						}
					},
					fail : function(result) {
						console.log(result);
						alert("이메일이 전송되지 않았습니다.");
					}
				});		
			}
			
		}
		
		function checkUuid(where) {
			let uuid = '';
			let userUUID = '';
			
			if(where == "id") {
				uuid = $("#id_hiddenUUID").text(); 
				userUUID = $("#id_userUUID").val();
			} else if(where == "pwd") {
				uuid = $("#pwd_hiddenUUID").text(); 
				userUUID = $("#pwd_userUUID").val();
			}
			
			console.log(uuid, userUUID);
			
			if(userUUID.length == 0) {
				alert("인증번호를 입력해주세요");
			} else {
				if(uuid == userUUID) {
					alert("인증이 완료되었습니다");
					$("#" + where + "_status").val("success");
					$("#" + where + "_hiddenCheckbox").hide();
					
				} else {
					alert("인증번호가 다릅니다.");
				}
			}
					
		}
		
		function setTimer(where) {
			let limit = 180;
			let min = 0;
			let sec = 0;
			
			let timer = setInterval(function() {
				min = parseInt(limit/ 60, 10);
				sec = parseInt(limit % 60, 10);
				
				min = min < 10 ? "0" + min : min;
				sec = sec < 10 ? "0" + sec : sec;
				
				$("#" + where + "_timer").html(min + "분 " + sec + "초");
				limit --;
				
				if(limit < 0) {
					setTimeout(function() {
						alert("인증 시간이 초과되었습니다. 재인증해주세요");
						$("#" + where + "_hiddenCheckbox").empty();
						
						clearInterval(timer);
					}, 0);
					
				}
				
			}, 1000);
			
		}
		
		function checkStatus(where) {
			let status = '';
				
			if(where == "id") {
				status = $("#id_status").val();
			} else if(where == "pwd") {
				status = $("#pwd_status").val();
			}
			
			if(status == "success") {
				return true;
			} else {
				alert("인증을 완료해주세요!");
			}
			
			return false;
		}
	
	</script>
</head>

<body>
    <%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>아이디/비밀번호 찾기</h2>
							<span class="byline">아이디 찾기</span>
						</header>
						<div>
						  <form action="/user/find_id" method="post">
						    <div class="form-group">
						      <label for="member_name">이름 :</label>
						      <input type="text" class="form-control" id="id_member_name" placeholder="Enter name" name="member_name">
						    </div>
						    <div class="form-group">
						      <label for="email" class="email">이메일 :</label>
						      <input type="email" class="form-control" id="id_member_email" placeholder="Enter email" name="member_email">
						      <input type="button" id="id_checkEmail" value="인증" onclick="sendMail('id');" />
						      <div id="id_hiddenCheckbox" style="display:none">
						      </div>
						    </div>
						    <button type="submit" class="btn btn-default" onclick="return checkStatus('id');">찾기</button>
						    <button type="button" class="btn btn-default" onclick="location.href='../login'">취소</button>
						  </form>
						</div>
					</section>
					<hr/>
					<section>
						<header>
							<span class="byline">비밀번호 찾기</span>
						</header>
						<div>
						  <form action="/user/find_pwd" method="post">
						    <div class="form-group">
						      <label for="member_id">아이디 :</label>
						      <input type="text" class="form-control" id="pwd_member_id" placeholder="Enter id" name="member_id">
						    </div>
						    <div class="form-group">
						      <label for="email" class="email">이메일 :</label>
						      <input type="email" class="form-control" id="pwd_member_email" placeholder="Enter email" name="member_email">
						      <input type="button" id="pwd_checkEmail" value="인증" onclick="sendMail('pwd');" />
						      <div id="pwd_hiddenCheckbox" style="display:none">
						      </div>						    	
						    </div>
						    <button type="submit" class="btn btn-default" onclick="return checkStatus('pwd');" >찾기</button>
						    <button type="button" class="btn btn-default" onclick="location.href='../user/login'">취소</button>
						  </form>
						</div>
					</section>
					  <!-- Modal -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">아이디/비밀번호 찾기</h4>
					        </div>
					        <div class="modal-body">
					          <p>아직 회원이 아닙니다</p>
					          <p>회원가입 하시겠습니까?</p>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" onclick="location.href='../user/register'">회원가입</button>
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					      </div>
					      
					    </div>
					  </div>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

    <%@include file="../cambak21Footer.jsp"%>
	
</body>

</html>