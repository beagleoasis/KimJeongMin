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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ea8351e29d05bbce3e8af30705e5907"></script>
	
	<!-- 템플릿 js, css 파일 -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<style>
		@import url(/resources/cambak21/css/SHWtamplet.css);
		
		#main {
			padding-bottom: 0px;
		}
		
		.\38 u {
			width : 100%;
		}
		
		.\34 u {
			width : 100%;
			margin : 0px;
		}
		
		#research {
			margin-bottom: 3%;
		}
		
		#keyword {
			border-radius: 0;
		}
		
		.btn {
			border: 1px solid #333;
			background-color: #333;
			color: #f1f1f1;
			border-radius: 0;
			transition: .2s;
			
		}
		
		.btn:hover {
			background-color: white;
			color: #333;
		}
		
		.row {
			margin-right: 0px;
		}
		
		.container {
 			padding-left: 0px;
 		}
		
		iframe {
			width: 100%;
		}
		
		.map_wrap {
			position:relative;
			width:100%;
			height:700px;
			margin-bottom:2%;
			}
		
		#menu_wrap {
			position:absolute;
			top:0;
			left:0;
			bottom:0;
			width:350px;
			margin:10px 0 30px 10px;
			padding:5px;overflow-y:auto;
			background:rgba(255, 255, 255, 0.7);
			z-index: 1;
			font-size:12px;
			border-radius: 10px;
			}
			
		.bg_white {
			background:#fff;
			}
		
		li {
			list-style: none;
			}
			
		.camping {
			position:relative;
			border-bottom:1px solid #888;
			overflow: hidden;
			cursor: pointer;
			min-height: 65px;
			}
		
		.camping span {
			display: block;
			}
			
		.camping .campingImg {
			float:left;
			position:absolute;
			margin:10px 0 0 10px;
			}
			
		.camping .boxInfo {
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
			padding:10px 0 10px 120px;
			}			
			
		#pagination {
			margin:10px auto;
			text-align: center;
			}
			
		#pagination a {
			display:inline-block;
			margin-right:10px;
			}
			
		#pagination .on {
			font-weight: bold; 
			cursor: default;color:#777;
			}
		 	
	    .wrap * {
	    	padding: 0;
	    	margin: 0;
	    	}
	    	
	    .wrap .info {
	    	width: 248px;
	    	height: 120px;
	    	border-radius: 5px;
	    	border-bottom: 2px solid #ccc;
	    	border-right: 1px solid #ccc;
	    	overflow: hidden;
	    	background: #fff;
	    	}
	    	
	    .wrap .info:nth-child(1) {
	    	border: 0;
	    	box-shadow: 0px 1px 2px #888;
	    	}
	    	
	    .info .title {
	    	padding: 5px 0 0 10px;
	    	height: 30px;
	    	background: #eee;
	    	border-bottom: 1px solid #ddd;
	    	font-size: 14px;
	    	font-weight: bold;
	    	}
	    
	    .info .body {
	    	position: relative;
	    	overflow: hidden;
	    	}
	    	
	    .info .desc {
	    	position: relative;
	    	margin: 13px 0 0 90px;
	    	height: 75px;
	    	}
	    	
	    .desc .ellipsis {
	    	overflow: hidden;
	    	text-overflow: ellipsis;
	    	white-space: nowrap;
	    	}
	    	
	    .desc .jibun {
	    	font-size: 11px;
	    	color: #888;
	    	margin-top: -2px;
	    	}
	    	
	    .info .img {
	    	position: absolute;
	    	top: 6px;
	    	left: 5px;
	    	width: 73px;
	    	height: 71px;
	    	border: 1px solid #ddd;
	    	color: #888;
	    	overflow: hidden;
	    	}
    
	</style>
	
	<script>
	
	let page = 1;
	let keyword = "${param.keyword}";
	
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
        
        addCampings(page);   
        
        // 엔터키를 누르면, 해당 캠핑장 검색하는 함수 호출
        document.addEventListener('keydown', function(event) { // 키보드 버튼을 누르면,
        	if(event.keyCode == 13) { // 그 누른 버튼이 엔터키라면,
        		sendKeyword();
        	}
        });
    });
    
    // 검색 창에 키워드를 입력하고 'search' 버튼을 누르면, 해당 캠핑장을 검색하는 함수 호출
    function sendKeyword() {
    	let keyword = $("#keyword").val();
    	
    	if(keyword.length < 2) {
    		alert("검색어를 2자 이상 입력해주세요");
    	} else {
    		location.href="/index/result?keyword=" + keyword;
    	}
    	
    }
    
    
 // VVVVvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv 캠핑장 검색 부분 시작 vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv    
    // keyword와 관련된 정보 가져오는 함수
    function addCampings(pageNum) {
    	$.ajax({
    	    type		: "post",
    	    url 		: "/index/result?keyword=" + keyword + "&page=" + pageNum,
    	    contentType : "application/json",
    	    success 	: function(data) {
    	    	console.log(data);
    	    	
    	    	showResult(data);
    	    	pagingScroll(data);
    	    	showMap(data);
    	    	}
    			
    		});
    }
    
    // 캠핑장 검색 결과 데이터를 보여주는 함수 (왼쪽 리스트 박스)
    function showResult(data) {
    	let paging = data.pagings;
    	let campings = data.campings;
    	
    	console.log(campings);
    	let output ="";
    	
    	if(campings.length == 0) { // 관련 캠핑장이 없으면,
    		output += '<p> 검색결과 없음 </p>';
    	} else {
    		$(campings).each(function(index, item) { // 관련 캠핑장이 있다면, 
    			output += '<li class="camping">';
    			output += '<span class="campingImg">';
    			
    			if(item.camping_firstImageUrl == null) { // 캠핑장 이미지가 등록되어 있지 않다면, no_image 사진 보여주기  
    				output += '<img src="../../resources/img/no_image.png" width="100px" height="100px"/></span>';
    			} else { // 캠핑장 이미지가 등뢱되어 있다면, 캠핑장 이미지 보여주기
    				output += '<img src="' + item.camping_firstImageUrl + '" width="100px" height="100px"/></span>';
    			}    			
    			output += '<div class="boxInfo"><span><a href="../index/detail?contentId=' + item.camping_contentId + '">' + item.camping_facltNm + '</a></span>';
    			output += '<span>' + item.camping_addr1 + '</span>';
    			
    			if(item.camping_addr2 != "null") { // 캠핑장 상세 주소가 등록되어 있으면, 보여주기
    				output += '<span>' + item.camping_addr2 + '</span>';
    			}
    			
    			if(item.camping_tel != null) { // 캠핑장 전화번호가 등록되어 있지 않다면, 안 보여주기
    				output += '<span>' + item.camping_tel + '</span>';
    			} 
    			
    			if(item.camping_sbrsCl != null) { // 캠핑장 유틸리티 정보가 등록되어 있지 않다면, 안 보여주기
    				output += '<span>' + item.camping_sbrsCl + '</span></div>';
    			}
    			
    			output += '</li>';
    		});
    	}
    	
    	$("#campingListContainer").html(output);
    }
    
    // 캠팡장 목록에 페이징 처리하는 함수
    function pagingScroll(pagingInfo) {
    		let data = pagingInfo.pagings;
    		let page = data.cri.page;
    		
    		let prev = Number(page) - 1;
    		let next = Number(page) + 1;
    		
    		let output = '';
    		
    		if(page > 1) { // 2페이지 이상으로 넘어갈 경우, 전으로 돌아가는 버튼 생성
    			output += '<a href="javascript:void(0);" onclick="addCampings(\'1\')"> << </a>';
    			output += '<a href="javascript:void(0);" onclick="addCampings(' + prev + ')"> < </a>';
    		}
    		
    		for(let i = 1; i < data.endPage + 1; i++) { // 페이지 번호별 버튼 생성
    			output += '<a href="javascript:void(0);" onclick="addCampings(' + i + ')">' + i + '</a>';
    		}
    		
    		if(page < data.endPage) { // 다음 페이지가 있을 경우, 다음으로 가기 버튼 생성
    			output += '<a href="javascript:void(0);" onclick="addCampings(' + next + ')"> > </a>';
    			output += '<a href="javascript:void(0);" onclick="addCampings(' + data.endPage + ')"> >> </a>';
    		}
    		
    		$("#pagination").html(output);   	
    }
    
    // 관련 캠핑장 지도에 띄어주는 함수 (오른쪽 지도)
    function showMap(data) {
    	let campings = data.campings;
    	
    	let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    	let options = { //지도를 생성할 때 필요한 기본 옵션
        	center: new kakao.maps.LatLng(campings[0].camping_mapY,campings[0].camping_mapX), //지도의 중심좌표.
        	level: 13 //지도의 레벨(확대, 축소 정도)
        };

    	let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴	

    	
        for (let i = 0; i < campings.length; i++) {
        	// 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: new kakao.maps.LatLng(campings[i].camping_mapY,campings[i].camping_mapX)	 // 마커의 위치
            });
        	
        	// 마커에 마우스를 오버하면 띄울 캠핑장 내용
        	let content1 = '<div class="wrap">';
        	content1 += '<div class="info">';
        	content1 += '<div class="title">';
        	content1 += campings[i].camping_facltNm;
        	content1 += '</div>';
        	content1 += '<div class="body">';
        	content1 += '<div class="img">';
        	if(campings[i].camping_firstImageUrl == null) { // 등록된 이미지가 없다면, no_imgae 사진 띄우기
        		content1 += '<img src="../../resources/img/no_image.png" width="73" height="70"></div>';
        	} else {
        		content1 += '<img src="' + campings[i].camping_firstImageUrl + '" width="73" height="70"></div>';
        	}
        	
        	content1 += '<div class="desc">';
        	content1 += '<div class="ellipsis">' + campings[i].camping_addr1 + '</div>';
        	
        	if(campings[i].camping_addr2 != "null") { // 등록된 상세 주소가 있다면, 같이 보여주기
        		content1 += '<div class="ellipsis">' + campings[i].camping_addr2 + '</div>';
        	}
        	
        	if(campings[i].camping_zipcode != null) { // 등록된 우편 주소가 없다면, 안 보여주기
        		content1 += '<div class="jibun ellipsis">(우) ' + campings[i].camping_zipcode + '</div>';
        	}
        	
        	if(campings[i].camping_tel != null) { // 등록된 전화번호가 없다면, 안 보여주기
        		content1 += '<div>' + campings[i].camping_tel + '</div>';
        	}
        	
        	content1 += '</div></div></div></div>';

        	// 마커에 표시할 인포윈도우를 생성합니다 
            var infowindow = new kakao.maps.InfoWindow({
                content: content1 // 인포윈도우에 표시할 내용
            });

            // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
            // 이벤트 리스너로는 클로저를 만들어 등록합니다 
            // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
            kakao.maps.event.addListener(marker, 'click', makeClickListener(campings[i].camping_contentId));
        }

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
        
		// 마커를 클릭하면, 해당 상세페이지로 이동하는 함수
        function makeClickListener(contentId) {
        	return function() {
        		location.href = '../index/detail?contentId=' + contentId;
        	}
        }
    }
    
