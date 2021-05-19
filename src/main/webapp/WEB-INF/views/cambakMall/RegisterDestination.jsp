<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 

<!DOCTYPE html>
<html lang="ko"><head>

<title>배송지 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

let firstNum = "";
let secondNum = "";
let thirdNum = "";
let finalNum = "";
const regExpName = /^[가-힣a-zA-Z]+$/;
const NumPattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
const DetailPattern = /^[가-힣0-9\s]+$/;

//부모창으로부터 열린 자식창임을 선언 //
opener.popup = this;

//우측 상단 X버튼 눌렀을 경우 이벤트 설정 //
	
$(window).bind("beforeunload", function (e){
	
	opener.location.reload();
// 	return "정말 닫으시겠습니까?";
	 
});


$(function(){
	$("#hash").val('${loginMember.member_id}');
	getDataParent();
	chkInsert();
});



//배송지 수정일 경우 부모페이지에서 각 저장된 값들 갖고와서 Form에 넣어주기 //
function getDataParent(){
	 let dstno = "${param.no}";
	 
	 if(dstno != 0){
		 $("#addressName").val(opener.document.getElementById("nickname" + dstno).value);
		 $("#receiver").val(opener.document.getElementById("toUser" + dstno).value);
		 $("#sample3_postcode").val(opener.document.getElementById("postCode" + dstno).value);
		 $("#sample3_address").val(opener.document.getElementById("address" + dstno).value);
		 $("#sample3_detailAddress").val(opener.document.getElementById("addressDetail" + dstno).value);
	     $("#destination_noVal").val(dstno);
	     let ModyMobileNum = opener.document.getElementById("mobile" + dstno).value;
	     $("#telNoFrist").val(ModyMobileNum.split("-")[0]);	 
	     $("#telNoSecond").val(ModyMobileNum.split("-")[1]);	 
	     $("#telNoThird").val(ModyMobileNum.split("-")[2]);	
	     firstNum = $("#telNoFrist").val();	 
	     secondNum = $("#telNoSecond").val();	 
	     thirdNum = $("#telNoThird").val();	
	     finalNum = firstNum + "-" + secondNum + "-" + thirdNum;
	     $("#completePhone").val(finalNum);
	     
	 }
		
}




function registerDestinationcheck(){
	
		if(validCheck()){
				$("#registerDestinationForm").submit();
			}
	
}



function validCheck(){
	
	 if(document.getElementsByName("destination_nickname")[0].value == ""){
		 alert("배송지명을 입력해주세요.");
		 return false;
	 }else if(document.getElementsByName("destination_nickname")[0].value.length >= 20){
		 alert("배송지명 글자수가 너무 많습니다. 20자 이내로 작성해주세요.");
		 return false;
	 }else if(document.getElementsByName("destination_toUser")[0].value == ""){
		 alert("수령인을 입력해주세요.");
		 return false;
	 }else if(document.getElementsByName("destination_toUser")[0].value.length >= 30){
		 alert("수령인 글자수가 너무 많습니다. 30자 이내로 작성해주세요.");
		 return false;
	 }else if(document.getElementsByName("destination_addressDetail")[0].value == ""){
		 alert("배송받을 상세 주소를 입력해주세요.");
		 return false;
	 }else if(document.getElementsByName("destination_addressDetail")[0].value.length >= 45){
		 alert("상세주소 글자수가 너무 많습니다. 45자 이내로 작성해주세요.");
		 return false;
	 }else if(document.getElementsByName("destination_toUser")[0].value.match(regExpName) == null){
		 alert("수령인을 올바르게 작성해주세요.");
		 return false;
	 }else if(document.getElementsByName("destination_addressDetail")[0].value.match(DetailPattern) == null){
		 alert("배송받을 상세 주소를 정확히 입력해주세요.");
		 return false;
	 }else if(document.getElementsByName("destination_mobile")[0].value.match(NumPattern) == null){
		 alert("연락처를 올바르게 입력해주세요.");
		 return false;
	 }else {
		 return true;
	 }
	 
	 
}



