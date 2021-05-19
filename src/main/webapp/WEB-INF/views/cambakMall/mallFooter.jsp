<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>

<meta charset="UTF-8">
 
 <script>
 
// *********************** 종진 수정 부분 **************************//   
if($(location).attr("href") != "http://localhost:8081/userChatting") { // 승권 : 채팅창에서 띄우기 위해 코드 추가했습니다 !
 $(window).on("scroll", function(){
   if($(window).scrollTop() > 500){
      $(".top").css("display","block");
//       $("#main-sidebar").css("display","block");
//       $(".radios").css("display","block");
   }else{
      $(".top").css("display","none");
//       $("#main-sidebar").css("display","none");
//       $(".radios").css("display","none");
   } 
     
 });
}
 
 $(function(){
   
    getRecentlyProduct();
    
//     if(${loginMember.member_id != null}){
//        console.log("접속한 유저가 있다");
//        getChkListYet();    
//     }   
    
 });
 
 function getRecentlyProduct(){
      let ChangeWon = /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g;
      let recentlyOutput = "";   
    $.getJSON("/mall/main/getRecentlyProduct", function(data){
      
   
         $("#RecentlySection").html("");
           isdata = data.length;
           console.log(isdata + "is data는");
            $(data).each(function(index, item){
               let prevPrice = String(this.product_sellPrice);
            
               let changeSellPrice = prevPrice.replace(ChangeWon, ",");
            
               
            recentlyOutput += '<li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px; cursor: pointer;" onclick="location.href=\'/mall/prodDetail/main?prodId=' + this.product_id + '\'" src="' + this.product_img1 + '"/><span class="recentlyItemJJ" ><a href="/mall/prodDetail/main?prodId=' + this.product_id + '">' + this.product_name + '</a><br/>' + changeSellPrice + '</span></li>';
      
            });
         recentlyOutput += '</ul>';
         $("#RecentlySection").html(recentlyOutput);
         $("#recentlyCntOutput").text(isdata);
    });
    
   
 
 }
 
 
 // ///////////////////////////////////////// 승권 채팅 ///////////////////////
 function goChatting() {
   if("${loginMember}" == "") {
      $("#modalText").text("로그인 후에 이용해 주세요");
      $("#bbsk-modal").modal();
   } else {
      location.href="../../mall/userChatting";
   }
}
 
 // //////////////////////////////////////////////////////////////////////////
 
      
   
//  function getChkListYet(){
//        let member_id = "${loginMember.member_id}";
//        console.log(member_id);
//       $.ajax({
//          method: "get",
//          url: "/mall/main/getChkListYet",
//          dataType: "text", // 응답 받는 데이터 타입
//          data : {"member_id" : member_id
//          },
//          success : function(result){
               
//                $("#CheckListCnt").html("체크리스트 (" + result + ")개");
            
//          }
//       });
   
//  }
 
 
//     function viewCheckList(){
       
//        console.log($("#chklistIframe").css("display"));
//             if($("#chklistIframe").css("display") == "none"){
//                 console.log("체크리스트 열리기");
//                 $("#chklistIframe").css("display","block");
//                 $("#CheckListCnt").html("체크리스트 닫기");
//                 $(".radios").css("background-color","greenyellow");
         
//             }else{
//                 $("#chklistIframe").css("display","none");
//                console.log("체크리스트 닫히기");
//                getChkListYet();
//                 $(".radios").css("background-color","#fff");
//             } 
//        }
 
 
 
 
// *********************** 종진 수정 부분 **************************//   
 </script>
 
 
 <style>
 /* *********************** 종진 수정 부분 ************************** */   
 .top{
    left: 90%;
    width: 40px;
    position: fixed;
    bottom: 80px;
    display: none;
    cursor: pointer;
 }
 
 #main-sidebar{
    left: 88%;
    width: 110px;
    position: fixed;
    top: 150px;
    z-index: 999999;
/*     display: none; */
 
 }
 
 .recently-viewed-products, .side-cart{
    background-color: indigo;
    padding: 7px;
    font-size: 13px;
 }
 
  #main-sidebar strong{
      color:white;
 }

  #main-sidebar em{
      color:YELLOW;
 }


 .recently-viewed-page{
    
    border: solid 1px darkgray;
    font-size: 12px;
    display: block;
    font-weight: bold;
    list-style: none;
    min-height: 450px;
 }
 
 .no-item{
 text-align: center;
 padding: 150px 0px 0px;
 
 }
 
 .recently-item{
 padding: 3px;
 text-align: center;
 margin-top: 15px;
 }
 
 .radios{
    left: 77%;
    bottom: 75px;
    width: 165px;
   display: inline-block;
    position: fixed;
    right: 13px;
    height: 50px;
    padding: 0 20px 0 20px;
    border-radius: 25px;
    border: 1px solid #555;
    background-color: #fff;
    -webkit-box-shadow: 0 5px 14px 0 rgb(0 0 0 / 10%);
    box-shadow: 0 5px 14px 0 rgb(0 0 0 / 10%);
    font-size: 14px;
    line-height: 48px;
    letter-spacing: -.3px;
    color: #333;
    -webkit-transition: right .4s;
    transition: right .4s;
    z-index: 10;
    display:none;
    
 }

 
 
  .recentlyItemJJ a:hover{ 
    text-decoration: underline; 
 } 
 
 
 
 
