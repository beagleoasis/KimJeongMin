<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Tweet -->
    <div id="tweet">
        <div class="container">
            <section>
                <blockquote>
                    &ldquo;진정한 여행은 새로운 풍경을 보러가는 것이 아니라, <br />세상을 바라보는 또 하나의 눈을 얻어오는
                    것이다.&rdquo;
                </blockquote>
            </section>
        </div>
    </div>
    <!-- /Tweet -->

    <!-- Footer -->
    <footer class="text-center" id="footerSide">
        <div id="contact" class="container" style="margin-top: 10px; height: 321px; padding: 0% 120px; width: 1170px;">
            <h3 class="text-center" id="footerTitle">Cambark's Info</h3>
            <div class="row" class="footerBottom">
                <div class="col-md-2" id="footerSubheading">
                    <p>계절별 캠핑장</p>
                </div>
                <div class="col-md-2" id="footerSubheading">
                    <p>캠박게시판</p>
                </div>
                <div class="col-md-2" id="footerSubheading">
                    <p>캠박몰</p>
                </div>
                <div class="col-md-2" id="footerSubheading">
                    <p>고객센터</p>
                </div>
                <div class="col-md-2" id="footerSubheading">
                    <p>캠박이일 제작 1팀</p>
                </div>
                <div class="col-md-2" id="footerSubheading">
                    <p>캠박이일 제작 2팀</p>
                </div>
                <div class="col-md-2" id="footerContent">
                    <p><a href="/index/result?keyword=봄">봄</a></p>
                    <p><a href="/index/result?keyword=여름">여름</a></p>
                    <p><a href="/index/result?keyword=가을">가을</a></p>
                    <p><a href="/index/result?keyword=겨울">겨울</a></p>
                </div>
                <div class="col-md-2" id="footerContent">
                    <p><a href="/board/campingTip/list?page=1">캠핑Tip 게시판</a></p>
                    <p><a href="/board/qa/list.bo?7page=1">Q&amp;A 게시판</a></p>
                </div>
                <div class="col-md-2" id="footerContent">
                    <p><a href="/mall/main">메인페이지</a></p>
                    <p><a href="/mall/categories">전체상품</a></p>
                    <p><a>이용약관</a></p>
                    <p><a>개인정보 처리방침</a></p>
                    <p><a>제휴마케팅</a></p>
                    <p><a>광고안내</a></p>
                </div>
                <div class="col-md-2" id="footerContent">
                    <p><a href="/board/notice/listCri?page=1">공지사항</a></p>
                    <p><a href="/board/cs/list?page=1">고객센터</a></p>
                </div>
                <div class="col-md-2" id="footerContent">
                    <p>김대기</p>
                    <p>장원영</p>
                    <p>이영광</p>
                    <p>김도연</p>
                    <p>김태훈</p>
                </div>
                <div class="col-md-2" id="footerContent">
                    <p>박종진</p>
                    <p>김정민</p>
                    <p>서효원</p>
                    <p>백승권</p>
                </div>
            </div>
            <!-- 위로 가기 버튼-->
            <a href="#" class="top"><img
                src="/resources/cambak21/images/top.png" class="topMove"></a>
            <!-- 위로 가기 버튼-->
        </div>
    </footer>
    <!-- /Footer -->
    <%@include file="cambak21checkList.jsp"%>