//     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 캠핑장 검색 부분 끝(지도 검색) ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

// VVVVvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv 게시판 검색 부분 시작 vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    
    // 게시판 검색 결과 데이터 가져오는 함수
    function showBoard(flag, pageNum) {
    	console.log(flag);
    	if(pageNum == null) {
    		page = 1;
    	} else {
    		page = pageNum;
    	}    	
    	
    	$.ajax({
			  method: "post",
			  url: "/index/resultBoard/" + flag + "/" + keyword + "/" + page,
			  headers: {	// 요청하는 데이터의 헤더에 전송
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override" : "POST"
			  },
			  dataType: "json", // 응답 받는 데이터 타입
			  success : function(data) {
				  console.log(data);
				  showList(data.boards, flag);
				  addPaging(data.pagings, flag);
			  }			  
			}); 
    }
    
    // 게시판 검색 결과 보여주는 함수
    function showList(data, index) {
    	let output = '';
    	
    	if(data.length == 0) {
    		output += '<p>데이터 없음</p>';
    	} else {
    		
    		output += '<ul class="list-group">';
    		
    		let url = '';
    		$(data).each(function(i, item) {
    				
    			let date = new Date(item.board_updateDate);
		        let dateFormat = date.toLocaleString(); // 날짜 형식 변환
    			
				if(index == 3) { // 인덱스가 3이면, 'QA 게시판'의 검색 결과 보여줌
        			url = '/board/qa/detail?no=' + item.board_no + '&page=1';
        		} else if(index == 5) { // 인덱스가 5이면, '캠핑 팁 게시판'의 검색 결과 보여줌
        			url = '/board/campingTip/view?id=Tip&no=' + item.board_no + '&page=1';
        		} else if(index == 6) { // 인덱스가 6이면, '공지사항 게시판'의 검색 결과 보여줌
        			url = '/board/notice/read?no=' + item.board_no + '&page=1';
        		} else if(index == 7) { // 인덱스가 7이면, '고객센터 게시판'의 검색 결과 보여줌
        			url = '/board/cs/detail?no=' + item.board_no + '&page=1';
        		}
        			
            	output += '<li class="list-group-item">';
            	output += '<a href="' + url + '">' + item.board_title + '</a>';
            	output += '<div><span>작성자: ' + item.member_id + '</span>';
            	output += '<span> 작성일: ' + dateFormat + '</span>'
            	output += '<span> 조회수: ' + item.board_viewCnt + '</span>'
            	output += '<span> 좋아요: ' + item.board_likeCnt + '</span>'
            	output += '</div>';
            	output += '<div class="boardContent">' + item.board_content + '</div>';
            	output += '</li>';
            });      	
        	
        	output += '</ul><div id="paging"></div>';    	
    	}
    	
    	$("#content").html(output);
    	textLimitBoard();
    }
    
 // 게시글, 댓글 길이가 20개를 넣을 시 21번째 글짜부터 ...으로로 변환
    function textLimitBoard() {

	 $(".boardContent").each(function() {
          var length = 50; //표시할 글자수 정하기

          $(this).each(function() {
        	  console.log($(this).html().length);

             if ($(this).html().length >= length) {

                $(this).text($(this).text().substr(0, length) + '...');
                //지정할 글자수 이후 표시할 텍스트
             }
          });
       });
    };
    
    // 게시판 페이징 처리 함수 
    function addPaging(data, flag) {
    	if(data.length == 0) {
    		console.log("데이터 없음")
    	} else {
    		console.log(data);
    		let prev = Number(page) - 1;
    		let next = Number(page) + 1;
    		
    		let output = '<ul class="pagination">';
    		
    		if(page > 1) {
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ')"> << </a></li>';
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ',' + prev + ')"> < </a></li>';
    		}
    		
    		for(let i = 1; i < data.endPage + 1; i++) {
    			output += '<li><a id="pageNum" href="javascript:void(0);" onclick="showBoard(' + flag + ',' + i + ')">' + i + '</a></li>';
    		}
    		
    		if(page < data.endPage) {
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ',' + next + ')"> > </a></li>';
    			output += '<li><a href="javascript:void(0);" onclick="showBoard(' + flag + ',' + data.endPage + ')"> >> </a></li>';
    		}
    		
    		output += '</ul>';
    		
    		$("#paging").html(output);

    	}
    }
	</script>
