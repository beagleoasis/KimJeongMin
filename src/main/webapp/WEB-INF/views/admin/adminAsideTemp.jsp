<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<aside class="left-sidebar" data-sidebarbg="skin5">
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<!-- 사이드바 카테고리 -->
			<nav class="sidebar-nav">
				<ul id="sidebarnav" class="p-t-30">
<!-- 					<li class="sidebar-item"><a -->
<!-- 						class="sidebar-link waves-effect waves-dark sidebar-link" -->
<!-- 						href="index.html" aria-expanded="false"><i -->
<!-- 							class="mdi mdi-view-dashboard"></i><span class="hide-menu">Dashboard</span></a></li> -->
<!-- 					<li class="sidebar-item"><a -->
<!-- 						class="sidebar-link waves-effect waves-dark sidebar-link" -->
<!-- 						href="charts.html" aria-expanded="false"><i -->
<!-- 							class="mdi mdi-chart-bar"></i><span class="hide-menu">Charts</span></a></li> -->
<!-- 					<li class="sidebar-item"><a -->
<!-- 						class="sidebar-link waves-effect waves-dark sidebar-link" -->
<!-- 						href="widgets.html" aria-expanded="false"><i -->
<!-- 							class="mdi mdi-chart-bubble"></i><span class="hide-menu">Widgets</span></a></li> -->
<!-- 					<li class="sidebar-item"><a -->
<!-- 						class="sidebar-link waves-effect waves-dark sidebar-link" -->
<!-- 						href="tables.html" aria-expanded="false"><i -->
<!-- 							class="mdi mdi-border-inside"></i><span class="hide-menu">Tables</span></a></li> -->
<!-- 					<li class="sidebar-item"><a -->
<!-- 						class="sidebar-link waves-effect waves-dark sidebar-link" -->
<!-- 						href="grid.html" aria-expanded="false"><i -->
<!-- 							class="mdi mdi-blur-linear"></i><span class="hide-menu">Full -->
<!-- 								Width</span></a></li> -->
						<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="../admin/memberList" aria-expanded="false"><i
							class="mdi mdi-chart-bubble"></i><span class="hide-menu">회원 관리 (도연)</span></a></li>
						<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="/admin/orderManagement?page=1" aria-expanded="false"><i
							class="mdi mdi-chart-bubble"></i><span class="hide-menu">주문 목록 (효원)</span></a></li>
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="/admin/board_admin" aria-expanded="false"><i
							class="mdi mdi-relative-scale"></i><span class="hide-menu">캠박이일 게시판 (종진)</span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="icon-material.html"
								class="sidebar-link"><i class="mdi mdi-note-outline"></i><span
									class="hide-menu"> 게시판 설정 </span></a></li>
							<li class="sidebar-item"><a href="icon-fontawesome.html"
								class="sidebar-link"><i class="mdi mdi-note-plus"></i><span
									class="hide-menu"> 게시판 관리 </span></a></li>
						</ul></li>
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i
							class="mdi mdi-view-dashboard"></i><span class="hide-menu"> 상품관리 (정민&승권)</span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="/admin/prodList?page=1"
								class="sidebar-link"><i class="mdi mdi-view-dashboard"></i><span
									class="hide-menu"> 상품목록 </span></a></li>
							<li class="sidebar-item"><a href="../admin/prodRegister"
								class="sidebar-link"><i class="mdi mdi-multiplication-box"></i><span
									class="hide-menu"> 상품등록 </span></a></li>
						</ul></li>
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i
							class="mdi mdi-receipt"></i><span class="hide-menu">상품 게시판 (원영)</span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="icon-material.html"
								class="sidebar-link"><i class="mdi mdi-bulletin-board"></i><span
									class="hide-menu"> 리뷰 </span></a></li>
							<li class="sidebar-item"><a href="icon-fontawesome.html"
								class="sidebar-link"><i class="mdi mdi-message-outline"></i><span
									class="hide-menu"> QnA </span></a></li>
						</ul></li>						
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i
							class="mdi mdi-chart-bar"></i><span class="hide-menu">매출 (대기)</span></a>
							<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="revenue"
								class="sidebar-link"><i class="mdi mdi-bulletin-board"></i><span
									class="hide-menu"> 매출분석  </span></a></li>
							<li class="sidebar-item"><a href="productAnalysis"
								class="sidebar-link"><i class="mdi mdi-message-outline"></i><span
									class="hide-menu"> 상품분석 </span></a></li>
						</ul></li>
							<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="/admin/chattingList" aria-expanded="false"><i
							class="mdi mdi-chart-bubble"></i><span class="hide-menu">채팅 관리 (승권)</span></a></li>
