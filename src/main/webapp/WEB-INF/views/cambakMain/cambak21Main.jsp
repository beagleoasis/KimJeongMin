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

<!DOCTYPE html>
<html>
<head>
<title>Cambark's</title>
<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/cambak21/css/effectV5.css">
<link rel="stylesheet" href="/resources/cambak21/css/SHWtamplet.css" />
<script src="/resources/cambak21/js/SHWtamplet.js"></script>

<script>
    
	$(document).ready(function () {
        // Initialize Tooltip
        $('[data-toggle="tooltip"]').tooltip();

        // Add smooth scrolling to all links in navbar + footer link
        $(".navbar a, footer a[href='#myPage']").on('click', function (event) {

            // Make sure this.hash has a value before overriding default behavior
            if (this.hash !== "") {

                // Prevent default anchor click behavior
                event.preventDefault();

                // Store hash
                var hash = this.hash;

                // Using jQuery's animate() method to add smooth page scroll
                // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                $('html, body').animate({
                    scrollTop: $(hash).offset().top
                }, 900, function () {

                    // Add hash (#) to URL when done scrolling (default click behavior)
                    window.location.hash = hash;
                });
            } // End if
        });

        textLimitBoard(); // ????????? ?????? ????????????
    });
	
	function checkSearchBar() {
		let inputKeyword = $("#searchBar").val();
		
		if (inputKeyword.length <= 1) {
			$("#autoSearchBar").empty();
			$("#autoSearchBar").css("display", "none");
		}
		
	}
	
	function getSearchList() {
		let inputKeyword = $("#searchBar").val();
		
		if (inputKeyword.length > 1) {
		   $("#autoSearchBar").empty();
		   
		   
	   		$.ajax({
				   method: "POST",
				   url: "main/autoSearch",
				   dataType: "json",
				   async: false,
				   data : {keyword : inputKeyword},
				   success : function(data) {
					   let output = '';
					   for (i = 0; i < data.length; i++) {
						   console.log(data);
						   console.log(data.length);
						   if (data.length == 0) {
							   $("#autoSearchBar").css("display", "none");
						   } else {
							   $("#autoSearchBar").css("display", "flex");
							   output += '<li><a href="#" class="searchListBar" onmouseover="resultColorIn(this);" onmouseout="resultColorOut(this);" '
							   output += 'onclick="clickKeyword(this); return false;"><span id="test"><span><img src="/resources/cambak21/img/searchIcon.png"'
							   output += ' class="searchImgSize"></span>' + data[i] + '</span></a></li>';
						   }
					   }
					   output += '<li class="searchListLastBar">* ??????????????? 2?????? ???????????? ???????????? ???????????????.</li>';
					   $("#autoSearchBar").append(output);
				   }
				 });
			
		} else {
			$("#autoSearchBar").empty();
			$("#autoSearchBar").css("display", "none");
		}
		
		
	}
	
	
 	// ????????? ????????? ????????? 30?????? ?????? ??? 21?????? ???????????? ...????????? ??????
    function textLimitBoard() {
    	$(".boardLinkSize").each(function() {
    		var length = 30; //????????? ????????? ?????????

    		$(this).each(function() {

    			if ($(this).text().length >= length) {

    				$(this).text($(this).text().substr(0, length) + '...')
    				//????????? ????????? ?????? ????????? ?????????
    			}
    		});
    	});
    };  
        
    function clickKeyword(obj) {
    	// ?????? ?????? ?????? ??? ?????? ?????? ??? ??????
    	let clickKeyword = $(obj).text();
    	
    	$("#searchBar").val(clickKeyword);
    	$("#searchCambaks").submit();
    	
    }
    
    function resultColorIn(obj) {
    	$(obj).attr("class", "searchListBarMouseIn");
    }
    
    function resultColorOut(obj) {
    	$(obj).attr("class", "searchListBar");
    }
    
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');

#footerContent {
	padding: 10px 15px;
	border-top: 1px solid #dedede;
	font-size: 15px;
	color: #000;
}

