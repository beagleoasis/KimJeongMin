<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<aside class="left-sidebar" data-sidebarbg="skin5" style="padding-top: 0px;">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- 사이드바 카테고리 -->
        <nav class="sidebar-nav">
            <ul id="sidebarnav" class="p-t-30">
                <li class="sidebar-item" style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
                	<span style="font-size: 28px; font-weight: bold; font-family: 'Lobster', cursive; color: #fff;">Cambak's Admin</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/index/main/" aria-expanded="false">
                        <i class="mdi mdi-chart-bubble"></i>
                        <span class="hide-menu">캠박이일로 이동</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/mall/main/" aria-expanded="false">
                        <i class="mdi mdi-chart-bubble"></i>
                        <span class="hide-menu">캠박몰로 이동</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../admin/memberList" aria-expanded="false">
                        <i class="mdi mdi-chart-bubble"></i>
                        <span class="hide-menu">회원 관리</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/orderManagement?page=1" aria-expanded="false">
                        <i class="mdi mdi-chart-bubble"></i>
                        <span class="hide-menu">주문 목록</span>
                    </a>
                </li>
                <li class="sidebar-item">

                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/board_admin" aria-expanded="false">
                        <i class="mdi mdi-chart-bubble"></i>
                        <span class="hide-menu">캠박이일 게시판 (종진)</span>

                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                        <i class="mdi mdi-view-dashboard"></i>
                        <span class="hide-menu"> 상품관리</span>
                    </a>
                    <ul aria-expanded="false" class="collapse  first-level">
                        <li class="sidebar-item">
                            <a href="/admin/prodList?page=1" class="sidebar-link">
                                <i class="mdi mdi-view-dashboard"></i>
                                <span class="hide-menu"> 상품목록 </span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="../admin/prodRegister" class="sidebar-link">
                                <i class="mdi mdi-multiplication-box"></i>
                                <span class="hide-menu"> 상품등록 </span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="../admin/QA" aria-expanded="false">
                        <i class="mdi mdi-chart-bubble"></i>
                        <span class="hide-menu">상품 리뷰 및 Q&A</span>
                    </a>
                </li>
                <li class="sidebar-item">
                	<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
	                	<i class="mdi mdi-chart-bar"></i>
	                	<span class="hide-menu">매출</span>
                	</a>
                    <ul aria-expanded="false" class="collapse  first-level">
                        <li class="sidebar-item">
	                        <a href="revenue" class="sidebar-link">
		                        <i class="mdi mdi-bulletin-board"></i>
		                        <span class="hide-menu"> 매출분석 </span>
	                        </a>
                        </li>
                        <li class="sidebar-item">
                        	<a href="productAnalysis" class="sidebar-link">
                        		<i class="mdi mdi-message-outline"></i>
                        		<span class="hide-menu"> 상품분석 </span>
                        	</a>
                        </li>
                    </ul>
                </li>
<!--                 <li class="sidebar-item"> -->
<!--                 	<a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/chattingList" aria-expanded="false"> -->
<!--                 		<i class="mdi mdi-chart-bubble"></i> -->
<!--                 		<span class="hide-menu">채팅 관리</span> -->
<!--                 	</a> -->
<!--                 </li> -->
				<li class="sidebar-item">
                	<a class="sidebar-link waves-effect waves-dark sidebar-link" href="/user/logout" aria-expanded="false">
                		<i class="mdi mdi-chart-bubble"></i>
                		<span class="hide-menu">로그아웃</span>
                	</a>
                </li>
            </ul>
        </nav>
        <!-- 사이드바 카테고리 끝 -->
    </div>
    <!-- End Sidebar scroll-->
</aside>