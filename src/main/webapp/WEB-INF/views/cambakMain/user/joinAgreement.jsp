<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>

<!DOCTYPE HTML>
<html>
<head>

<meta charset="utf-8" />
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<title>Cambark's</title>

<!-- jquery -->
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="/resources/cambak21/css/SHWtamplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<!-- 게시판 공통 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>

<script>

   $(document).ready(function() {
	   let user = '${param.user }';
	   let userEmail = '${param.email }';
	   let checkId = '${registerUUID }';
	   let checkEmail = '${registerEmail }';
	   let loginMember = '${loginMember}';
	   
	   if (user != checkId || userEmail != checkEmail || checkId == "" || checkEmail == "" || loginMember != "") {
		   alert("잘못된 접근입니다.");
		   location.href="/index/main";
	   }
	   
	   $("#check_all").on("change", function () {
		   let allChecked = $("#check_all").prop("checked");
		   
		   if (!allChecked) { // false
			   $("input:checkbox").prop("checked", false);
		   } else { // true
			   $("input:checkbox").prop("checked", true);
		   }
		   
	   });
	   
   });
   
   function checkAgreeBtn() {
	   
	   let check1 = $("#check_1").prop("checked");
	   let check2 = $("#check_2").prop("checked");
	   
	   if (check1 == false || check2 == false) {
		   alert("(필수) 이용약관을 체크해주세요.");
		   return false;
	   } else {
		   $("#checkBoxComplete").submit();
	   }
	   
   }
   
   function changeCheckbox() {
	   let check1 = $("#check_1").prop("checked");
	   let check2 = $("#check_2").prop("checked");
	   
	   if (check1 == true && check2 == true) {
		   $("#check_all").prop("checked", true);
	   } else if (check1 == false || check2 == false) {
		   $("#check_all").prop("checked", false);
	   }
	   
   }
   
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap');

#main {
	font-family: 'Gothic A1', sans-serif;
}

.contentPlace{
	margin: 0 auto;
	width: 900px;
}

.registerTitle {
	border-bottom: 1px solid #dbdbdb;
	margin-bottom: 40px;
}

.registerTitleHead {
	display: inline-block;
	font-size: 28px;
	font-weight: bold;
	padding-bottom: 10px;
}

.registerBtnCancle {
	width: 150px;
	height: 55px;
	line-height: 50px;
	font-size: 14px;
	border: 1px solid #3e3d3c;
	color: #3e3d3c;
	font-weight: 900;
}

.registerBtn {
	padding-right: 296px;
	padding-left: 300px;
	margin-top: 30px;
}

.registerBtnSubmit {
	width: 150px;
	height: 55px;
	line-height: 50px;
	font-size: 14px;
	background: #3e3d3c;
	border: 1px solid #3e3d3c;
	color: #fff;
	font-weight: 900;
}

.agreeSite {
	padding-bottom: 5px;
    border-bottom: 1px solid #717171;
    color: #111;
    font-size: 20px;
    font-weight: normal;
}

.allAgreeBtn {
	color: #333;
	font-size: 16px;
	font-weight: bold;
	margin-left: 3px;
}

.termsContent {
	font-size: 13px;
	overflow-x: hidden;
	overflow-y: auto;
	height: 150px;
	margin: 10px 0 0;
	padding: 20px;
	border: 1px solid #e6e6e6;
	border-top: 1px solid #717171;
	line-height: 18px;
}

.userTerms {
	color: #333;
	font-size: 15px;
}

</style>

</head>