#footerTitle {
	font-weight: bold;
	color: #3A4636;
	font-size: 23px;
}

#footerSubheading {
	font-size: 16px;
}

.BoardListHead {
	text-align: center;
}

.BoardListBody {
	text-align: center;
}

.informationText {
	text-align: center;
    font-size: 1vw;
    color: white;
}

.moreView {
	float: right;
}

.plusBtn {
	width: 8px;
    margin-bottom: 3px;
}

.boardPageLink {
	width: 486px;
}

.boardLinkSize {
	color: #000;
}

.boardPageLink a:hover {
	color: #5d5d5d;
	text-decoration: none;
}

.moreViewBtn {
	color: #5d5d5d;
    font-size: 13px;
}

.moreView a:hover {
	color: #777;
	text-decoration: none;
}

.searchList {
	background: #fff;
    box-shadow: 0 9px 8px -3px rgb(64 60 67 / 24%), 8px 0 8px -7px rgb(64 60 67 / 24%), -8px 0 8px -7px rgb(64 60 67 / 24%);
    display: none;
    flex-direction: column;
    margin: 0;
    padding: 0;
    border: 0;
    border-radius: 0 0 7px 7px;
    padding-bottom: 4px;
    overflow: hidden;
    list-style: none;
}

.searchListBar {
	display: block;
    position: relative;
    padding-left: 30px;
    font-size: 1.4rem;
    line-height: 40px;
}

.searchListBarMouseIn {
	display: block;
    position: relative;
    padding-left: 30px;
    font-size: 1.4rem;
    line-height: 40px;
    background-color: #F1F1F1;
}

.searchListLastBar {
	border-top: 1px solid #f1f4f6;
    font-size: 1.4rem;
    line-height: 35px;
    background-color: #f9fafb;
    padding-left: 25px;
    margin-top: 5px;
}

.searchImgSize {
    overflow: hidden;
    position: absolute;
    top: 50%;
    left: 9px;
    width: 17px;
    height: 17px;
    margin-top: -8px;
}

.themaBtn {
	text-decoration-line: none;
}

#mainHeaderTitle {
	font-size: 19px;
	font-weight: bold;
	font-family: 'Pacifico', cursive;
}

.mainHeaderBar {
	float: left;
	width: 1px;
	height: 15px;
	margin: 18px 9px 0 -5px;
	background-color: #a99482;
}

