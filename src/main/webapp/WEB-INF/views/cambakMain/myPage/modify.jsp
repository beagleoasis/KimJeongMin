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
<title>Cambark's</title>

<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/SHWtamplet.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageAside.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageTemplet.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/myPage.js"></script> <!-- 마이페이지 공동 js파일 -->

<script>
let koreanJ = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //  한글 정규표현식
let numberJ = /[0-9]/; // 숫자 정규표현식
let StringJ = /[a-zA-Z]/; // 문자 정규표현식
let specialJ = /[.,/~!@#$%^&*()_+|<>?:{}]/; // 특수문자 정규표현식
let nameJ = /^[가-힣]{2,17}$/; // 이름 정규표현식
let blankJ = /\s/; // 공백 정규표현식
let savedProFile ="";

$(document).ready(function() {
   
   $('#clickFileSelector').click(function (e) {
		// 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
		e.preventDefault();
		$('#profile').click();
	});

   $("body,html").animate({scrollTop: 300}, 1);
   
});

function changeBasicProfilePic() {
	$("#member_img").val("memberProfile/profileDefualt.png");
	$("#tmpUserProfile").attr("src", "/resources/uploads/memberProfile/profileDefualt.png");
}

function changePhoneCancel() {
	$("#modifyPhone").css("display", "none");
	$("#phoneSecond").val("");
	$("#phoneThird").val("");
	$("#userPhoneNumber").css("display", "");
}

function changePhoneBtn() {
	$("#userPhoneNumber").css("display", "none");
	$("#modifyPhone").css("display", "");
}

function getSelectAddress(sendAddress) {
	$("#getZipCode").val(sendAddress[1]);
	$("#getAddress").val(sendAddress[0]);
	$("#detailAddress").val("");
	closeAddrBar();
}

function closeAddrBar() {
	$("#searchAddrBar").css("display", "none");
	$("#searchAddrBar").html("");
}

function viewAddressFrame() {
	$("#searchAddrBar").css("display", "block");
	$("#searchAddrBar").html('<iframe id="addrSearchBar" width="650" height="478" src="/user/addrSearch" class="addressFrame"></iframe>');
}

function saveUserProFile() {

	let imgFile = $('#profile').val();
	imgFile = imgFile.substring(imgFile.lastIndexOf(".") + 1);
	
	let maxSize = 10 * 1024 * 1024; // 10485760 byte
	
	if(imgFile != "") {
		let fileSize = $("#profile")[0].files[0].size;
	    
	    if(imgFile == "jpg" || imgFile == "jpeg" || imgFile == "png") {
	    	
			if (savedProFile == "") {
				profileSave();
			} else {
				deleteTmpProfile();
				profileSave();
			}
	    	
	    } else if(fileSize > maxSize) {
	    	alert("파일 사이즈는 10MB까지 가능");
	        return;
	    } else {
	    	alert("jpg, jpeg, png파일만 업로드 가능");
	        return;
	    }
	}
	

	
}

function deleteTmpProfile() {
	
	$.ajax({
		url : '/user/deleteProfile',
		data : {tmpProfile : savedProFile},
		dataType : 'text', // 응답받을 타입
		type : 'post',
		success : function(result) {
			
		},
		fail : function(result) {
			alert("사진 첨부를 실패했습니다. 다시 시도 후 실패 시 문의바랍니다.");
		}
	});
	
}

function profileSave() {
	
	let formData = new FormData();
	formData.append("file", $("#profile")[0].files[0]);
	
	$.ajax({
		url : '/user/userProfileImgMake',
		data : formData,
		dataType : 'text', // 응답받을 타입
		type : 'post',
		processData : false, // 전송하는 데이터를 쿼리스트링 형태로 변환하는지를 결정
		contentType : false, // 기본 값 : apllication/x-www-form-urlencoded (form 태그의 인코딩 기본값)
		success : function(result) {
			savedProFile = result;
			$("#member_img").val("memberProfile/" + result);
			$("#tmpUserProfile").attr("src", "/resources/uploads/memberProfile/" + result);
		},
		fail : function(result) {
			alert("사진 첨부를 실패했습니다. 다시 시도 후 실패 시 문의바랍니다.");
		}
	})
	
}


function checkAllContent() {
	let result = true;
	
	// 비밀번호 체크
    let userPwd = $("#member_password").val(); // 비밀번호
    let userPwdChk = $("#reCheckPwd").val(); // 비밀번호 확인
	
    if (userPwd.length != 0 && userPwdChk != 0) {
    	if (userPwd != userPwdChk) {
        	alert("비밀번호와 비밀번호 확인을 동일하게 입력해주세요.");
       		result = false;
       		return;
        } else if (userPwd.length < 8 || userPwd.length > 16) { // 비밀번호 길이가 유효하지 않을 경우
        	alert("입력하신 비밀번호는 사용할 수 없습니다.");
       		result = false;
       		return;
        } else if (!numberJ.test(userPwd) && !StringJ.test(userPwd)) {
        	alert("입력하신 비밀번호는 사용할 수 없습니다.");
       		result = false;
       		return;
        } else if (!numberJ.test(userPwd) && !specialJ.test(userPwd)) {
        	alert("입력하신 비밀번호는 사용할 수 없습니다.");
       		result = false;
       		return;
        } else if (!specialJ.test(userPwd) && !StringJ.test(userPwd)) {
        	alert("입력하신 비밀번호는 사용할 수 없습니다.");
       	    result = false;
       		return;
        }
    }
 	
 	// 휴대전화 번호 체크 및 submit 가능하도록 input 태그에 값 넣기
    let phoneFirst = $("#phoneFirst").val();
    let phoneSecond = $("#phoneSecond").val();
    let phoneThird = $("#phoneThird").val();
    
    if (phoneSecond.length != 0 && phoneThird.length != 0) {
    	
    	if (phoneSecond.length < 3 || phoneThird.length < 4 || koreanJ.test(phoneSecond) || koreanJ.test(phoneThird) || StringJ.test(phoneSecond) || StringJ.test(phoneThird) || specialJ.test(phoneSecond) || specialJ.test(phoneThird) || blankJ.test(phoneSecond) || blankJ.test(phoneThird)) {
    		alert("휴대전화 번호를 확인해주세요.");
       		result = false;
       		return;
        }
    	
        // submit 실행 시 휴대폰 번호가 전달될 수 있도록 value에 넣기
        $("#member_mobile").val(phoneFirst + "-" + phoneSecond + "-" + phoneThird);
        
    }
    
 	// 주소 체크 및 submit 가능하도록 input 태그에 값 넣기
    let address = $("#getAddress").val();
    
    if (address.length == 0) {
		alert("주소를 입력해주세요.");
   		result = false;
   		return;
    }

    // 유효성 검사 완료 시 submit
		if (result) {
			if (userPwd.length == 0) $("#member_password").attr("name", "");
			if (phoneSecond.length == 0 && phoneThird.length == 0) $("#member_mobile").attr("name", "");
			
			$("#saveNewMember").submit();
		}
}

	
function onlyNumberChk(obj) { // 숫자 입력 창 유효성 검사
	let inputId = $(obj).attr("id");
	let userInput = $("#" + inputId).val();
    
	if (!numberJ.test(userInput)) { // 숫자 외의 문자 작성 시 작성한 글자 삭제
	    $("#" + inputId).val($("#" + inputId).val().replace(StringJ,""));
	    $("#" + inputId).val($("#" + inputId).val().replace(koreanJ,""));
	    $("#" + inputId).val($("#" + inputId).val().replace(specialJ,""));
    }
	
}

function reconfirmUserPwd() {
	let userPwd = $("#member_password").val();
	let userPwdChk = $("#reCheckPwd").val(); // 비밀번호 확인 작성한 내용
	
    if (userPwd != userPwdChk) {
	    $("#pwdChkBar2").css("display", "inline-block");
	    $("#pwdReChkContent").attr("class", "changeTextBarMsg");
	    $("#pwdReChkContent").text("비밀번호가 서로 다릅니다.")
    } else if (userPwd == userPwdChk) {
 	    $("#pwdChkBar2").css("display", "none");
    } else if (userPwd.length == 0) {
	    $("#pwdChkBar2").css("display", "inline-block");
	    $("#pwdReChkContent").attr("class", "changeTextBarMsg");
	    $("#pwdReChkContent").text("비밀번호가 서로 다릅니다.")
    } else if (userPwdChk.length == 0) {
    	$("#pwdChkBar2").css("display", "none");
    }
	
}

function checkUserPwdSize() {
   let userPwd = $("#member_password").val();
   let userPwdChk = $("#reCheckPwd").val(); // 비밀번호 확인 작성한 내용
   let result = true;
   
   if (userPwd.length < 8) { // 비밀번호 길이가 유효하지 않을 경우
	    $("#pwdChkBar1").css("display", "inline-block");
	    $("#pwdChkContent").attr("class", "changeTextBarMsg");
   		$("#pwdChkContent").text("최소 8자 이상으로 입력해 주세요.");
   		result = false;
   } else if (userPwd.length > 16) {
	   $("#pwdChkBar1").css("display", "inline-block");
	   $("#pwdChkContent").attr("class", "changeTextBarMsg");
   	   $("#pwdChkContent").text("최소 16자 이하로 입력해 주세요.");
   	   result = false;
   } else if (!numberJ.test(userPwd) && !StringJ.test(userPwd)) {
	   $("#pwdChkBar1").css("display", "inline-block");
	   $("#pwdChkContent").attr("class", "changeTextBarMsg");
   	   $("#pwdChkContent").text("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하여 작성바랍니다.");
   	   result = false;
   } else if (!numberJ.test(userPwd) && !specialJ.test(userPwd)) {
	   $("#pwdChkBar1").css("display", "inline-block");
	   $("#pwdChkContent").attr("class", "changeTextBarMsg");
   	   $("#pwdChkContent").text("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하여 작성바랍니다.");
   	   result = false;
   } else if (!specialJ.test(userPwd) && !StringJ.test(userPwd)) {
	   $("#pwdChkBar1").css("display", "inline-block");
	   $("#pwdChkContent").attr("class", "changeTextBarMsg");
   	   $("#pwdChkContent").text("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하여 작성바랍니다.");
   	   result = false;
   }
   
   if (userPwd.length == 0) {
	   $("#pwdChkBar1").css("display", "none");
	   result = false;
   } else if (userPwd == userPwdChk) {
	   $("#pwdChkBar2").css("display", "none");
   } else if (userPwd != userPwdChk && userPwdChk.length != 0) {
	   $("#pwdChkBar2").css("display", "inline-block");
	   $("#pwdReChkContent").attr("class", "changeTextBarMsg");
	   $("#pwdReChkContent").text("비밀번호가 서로 다릅니다.");
   }
   
   if (result) {
	   $("#pwdChkContent").attr("class", "serviceable");
   	   $("#pwdChkContent").text("사용 가능한 비밀번호입니다.");
   }
   
}

</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap');

#main {
	font-family: 'Gothic A1', sans-serif;
}

