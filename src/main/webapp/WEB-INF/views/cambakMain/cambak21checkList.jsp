<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<head>
 <meta charset="UTF-8">
<script src="/resources/cambak21/js/checkList.js"></script>
<script>
let member_id = "${loginMember.member_id}";

let checkList_no = 0;
let output = "";
let checkList_checked = "";
let checkedCnt = 0;
let noncheckedCnt = 0;

  function checkWriteNumber(){

	   let checkLength = $(".checkListInputBox").val();
	   if(checkLength.length >= 26){
		   $("#checkLimitNum").html("<span style='color:red; font-weight: bold;'>" + checkLength.length + "</span> / 26");
	   }else{
		   $("#checkLimitNum").html("<span style='color:black;'>" + checkLength.length + "</span> / 26");
	   }
	 
	  
  }

	 function viewCheckList(){
		 
		 if(member_id != ""){
		
			 if($("#chklistIframe").css("display") == "none"){
				 
				 $("#chklistIframe").css("display","block");
				 $("#CheckListCnt").html("체크리스트 닫기");
				 $(".radios").css("background-color","#111");
				 $(".radios").css("color","white");
		
			}else{
				 $("#chklistIframe").css("display","none");
 				 getChkListYet();
				 $(".radios").css("background-color","#fff");
				 $(".radios").css("color","#333");
			} 
		 }else{
			 
			 if (confirm("회원만 체크리스트 작성이 가능합니다. 로그인 페이지로 이동하시겠습니까?") == true) { //확인
	             location.href='/user/login/yet';
	        } else { //취소
           		 return false;
	        }
			 
		 }	
		 
		 
	 }
		 
	 function getChkListYet(){
		 	
			$.ajax({
				method: "get",
				url: "/mall/main/getChkListYet",
				dataType: "text", // 응답 받는 데이터 타입
				data : {"member_id" : member_id
				},
				success : function(result){
						
						$("#CheckListCnt").html("체크리스트 (" + result + ")개");
						$("#CheckListCnt").css("font-size","14px");

				}
			});
		
		}

// 	 function getChkListAll(){
		 	
// 			$.ajax({
// 				method: "get",
// 				url: "/mall/main/getChkListAll",
// 				dataType: "text", // 응답 받는 데이터 타입
// 				data : {"member_id" : member_id
// 				},
// 				success : function(result){
						
// 						let size = 134 + (result * 35);
// 						console.log(size);
// 						$("#chklistIframe").css("max-height",size + "px");
// 				}
// 			});
		
// 		} 	
	 
	 
	 
	 
	 
$(function(){
		

	 if(member_id != ""){

		 getChkListYet();
		 getAjaxCheckListAll();
 		 	 
	 }	
	 
});

</script>

<style>


 .radios{
    right: 5%;
    bottom: 45px;
    width: 170px;
	position: fixed;
 	z-index: 99999;
    height: 50px;
    padding: 0 20px 0 20px;
    border-radius: 25px;
    border: 1px solid #555;
    background-color: #fff;
    box-shadow: 0 5px 14px 0 rgb(0 0 0 / 10%);
    font-size: 14px;
    line-height: 48px;
    letter-spacing: -.3px;
    color: #333;
    transition: right .4s;
 
/*     display:none; */
    
 }
 


.checklist{
 margin-top: -30px;
  
}

.listCheck{
    border-style: ridge;
    text-decoration: none;
    list-style: none;
    padding: 8px;
    margin-top: 1px;
}

.listCheck li{
    border: solid;
    font-weight: bold;
    padding: 2px;
    font-size: 17px;
    border-style: ridge;
    border-color: mintcream;
    align-items: center;
}


/* body{ -ms-overflow-style: none; } ::-webkit-scrollbar { display: none; } */

/* #selected li {background-color:blue;} */


.filters {
  display: inline-flex; padding: 0; list-style: none; right: 0; left: 0; margin: 0px 0px 0px 25px; cursor: pointer;
}

.filters li{
	text-decoration: none;
    border: none;
    margin: 0px 5px;
    font-size: 13px;
    font-weight: 600;
    margin: 0px 20px;
}


.checkListBox{
	
	width: 600px;
	background-color: whitesmoke;
	border: solid;
	

}
.checkListInputBox{
    font-weight: bold;
    font-size: 20px;
 	height: 40px;
    opacity: 0.8;
    background-color: whitesmoke;
    padding: 5px;
    margin: 2px 1px 0px 47px;
    font-weight: bold;
    font-size: 20px;
  	height: 40px;
    opacity: 0.8;
    padding: 5px;
    margin: 2px 1px 0px 47px;
    border: none;
    outline: none; 
    width: 430px;
    border-bottom: revert;
    width: 470px;
	
}
















</style>



</head>	
	

		<!--  박종진 작업 체크리스트  -->
			
			
			<div class="radios" id="checkListCntContainer" style="cursor:pointer;" onclick="viewCheckList();">  
	  		
	  		<span id="CheckListCnt" style="margin-left: 15px;  font-size: 11px;">체크리스트(회원 전용)</span>
		
			</div>
			<div id="chklistIframe"  style="z-index: 99999; position: fixed; display:none; right:1%; top:32%; width:600px;  overflow:hidden; max-height: 540px;">
	  			<div class="checkListBox">
					<div style="margin: -1px 0px -3px 0px; border-style:ridge;">
					<input type="text" name="checkList_content" class="checkListInputBox" onkeyup="checkWriteNumber();" onkeydown="enterkey();" placeholder="해야할 일, 준비해야할 물건 입력하기(Enter Key)"/><span id="checkLimitNum"> 0 / 26</span>
					<input type="hidden" id="checkListmember_id" name ="member_id" value="${loginMember.member_id }"/>
					
					</div>
					
					<div id="inputTodo" ></div>
					</div>
		  		
  				</div>
		
  				
			
			
			
			
			
			
			<!--  박종진 작업 체크리스트  -->