</style>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50" ondragstart="return false">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/index/main" id="mainHeaderTitle">Cambark's</a>
                <span class="mainHeaderBar"></span>
                <a class="navbar-brand" href="/mall/main/" id="mainHeaderTitle">CambakMall</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">MENU<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                       		<!-- ????????? ????????? ?????? ???????????? -->
                            <c:if test="${loginMember == null }">
                            	<li><a href="/user/login/yet" id="loginBtn">?????????</a></li>
                            	<li><a href="/user/register">????????????</a></li>
		                        <li><a href="/board/qa/list?page=1">?????????</a></li>
		                        <li><a href="/board/notice/listCri?page=1">????????????</a></li>
		                        <li><a href="/board/cs/list?page=1">????????????</a></li>
                            </c:if>
                            <!-- ????????? ??? ?????? -->
                            <c:if test="${loginMember != null }">
                            	<!-- ???????????? ????????? ???????????? ?????? -->
                            	<c:if test="${loginMember.member_isAdmin == 'Y' }">
                            		<li><a href="/admin/productAnalysis">????????? ?????????</a></li>
		                            <li><a href="/board/qa/list?page=1">?????????</a></li>
		                            <li><a href="/board/notice/listCri?page=1">????????????</a></li>
		                            <li><a href="/board/cs/list?page=1">????????????</a></li>
		                            <li><a href="/user/logout" id="loginBtn">????????????</a></li>
                            	</c:if>
                            	<!-- ???????????? ????????? ?????? ????????? ?????? -->
                            	<c:if test="${loginMember.member_isAdmin == 'N' }">
                            		<li><a href="/myPage/myPost">???????????????</a></li>
		                            <li><a href="/board/qa/list?page=1">?????????</a></li>
		                            <li><a href="/board/notice/listCri?page=1">????????????</a></li>
		                            <li><a href="/board/cs/list?page=1">????????????</a></li>
		                            <li><a href="/user/logout" id="loginBtn">????????????</a></li>
                            	</c:if>
                            </c:if>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="/resources/cambak21/img/main_bushcraft.jpg" alt="campfire" width="1200" height="800">
            </div>

            <div class="item">
                <img src="/resources/cambak21/img/main_bonfire.jpg" alt="tent" width="1200" height="800">
            </div>

            <div class="item">
                <img src="/resources/cambak21/img/thumb_tent.jpg" alt="bus" width="1200" height="800">
            </div>
        </div>

        <div class="carousel-search">
            <div class="thema">
                <div class="themaBtn"><a href="/index/result?keyword=???">???</a></div>
                <div class="themaBtn"><a href="/index/result?keyword=??????" >??????</a></div>
                <div class="themaBtn"><a href="/index/result?keyword=??????" >??????</a></div>
                <div class="themaBtn"><a href="/index/result?keyword=??????" >??????</a></div>
            </div>
            <h1>????????????</h1>
            <p class="informationText" style="margin-bottom: 50px;">We are specialized in camping</p>
            <br />
            <form action="/index/result" id="searchCambaks" method="get">
                <div class="input-group">
                    <input type="text" class="form-control" size="50" style="font-size: 18px;" id="searchBar" placeholder="???????????? ??????????????????." name="keyword" onchange="checkSearchBar();" onkeyup="getSearchList();" autocomplete="off">
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-danger">Search</button>
                    </div>
                </div>
                <div>
                	<ul class="searchList" id="autoSearchBar"></ul>
                </div>
                <div id="search-res">
                </div>
            </form>
        </div>

    </div>

    <div class="grid">
        <h3 class="text-center" id="footerTitle">Cambak's ?????? ?????????</h3>
        <p class="text-center">
        What do you think about going there for this month break?<br> 
        Enjoy your trip with fresh air and wonderful landscape!
        </p><br />
        <c:forEach var="Campings" items="${CampingSites }">
	        <figure class="effect-milo" style="height: 240px;">
	        <img src="${Campings.camping_firstImageUrl }" alt="img11" id="${Campings.camping_contentId }" style="width: 312px;"/>
		        <figcaption>
			        <h2>
			        	<span>${Campings.camping_facltNm }</span>
			        </h2>
			        <p>${Campings.camping_addr1 }</p>
			        <a href="/index/detail?contentId=${Campings.camping_contentId }">??????</a>
		        </figcaption>
	        </figure>
        </c:forEach>
    </div>
    <div id="contact" class="container">
        <h3 class="text-center" id="footerTitle">Cambark's board</h3>
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">????????????</a></li>
            <li><a data-toggle="tab" href="#menu1">??????Tip</a></li>
            <li><a data-toggle="tab" href="#menu3">Q&amp;A</a></li>
        </ul>

        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
				<div class="moreView">
					<a href="/board/notice/listCri?page=1" class="moreViewBtn">???????????? ?????????<img src="/resources/cambak21/img/plus.png" class="plusBtn"/></a>
				</div>
				<table class="table">
				  <thead>
				    <tr>
				      <th class="BoardListHead">?????????</th>
				      <th class="BoardListHead">??????</th>
				      <th class="BoardListHead">??????</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="notice" items="${Boards.notice }">
				    <tr class="BoardListBody">
				      <td><fmt:formatDate value="${notice.board_writeDate }" pattern="MM-dd HH:MM" type="DATE" /></td>
				      <td class="boardPageLink"><a href="/board/campingreview/detail?no=${notice.board_no }" class="boardLinkSize">${notice.board_title }</a></td>
				      <td>${notice.board_viewCnt }</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
            </div>
            <div id="menu1" class="tab-pane fade">
				<div class="moreView">
					<a href="/board/campingTip/list?page=1" class="moreViewBtn">????????? ?????????<img src="/resources/cambak21/img/plus.png" class="plusBtn"/></a>
				</div>
				<table class="table">
				  <thead>
				    <tr>
				      <th class="BoardListHead">?????????</th>
				      <th class="BoardListHead">??????</th>
				      <th class="BoardListHead">??????</th>
				      <th class="BoardListHead">??????</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="Tip" items="${Boards.Tip }">
				    <tr class="BoardListBody">
				      <td><fmt:formatDate value="${Tip.board_writeDate }" pattern="MM-dd HH:MM" type="DATE" /></td>
				      <td class="boardPageLink"><a href="/board/campingTip/view?id=Tip&no=${Tip.board_no }" class="boardLinkSize">${Tip.board_title }</a></td>
				      <td>${Tip.board_likeCnt }</td>
				      <td>${Tip.board_viewCnt }</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
            </div>
            <div id="menu3" class="tab-pane fade">
				<div class="moreView">
					<a href="/board/qa/list.bo?page=1" class="moreViewBtn">Q&amp;A ?????????<img src="/resources/cambak21/img/plus.png" class="plusBtn"/></a>
				</div>
				<table class="table">
				  <thead>
				    <tr>
				      <th class="BoardListHead">?????????</th>
				      <th class="BoardListHead">??????</th>
				      <th class="BoardListHead">??????</th>
				      <th class="BoardListHead">??????</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="QA" items="${Boards.QA }">
				    <tr class="BoardListBody">
				      <td><fmt:formatDate value="${QA.board_writeDate }" pattern="MM-dd HH:MM" type="DATE" /></td>
				      <td class="boardPageLink"><a href="/board/qa/detail.bo?no=${QA.board_no }" class="boardLinkSize">${QA.board_title }</a></td>
				      <td>${QA.board_likeCnt }</td>
				      <td>${QA.board_viewCnt }</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
            </div>
        </div>
    </div>

	<!-- Footer -->
	<footer class="text-center">
		<div id="contact" class="container">
			<h3 class="text-center" id="footerTitle">Cambark's Info</h3>
			<div class="row">
				<div class="col-md-2" id="footerSubheading">
					<p>????????? ?????????</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>???????????????</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>?????????</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>????????????</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>???????????? ?????? 1???</p>
				</div>
				<div class="col-md-2" id="footerSubheading">
					<p>???????????? ?????? 2???</p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p><a href="/index/result?keyword=???">???</a></p>
					<p><a href="/index/result?keyword=??????">??????</a></p>
					<p><a href="/index/result?keyword=??????">??????</a></p>
					<p><a href="/index/result?keyword=??????">??????</a></p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p><a href="/board/campingTip/list?page=1">??????Tip ?????????</a></p>
					<p><a href="/board/qa/list.bo?7page=1">Q&amp;A ?????????</a></p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p><a href="/mall/main">???????????????</a></p>
					<p><a href="/mall/categories">????????????</a></p>
					<p><a>????????????</a></p>
					<p><a>???????????? ????????????</a></p>
					<p><a>???????????????</a></p>
					<p><a>????????????</a></p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p><a href="/board/notice/listCri?page=1">????????????</a></p>
					<p><a href="/board/cs/list?page=1">????????????</a></p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p>?????????</p>
					<p>?????????</p>
					<p>?????????</p>
					<p>?????????</p>
					<p>?????????</p>
				</div>
				<div class="col-md-2" id="footerContent">
					<p>?????????</p>
					<p>?????????</p>
					<p>?????????</p>
					<p>?????????</p>
				</div>
			</div>
			<!-- ?????? ?????? ??????-->
			<a href="#" class="top"><img
				src="/resources/cambak21/images/top.png" class="topMove"></a>
			<!-- ?????? ?????? ??????-->
		</div>
	</footer>
	<!-- /Footer -->
 	<%@include file="cambak21checkList.jsp"%> 


</body>

</html>