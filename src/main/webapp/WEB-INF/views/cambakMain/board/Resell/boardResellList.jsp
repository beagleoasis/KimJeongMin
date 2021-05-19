<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		.bordListBox{
			width : 322px;
			height : 387px;
			margin :10px;	
			border: solid 1px black;
			float: left;
		
		}
		.tdTotolStyle{
			margin:	 10px;
			display:block;
		}	
		.tdContentBox{
			width: 300px;
			height: 45px;
		}
		.Thumbnail{
			display: block;
			width: 300px;
			height: 175px
		}
		.rightSapn{
			float: right;
		}
	</style>
</head>
<script type="text/javascript">
var minHeight = 0
let page = 2;
function gotoDeteilPage	(no) {
	window.location.href="/board/resell/detail?no="+no+"&page=${pagingParam.cri.page}"
}
$(window).scroll(function () {
	
	var height = $(document).scrollTop();
	if(height > (minHeight+980)){
		console.log(minHeight);
		minHeight += 980;
		$.ajax({
			type : "post",
			contentType : "application/json",
			url : "/board/resell/list/"+page, 
			success : function(data) {
				console.log(data)
				$.each(data,function(index,item){
					let output = ""
					textLimit();
					if(item.resellBoard_isDelete != "Y"){
						output += '<tr class="bordListBox" onclick="gotoDeteilPage('+item.resellBoard_no+');">';
						output +='<td class="tdTotolStyle"><span>'+item.member_id+'</span></td>';
						output +='<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>';
						output +='<td class="tdTotolStyle"><span>'+item.resellBoard_title+'</span></td>';
						output +='<td class="tdTotolStyle tdContentBox" ><span style="word-break:normal;">'+item.resellBoard_content+'</span></td>';
						output +='<td class="tdTotolStyle"><span class="rightSapn">조회수 : '+item.resellBoard_viewCnt+'</span></div></td>';
						output +='<td class="tdTotolStyle"><div><span>'+item.resellBoard_postDate+'</span><span class="rightSapn">'+item.resellBoard_price+'원</span></div></td>';
						output +='</tr>';
					}else{
						output += '<tr class="bordListBox">';
						output +='<td class="tdTotolStyle"><del><span>'+item.member_id+'</span></del></td>';
						output +='<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>';
						output +='<td class="tdTotolStyle"><del><span>'+item.resellBoard_title+'</span></del></td>';
						output +='<td class="tdTotolStyle tdContentBox" ><del><span style="word-break:normal;">'+item.resellBoard_content
						+'</span></del></td>';
						output +='<td class="tdTotolStyle"><del><span class="rightSapn">조회수 : '+item.resellBoard_viewCnt+'</span></div></td>';
						output +='<td class="tdTotolStyle"><div><del><span>'+item.resellBoard_postDate+'</span></del><span class="rightSapn">판매완료</span></div></td>';
						output +='</tr>';
					}
					
					$("#nextPage").append(output)
				});
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
		console.log("page : "+page)
		page+=1;
	}
});
$(function() {
	textLimit();
});
//게시글 제목 글자수를 조절하는 함수
function textLimit() {
   $(".tdContentBox").each(function() {
      var length = 45; //표시할 글자수 정하기

      $(this).each(function() {

         if ($(this).text().length >= length) {

            $(this).text($(this).text().substr(0, length) + '...')
            //지정할 글자수 이후 표시할 텍스트
         }
      });
   });
};

</script>
<body>
    <%@include file="../../cambak21Header.jsp"%>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">
			
			<!-- 사이드바 템플릿 -->
			<%@include file="../../cambak21Aside2.jsp"%>

				<!-- Content -->
				<div id="content" class="8u skel-cell-important"style="width: 100%;float: revert;">
				<section>
					<header style="display: table;margin: auto;">
						<h2>중고거래</h2>
						<span class="byline" id="rollNot" style="text-align: center;"><a href="../notice/listCri">공지사항</a></span>
					</header>
				</section>
						<table style="width: 100%x"id="nextPage">
				
						<tbody style="width: 100%">
						<div id="ResellList" style="display: table;margin: auto;">
							<form action="/board/resell/search" method="GET">
								<select name="searchType" style="margin-right: 15px">
									<option value="resellBoard_title">제목</option>
									<option value="resellBoard_content">내용</option>
									<option value="member_id">작성자</option>
								</select>
								
								<input type="text" name="searchWord" placeholder="검색어 입력..." style="width: 550px"/>
								<input type="submit" id="goSearch" value="검색" />
							</form>
							<c:if test="${loginMember.member_id != null }">
							<a href="write" style="margin-left: 15px"><button type="button" class="btn btn-info" id="deleteBoard">글쓰기</button></a>
						</c:if>
						</div >
						
						<c:forEach var="board" items="${board}">
						<c:choose>
                  			<c:when test='${board.resellBoard_isDelete == "Y"}'>
								<tr class="bordListBox">
								
								<td class="tdTotolStyle"><del><span>${board.member_id}</span></del></td>
								<td class="Thumbnail tdTotolStyle"><img class="Thumbnail" src="/resources/mallMain/img/shop/shop-5.jpg"/></td>
								<td class="tdTotolStyle"><del><span>${board.resellBoard_title}</span></del></td>
								<td class="tdTotolStyle tdContentBox" ><del><span style="word-break:normal;">${board.resellBoard_content}</span></del></td>
								<td class="tdTotolStyle"><del><span class="rightSapn">조회수 : ${board.resellBoard_viewCnt}</span></del></td>
								<td class="tdTotolStyle"><del><div><span>${board.resellBoard_postDate}</span><span class="rightSapn">${board.resellBoard_price}원</span></div></del></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="bordListBox" onclick="gotoDeteilPage(${board.resellBoard_no});">
								
								<td class="tdTotolStyle"><span>${board.member_id}</span></td>
								<td class="Thumbnail tdTotolStyle"><img class="Thumbnail"src='data:image/png;base64,' /></td>
								<td class="tdTotolStyle"><span>${board.resellBoard_title}</span></td>
								<td class="tdTotolStyle tdContentBox" ><span style="word-break:normal;">
									${board.resellBoard_content}
								</span></td>
								<td class="tdTotolStyle">
								<span class="rightSapn">조회수 : ${board.resellBoard_viewCnt}</span></div></td>
								<td class="tdTotolStyle"><div><span>${board.resellBoard_postDate}</span><span class="rightSapn">${board.resellBoard_price}원</span></div></td>
								</tr>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							</tbody>
						</table>	

	
			<!--  
				<div class="text-center">
				     <ul class="pagination"style="text-align: center;">
	      
	              <c:if test="${pagingParam.prev }">
	                  <li class="page-item">
	                     <a class="page-link" href="list?page=${pagingParam.cri.page -1 }">prev</a>
	                  </li>
	               </c:if>
					
	                  <c:forEach begin="${pagingParam.startPage}" end="${pagingParam.endPage }" var="pageNo">
		
		                     <li class="page-item">
	                     	<a class="page-link" href="list?page=${pageNo}">${pageNo}</a>
	                     </li>
						
	                  </c:forEach>
	              
	               <c:if test="${pagingParam.next }">
	                  <li class="page-item">
	                     <a class="page-link" href="list?page=${pagingParam.cri.page+ 1 }">next</a>
	                  </li>
	               </c:if>
	
	                </ul>
            </div>
            -->
			
			</div>
		</div>
		
		
	</div>
	<!-- /Main -->

    <%@include file="../../cambak21Footer.jsp"%>
	
</body>

</html>