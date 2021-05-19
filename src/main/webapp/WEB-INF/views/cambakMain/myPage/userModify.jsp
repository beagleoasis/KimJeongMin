<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<script>
	//정규식
	let ko_pattern = /([^가-힣\x20])/i; 
	let special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	let number_pattern = /[0-9]/;
	let koCheck_pattern  = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	//아이디 체크 함수
	function userIdcheck() {
		let userId = $("#userNameCheck").val().replace(/(\s*)/g, "")
		console.log(userId)
        if (!userId) { // 아이디가 입력되지 않음.
        	document.getElementById("errId").innerHTML = "공백으로는 변경 불가능합니다.";
        	$("#userNameCheck").val("${member.member_name }");
        	
        }else if(special_pattern.test(userId) || number_pattern.test(userId)){
        	document.getElementById("errId").innerHTML = "한글또는 영문만 사용 가능합니다";
        	document.getElementById("userNameCheck").focus();
        }else if(ko_pattern.test(userId)){
        	document.getElementById("errId").innerHTML = "한글입력도중 모음,자음이 부족합니다.";
        	document.getElementById("userNameCheck").focus();
        }
        else if (userId.length < 2 || userId.length > 16) {
        	document.getElementById("errId").innerHTML = "아이디는 2자이상 15자이하입니다";
        	document.getElementById("userNameCheck").focus();
		}else {
			$("#userNameCheck").val(userId);
			document.getElementById("errId").innerHTML = "";
		}
	}
	//비밀번호 체크 함수
	function userPWDCheck() {
		let password = $("#userPasswordCheck").val()
	    if (!password) { // 아이디가 입력되지 않음.
	    	document.getElementById("errPwd").innerHTML = "공백으로는 변경 불가능합니다.";
	    	$("#userPasswordCheck").val(${member.member_password });
	    	
	    	
	    }else if(koCheck_pattern.test(password)){
	    	document.getElementById("errPwd").innerHTML = "비밀번호에는 한글이 들어갈 수 없습니다";
	    	document.getElementById("userPasswordCheck").focus();
	    }else if (password.length < 3 || password.length > 101) {
	    	document.getElementById("errPwd").innerHTML = "비밀번호는 4자이상 100자이하입니다";
	    	document.getElementById("userPasswordCheck").focus();
			}   
	    else {
			document.getElementById("errPwd").innerHTML = "";
		}
	}
	//생년월일 체크 함수
	function userBrithCheck() {
		let brith = $("#userBrithCheck").val()
        if (!brith) { // 아이디가 입력되지 않음.
        	document.getElementById("errBirth").innerHTML = "공백으로는 변경 불가능합니다.";
        	$("#userBrithCheck").val(<fmt:formatDate value="${member.member_birth }" type="both" pattern="yyyy-MM-dd" />)
        	
        }else if(Number($("#userBrithCheck").val().substring(0,4)< 1900 || $("#userBrithCheck").val().substring(0,4) > 2022)){
        	document.getElementById("errBirth").innerHTML = "날짜는 1900년도 이상 2021년도 이하 부터 입력하여 주세요";
        }else {
			document.getElementById("errBirth").innerHTML = "";
		}
	}
	function userAddressCheck() {
		let addr = $("#userAddresCheck").val()
        if (!addr) { // 아이디가 입력되지 않음.
        	document.getElementById("errAddr").innerHTML = "공백으로는 변경 불가능합니다.";
        	$("#userAddresCheck").val("${member.member_addr }");
        	
        }  else {
			document.getElementById("errAddr").innerHTML = "";
		}
	}
	//e-Mail주소 체크 함수
	function userEmailCheck() {
		let email = $("#userEmailCheck").val()
	       if (!email) { // 아이디가 입력되지 않음.
	       	document.getElementById("errEmail").innerHTML = "공백으로는 변경 불가능합니다.";
	       	$("#userEmailCheck").val("${member.member_email }");
	       	
	       }else if(email.indexOf("@") == -1 || email.indexOf(".") == -1 || (email.split("."))[1].length < 2){
	       	document.getElementById("errEmail").innerHTML = "이메일이 유효하지 않습니다.";
	       	document.getElementById("userEmailCheck").focus();
	       }else {
			document.getElementById("errEmail").innerHTML = "";
		}
	}
	
	function userMobileCheck() {
    	  let mobile = $("#userMobileCheck").val();
      	  mobile = mobile.replace(/[^0-9]/gi, "");
      	  mobileLength = mobile.length; 
      	  
      	  let regExp = /^01(?:0|1|[6-9])-(?:\d{3}   |\d{4})-\d{4}$/;
      	  console.log("mobile : "+mobile)
      	  if (!mobile) { // 아이디가 입력되지 않음.
        	document.getElementById("errMobile").innerHTML = "공백으로는 변경 불가능합니다.";
        	$("#userMobileCheck").val("${member.member_mobile }");
        	
      	  }else{
      		  mobile = mobile.substring(0,3)+"-"+mobile.substring(3,7)+"-"+mobile.substring(7,mobile.length)
      		  if(mobileLength < 10){
      			  document.getElementById("errMobile").innerHTML = "유효하지 않은 길이 입니다";
  		          $("#userMobileCheck").focus();
          	  }else if(!regExp.test(mobile)){
          		  document.getElementById("errMobile").innerHTML = "휴대폰 형식이 아닙니다.";
  		        	$("#userMobileCheck").focus();
          	  }else {
          		  $("#userMobileCheck").val(mobile)
        			document.getElementById("errMobile").innerHTML = "";
      	  }
      		  
    	}
     
	}
	$(function() {
		//아이디 체크
		$("#userNameCheck").on("focusout",function() {
			setTimeout(userIdcheck, 500);
		});
		
		//비밀번호 체크
		$("#userPasswordCheck").on("focusout",function() {
			setTimeout(userPWDCheck, 500);
			
		});
		//생년월일 체크
		$("#userBrithCheck").on("focusout",function() {
			setTimeout(userBrithCheck, 500);
		});
		//주소 체크
		$("#userAddresCheck").on("focusout",function() {
			setTimeout(userAddressCheck, 500);
		});
	     //e-Mail주소 체크
	   	$("#userEmailCheck").on("focusout",function() {
	   		setTimeout(userEmailCheck, 500);
		});
        //휴대전화 체크
        $("#userMobileCheck").on("focusout",function(){
        	setTimeout(userMobileCheck(), 500);
        });
	$("#modal-backdrop").click(function() {
		$("#modifyBox").hide();
		$("#modal-backdrop").hide();
	});  
	})
   //최종체크
	function check() {
		let valid = true; 
		//아이디 체크
		let userId = $("#userNameCheck").val().replace(/(\s*)/g, "")
        if (!userId) { // 아이디가 입력되지 않음.
        	document.getElementById("errId").innerHTML = "공백으로는 변경 불가능합니다.";
        	$("#userNameCheck").val(${member.member_name })
        	 valid = false;
        	
        }else if(special_pattern.test(userId) || number_pattern.test(userId)){
        	document.getElementById("errId").innerHTML = "한글또는 영문만 사용 가능합니다";
        	document.getElementById("userNameCheck").focus();
        	valid = false;
        }else if(ko_pattern.test(userId)){
        	document.getElementById("errId").innerHTML = "한글입력도중 모음,자음이 부족합니다.";
        	document.getElementById("userNameCheck").focus();
        	valid = false;
        }
        else if (userId.length < 2 || userId.length > 16) {
        	document.getElementById("errId").innerHTML = "아이디는 2자이상 15자이하입니다";
        	document.getElementById("userNameCheck").focus();
        	valid = false;
        }else {
        	 $("#userNameCheck").val(userId);
			document.getElementById("userNameCheck").innerHTML = "";
		}
		
		//비밀번호 체크
		let password = $("#userPasswordCheck").val()
        if (!password) { // 아이디가 입력되지 않음.
        	document.getElementById("errPwd").innerHTML = "공백으로는 변경 불가능합니다.";
        	$("#userPasswordCheck").val(${member.member_password });
        	 valid = false;
        	
        }else if(koCheck_pattern.test(password)){
        	document.getElementById("errPwd").innerHTML = "비밀번호에는 한글이 들어갈 수 없습니다";
        	document.getElementById("userPasswordCheck").focus();
        	valid = false;
        }else if (password.length < 3 || password.length > 101) {
        	document.getElementById("errPwd").innerHTML = "비밀번호는 4자이상 100자이하입니다";
        	document.getElementById("userPasswordCheck").focus();
        	valid = false;
   		}   
        else {
			document.getElementById("errPwd").innerHTML = "";
		}
		
		//생년월일 체크
		let brith = $("#userBrithCheck").val()
		if (!brith) { // 아이디가 입력되지 않음.
			document.getElementById("errBirth").innerHTML = "공백으로는 변경 불가능합니다.";
			$("#userBrithCheck").val(<fmt:formatDate value="${member.member_birth }" type="both" pattern="yyyy-MM-dd" />)
        	 valid = false;
        }else if(Number($("#userBrithCheck").val().substring(0,4))< 1900){
        	document.getElementById("errBirth").innerHTML = "날짜는 1900년도 이상부터 입력하여 주세요";
        	valid = false;
        }else {
			document.getElementById("errBirth").innerHTML = "";
		}
		//주소 체크
		let addr = $("#userAddresCheck").val()
        if (!addr) { // 아이디가 입력되지 않음.
        	document.getElementById("errAddr").innerHTML = "공백으로는 변경 불가능합니다.";
        	$("#userAddresCheck").val("${member.member_addr }");
        	 valid = false;
        }else {
			document.getElementById("errAddr").innerHTML = "";
		}
		
		//e-Mail주소 체크
		let email = $("#userEmailCheck").val()
        if (!email) { // 아이디가 입력되지 않음.
        	document.getElementById("errEmail").innerHTML = "공백으로는 변경 불가능합니다.";
        	$("#userEmailCheck").val("${member.member_email }");
        	valid = false;
        }else if(email.indexOf("@") == -1 || email.indexOf(".") == -1 || (email.split("."))[1].length < 2){
        	document.getElementById("errEmail").innerHTML = "이메일이 유효하지 않습니다.";
        	document.getElementById("userEmailCheck").focus();	
        	 valid = false;
        }else {
			document.getElementById("errEmail").innerHTML = "";
		}
		//휴대폰 체크

   	  let mobile = $("#userMobileCheck").val();
   	  mobile = mobile.replace(/[^0-9]/gi, "");
   	  mobileLength = mobile.length; 
   	 
   	  let regExp = /^01(?:0|1|[6-9])-(?:\d{3}   |\d{4})-\d{4}$/;
   	  if (!mobile) { // 아이디가 입력되지 않음.
     	document.getElementById("errMobile").innerHTML = "공백으로는 변경 불가능합니다.";
     	$("#userMobileCheck").val("${member.member_mobile }");
     	valid = false;
   	  }else{
   		 mobile = mobile.substring(0,3)+"-"+mobile.substring(3,7)+"-"+mobile.substring(7,mobile.length)
   		if(mobileLength < 10){
     		  document.getElementById("errMobile").innerHTML = "유효하지 않은 길이 입니다";
  	       $("#userMobileCheck").focus();
  	       valid = false;
     	  }else if(!regExp.test(mobile)){
     		  document.getElementById("errMobile").innerHTML = "휴대폰 형식이 아닙니다.";
       	$("#userMobileCheck").focus();
       	valid = false;
     	  }else {
     		  $("#userMobileCheck").val(mobile)
   			document.getElementById("errMobile").innerHTML = "";
     	  }
   	  }
  	  	console.log(valid);
		return valid
	}
		
