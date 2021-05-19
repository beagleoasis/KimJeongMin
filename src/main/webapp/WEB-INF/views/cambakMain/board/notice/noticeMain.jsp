<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 
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
<script src="/resources/cambak21/js/notice.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script> 

<script>

	

	function chechSearchInput(){
		console.log("!");
		console.log($("select[name=searchType]").val())
		if($("#searchWord").val() == ""){
			alert("검색어를 입력해주세요.");
		}else if($("select[name=searchType]").val() == "n"){
			alert("검색 카테고리를 선택해주세요.");
		}else{
			$("#searchFormGo").submit();
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
        	 location.href='/board/notice/listCri?page=1';
         } 
     
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
							<h2>최근 공지사항</h2>
							<span class="byline" id="rollNot"><a href="../notice/listCri">공지사항</a></span>
						</header>
					
					</section>
					
					
					<div>
						<div>
					<c:choose>
			<c:when test="${noticeList != null }">
				<table class="table table-hover" style="font-weight:bold;">
					<thead>
						<tr>
							<th style="width: 7%;">번호</th>
<!-- 							<th style="width: 10%;">분류</th> -->
							<th style="width: 40%;">제목</th>
							<th style="width: 15%;">작성일(수정일)</th>
							<th style="width: 7%;">댓글수</th>
							<th style="width: 7%;">읽은수</th>
							<th style="width: 10%;">작성자</th>
						</tr>
					</thead>
					<tbody class="center">
					<c:forEach var="noticeList" items="${noticeList }" varStatus="status">
						<c:choose>
							<c:when test='${noticeList.board_isDelete == "Y" }'>
								<tr>
									<td><strike>${noticeList.board_no }</strike></td>
<%-- 									<td><strike>${noticeList.board_category }</strike></td> --%>
									<td><a href="#" class="noticeTitle" name="board_no"><strike> ${noticeList.board_title }</strike></a></td>
									<td><strike><span class="sendTime"
											id="${status.count }"><fmt:formatDate
													value="${noticeList.board_writeDate }" type="both"
													pattern="yyyy-MM-dd HH:mm:ss" /></span></strike></td>
									<td><strike>${noticeList.board_replyCnt }</strike></td>
									<td><strike>${noticeList.board_viewCnt }</strike></td>
									<td><strike>${noticeList.member_id }</strike></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${noticeList.board_no }</td>
<%-- 										<td>${noticeList.board_category }</td> --%>
									<c:if test="${param.searchType != null && param.page != null}">
											<td><a style="overflow: hidden;" href="/board/notice/read?no=${noticeList.board_no }&searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page }" >
																${noticeList.board_title } </a></td>
								   </c:if>
									<c:if test="${param.searchType != null && param.page == null}">
											<td><a style="overflow: hidden;" href="/board/notice/read?no=${noticeList.board_no }&searchType=${param.searchType }&searchWord=${param.searchWord }&page=1" >
																${noticeList.board_title } </a></td>
								   </c:if>
								   
								   
								   
										<c:if test="${param.searchType == null && param.page != null}">
											<td><a href="/board/notice/read?no=${noticeList.board_no }&page=${param.page }" >${noticeList.board_title }  </a></td>
										</c:if>
										<c:if test="${param.searchType == null && param.page == null}">
											<td><a href="/board/notice/read?no=${noticeList.board_no }&page=1" >${noticeList.board_title } </a></td>
										</c:if>
												<td><span class="sendTime"
														id="${status.count }"><fmt:formatDate
																value="${noticeList.board_writeDate }" type="both"
																pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
												<td>${noticeList.board_replyCnt }</td>
												<td>${noticeList.board_viewCnt }</td>
												<td>${noticeList.member_id }</td>
								</tr>
									
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
				
				<form action="/board/notice/search" id="searchFormGo" method="GET">
				<select name="searchType" style="height:31px; width: 78px; color: chocolate;">
					<option value="title"> 제목 </option>					
					<option value="content"> 내용 </option>					
					<option value="writer"> 작성자 </option>					
				</select>
				
				<input type="text" name="searchWord" style="color: chocolate;" id="searchWord" placeholder="검색어 입력..."/>
				<input type="button" id="goSearch" style="color: chocolate;" value="검색" onclick="chechSearchInput();" />
				<input type="hidden" name="page" value="1" />
				<input type="button" style="color: chocolate;" value="전체보기" onclick="location.href='/board/notice/listCri?page=1'"/>
				<c:if test="${loginMember.member_id == 'admin' }">
				<button type="button" style="color: chocolate; float: right; font-weight: bold; width: 100px;" onclick="location.href='/board/notice/user/register'">글쓰기</button>
				</c:if>
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
								class="page-link" href="listCri?page=${param.page - 1 }">Prev</a>
							</li>
						</c:if>

						<c:forEach begin="${pagingParam.startPage}"
							end="${pagingParam.endPage }" var="pageNo">

							<li class="page-item" >
							<c:if test="${pageNo == param.page}">
							<a class="page-link" style="background-color: aquamarine;" href="listCri?page=${pageNo }">${pageNo }</a>
							</c:if>
							<c:if test="${pageNo != param.page}">
							<a class="page-link" href="listCri?page=${pageNo }">${pageNo }</a>
							</c:if>
							
						
								
							</li>

						</c:forEach>

						<c:if test="${pagingParam.next}">
							<li class="page-item"><a
								class="page-link" href="listCri?page=${param.page + 1 }">next</a>
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