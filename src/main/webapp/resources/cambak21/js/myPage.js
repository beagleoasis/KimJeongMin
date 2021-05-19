/**
 * 캠박이일 마이페이지 jsp에서 공통적으로 사용될 코드
 */

// 마이페이지 uri 접속 시 myPage/ 뒤에 오는 게시판이름 가져오는 기능
function searchMyPageUriAddress() {
    var url = location.href; //url주소
    var params = url.slice(url.indexOf("myPage") + 6, url.length).split("/"); // board/ 뒤부터 "/"로 잘라서 배열에 넣기
   return params[1]; // board/OO/??/??  OO만 반환
}

// 마이페이지 uri 접속 시 myPage/ 뒤에 오는 게시판이름 가져오는 기능
function myMallAddress() {
    var url = location.href; //url주소
    var params = url.slice(url.indexOf("myMall") + 6, url.length).split("/"); // board/ 뒤부터 "/"로 잘라서 배열에 넣기
   return params[1]; // board/OO/??/??  OO만 반환
}

// 전달받은 마이페이지Uri 변수로 사이드바 색깔 변경해주는 기능
function myPageAsideBarDraw(myPageUri) {
    $("#" + myPageUri + "Aside").attr("class", "active");
}




