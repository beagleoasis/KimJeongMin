<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Section Begin -->
<header class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-2 col-lg-2">
                <div class="header__logo" style="text-align: center; padding: 4px 0px; ">
                    <a href="/mall/main/" style="font-size: 19px; color: black; font-weight: bold; font-family: 'Pacifico', cursive;">CambakMall</a><hr style="margin:11px 0px;">
                    <a href="/index/main/" style="font-size: 19px; color: black; font-weight: bold; font-family: 'Pacifico', cursive;">Cambark's </a>
                </div>
            </div>
            <div class="col-xl-7 col-lg-7">
                <nav class="header__menu">
                    <ul>
                        <li><a href="/mall/categories?mainCategory_id=1&middleCategory_id=1">텐트/타프</a>
                          <ul class="dropdown">
                                <li><a href="/mall/categories?mainCategory_id=1&middleCategory_id=1">텐트</a></li>
                                <li><a href="/mall/categories?mainCategory_id=1&middleCategory_id=2">타프</a></li>
                            </ul></li>
                        <li><a href="/mall/categories?mainCategory_id=2&middleCategory_id=1">침낭/매트</a>
                           <ul class="dropdown">
                                <li><a href="/mall/categories?mainCategory_id=2&middleCategory_id=1">침낭</a>
                                <li><a href="/mall/categories?mainCategory_id=2&middleCategory_id=2">매트</a></li>
                            </ul></li>
                        <li><a href="/mall/categories?mainCategory_id=3&middleCategory_id=1">테이블/체어/배트</a>
                         <ul class="dropdown">
                                <li><a href="/mall/categories?mainCategory_id=3&middleCategory_id=1">경랑 테이블</a></li>
                                <li><a href="/mall/categories?mainCategory_id=3&middleCategory_id=2">체어</a></li>
                            </ul></li>
                        <li><a href="/mall/categories?mainCategory_id=4&middleCategory_id=1">랜턴</a></li>
                        <li><a href="/mall/categories?mainCategory_id=5&middleCategory_id=1">액세서리</a>
                           <ul class="dropdown">
                                <li><a href="/mall/categories?mainCategory_id=5&middleCategory_id=1">담요</a></li>
                                <li><a href="/mall/categories?mainCategory_id=5&middleCategory_id=2">쿨러/아이스박스</a></li>
                            </ul></li>
                        <li><a href="/mall/categories?mainCategory_id=6&middleCategory_id=1">화로/히터</a>
                           <ul class="dropdown">
                                <li><a href="/mall/categories?mainCategory_id=6&middleCategory_id=1">착화재</a></li>
                                <li><a href="/mall/categories?mainCategory_id=6&middleCategory_id=2">화로대</a></li>
                            </ul></li>
                        <li><a href="/mall/categories?mainCategory_id=7&middleCategory_id=1">수납/케이스</a></li>
                        <li><a href="/mall/categories?mainCategory_id=8&middleCategory_id=1">키친/취사용품</a>
                       <ul class="dropdown">
                            <li><a href="/mall/categories?mainCategory_id=8&middleCategory_id=1">식기/일반</a></li>
                            <li><a href="/mall/categories?mainCategory_id=8&middleCategory_id=2">설거지용품</a></li>
                            <li><a href="/mall/categories?mainCategory_id=8&middleCategory_id=3">버너</a></li>
                        </ul></li>
                        <li><a href="/mall/categories?mainCategory_id=9&middleCategory_id=1">기타</a></li>
         		    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__right">
                	<c:if test="${loginMember == null}">
	                    <form action="/mall/search" class="searchForm" id="searchForm" onkeyup="formSearchBtn();" onsubmit="return false;">
	                    	<span id="searchArea">
	                    		<input type="text" class="searhcInput" id="keyword" name="keyword" autocomplete="off"/>
	                    		<input type="hidden" name="page" value="1" />
	                    	</span>
	                    </form>
	                    <ul class="header__right__widget">
	                        <li style="margin-right: 10px;"><a id="searchIcon" onclick="viewSearchForm();"><img src="../../resources/mallMain/img/default/mallSearch.png" class="searchIconBtn"></a></li>
	                        <li style="margin-right: 20px;"><a href="/mall/cart"><img src="../../resources/mallMain/img/default/shoppingCart.png" style="height: 22px;"></a></li>
	                    </ul>
	                    <div class="header__right__auth">
	                        <a id="userLogin" style="cursor: pointer;">로그인</a>
	                        <a href="/user/register">회원가입</a>
	                    </div>
                    </c:if>
                	<c:if test="${loginMember.member_isAdmin == 'N'}">
	                    <form action="/mall/search" class="searchForm" id="searchForm" onkeyup="formSearchBtn();" onsubmit="return false;">
	                    	<span id="searchArea">
	                    		<input type="text" class="searhcInput" id="keyword" name="keyword" autocomplete="off"/>
	                    		<input type="hidden" name="page" value="1" />
	                    	</span>
	                    </form>
	                    <ul class="header__right__widget">
	                        <li style="margin-right: 10px;"><a id="searchIcon" onclick="viewSearchForm();"><img src="../../resources/mallMain/img/default/mallSearch.png" class="searchIconBtn"></a></li>
	                        <li style="margin-right: 20px;"><a href="/mall/cart"><img src="../../resources/mallMain/img/default/shoppingCart.png" style="height: 22px;"></a></li>
	                    </ul>
	                    <div class="header__right__auth">
	                        <a href="/user/logout">로그아웃</a>
	                        <a href="/myPage/myPost">마이페이지</a>
	                    </div>
                    </c:if>
                    <c:if test="${loginMember.member_isAdmin == 'Y'}">
	                    <form action="/mall/search" class="searchForm" id="searchForm" onkeyup="formSearchBtn();" onsubmit="return false;">
	                    	<span id="searchArea">
	                    		<input type="text" class="searhcInput" id="keyword" name="keyword" autocomplete="off"/>
	                    		<input type="hidden" name="page" value="1" />
	                    	</span>
	                    </form>
	                    <ul class="header__right__widget">
	                        <li style="margin-right: 10px;"><a id="searchIcon" onclick="viewSearchForm();"><img src="../../resources/mallMain/img/default/mallSearch.png" class="searchIconBtn"></a></li>
	                        <li style="margin-right: 20px;"><a href="/mall/cart"><img src="../../resources/mallMain/img/default/shoppingCart.png" style="height: 22px;"></a></li>
	                    </ul>
	                    <div class="header__right__auth">
	                        <a href="/user/logout">로그아웃</a>
	                        <a href="/admin/productAnalysis">관리자페이지</a>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="canvas__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<div class="container">

  <!-- Modal -->
  <div class="modal fade" id="loginModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 81px;">
          <h4 class="modalTitle"><span class="glyphicon glyphicon-lock"></span>캠박몰 / 캠박이일 통합 로그인</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
            <div class="form-group">
              <input type="text" class="form-control" id="member_id" placeholder="아이디" style="font-size: 14px;" onkeyup="loginEnter();">
            </div>
            <div class="form-group">
              <input type="password" class="form-control" id="member_password" placeholder="비밀번호" style="font-size: 14px;" onkeyup="loginEnter();">
            </div>
            <div class="checkbox" style="margin-bottom: 5px; font-size: 13px;">
              <span><a href="/user/find_idPwd" style="color: #8e8e8e; float: right; padding-bottom: 10px;">아이디 / 비밀번호 찾기</a></span>
            </div>
              <button type="button" class="btn btn-basic btn-block" style="border: 1px solid #b3bcc5;" onclick="loginRequestCheck();"><span class="glyphicon glyphicon-off"></span> 로그인</button>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" style="background: #b3bcc5; border: 1px solid #b3bcc5;"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
      
    </div>
  </div> 
