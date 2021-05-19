<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<!-- 	<div class="profile"> -->
	<!-- 		<div> -->
	<!-- 			<div class="profileSize"> -->
	<!-- 				<a href=></a><img src="img/profileDefualt.png" -->
	<!-- 					class="userProfileImg"></a> -->
	<!-- 				<h4>서효원</h4> -->
	<!-- 				<div class="profileEmail">hyoniki@gmail.com</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="profileCategory"> -->
	<!-- 				<ul> -->
	<!-- 					<li class="profileMenu1"><a href="SHW_accountInfo.html" -->
	<!-- 						class="profileMenu">회원 정보 수정</a></li> -->
	<!-- 					<li class="profileMenu2"><a href="#" class="profileMenu">캠핑장 -->
	<!-- 							찜 리스트</a></li> -->
	<!-- 					<li class="profileMenu2"><a href="#" class="profileMenu">좋아요 -->
	<!-- 							표시한 게시글</a></li> -->
	<!-- 				</ul> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->



	<!-- Sidebar -->
	<div id="sidebar" class="4u">
      <div class="sidebar">
         <div class="panel panel-success">
            <div class="panel-heading">
               <p class="category-title" style="margin-bottom: 0px;">Category</p>
            </div>
         </div>
         <ul class="nav nav-pills nav-stacked">
            <li id="qaAside"><a href="/board/qa/list?page=1">Q&amp;A 게시판</a></li>
            <li id="campingTipAside"><a href="/board/campingTip/list?page=1">캠핑 Tip 게시판</a></li>
            <li id="noticeAside"><a href="/board/notice/listCri?page=1">공지사항</a></li>
            <li id="csAside"><a href="/board/cs/list?page=1">고객센터</a></li>
         </ul>
      </div>
   </div>


</div>