// 파라매터 값 가져오기
function getParameter(param) {
	let returnVal; //리턴할 값을 저장하는 변수
	let url = location.href; //url주소
	let params = url.slice(url.indexOf("?") + 1, url.length).split("&");

	for (let i in params) {
		let paraName = params[i].split("=")[0]; // 매개변수명 얻음
		if (param.toLowerCase() == paraName.toLowerCase()) {
			returnVal = params[i].split("=")[1];
			return decodeURIComponent(returnVal);
		}
	}

	return -1; // 모든 배열 요소를 다 검색해도 매개변수가 없을때
}

//배송지 등록 및 수정 후 자식 팝업 창 닫으며 부모창 재로딩 //
function chkInsert() {
	
	   let result = getParameter("result");
	
	   if (result == "success") {
		   alert("배송지 등록이 완료 되었습니다.");
		   opener.location.reload();
	 		window.close();
	   }else if(result == "modisuccess"){
		   alert("배송지 정보가 수정되었습니다.");
		   opener.location.reload();
	 		window.close();
		   
	   }else if (result == "fail") {
		   alert("배송지 등록을 실패 했습니다. 다시 시도 후 실패 시 문의바랍니다.");
	   }
}

 
 
//전화번호 앞-중간-뒤 구분하여 얻어온 후 하이픈 구분 //
 function inputPhoneNum(data){
	 
	 if(data == 1){
			 firstNum = $("#telNoFrist").val();	 
	 }else if(data == 2){
			 secondNum = $("#telNoSecond").val();	 
	 }else if(data == 3){
			 thirdNum = $("#telNoThird").val();	
	 }
	 
	 if(firstNum.length == 3 && secondNum.length >= 3 && thirdNum.length == 4){
		
		 finalNum = firstNum + "-" + secondNum + "-" + thirdNum;
		 $("#completePhone").val(finalNum);
		
	 }else{
		 $("#completePhone").val("");
	 }

	 
	 
 }
 

// 끝 배송지 인서트 부분 끝//


</script>














<style type="text/css">




.setting_popup_title{

	position: relative;
    margin-top: 30px;
    padding: 0 10px;
    border-top: 1px solid #888;
    border-bottom: 1px solid #ebebeb;

}

.tbl_delivery_info {
    width: 100%;
    padding: 13px 0 11px;
    border-bottom: 1px solid #ebebeb;
    table-layout: fixed;
    -webkit-font-smoothing: antialiased;
}

.tbl_delivery_info {
    width: 100%;
    padding: 13px 0 11px;
    border-bottom: 1px solid #ebebeb;
    table-layout: fixed;
    -webkit-font-smoothing: antialiased;
}

.tbl_delivery_info th.cell_title {
    width: 98px;
    padding: 5px 0 0 12px;
    font-weight: normal;
    line-height: 32px;
    text-align: left;
    color: #222;
    vertical-align: top;
}

.tbl_delivery_info td {
    padding: 5px 0;
}

.delivery_notice {
    padding: 16px 20px 14px;
    background-color: #fafafa;
    font-size: 11px;
    line-height: 22px;
    color: #666;
}

#pop_footer {
    padding: 30px 0 32px;
    text-align: center;
}

.basic_input {
    display: inline-block;
    position: relative;
    padding: 0 10px;
    border: 1px solid #ccc;
    background-color: #fff;
    color: #222;
    vertical-align: top;
}
.basic_input .lb_text {
    position: absolute;
    left: 0;
    top: 0;
    padding: 0 10px;
    line-height: 30px;
    color: #888;
}

.basic_input .ip_text {
    position: relative;
    width: 100%;
    height: 30px;
    border: none;
    background-color: transparent;
    line-height: 30px;
    color: #222;
    vertical-align: top;
}

.basic_input.focus {
    border-color: #00c73c;
}

#pop_container {
    margin: 0 25px;
    padding-top: 10px;
}

#pop_wrap {
    margin: 0 auto;
    position: relative;
}


.setting_selectbox {
    display: inline-block;
    position: relative;
    height: 33px;
    border: 1px solid #ccc;
    background-color: #fff;
}

.tbl_delivery_info .setting_selectbox, .tbl_delivery_info .setting_selectbox a.select_value {
    height: 30px;
    line-height: 30px;
}
.setting_selectbox .layer_select_option {
    display: none;
    z-index: 10;
    position: absolute;
    left: -1px;
    right: -1px;
    top: 33px;
    padding: 10px 0;
    background-color: #fff;
    border: 1px solid #e0e0e0;
    box-shadow: 1px 1px 4px 0 rgb(0 0 0 / 5%);
}