/* *********************** 종진 수정 부분 ************************** */
 
 </style>
 
</head>

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
<!--             <div class="col-lg-4 col-md-6 col-sm-7"> -->
<!--                 <div class="footer__about"> -->
<!--                     <div class="footer__logo"> -->
<!--                         <a href="#" style="font-size: 38px;color: black;font-weight: bold;">캠박몰</a> -->
<!--                     </div> -->
<!--                     <p>김도연, 장원영, 김대기, 김정민, 이영광, 서효원, 백승권, 김태훈, 박종진</p> -->
              
<!--                 </div> -->
<!--             </div> -->
            <div style="margin:0px -17px 0px 0px;" class="col-lg-2 col-md-3 col-sm-1">
                <div class="footer__widget">
                    <h6>김도연</h6>
                    <ul>
                        <li><a href="/find_idPwd">ID/Password 찾기</a></li>
                        <li><a href="/index/result?keyword=봄">캠핑장 검색 결과</a></li>
                        <li><a href="/mall/prodDetail/main?prodId=400">상품 상세</a></li>
                        <li><a href="/mall/prodDetail/main?prodId=400">상품 문의</a></li>
                        <li><a href="/admin/memberList">관리자(회원관리)</a></li>
                    </ul>
                </div>
            </div>
            <div style="margin:0px -17px;" class="col-lg-2 col-md-3 col-sm-2">
                <div class="footer__widget">
                    <h6>백승권</h6>
                    <ul>
                    	<li><a href="/board/cs/list">고객센터</a></li>
                        <li><a href="/mall/cart">회원 장바구니</a></li>
                        <li><a href="/myPage/myLike">마이-좋아요</a></li>
                        <li><a href="/myMall/myQnA">마이-상품 문의</a></li>
                        <li><a href="/admin/prodRegister">상품등록 및 수정</a></li>
                    </ul>
                </div>
            </div>
            <div style="margin:0px -17px;" class="col-lg-2 col-md-3 col-sm-3">
                <div class="footer__widget">
                    <h6>서효원</h6>
                    <ul>
                        <li><a href="/user/register">회원가입</a></li>
                        <li><a href="/user/pwdCheck">회원정보수정</a></li>
                        <li><a href="/board/campingTip/list?page=1">캡핑팁 게시판</a></li>
                        <li><a href="/myPage/myReply">내가 작성한 댓글</a></li>
                        <li><a href="/mall/categories">상품 리스트</a></li>
                        <li><a href="/admin/orderManagement?page=1">관리자-주문목록</a></li>
                    </ul>
                </div>
            </div>
            <div style="margin:0px -17px;" class="col-lg-2 col-md-3 col-sm-4">
                <div class="footer__widget">
                    <h6>김대기</h6>
                    <ul>
                        <li><a href="/user/resign">회원 탈퇴</a></li>
                        <li><a href="/myMall/myOrder">구매 확정</a></li>
                        <li><a href="/myMall/myRefund">상품환불 교환</a></li>
                        <li><a href="/board/cs/list">고객센터 게시판</a></li>
                        <li><a href="/admin/productAnalysis">관리자-매출관리</a></li>
                    </ul>
                </div>
            </div>
            <div style="margin:0px -17px;" class="col-lg-2 col-md-3 col-sm-5">
                <div class="footer__widget">
                    <h6>장원영</h6>
                    <ul>
                        <li><a href="/user/logout">로그인/로그아웃</a></li>
                        <li><a href="/board/qa/list">Q&A 게시판</a></li>
                        <li><a href="/mall/prodOrder">상품 주문</a></li>
                        <li><a href="/mall/orderFin">주문 결과</a></li>
                        <li><a href="/admin/QA">관리자-QA&리뷰</a></li>
                    </ul>
                </div>
            </div>
            <div style="margin:0px -17px;" class="col-lg-2 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>김정민</h6>
                    <ul>
                        <li><a href="/index/detail?contentId=9">캠핑장 상세</a></li>
                        <li><a href="/mall/prodDetail/main?prodId=400">상품후기 게시판</a></li>
                        <li><a href="/myPage/myPost">마이-내가쓴글</a></li>
                        <li><a href="/myMall/myPoint">마이-포인트</a></li>
                        <li><a href="/admin/prodList">관리자-상품게시판</a></li>
                    </ul>
                </div>
            </div>
            <div style="margin:0px 0px 0px -17px;" class="col-lg-2 col-md-3 col-sm-7">
                <div class="footer__widget">
                    <h6>박종진</h6>
                    <ul>
                        <li><a href="/mall/main/">캠박몰 메인</a></li>
                        <li><a href="/admin/board_admin">관리자-게시판관리</a></li>
                        <li><a href="/mall/main/">최근 본 상품</a></li>
                        <li><a href="/mall/destinationsList">배송지 관리</a></li>
                        <li><a href="/board/notice/listCri">공지사항 게시판</a></li>
                        <li><a href="/index/main">체크리스트</a></li>
                    </ul>
                </div>
            </div>
      </div>
      
      
      
      <section id="main-sidebar">
               <div class="recently-viewed-products" >
                  <strong>최근본상품</strong>
                  <em class="total-element" id="recentlyCntOutput"> 0 </em>
              </div>
              <div class="recently-viewed-list">
                  <ul class="recently-viewed-page" id="RecentlySection" style="display: block;">
