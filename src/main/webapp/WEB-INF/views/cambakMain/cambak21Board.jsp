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
		
		.\34 u {
			width : 100%;
			margin : 0px;
		}
	</style>
	
	<script>
    $(document).ready(function () {
        // 공지들을 배열로 넣는 함수
        let notices = new Array();
        index = 0;

        notices.push("공지1");
        notices.push("공지2");
        notices.push("공지3");

        // 공지 롤링 함수를 호출하는 함수
        setInterval(
        	rolling(), 500
        );

        // 배열에 넣은 공지를 0번째부터 출력하여 롤릴하는 함수(+무한 롤링)
        function rolling() {
            $("#rollNot").fadeOut(3000, function () {
                for (let j = 0; j < 3; j++) {
                    if (index == j) {
                        $("#rollNot").html("<a href='http://zinsimi.cafe24.com/1_project/Do_bbsDetail.html?contentId=1116925&title=갈산근린공원&firstImage=http://tong.visitkorea.or.kr/cms/resource/62/2612062_image2_1.bmp'>" + notices[j] + "<a>").fadeIn(3000);
                    };
                };
                index++;
                rolling();
                if (index >= notices.length) {
                    index = 0;
                }
                console.log(index);
            });
        };
        dataLoading();

        $(".row").on("click", ".heartIcon", function () {
            fix(this);
        });

        $(".row").on("click", ".commentIcon", function () {
            fix2(this);
        });
    });
	</script>
</head>

<body>
    <%@include file="cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">
			
			<!-- 사이드바 템플릿 -->
			<%@include file="cambak21BoardAside.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>게시판</h2>
                    		<span class="byline" id="rollNot"><a href="#">공지가 들어갈 자리입니다.</a></span>
						</header>
						<div class="research">
		                    <!-- <form> -->
		                    <div class="input-group">
		                        <input type="text" class="form-control" size="50" placeholder="Search" onkeypress="enterKey();">
		                        <div class="input-group-btn">
		                            <button type="button" class="btn btn-danger search" onclick="sendKeyword();">Search</button>
		                            <button class="btn btn-danger write"><a href="SHW_board.html">글쓰기</a></button>
		                        </div>
		                    </div>
		                    <!-- <div class="input-group-btn write">
		                        <button class="btn btn-danger write"><a href="SHW_board.html">글쓰기</a></button>
		                    </div> -->
		                    <!-- </form> -->
		                </div>
					</section>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

    <%@include file="cambak21Footer.jsp"%>
	
</body>

</html>