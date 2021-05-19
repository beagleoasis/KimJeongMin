<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<title>Cambark's</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/resources/cambak21/js/skel.min.js"></script>
	<script src="/resources/cambak21/js/skel-panels.min.js"></script>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=887fe4aa88407b63eba44422c0a6fef4"></script>
	
	<!-- 템플릿 js, css 파일 ../../resources/cambak21/js/skel.min.js -->
	<script src="/resources/cambak21/js/SHWtamplet.js"></script>
	<!-- KJM 사용 부분 -->
		<link href="../../resources/cambak21/lib/lightbox2-2.11.3/dist/css/lightbox.min.css" rel="stylesheet" />
		<script src="../../resources/cambak21/lib/lightbox2-2.11.3/dist/js/lightbox-plus-jquery.min.js"></script>
	
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
		
		.row {
			margin-right: 0px;
		}
		.container {
 			padding-left: 0px;
 		}
 		
 		.campingImg {
 			padding-bottom: 0px;
 		}
		
		#campingListContainer {
			height:788px;
			border : 1px solid black;
			overflow: scroll;
		}
		
		iframe {
			width: 100%;
		}
    
    <!-- 김정민 CSS -->
    
    
    .tourimg {
			width: 100%;
		}

		.col-md-6 {
			padding: 0px;
		}

		.row {
			margin-left: 0px;
			margin-right: 0px;
		}

		#kakaoMap {
			padding-left: 0px;
		}

		#map {
			height: 519px;
		}

		.h3 {
			margin-top: 0px;
		}

		#basicDesc1 {
			padding-right: 5px;
			padding-left: 0%;
			max-width: 100%;
		}

		#weather {
			padding-right: 5px;
			padding-left: 0%;
			padding-top: 0%;
		}

		#descAndMap {
			padding-top: 2%;
			padding-bottom: 2%;
		}

		#detailedBox {
			padding-bottom: 7%;
			padding-left: 0px;
		}

		#imageList3 {
			padding: 0;
		}

		#imageList4 {
			padding: 0;
		}
		#detailedDesc{
			padding-left: 0px;
		}
		#intro {
			font-size: 18px;
			font-weight: 500;
		}
    
    
    <!-- -->
    
	</style>
	<script type="text/javascript">
		lightbox.option({
	        'resizeDuration': 200,
	        'wrapAround': true,
	        'maxWidth' : 600,
	        'fadeDuration' : 1000
	      })
	</script>
	<script>
	
	//쿼리문에서 해당 항목 값을 찾아주는 함수
	function getParameter(param) {
		var returnVal; //리턴할 값을 저장하는 변수
		var url = location.href; //url주소
		// console.log(url);
		var params = url.slice(url.indexOf("?") + 1, url.length).split("&");
		// console.log(params);

		for (var i in params) {
			var paraName = params[i].split("=")[0]; // 매개변수명 얻음
			if (param.toLowerCase() == paraName.toLowerCase()) {
				returnVal = params[i].split("=")[1];
				return decodeURIComponent(returnVal);
			}
		}

		return -1; // 모든 배열 요소를 다 검색해도 매개변수가 없을때
	}
	

	
	let contentId = getParameter("contentId"); // 관광지 PK
	let weatherUrl;
	let X;
	let Y;
	
	// 날씨URL 변수 설정
	const weatherServiceKey = "&appid=e3d6df7622a5cd65dca26e2c8231e08a&units";
	const serviceKey = "1Bz08Ggw9EdLa34dX8ATnU3tvxuDhV42GoBODXgIVZtNli5M3OyA3YnArF6F9oJHdFtatdLkamelhBxgi4Fdvg%3D%3D";
	
	// firstImageUrl을 제외한 이미지 리스트를 담고 있는 json url
	let imageUrl = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/imageList?ServiceKey=" + serviceKey +
		"&MobileOS=ETC&MobileApp=AppTest&contentId=" + contentId + "&_type=json";

	console.log(typeof(contentId));
	
	function showCampingDetail() {
		
		$.ajax({
		    type		: "post",
		    url 		: "/index/campingDetail/" + contentId,
		    contentType : "application/json",
		    success 	: function(data) {
		    	console.log(data);
		    	let campingFirstImgUrl;
		    	
		    	//메인 이미지가 있다면,
		    	if(data.camping_firstImageUrl != null){

		    		campingFirstImgUrl = "<img src='" + data.camping_firstImageUrl + "' style=\"width: 567.5px; height:480px;\"/>";
		    	} 
		    	//메인 이미지가 없다면,
		    	else {
		    		campingFirstImgUrl = "<img src='../../resources/cambak21/img/trip.jpg' style=\"width: 1135px;\"/>";
		    	}
				
		    	//캠핑장 이름
		    	let output = "<div><h3><strong>" + data.camping_facltNm + "</strong></h3></div>";
				
		    	
		    	output += "<div class='cont_tb'><table class='table'><tbody>";
		    	output += "<tr><th><strong>주소</strong></th><td>" + nullCheck(data.camping_addr1) + "</td></tr>";
		    	output += "<tr><th><strong>문의처</strong></th><td>" + nullCheck(data.camping_tel) + "</td></tr>";
		    	output += "<tr><th><strong>캠핑장 환경</strong></th><td>" + nullCheck(data.camping_lctCl) + "</td></tr>";
		    	output += "<tr><th><strong>캠핑장 유형</strong></th><td>" + nullCheck(data.camping_induty) + "</td></tr>";
		    	output += "<tr><th><strong>운영기간</strong></th><td>" + nullCheck(data.camping_operPdCl) + "</td></tr>";
		    	output += "<tr><th><strong>운영일</strong></th><td>" + nullCheck(data.camping_operDeCl) + "</td></tr>";
		    	output += "<tr><th><strong>예약방법</strong></th><td>" + nullCheck(data.camping_resveCl) + "</td></tr>";
		    	output += "</tbody></table><div>";
		    	
		    	let campingInfoDetail = "<div><h4>" + nullCheck(data.camping_intro) + "</h4></div>";
		    	
				//메인 이미지 출력
				$("#campingFirstImgUrl").html(campingFirstImgUrl);
				//캠핑장 간략 정보 출력
				$("#basicDesc1").html(output);
				
				//캠핑 상세 설명 출력
				$("#detailedDesc").html(campingInfoDetail);
		    }
		
			, complete : function(data) {
		    	console.log(data.responseJSON);
		    	X = data.responseJSON.camping_mapY;
		    	Y = data.responseJSON.camping_mapX;
		    	weatherUrl = "http://api.openweathermap.org/data/2.5/weather?lat=" + X + "&lon=" + Y + weatherServiceKey + "=metric";
				console.log(weatherUrl);
				ajaxLoading(weatherUrl, 2);
				mapApi(X, Y);
		    	
			}
		}); // end of ajax
	}
	
	// 받은 json url 주소를 바탕으로 데이터 로딩하는 부분!
	function ajaxLoading(dataUrl, urlType) {
		$.ajax({
			url: dataUrl, // 데이터가 송수신 될 곳
			dataType: "json", // 수신할 데이터의 타입
			type: "GET", // 통신 방식
			success: function (data) { // 통신이 성공 했을때 수행되는 콜백함수
				// console.log(data);
				parseTour(data, contentId, urlType);
			},
			error: function (response) { // 통신 실패시
				alert("통신 실패 : " + response.responseText);
			}
		});
	}
	
	
	// 데이터 로딩 후, 1)상세내용2)이미지3)날씨 관련 파싱하는 부분!
	function parseTour(data, contentId, urlType) {
		let tour = " ";
		let selectedContentId = " ";
		let weatherList = " ";

		switch (urlType) {
			// 상세내용일 때,
			case 0:
				tour = data.response.body.items.item;
				selectedContentId = contentId;
				printDataURL(tour, selectedContentId);
				console.log(tour);
				console.log(selectedContentId);
				break;
			// 이미지일 때,
			case 1:
				tour = data.response.body.items.item;
				selectedContentId = contentId;
				printImageUrl(tour, selectedContentId);
				break;
			// 날씨일 때,
			case 2:
				weatherList = data;
				printWeatherDataUrl(weatherList);
				console.log(weatherList);
				break;
		}
	}
	
	//2)이미지 리스트 출력 함수
	function printImageUrl(itemData, itemID) {
		// 이미지리스트를 출력하는 부분
		if (itemData != null) {
			console.log(itemData);
			for (let i = 0; i < itemData.length + 4; i++) {
				$("#imageList" + (i)).hide();
			}
			for (let i = 0; i < itemData.length; i++) {
				if (itemData[i].contentId == itemID) {
					if (itemData[i].imageUrl == null) {
						//console.log(tour[i].imageUrl);
						var imgListBox = document.getElementById("imgListBox");
						imgListBox.style.display = "none";
						break;
					} else {
						if (itemData[i].imageUrl != null) {
							let imageList;
							imageList = "<a href='" + itemData[i].imageUrl + "' data-lightbox='tourList'>" + "<img src = '" +
								itemData[i].imageUrl + "'    class='tourimg' style='width: 283.75px;height:240px;'/>" + "</a>";
							// console.log(itemData[i].imageUrl);
							$("#imageList" + (i + 1)).show();
							$("#imageList" + (i + 1)).html(imageList);
						} else {
							$("#imageList" + (i + 1)).hide(); //html(imageList.display = "none");
						}
					}
				}
			}
		} else {
			var imgListBox = document.getElementById("imgListBox");
			imgListBox.style.display = "none";
		}

	}
	
	//3) 날씨 데이터 파싱 함수
	function printWeatherDataUrl(itemData) {
		let weatherData;
		// let weatherDataCheck = itemData;
		// console.log(weatherDataCheck);
		$.each(itemData, function (index, item) {
			weatherData = "<div><h3 style='margin-top: 0%;'><strong>현지 날씨</strong></h3></div><div class='cont_tb'><table class='table'><tbody><tr><th><strong>기온</strong></th><td>" + itemData.main.temp + "도" + "</td></tr><tr><th><strong>시간당 최저/최고기온<strong></th><td> " + itemData.main.temp_min + "도 / " + itemData.main.temp_max + "도" + "</td></tr><tr><th><strong>일몰 시간<strong></th><td>" + msToTime(itemData.sys.sunset) + "</td></tr><tr><th><strong>습도/풍속</strong></th><td>"+ itemData.main.humidity + "% / " + itemData.wind.speed + " m/s </td></tr></tbody></table></div>";
		});
		$("#weather").html(weatherData);
	}
	
	//3-1)일기예보 시간 변환 함수
	let duration = " ";
	function msToTime(duration) {
		let _gmt = new Date();  // GMT시간
		duration = new Date(_gmt.getTime() + (_gmt.getTimezoneOffset() * 60000));

		let milliseconds = parseInt((duration % 1000) / 100)
			, seconds = parseInt((duration / 1000) % 60)
			, minutes = parseInt((duration / (1000 * 60)) % 60)
			, hours = parseInt((duration / (1000 * 60 * 60)) % 24);

		hours = (hours < 10) ? "0" + hours : hours;
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		seconds = (seconds < 10) ? "0" + seconds : seconds;
		return hours + ":" + minutes + ":" + seconds; //"." + milliseconds;
	}
	
	// //카카오 지도 api 연동 및 표시 부분 함수
	function mapApi(X, Y) {
		console.log(X, Y);
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(X, Y), //지도의 중심좌표.
			//center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		let markerPosition = new kakao.maps.LatLng(X, Y); // 위도, 경도 객체
		let marker = new kakao.maps.Marker({
			position: markerPosition
		}); // 마커 객체 생성

		marker.setMap(map);
	}
	
	// 데이터 Url 항목 검사 함수(null인지 아닌지)
	function nullCheck(itemData) {
		let fixedData;
		fixedData = itemData;
		if (fixedData == null) {
			fixedData = "";
		}
		return fixedData;
	}
	
	// 검색어를 위한 키워드 전송 함수
	function enterKey() {
		let keyWord = $("#keyWord").val();
		console.log(keyWord);
		location.href = "/index/result?keyword=" + keyWord;
	}
	
	

	
	$(function() {
		showCampingDetail();

		ajaxLoading(imageUrl, 1);
		
		// 엔터키를 눌렀을 때,
		$("#keyWord").keydown(function(key) {
	        if (key.keyCode == 13) {
	        	enterKey();
	        }
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
				<section>
				<header>
					<h2>캠핑장 검색</h2>
<!--            	<span class="byline" id="rollNot"><a href="#">공지가 들어갈 자리입니다.</a></span> -->
				</header>
				<div id="research">
		        <!-- <form> -->
		           <div class="input-group">
		              <input type="text" class="form-control" size="50" id="keyWord" placeholder="Search" >
		                 <div class="input-group-btn">
		                    <button type="button" class="btn" onclick="enterKey();" style="background-color: #333; color: #f1f1f1;">Search</button>
		                 </div>
		            </div>
		        </div>
		        	<div id="content">
			            <div class="row">
			            <div class="col-sm-12" style="padding-left: 0px;">
				            <!-- 이미지 4장 출력 부분 -->
				            <div class="row" id="imageListBox">
								<div class="col-md-6" id="campingFirstImgUrl">
									<div class="well">
									</div>
								</div>
								<div class="col-md-6" id="imgListBox">
									<div class="row">
										<div class="col-md-6" id="imageList1" style="height:240px;">
											<!-- <div class="well"></div> -->
										</div>
										<div class="col-md-6" id="imageList2" style="height:240px;">
											<!-- <div class="well"></div> -->
										</div>
									</div>
									<div class="row">
										<div class="col-md-6" id="imageList3" style="height:240px;">
											<!-- <div class="well"></div> -->
										</div>
										<div class="col-md-6" id="imageList4" style="height:240px;">
											<!-- <div class="well"></div> -->
										</div>
									</div>
								</div>
							</div>
							<!-- 지도 + 일기예보 -->
							<div class="row" id="descAndMap">
								<!-- 카카오 지도가 들어가는 부분 -->
								<div class="col-md-6" id="kakaoMap">
									<div class="well" id="map" style="width: 640.547px; height:539px;">
										<!-- <p></p> -->
									</div>
								</div>
								<!-- 야영지 기본정보 + 날씨예보 -->
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-12" id="basicDesc1" style="padding-left: 110px;">
											<div class="well">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12" id="weather" style="padding-left: 110px;">
											<div class="well">일기예보 위치</div>
										</div>
									</div>
								</div>
		
							</div><!-- end of 지도+일기예보 -->
							<!-- 장소 상세 설명 부분 -->
				            <div class="row" id="detailedBox">
								<div class="col-sm-12" id="detailedDesc">
									<div class="well">
									</div>
								</div>
							</div>
			            	
			            </div><!-- end -->
					                
						</div>
					</div>                    
					</section>
				</div>
			</div>
		</div>
<!--  	<script>  -->
<!--  	</script>  -->

    <%@include file="cambak21Footer.jsp"%>
	
</body>


</html>