<%--                   <c:if test="${para.viewRecently0 == null }"> --%>
                   <li class="no-item">최근본 상품이<br>없습니다.</li>
<%--                 </c:if> --%>
                
<%--                 <c:if test="${para.viewRecently0 != null }"> --%>
<%--                    <a href="/mall/prodDetail/main?prodId=${para.viewRecently0.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently0.product_img1 }"/><span>${para.viewRecently0.product_name }<br/><fmt:formatNumber value="${para.viewRecently0.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%--                 </c:if> --%>
<%--                 <c:if test="${para.viewRecently1 != null }"> --%>
<%--                    <a href="/mall/prodDetail/main?prodId=${para.viewRecently1.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently1.product_img1 }"/><span>${para.viewRecently1.product_name }<br/><fmt:formatNumber value="${para.viewRecently1.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%--                 </c:if> --%>
<%--                 <c:if test="${para.viewRecently2 != null }"> --%>
<%--                    <a href="/mall/prodDetail/main?prodId=${para.viewRecently2.product_id }"><li class="recently-item"><img style=" width: 100px; height: 75px; border: solid 1px darkgray; padding: 1px;" src="/resources/img/${para.viewRecently2.product_img1 }"/><span>${para.viewRecently2.product_name }<br/><fmt:formatNumber value="${para.viewRecently2.product_sellPrice }" pattern="#,###원" /></span></li></a> --%>
<%--                 </c:if> --%>
                       
<!--                </ul> -->
                 
           </div>
          </section>
     
<!--         <div class="radios" id="checkListCntContainer" style="cursor:pointer;" onclick="viewCheckList();"> -->
<!--            <div id="chklistIframe"  style=" position: fixed; display:none; left:29%; top:20%; width:600px; height: -webkit-fill-available; overflow:hidden; max-height: 747px;"> -->
           
<!--            <iframe style="border: none; width: 100%;height:-webkit-fill-available; "src="../../../myPage/checkList"></iframe> -->
           
<!--            </div> -->
<!--            <span id="CheckListCnt" style="margin-left: 15px; ">체크리스트(회원 전용)</span> -->
<!--         </div> -->
     
     
     
        <a onclick="window.scrollTo(0,0);" id="sideTop" class="top" title="맨 위로 가기" >
      <img src="/resources/img/pageUp.png" />
      </a>
      <!-- --------------------------승권 채팅 버튼------------------------ -->
<!--       <a class="top" title="채팅 하러 가기" style="margin-left: 50px" onclick="goChatting()" id="btnGoChatting"> -->
<!--       <img src="/resources/img/chatting.png" /> -->
<!--       </a> -->
      <!-- ----------------------------------------------------------- -->

        <div class="row">

            <div class="col-lg-12">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <div class="footer__copyright__text">
                    <p>Copyright © <script>document.write(new Date().getFullYear());</script>2021 All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                </div>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </div>
        
    </div>
    
    <!-- modal 승권 -->
   <div id="bbsk-modal" class="modal fade" role="dialog">
      <div class="modal-dialog modal-sm">
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" id="modalText"></div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='/user/login/yet'">로그인 하러 가기</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
         </div>

      </div>
   </div>
</footer>
<!-- Footer Section End -->