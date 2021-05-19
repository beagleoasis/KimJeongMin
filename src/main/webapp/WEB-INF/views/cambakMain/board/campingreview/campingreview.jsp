<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 공지사항 </title>

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak21/js/skel-panels.min.js"></script>
<script src="/resources/cambak21/js/init.js"></script>

<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />

<link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script> 

<script>
	function checkSearchInput(){
		console.log("!");
		console.log($("select[name=searchType]").val())
		if($("#searchWord").val() == ""){
			alert("검색어를 입력.");
		}else if($("select[name=searchType]").val() == "n"){
			alert("검색 카테고리를 선택해주세요.");
		}else{
			$("#searchSelect").submit();
		}
		
	}

	 $(document).ready(function() {
		  checkPageMain();
	      let boardUri = searchUriAddress();
	      asideBarDraw(boardUri);
	      rolling();
	      
	   });
		
	   // 게시판 uri 접속 시 board/ 뒤에 오는 게시판이름 가져오는 기능
    function checkPageMain() {
        var url = location.href; //url주소
        var ispage = url.indexOf("page=");
        
         if(ispage == -1){
       	 location.href='/board/campingreview/listcri?page=1';
        } 
    
    }
	   
	function checkLogin() {
		
		if(${loginMember.member_id == null}) {
			alert("회원만 글쓰기 가능합니다.");
			location.href='/user/login/yet'
			return false;
			
		}
		
		return true;
	}   
	   
	   
	
	
	
</script>






<style>
@import url(/resources/cambak21/css/SHWtamplet.css);
</style>

</head>

<body>

<%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">

				<!-- 사이드바 템플릿 -->
				<%@include file="../../cambak21Aside2.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2>캠핑후기 페이징 리스트</h2>
							<span class="byline" id="rollNot"><a href="#">캠핑후기 페이징 리스트</a></span>
						</header>
					
					</section>
					
					
					<div>
						<div>
					<c:choose>
			<c:when test="${CRboardlist != null }">
				<table class="table table-hover" style="font-weight:bold;">
					<thead>
						<tr>
							<th style="width: 7%;">번호</th>
							<th style="width: 10%;">분류</th>
							<th style="width: 40%;">제목</th>
							<th style="width: 15%;">작성일(수정일)</th>
							<th style="width: 7%;">좋아요</th>
							<th style="width: 7%;">읽은수</th>
							<th style="width: 10%;">작성자</th>
						</tr>
					</thead>
					<tbody class="center">
					<c:forEach var="CRboardlist" items="${CRboardlist }" varStatus="status">
						<c:choose>
							<c:when test='${CRboardlist.board_isDelete == "Y" }'>
								<tr>
									<td><strike>${CRboardlist.board_no }</strike></td>
									<td><strike>${CRboardlist.board_category }</strike></td>
									<td><a href="#" class="crTitle" name="board_no"><strike> ${CRboardlist.board_title }</strike></a></td>
									<td><strike><span class="sendTime"
											id="${status.count }"><fmt:formatDate
													value="${CRboardlist.board_writeDate }" type="both"
													pattern="yyyy-MM-dd HH:mm:ss" /></span></strike></td>
									<td><strike>${CRboardlist.board_likeCnt }</strike></td>
									<td><strike>0</strike></td>
									<td><strike>${CRboardlist.member_id }</strike></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${CRboardlist.board_no }</td>
										<td>${CRboardlist.board_category }</td>
									<c:if test="${param.searchType != null}">
											<td><a style="overflow: hidden;" href="/board/campingreview/detail?no=${CRboardlist.board_no }&searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page }" >
																${CRboardlist.board_title } <span style="color: chocolate;">(${CRboardlist.board_replyCnt })</span> </a></td></c:if>
										<c:if test="${param.searchType == null}">
											<td><a href="/board/campingreview/detail?no=${CRboardlist.board_no }&page=${param.page }" >${CRboardlist.board_title }  <span style="color: chocolate;">(${CRboardlist.board_replyCnt })</span></a></td>
										</c:if>
												<td><span class="sendTime"
														id="${status.count }"><fmt:formatDate
																value="${CRboardlist.board_writeDate }" type="both"
																pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
												<td>${CRboardlist.board_likeCnt }</td>
												<td>${CRboardlist.board_viewCnt }</td>
												<td>${CRboardlist.member_id }</td>
								</tr>
									
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
				
				<form action="/board/campingreview/search" id="searchSelect" method="GET">
				<select name="searchType" style="height:31px; width: 78px; color: chocolate;">
					<option value="n">-----------------</option>
					<option value="title"> 제목 </option>					
					<option value="content"> 내용 </option>					
					<option value="writer"> 작성자 </option>					
				</select>
				
				<input type="text" name="searchWord" style="color: chocolate;" id="searchWord" placeholder="검색어 입력..."/>
				<input type="button" id="goSearch" style="color: chocolate;" value="검색" onclick="checkSearchInput();" />
				<input type="hidden" name="page" value="1" />
				<input type="button" style="color: chocolate;" value="전체보기" onclick="location.href='/board/campingreview/listcri'"/>
				
				
				<div class="writeBtn">
							<a href='/board/campingreview/write' onclick="return checkMember();">
				<button type="button" style="color: chocolate; float: right; font-weight: bold; width: 100px;" onclick="return checkLogin();">글쓰기 </button>
				</a>
				</div>
				
				<hr style="margin:1em 0 0 0; padding:1em 0 0 0; color:chocolate;"/>
			</form>
			
			<c:choose>
						<c:when test='${param.searchWord != null }'>
							<div class="text-center">
					<ul class="pagination">
						<c:if test="${pagingParam.prev }">
							<li class="page-item" ><a
								class="page-link" href="search?searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page - 1 }">Prev</a>
							</li>
						</c:if>

						<c:forEach begin="${pagingParam.startPage}"
							end="${pagingParam.endPage }" var="pageNo">

							<li class="page-item"><a
								class="page-link" href="search?searchType=${param.searchType }&searchWord=${param.searchWord }&page=${pageNo }">${pageNo }</a>
							</li>

						</c:forEach>

						<c:if test="${pagingParam.next}">
							<li class="page-item"><a
								class="page-link" href="search?searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page + 1 }">next</a>
							</li>
						</c:if>

					</ul>
				</div>	
							
				</c:when>
				<c:otherwise>

				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pagingParam.prev }">
							<li class="page-item"><a
								class="page-link" href="listcri?page=${param.page - 1 }">Prev</a>
							</li>
						</c:if>

						<c:forEach begin="${pagingParam.startPage}"
							end="${pagingParam.endPage }" var="pageNo">

							<li class="page-item" ><a
								class="page-link" href="listcri?page=${pageNo }">${pageNo }</a>
							</li>

						</c:forEach>

						<c:if test="${pagingParam.next}">
							<li class="page-item"><a
								class="page-link" href="listcri?page=${param.page + 1 }">next</a>
							</li>
						</c:if>

					</ul>
				</div>							
					</c:otherwise>
				</c:choose>
			
			
			
		
			</div>
		</c:when>
			<c:otherwise>
   				게시물이 존재하지 않거나, 데이터를 얻어오지 못했습니다.
   			</c:otherwise>
		</c:choose>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>


</body>

</html>