.tableTitleSize {
    padding: 20px 10px 0 20px;
    border-bottom: 1px solid #dbdbdb;
    background: #f9f9f9;
}

.tableContentSize {
    padding: 12px 20px;
    border-bottom: 1px solid #dbdbdb;
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
	font-size: 23px;
	font-weight: bold;
	padding-bottom: 10px;
}

.genderSideMan {
	margin-right: 20px;
	margin-left: 5px;
}

.genderSideWoman {
	margin-left: 5px;
}

.phoneFirst {
	height: 31px;
	width: 82px;
	margin-right: 5px;
}

.phoneSecond {
	width: 88px;
	margin-left: 5px;
	margin-right: 5px;
}

.phoneThird {
	width: 88px;
	margin-left: 5px;
}

.registerBtn {
	padding-left: 354px;
    padding-right: 351px;
	margin-top: 30px;
}

.registerBtnCancle {
	width: 95px;
	height: 38px;
	line-height: 35px;
	font-size: 14px;
	border: 1px solid #3e3d3c;
	color: #3e3d3c;
	font-weight: 900;
}

.registerBtnSubmit {
	width: 95px;
	height: 38px;
	line-height: 35px;
	font-size: 14px;
	background: #3e3d3c;
	border: 1px solid #3e3d3c;
	color: #fff;
	font-weight: 900;
}

