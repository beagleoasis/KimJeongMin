<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko"><head>

<title> 테스트 체크리스트 </title>
<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/resources/cambak21/js/checkList.js"></script>
<script>


let member_id = '${loginMember.member_id}';
let checkList_no = 0;
let output = "";
let checkList_checked = "";
let checkedCnt = 0;
let noncheckedCnt = 0;



$(function() {
	
	if(${loginMember.member_id != null}){
		$(".checkListInputBox").focus();
		getAjaxCheckListAll();
	}
	
});



</script>


<style type="text/css">

/* 여기서 부터 종진 */ 

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
/*     margin-left:90px; */
	margin-top: 30px; 
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
<body style="overflow: hidden;">

<section class='checklist'>

	
	<div class="checkListBox">
	<div style="margin: -1px 0px -3px 0px; border-style:ridge;">
	<input type="text" name="checkList_content" class="checkListInputBox" onkeydown="enterkey();" placeholder="해야할 일, 준비해야할 물건 입력하기(Enter Key)"/>
	<input type="hidden" id="checkListmember_id" name ="member_id" value="${loginMember.member_id }"/>
	
	</div>
	
	<div id="inputTodo" ></div>
	</div>
	
	
	</section>

</body>
</html>