</head>

<body>
    <%@include file="cambak21Header.jsp"%>
    
    	<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
				<section>
				<header>
					<h2>캠핑장 검색</h2>
<!--            	<span class="byline" id="rollNot"><a href="#">공지가 들어갈 자리입니다.</a></span> -->
				</header>
				<div id="research">
		        	<!-- <form> -->
	            	<div class="input-group">
	            		<input type="text" class="form-control" id="keyword" size="50" placeholder="Search" />
	                	<div class="input-group-btn">
	                    	 <button type="button" class="btn" onclick="sendKeyword();">Search</button>
	                	</div>
	            	</div>
            		<!-- </form> -->
		        </div>
		        <!-- 위에 카테고리 -->
				<div class="small-category">
					<nav class="navbar navbar-default" id="bsk-nav">
						<div class="container-fluid" id="bsk-smallCat">
							<ul class="nav navbar-nav">
								<li class="bsk-focus catagory-name"><a href="http://localhost:8081/index/result?keyword=${param.keyword }">전체보기</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('3');">Q&A</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('5');">캠핑Tip</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('6');">공지사항</a></li>
								<li class="catagory-name"><a href="javascript:void(0);" onclick="showBoard('7');">고객센터</a></li>
							</ul>
						</div>
					</nav>
				</div>
		        <div id="content">
<!-- 		        	<div class="col-lg-6 col-md-6"> -->
<!-- 		        		<div class="contact__content" id="campingListContainer"> -->
<!-- 				        </div> -->
<!-- 				    </div> -->
				    <div class="map_wrap">
				        <div class="well" id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				        <div id="menu_wrap" class="bg_white">
					        <ul id="campingListContainer"></ul>
					        <div id="pagination"></div>
					    </div>
				    </div>
				</div>                  
				</section>
				</div>
			</div>
		</div>

    <%@include file="cambak21Footer.jsp"%>
	
</body>


</html>