.changeTextBarMsg {
	color: #ea2940;
    font-size: 12px;
    font-weight: bold;
}

.serviceable {
    font-size: 12px;
    font-weight: bold;
}

.searchPost {
	height: 33px;
    border: 1px solid #dbdbdb;
    font-size: 13px;
    background-color: #f9f9f9;
    margin-left: 5px;
    margin-bottom: 5px;
}

.resultPost {
	margin-top: 5px;
    margin-bottom: 10px;
    font-size: 13px;
}

.tmpProfile {
    float: left;
    overflow: hidden;
    border-radius: 50%;
    border: 1px solid #ccc;
    margin-right: 15px;
}

.uploadBtn {
	margin-top: 8px;
    vertical-align: middle;
    background-color: #353535;
    font-size: 12px;
    color: #fff;
    display: inline-block;
    font-weight: bold;
    border: 0;
}

.basicProfileBtn {
	margin-top: 8px;
    vertical-align: middle;
    background-color: #efefef;
    font-size: 12px;
    color: #3e3d3c;
    display: inline-block;
    font-weight: bold;
    border: 0;
}

.changePhoneNumBtn {
	margin-top: 8px;
    background-color: #efefef;
    font-size: 12px;
    color: #3e3d3c;
    display: inline-block;
    font-weight: bold;
    border: 0;
}