//===========================================

//아이디 다시 되돌리기
function rollback(checkd) {
	console.log(checkd);
	switch (checkd) {
	case "name":
		$("#userNameCheck").val("${member.member_name }");
		document.getElementById("errId").innerHTML = "";
		break;
	case "pwd":
		$("#userPasswordCheck").val("${member.member_password }");
		document.getElementById("errPwd").innerHTML = "";
		break;
	case "birth":
		$("#userBrithCheck").val(<fmt:formatDate value="${member.member_birth }" type="both" pattern="yyyy-MM-dd" />)
		document.getElementById("errBirth").innerHTML = "";
		break;
	case "addr":
		$("#userAddresCheck").val("${member.member_addr }");
		document.getElementById("errAddr").innerHTML = "";
		break;
	case "email":
		$("#userEmailCheck").val("${member.member_email }");
		document.getElementById("errEmail").innerHTML = "";
		break;
	case "mobile":
		$("#userMobileCheck").val("${member.member_mobile }");
		document.getElementById("errMobile").innerHTML = "";
		break;
	default:
		$("#modifyBox").show();
		$("#modal-backdrop").show();
		document.getElementById("errMessge").innerHTML ="알 수 없는 오류입니다!!"
		break;
	}
}
	</script>
	<style type="text/css">	
		.textArray{
			width: 100px;	
			height: 30px;
			display: inline-block;
		}
		.inputArray{
			width: 500px;
			height: 30px;
			text-align: center;
			border: none;
		}
		.inputArray:focus{
		outline: none;
		border:none
		}
		.totalArray{
			border: solid 1px black;
			width: auto;
			height: 30px
		}
		.erroArray{
			width: auto;
			height: auto;
			display: inline-block;
			color: red;
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
</head>

<body>
    <%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- Content -->
				<div style="width: 100%" id="content" class="8u skel-cell-important">
					<div id="modifyBox">
						<div>오류!!</div>
							<div id="errMessge">
								
							</div>
					</div>
					<div id="modal-backdrop">
   					</div>
    				
					<section>
						<header>
							<h2>회원정보 수정</h2>
						</header>
						<div>
							<form action="/user/userDateUpdate" method="post" onsubmit="return check();">
								<input type="text" name="member_id" value="${member.member_id }" style="display: none">
							  <table>
							  	<tr>
							  		<td class="totalArray" ><span class="textArray">이름 : </span><input class="inputArray" id="userNameCheck"  name="member_name" type="text" value="${member.member_name }"/></td>
							  		<td style="width: auto;height: 30px"><input type="button"  onclick="rollback('name');" value="되돌리가"/></td>
							  		<td style="width: auto;height: 30px"><span class="erroArray"id="errId"></span></td>
							  	</tr>
							  	<tr>
							  		<td class="totalArray" ><span class="textArray">비밀번호 : </span><input class="inputArray" name="member_password"  id="userPasswordCheck" type="text" value="${member.member_password }"/></td>
							  		<td style="width: auto;height: 30px"><input type="button"  onclick="rollback('pwd');" value="되돌리가"/></td>
							  		<td><span class="erroArray"id="errPwd"></span></td>
							  	</tr>
							  	<tr>
									<td class="totalArray"><span class="textArray">생일 : </span><input class="inputArray" name="member_birth"  id="userBrithCheck"  type="date" value='<fmt:formatDate value="${member.member_birth }" type="both" pattern="yyyy-MM-dd" />'/></td>
									<td style="width: auto;height: 30px"><input type="button"  onclick="rollback('birth');" value="되돌리가"/></td>
									<td style="width: auto;height: 30px"><span class="erroArray"id="errBirth"></span></td>
							  	</tr>
							  	<tr>
							  		<td class="totalArray"><span class="textArray">주소 : </span><input class="inputArray" name="member_addr"  id="userAddresCheck" type="text" value="${member.member_addr }"/></td>
							  		<td style="width: auto;height: 30px"><input type="button"  onclick="rollback('addr');" value="되돌리가"/></td>
							  		<td style="width: auto;height: 30px"><span class="erroArray"id="errAddr"></span></td>
							  	</tr>
							  	<tr>
							  		<td class="totalArray"><span class="textArray">이메일 : </span><input class="inputArray"name="member_email"   id="userEmailCheck" type="email" value="${member.member_email }"/></td>
							  		<td style="width: auto;height: 30px"><input type="button"  onclick="rollback('email');" value="되돌리가"/></td>
							  		<td style="width: auto;height: 30px"><span class="erroArray"id="errEm	ail"></span></td>
							  	</tr>
							  	<tr>
							  		<td class="totalArray"><span class="textArray">휴대폰 번호 : </span><input class="inputArray" name="member_mobile"  id="userMobileCheck" type="text" value="${member.member_mobile }"/></td>
							  		<td style="width: auto;height: 30px"><input type="button"  onclick="rollback('mobile');" value="되돌리가"/></td>
							  		<td style="width: auto;height: 30px"><span class="erroArray"id="errMobile"></span></td>
							  	</tr>
							  
							  </table>
					          <br>
					          <hr>
					          <div style="margin: auto;display: table">
					          <input type="submit" value="수정완료"style="margin-right: 20px"/> <input type="button" value="취소" onclick="location.reload()">
					          </div>
					      	</form>
						</div>
					</section>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

    <%@include file="../cambak21Footer.jsp"%>
	
</body>

</html>