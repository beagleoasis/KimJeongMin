<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>체크리스트 뉴 버전</title>
<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/resources/cambak21/js/checkList.js"></script>

<!-- tamplet css -->
<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/SHWtamplet.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/myPageAside.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>

<!-- tamplet js -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>




<style>
.\34 u {
   width: 100%;
}

.profile {
   box-sizing: border-box;
   width: 200px;
   text-align: center;
   border: 1px solid #F0F2F0;
   margin-bottom: 120px 50px 0px 0px;
       
}

.profileSize {
   background-color: #F0F2F0;
   padding: 20px 0px;
}

.userProfileImg {
    width: 64px;
    height: 64px;
    border-radius: 70%;
    overflow: hidden;   
}

.profileEmail {
    font-size: 13px;
}

.nav-stacked>li{
   margin-top: -10px;
}

.nav>li>a {
    position: relative;
    display: block;
    padding: 5px 15px;
}

#category-title{

    text-align-last: center;
    
    }

.panel-success {
    margin-top: 25px;
    border-color: #d6e9c6;
}

.profileMenu1{
margin-top: 10px;
}
.DateArray,.BtnArray{
	width: 150px;
	height: 155px;
	border: solid 1px black;
}
.ContentArray{
	width: 400px;
	height: 155px;
	border: solid 1px black;
}
.textArray{
	display: block;
	margin: 10px 0 0 10px;
}

</style>

<script type="text/javascript">
$(function() {
	$(".DetailOrder").dblclick(function() {
		console.log("!!")
		let payment_serialNo = Number($(".serialNo").val)
		$.ajax({
			type : "post",
			contentType : "application/json",
			url : "/myMall/userOrderDetail/"+payment_serialNo+"/+${loginMember.member_id}", 
			success : function(data) {
				console.log(data)
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
		console.log("page : "+page)
		page+=1;
	});
})

</script>

</head>
<body>
<%@include file="../cambakMain/cambak21Header.jsp"%>


<!-- Main -->
<div id="main">
	<div class="container">
		<div class="row">
			
		<%@include file="../cambakMain/myPage/myPageAside.jsp"%>

			<table style="margin-left: 20px">
				 <c:forEach var="order" items="${order}">
	               
						<tr style="margin: 10px">
							<td class="DateArray">
							<span class="textArray" style="text-align: center;"><fmt:formatDate value="${order.payment_date}" type="both" pattern="yyyy-MM-dd" /></span>
							</td>
							<td class="ContentArray DetailOrder">
							<input type="text" class="serialNo" style="display: none;" value="${payment_serialNo}">
							<span class="textArray">제품 이름 : ${order.product_name }</span>
							<span class="textArray"><c:if test="${empty order.product_factory }"> 없음</c:if>
							${order.product_factory }</span>
							<span class="textArray">주문번호 : ${order.payment_no }</span>
							<span class="textArray price" >제품가격 : ${order.buyProduct_totPrice }</span>
							</td>
							<td class="BtnArray">테스트</td>
						</tr>
					
				</c:forEach>
			</table>

      		</div>
    
  
	</div>
</div>

<%@include file="../cambakMain/cambak21Footer.jsp"%>
	
	
	
     </body>
</html>