.setting_selectbox .layer_select_option > ul {
    position: relative;
}


ul, ol {
    list-style: none;
}
.setting_selectbox .layer_select_option > ul li a:hover {
    background-color: #f8f8f8;
}

.setting_selectbox .layer_select_option > ul li a {
    display: block;
    padding: 0 10px;
    background-color: #fff;
    line-height: 35px;
    color: #222;
    text-decoration: none;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.setting_btn.green {
    border-color: dimgrey;
    color: white;
}
.tbl_delivery_info .setting_btn {
    margin-left: -4px;
    padding: 0 12px;
    line-height: 30px;
}

.setting_btn.green:hover {
    background-color: burlywood;
    color: #fff;
}

.setting_btn {
    display: inline-block;
    position: relative;
    padding: 0 13px;
    border: 1px solid #ddd;
    background-color: dimgrey;
    border-radius: 0;
    line-height: 33px;
    color: #222;
    text-align: center;
    text-decoration: none;
    vertical-align: top;
}

.delivery_notice {
    padding: 16px 20px 14px;
    background-color: #fafafa;
    font-size: 11px;
    line-height: 22px;
    color: #666;
}


.button.green_bg {
    border: 1px solid dimgrey;
    background-color: dimgrey;
    color: #fff;
}

.button.green_bg:hover {
    background-color: burlywood;
}

.button {
    padding: 0 23px;
    font-size: 13px;
    color: #222;
    background: #fff;
    border: 1px solid #ddd;
    line-height: 34px;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    -webkit-font-smoothing: antialiased;
}

.button:hover {
    background-color: #f0f1f2;
}



/* .setting_checkbox:after { */
/*     width: 18px; */
/*     height: 18px; */
/*     background-position: -70px -30px; */
/* } */

.setting_checkbox input, .setting_radio input {
    position: absolute;
    z-index: -1;
    opacity: 0;
    filter: alpha(opacity=0);
}
.basic_input .ip_text:focus {
    outline: none;
}

.tbl_delivery_info .setting_checkbox {
    margin-right: 3px;
    vertical-align: top;
}

.setting_checkbox, .setting_radio {
    display: inline-block;
    position: relative;
}




</style>

</head>
<body style="overflow: hidden;">

<div id="pop_wrap">

    <div id="pop_container">
        <div id="pop_content">
            <div class="setting_popup_title">
                <h2 class="h_title" style="font-size: 12px; line-height: 45px; color: #222;">배송지 정보 상세</h2>
            </div>
            <form action="/mall/destinationsList/insertDestiny" id="registerDestinationForm"  autocomplete="off" method="post" >
            <table class="tbl_delivery_info">
         
                <tbody>
                <tr>
                    <th class="cell_title">배송지명</th>
                    <td>
                        <span class="_editable_input _input basic_input" style="width: 133px">
                            <label for="addressName" class="lb_text blind"></label>
                            <input type="text" name="destination_nickname" id="addressName" class="ip_text" value="" maxlength="150">
                            <input type="hidden" name="member_id" id="hash" class="ip_text" value="admin">
                            <input type="hidden" name="destination_no" id="destination_noVal" class="ip_text" value="0">
                        </span>
                    </td>
                </tr>
                <tr>
                    <th class="cell_title">수령인 <em class="mark_necessity"><span class="blind"></span></em></th>
                    <td>
                        <span class="_editable_input _input basic_input" style="width: 133px">
                           
                            <label for="receiver" class="lb_text "></label>
                            <input type="text" id="receiver" name="destination_toUser" class="ip_text" value="" maxlength="150">
                        </span>
                    </td>
                </tr>
                <tr>
                    <th class="cell_title">주소 <em class="mark_necessity"><span class="blind"></span></em></th>
                    <td>
                                <span class="_input basic_input" style="width: 64px; background-color: gainsboro;">
								<label for="zipCode" class="lb_text blind"></label>
								<input type="text" readonly name="destination_zipCode" id="sample3_postcode" class="ip_text" value="">
							</span>&nbsp&nbsp&nbsp
                        <a onclick="sample3_execDaumPostcode();" style="cursor:pointer;" class="_search setting_btn green">주소검색</a>
                        <p class="address_detail">
                                    <span class="_input basic_input" style="width: 338px; background-color: gainsboro;">
									<label for="baseAddress" class="lb_text blind"></label>
									<input type="text" name="destination_address" readonly id="sample3_address" class="ip_text" value="">
									<input type="hidden" id="roadNameAddressYn" value="">
								</span>
                        </p>
                        <p class="address_detail">
                                    <span class="_editable_input _input basic_input" style="width: 338px">
							
									<label for="detailAddress" class="lb_text">
                                       
                                    </label>
									<input placeholder="상세 주소를 입력해주세요." type="text" name="destination_addressDetail" id="sample3_detailAddress" class="ip_text" value="" maxlength="100">
									<input type="hidden" id="sample3_extraAddress" placeholder="참고항목">
								</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="cell_title">연락처 <em class="mark_necessity"><span class="blind"></span></em></th>
                    <td>
                    
                          <span class="_editable_input _input basic_input" style="width: 48px">
								<label for="telNo1Second" class="lb_text blind"></label>
								<input type="text" onkeyup="inputPhoneNum(1);" id="telNoFrist" class="ip_text" maxlength="3" value="">
							</span>
                        <span class="hyphen">-</span>
                        <span class="_editable_input _input basic_input" style="width: 48px">
								<label for="telNo1Second" class="lb_text blind"></label>
								<input type="text" onkeyup="inputPhoneNum(2);" id="telNoSecond" class="ip_text" maxlength="4" value="">
							</span>
                        <span class="hyphen">-</span>
                        <span class="_editable_input _input basic_input" style="width: 48px">
								<label for="telNo1Third" class="lb_text blind"></label>
								<input type="text" onkeyup="inputPhoneNum(3);" id="telNoThird" class="ip_text" maxlength="4" value="">
								<input type="hidden" id="completePhone" name="destination_mobile" value="" />
							</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="wrap" style="display:none; top:1%; border:1px solid;width:470px;height:470px; margin:5px 0;position:fixed">
                            <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
                            style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                        </div>
                    </td>
                </tr>
                
            
                </tbody>
            </table>
            </form>
            <div class="delivery_notice">
                <p class="desc">· 입력/수정하신 배송지는 배송지 목록에 저장됩니다.</p>
            </div>
        </div>
    </div>
    <div id="pop_footer">
  
        <button type="button" class="button" style="cursor:pointer;" onclick="javascript:window.close(); opener.location.reload(); return false;">닫기</button>
        <button type="button" onclick="registerDestinationcheck();" style="cursor:pointer;" class="_btn_save button green_bg">저장</button>
    </div>
</div>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                    // 우편번호 찾기 찾기 화면을 넣을 element
                    var element_wrap = document.getElementById('wrap');

                    function foldDaumPostcode() {
                        // iframe을 넣은 element를 안보이게 한다.
                        element_wrap.style.display = 'none';
                    }

                    function sample3_execDaumPostcode() {
                        // 현재 scroll 위치를 저장해놓는다.
                        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var addr = ''; // 주소 변수
                                var extraAddr = ''; // 참고항목 변수

                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                    addr = data.roadAddress;
                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                    addr = data.jibunAddress;
                                }

                                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                if (data.userSelectedType === 'R') {
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                        extraAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if (data.buildingName !== '' && data.apartment === 'Y') {
                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if (extraAddr !== '') {
                                        extraAddr = ' (' + extraAddr + ')';
                                    }
                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                    document.getElementById("sample3_extraAddress").value = extraAddr;
                                 

                                } else {
                                    document.getElementById("sample3_extraAddress").value = '';
                                }

                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('sample3_postcode').value = data.zonecode;
                                document.getElementById("sample3_address").value = addr;
                                let basicAddress = $("#sample3_address").val();
                			    basicAddress += " " + $("#sample3_extraAddress").val();
                			    $("#sample3_address").val(basicAddress);
                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById("sample3_detailAddress").focus();

                                // iframe을 넣은 element를 안보이게 한다.
                                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                                element_wrap.style.display = 'none';

                                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                                document.body.scrollTop = currentScroll;
                            },
                            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                            onresize: function(size) {
                                element_wrap.style.height = size.height + 'px';
                            },
                            width: '100%',
                            height: '100%'
                        }).embed(element_wrap);

                        // iframe을 넣은 element를 보이게 한다.
                        element_wrap.style.display = 'block';
                    }

                </script>
                
                
</body></html>