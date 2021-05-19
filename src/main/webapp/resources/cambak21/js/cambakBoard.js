/**
 * 캠박이일 게시판 jsp에서 공통적으로 사용될 코드
 */

  // 게시판 uri 접속 시 board/ 뒤에 오는 게시판이름 가져오는 기능
   function searchUriAddress() {
       var url = location.href; //url주소
       var params = url.slice(url.indexOf("board") + 6, url.length).split("/"); // board/ 뒤부터 "/"로 잘라서 배열에 넣기
      return params[0]; // board/OO/??/??  OO만 반환
   }
   
   // 전달받은 boardUri 변수로 사이드바 색깔 변경해주는 기능
   function asideBarDraw(boardUri) {
       $("#" + boardUri + "Aside").attr("class", "nowSideBar");
   }

