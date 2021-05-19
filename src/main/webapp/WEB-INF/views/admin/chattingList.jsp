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
<script src="../resources/adminAssets/libs/jquery/dist/jquery.min.js"></script>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="../resources/cambak21/js/bbskJS.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		textLimit(40);
	})
</script>

<style type="text/css">
span.userId {
	font-size: 20px;
	font-weight: bold;
	padding-left: 20px;
}
.userProfile {
	margin-bottom: 20px;
}
span.msgDate {
	margin-left: 20px;
	font-weight: bold;
}
.isReadImg {
	height: 30px;
	padding-left: 10px;
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
			<div class="container-fluid">
				<c:forEach var="item" items="${ChattingList }">
					<div class="userProfile">
						<img alt="" src="../resources/uploads/${item.member_img }"
							class="userImg"><span class="userId">${item.member_id }</span>
					</div>
					<div class="userMsg-wrap">
						<a href="../admin/adminChatting?id=${item.member_id }"
							class="board-title-a">${item.chatting_content }</a> <span
							class="msgDate"><fmt:formatDate
								value="${item.chatting_date }" pattern="HH:mm" type="DATE" /></span>
						<c:if test="${item.chatting_isRead == 'N' }">
							<img alt="" src="../resources/img/noReadMsg.png"
								class="isReadImg">
						</c:if>
					</div>
					<hr>
				</c:forEach>
			</div>
			<!-- 본문 작성 끝  -->
			<%@ include file="adminFooter.jsp"%>
			<%@ include file="adminJs.jsp"%>
		</div>

	</div>

</body>
</html>