<body>

	<%@include file="../cambak21Header.jsp"%>

	<div id="main">
		<div id="content" class="container">
				<div class="contentPlace">
					<form action="join" id="checkBoxComplete" method="post">
						<div>
							<div class="registerTitle">
								<h2 class="registerTitleHead">회원가입 - 약관동의</h2>
							</div>
						</div>
						<div style="margin-top: 40px; margin-bottom: 20px;">
								<h2 class="agreeSite">약관 동의</h2>
						</div>
						<p style="margin: 0;" id="test">
							<input type="checkbox" id="check_all" style="cursor: pointer;"/>
							<label for="check_all" id="allCheck">
								<span class="allAgreeBtn">캠박이일의 모든 약관을 확인하고 전체 동의합니다.</span>
							</label>
						</p>
						<div style="padding: 32px 0 0;">
							<input type="checkbox" id="check_1" style="cursor: pointer;" onchange="changeCheckbox();"/>
							<label for="check_1">
								<span class="userTerms"><strong style="font-weight: bold;">(필수)</strong> 회원약관</span>
							</label>
							<div class="termsContent">
								<strong>여러분을 환영합니다.</strong><br />
								캠박's 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. <br />
								여러분의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.<br />
								<br />
								서비스를 이용하시거나 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, <br />
								잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.<br />
								<br />
								캠박's 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 <br />
								캠핑장 정보 검색, 캠핑용품 상품 쇼핑 등 여러분의 캠핑 활동에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.<br />
								<br />
								캠박's는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. <br />
								다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 <br />
								이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. <br />
								자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.<br />
							</div>
						</div>
							<div style="padding: 32px 0 20px 0;">
							<input type="checkbox" id="check_2" style="cursor: pointer;" onchange="changeCheckbox();" />
							<label for="check_2">
								<span class="userTerms"><strong style="font-weight: bold;">(필수)</strong> 개인정보 수집 및 이용</span>
							</label>
							<div class="termsContent">
								1. 수집하는 개인정보 항목"<br />
								<br />
								  캠박's은 회원가입, 서비스 이용 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br />
								<br />
								  1) 수집항목<br />
								    일반 회원 가입시<br />
								     - 필수항목 : 아이디, 패스워드, 실명, 주소, 연락처, 이메일주소, 생년월일, 성별<br />
								    서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br />
								     - IP 주소, 쿠키, 서비스 이용기록, 불량 이용 기록<br />
								<br />
								  2) 개인정보 수집방법 : 홈페이지 회원가입, 서비스 이용 신청, 회원정보 수정<br />
								<br />
								2. 개인정보의 수집 및 이용목적<br />
								<br />
								  캠박이일은 수집한 개인정보를 다음의 목적을 위해 활용하며 다른 용도로는 사용되지 않습니다.<br />
								  차후 이용목적이 변경될 시에는 사전에 동의를 구합니다.<br />
								<br />
								  1) 아이디, 패스워드 : 서비스 이용에 따른 본인식별, 중복가입 확인, 부정이용 방지를 위해 사용됩니다.<br />
								  2) 이메일주소 : 전체메일발송, 패스워드 분실 시 필요한 정보제공 및 민원처리 등을 위해 사용됩니다.<br />
								  3) 생년월일, 성별 : 연령, 성별로 제한하는 특수한 서비스를 제공할 경우 및 내부 마케팅 자료구축을 위해 사용됩니다.<br />
								  4) 전화번호 : 회원이 자신의 전화번호를 공개하거나 회원긴급연락을 위해 사용됩니다.<br />
								  5) 이용자의 IP주소, 방문일시 : 불량회원의 부정 이용방지와 비인가 사용방지, 통계학적 분석에 사용됩니다.<br />
								  6) 그 외 선택사항 : 개인 맞춤 서비스를 제공하기 위해 사용됩니다.<br />
								<br />
								3. 개인정보의 보유 및 이용기간<br />
								<br />
								  캠박이일은 회원가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br />
								<br />
								  - 보존항목 : 아이디, 비밀번호, 생년월일, 성별, 이름, 이메일주소<br />
								  - 보존근거 : 빈번한 가입과 탈퇴를 반복하는 악의적 이용 방지, 서비스 이용의 혼선 방지<br />
								  - 보존기간 : 30일<br />
								<br />
								  - 보존항목 : 회원조치이력<br />
								  - 보존근거 : 회원의 불량 이용에 대한 조치이력 보관으로 악의적 이용의 재발 방지<br />
								  - 보존기간 : 서비스 종료 시<br />
								<br />
								  - 보존항목 : ID<br />
								  - 보존근거 : 사이트 제작의 기본이 되는 그누보드가 ID를 기준으로 설계되어 있어 탈퇴 후 타인이 동일한 ID로 가입할 경우 서비스 이용의 혼선 방지<br />
								  - 보존기간 : 서비스 종료 시<br />
							</div>
						</div>
							
						<div class="registerBtn">
							<button type="button" class="registerBtnCancle" onclick="location.href='/index/main';">홈으로</button>
							<button type="submit" class="registerBtnSubmit" onclick="checkAgreeBtn(); return false;">다음단계</button>
						</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="../cambak21Footer.jsp"%>

</body>

</html>