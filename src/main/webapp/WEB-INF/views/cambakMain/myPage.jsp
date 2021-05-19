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
	
	<link rel="icon" type="image/png" href="../../resources/cambak21/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="../../resources/cambak21/css/loginUtil.css">
	<link rel="stylesheet" type="text/css" href="../../resources/cambak21/css/login.css">
	
	
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../../resources/cambak21/js/skel.min.js"></script>
	<script src="../../resources/cambak21/js/skel-panels.min.js"></script>
	<script src="../../resources/cambak21/js/init.js"></script>

	<link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
	
	<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
	<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
	
	<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<script>
	function loginOK(){
		if(document.getElementById('chkCookie').checked){
			alert("자동 로그인 기능은 공공장소에서는 사용하지 마세요!");
			return true;
		}
	}
	</script>
	<style>
		@import url(../../resources/cambak21/css/SHWtamplet.css);
	
	
	.\34 u {
    width: 100%;
	}


	/* 효원이 CSS */ 

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



	</style>



</head>

<body>
    <%@include file="cambak21Header.jsp"%>

<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">


<div>

			<!--  효원이 디자인 시작 -->
				<div class="profile">
						<div>
							<div class="profileSize">
								<a href=""></a><img src="../../resources/cambak21/img/trip.jpg" class="userProfileImg">
								<h4>${loginMember.member_id }</h4>
								<div class="profileEmail">${loginMember.member_email }</div>
							</div>
							<div class="profileCategory">
								<ul>
									<li class="profileMenu1"><a href="#" class="profileMenu">마이 페이지</a></li>
									<li class="profileMenu2"><a href="#" class="profileMenu">회원 정보 수정</a></li>
								</ul>
							</div>
						</div>
					</div>
		<!--  효원이 디자인 끝  -->

	<!-- Sidebar top -->
	<div id="sidebar" class="4u">
		<div class="sidebar">
			<div class="panel panel-success">
				<div class="panel-heading">
					<p class="category-title" id="category-title" style="margin-bottom: 0px;">나의 캠박이일</p>
				</div>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li id="campingReviewAside"><a href="#">내가 쓴글</a></li>
				<li id="humorAside"><a href="#">내 댓글</a></li>
				<li id="QnAAside"><a href="#">내 좋아요 글</a></li>
				<li id="resellAside"><a href="#">나의 문의</a></li>
		
			</ul>
		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar" class="4u">
		<div class="sidebar">
			<div class="panel panel-success">
				<div class="panel-heading">
					<p class="category-title" id="category-title"  style="margin-bottom: 0px;">캠박몰</p>
				</div>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li id="#"><a href="#">적립금 관리</a></li>
				<li id="#"><a href="#">주문 목록</a></li>
				<li id="#"><a href="#">취소 / 반품</a></li>
				<li id="#"><a href="#">구매 목록</a></li>
			</ul>
		</div>
	</div>




</div>
			
		
		<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>고객센터</h2>
							<span class="byline" id="rollNot"><a href="/board/notice/listCri">공지사항 상세페이지</a></span>
						</header>
				
				
    <!-- 요 안에 작성하시오 Main -->
	
	<!-- 요 까지 작성하시오 /Main -->
				
				
				
        </section>   
    
   
      </div>
  
	</div>
	</div>
	</div>
	</div>
    <%@include file="cambak21Footer.jsp"%>
	
</body>

</html>