.addressBar {
	display: none;
	position: fixed;
	overflow: hidden;
	z-index: 10;
	width: 600px;
	height: 488px;
	border: 5px solid;
	left: 754px;
	top: 300px;
}

.addressFrame {
	position: absolute;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	min-width: 300px;
}

.textBarInfo {
	font-size: 12px;
}

</style>
</head>
<body>
	<%@include file="../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<%@include file="myPageAside.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<div class="contentPlace">
						<div class="registerTitle">
							<h2 class="registerTitleHead">회원 정보 수정</h2>
						</div>
					<form id="saveNewMember" action="modifyUserInfo" method="post">
						<table class="registerTable">
							<tr>
								<th class="tableTitleSize">아이디</th>
								<td class="tableContentSize">
									<div>${loginMember.member_id }</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">비밀번호</th>
								<td class="tableContentSize">
									<div>
									<input type="password" name="member_password" id="member_password" maxlength="40" size="40" onblur="checkUserPwdSize();"/>
									<span class="textBarInfo">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span>
									</div>
									<div id="pwdChkBar1">
									<span class="changeTextBarMsg" id="pwdChkContent"></span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">비밀번호 확인</th>
								<td class="tableContentSize">
									<div>
									<input type="password" id="reCheckPwd" maxlength="40" size="40" onblur="reconfirmUserPwd();"/>
									</div>
									<div id="pwdChkBar2">
									<span class="changeTextBarMsg" id="pwdReChkContent"></span>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">이름</th>
								<td class="tableContentSize">
									<div>${loginMember.member_name }</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">성별</th>
								<td class="tableContentSize">
									<div>
									<c:choose>
										<c:when test="${loginMember.member_gender == '남'}">
										<input type="radio" name="member_gender" value="남" checked/><span class="genderSideMan">남</span>
										<input type="radio" name="member_gender" value="여" /><span class="genderSideWoman">여</span>
										</c:when>
										<c:when test="${loginMember.member_gender == '여'}">
										<input type="radio" name="member_gender" value="남" /><span class="genderSideMan">남</span>
										<input type="radio" name="member_gender" value="여" checked/><span class="genderSideWoman">여</span>
										</c:when>
									</c:choose>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">생년월일</th>
								<td class="tableContentSize">
									<div><fmt:formatDate value="${loginMember.member_birth }" pattern="yyyy-MM-dd" type="DATE" /></div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">이메일</th>
								<td class="tableContentSize">
									<div>${loginMember.member_email }</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">휴대전화</th>
								<td class="tableContentSize">
									<div id="modifyPhone" style="display: none;">
										<input type="hidden" name="member_mobile" id="member_mobile" />
										<span>
											<select class="phoneFirst" id="phoneFirst">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</span>
										<span>
											-<input type="text" maxlength="4" id="phoneSecond" class="phoneSecond" onkeyup="onlyNumberChk(this)" autocomplete="off"/>-
										</span>
										<span>
											<input type="text" maxlength="4" id="phoneThird" class="phoneThird" onkeyup="onlyNumberChk(this)" autocomplete="off"/>
										</span>
										<button type="button" class="changePhoneNumBtn" onclick="changePhoneCancel();">취소</button>
									</div>
									<div id="userPhoneNumber">
										${loginMember.member_mobile }
										<button type="button" class="changePhoneNumBtn" onclick="changePhoneBtn();">변경</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">주소</th>
								<td class="tableContentSize">
									<input type="text" id="getZipCode" value="${loginMember.member_postCode }" name="member_postCode" style="font-size: 13px;" readonly autocomplete="off">
									<input type="button" onclick="viewAddressFrame();" class="searchPost" value="우편번호 찾기">
									<br>
									<input type="text" class="resultPost" id="getAddress" value="${loginMember.member_addr }" name="member_addr" size="55" readonly autocomplete="off">
									<span class="textBarInfo">기본주소</span>
									<br>
									<input type="text" id="detailAddress" name="member_addrDetail" value="${loginMember.member_addrDetail }" size="55" style="font-size: 13px;" autocomplete="off">
									<span class="textBarInfo">나머지주소 (선택입력가능)</span>
									<div id="searchAddrBar" class="addressBar"></div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">프로필사진</th>
								<td class="tableContentSize">
									<input type="hidden" name="member_img" id="member_img" value="${loginMember.member_img }"/>
									<input type="file" id="profile" accept="image/jpeg, image/png, image/jpg" onchange="saveUserProFile();" style="display : none;">
									<div>
									<img src="/resources/uploads/${loginMember.member_img }" id="tmpUserProfile" class="tmpProfile" />
									</div>
									<div>
									<button type="button" id="clickFileSelector" class="uploadBtn">업로드</button>
									<button type="button" id="changeBasicProfile" class="basicProfileBtn" onclick="changeBasicProfilePic();">기본사진으로 변경</button>
									</div>
									<div class="textBarInfo" style="color : #ea2940; margin-top: 7px;">* 프로필사진은 이미지(jpg/jpeg/png) 파일만 가능하며, 10MB이하의 파일만 가능합니다.</div>
								</td>
							</tr>
							<tr>
								<th class="tableTitleSize">SNS 연동관리</th>
								<td class="tableContentSize">
									<c:choose>
										<c:when test="${loginMember.member_kakaoId == NULL }">
										<img src="/resources/img/kakaoInerlock.png" style="width: 25px;">
										<p style="display: inline-block; font-size: 18px; font-weight: bold; margin-bottom: 0px; margin-left: 3px;">kakao</p>
										<p style="display: inline-block; float: right;">
											<button type="button" class="changePhoneNumBtn" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=b3f3cf086449d274d79c8ab8a463ea84&redirect_uri=http://goot6.cafe24.com/user/kakaoInterlock&response_type=code'">연결하기</button>
										</p>
										</c:when>
										<c:when test="${loginMember.member_kakaoId != NULL }">
										<img src="/resources/img/kakaoInerlock.png" style="width: 25px;">
										<p style="display: inline-block; font-size: 18px; font-weight: bold; margin-bottom: 0px; margin-left: 3px;">kakao</p>
										<p style="display: inline-block; font-size: 12px; font-weight: bold; margin-bottom: 0px; margin-left: 50px;"><fmt:formatDate value="${loginMember.member_kakaoInterlockDate }" pattern="yyyy-MM-dd HH:mm:ss" type="DATE" /> 연결완료</p>
										<p style="display: inline-block; float: right;">
											<button type="button" class="changePhoneNumBtn" onclick="location.href='/user/kakaoRelease'">연결해제</button>
										</p>
										</c:when>
									</c:choose>
								</td>
							</tr>
						</table>
						<div class="registerBtn">
							<button type="button" class="registerBtnCancle" onclick="location.href='/user/pwdCheck'">취소</button>
							<button type="button" class="registerBtnSubmit" onclick="checkAllContent();">정보수정</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../cambak21Footer.jsp"%>
</body>
</html>