</div>
 
<script>
$(document).ready(function(){
  $("#userLogin").click(function(){
    $("#loginModal").modal();
  });
  searchSiteControll(); // 사이트 헤더에 있는 검색 창 열고 닫기 css 변경
});

//캠박몰 로그인 아이디 비밀번호 입력 후 엔터 누를 시 작동
function loginEnter() {
	
	if (window.event.keyCode == 13) {
		let member_id = $("#member_id").val();
		let member_password = $("#member_password").val();
		
		if (member_id == "" || member_password == "") {
			alert("아이디/비밀번호를 작성바랍니다.");
			return;
		} else {
			loginRequestCheck();
		}
	}
	
}

//캠박몰 로그인
function loginRequestCheck() {
	let member_id = $("#member_id").val();
	let member_password = $("#member_password").val();
	console.log(member_id);
	if (member_id == "" || member_password == "") {
		alert("아이디/비밀번호를 작성바랍니다.");
		return;
	}
	
	$.ajax({
		  method: "POST",
		  url: "/user/loginCheck",
		  dataType: "text",
		  data : {member_id : member_id, member_password : member_password},
		  success : function(data) {
			  if (data == "memberCheck") {
					$.ajax({
						  method: "POST",
						  url: "/user/login",
						  dataType: "text",
						  data : {member_id : member_id, member_password : member_password}
						});
					location.reload();
			  } else {
				  alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다");
			  }
		  }, error : function(data) {
			  alert(data);
        }
		  
		});
	
}
</script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bungee&family=Pacifico&display=swap" rel="stylesheet">
<!-- Header Section End --> 