<!-- 					<li class="sidebar-item"><a -->
<!-- 						class="sidebar-link has-arrow waves-effect waves-dark" -->
<!-- 						href="javascript:void(0)" aria-expanded="false"><i -->
<!-- 							class="mdi mdi-move-resize-variant"></i><span class="hide-menu">Addons -->
<!-- 						</span></a> -->
<!-- 						<ul aria-expanded="false" class="collapse  first-level"> -->
<!-- 							<li class="sidebar-item"><a href="index2.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-view-dashboard"></i><span -->
<!-- 									class="hide-menu"> Dashboard-2 </span></a></li> -->
<!-- 							<li class="sidebar-item"><a href="pages-gallery.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-multiplication-box"></i><span -->
<!-- 									class="hide-menu"> Gallery </span></a></li> -->
<!-- 							<li class="sidebar-item"><a href="pages-calendar.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-calendar-check"></i><span -->
<!-- 									class="hide-menu"> Calendar </span></a></li> -->
<!-- 							<li class="sidebar-item"><a href="pages-invoice.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-bulletin-board"></i><span -->
<!-- 									class="hide-menu"> Invoice </span></a></li> -->
<!-- 							<li class="sidebar-item"><a href="pages-chat.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-message-outline"></i><span -->
<!-- 									class="hide-menu"> Chat Option </span></a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li class="sidebar-item"><a -->
<!-- 						class="sidebar-link has-arrow waves-effect waves-dark" -->
<!-- 						href="javascript:void(0)" aria-expanded="false"><i -->
<!-- 							class="mdi mdi-account-key"></i><span class="hide-menu">Authentication -->
<!-- 						</span></a> -->
<!-- 						<ul aria-expanded="false" class="collapse  first-level"> -->
<!-- 							<li class="sidebar-item"><a href="authentication-login.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-all-inclusive"></i><span -->
<!-- 									class="hide-menu"> Login </span></a></li> -->
<!-- 							<li class="sidebar-item"><a -->
<!-- 								href="authentication-register.html" class="sidebar-link"><i -->
<!-- 									class="mdi mdi-all-inclusive"></i><span class="hide-menu"> -->
<!-- 										Register </span></a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li class="sidebar-item"><a -->
<!-- 						class="sidebar-link has-arrow waves-effect waves-dark" -->
<!-- 						href="javascript:void(0)" aria-expanded="false"><i -->
<!-- 							class="mdi mdi-alert"></i><span class="hide-menu">Errors </span></a> -->
<!-- 						<ul aria-expanded="false" class="collapse  first-level"> -->
<!-- 							<li class="sidebar-item"><a href="error-403.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span -->
<!-- 									class="hide-menu"> Error 403 </span></a></li> -->
<!-- 							<li class="sidebar-item"><a href="error-404.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span -->
<!-- 									class="hide-menu"> Error 404 </span></a></li> -->
<!-- 							<li class="sidebar-item"><a href="error-405.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span -->
<!-- 									class="hide-menu"> Error 405 </span></a></li> -->
<!-- 							<li class="sidebar-item"><a href="error-500.html" -->
<!-- 								class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span -->
<!-- 									class="hide-menu"> Error 500 </span></a></li> -->
<!-- 						</ul></li> -->
				</ul>
			</nav>
			<!-- 사이드바 카테고리 끝 -->
		</div>
		<!-- End Sidebar scroll-->
	</aside>