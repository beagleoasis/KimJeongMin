<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Cambark's Q&A</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900'
	rel='stylesheet' type='text/css'>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/cambak21/js/skel.min.js"></script>
<script src="/resources/cambak/21js/skel-panels.min.js"></script>
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

<link rel="stylesheet" href="/resources/cambak21/css/style.css" />
<link rel="stylesheet" href="/resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script>
<style>
@import url(/resources/cambak21/css/SHWtamplet.css);
</style>

<script>
	$(document).ready(function() {
		// 글 제한
		textLimit();
		
		// 공지사항
		rolling();
		
		// 댓글
		replyList();
		
		// 글 작성 완료
		statusOk();
		
		// 사이드바 현재 카테고리 표시
		asideBarDraw(searchUriAddress());
		
		// 좋아요 체크 확인
		checkLike();
	
	});
	
	// 좋아요 눌렀는지 체크
	function checkLike() {
		if (${loginMember.member_id == null}) {
			$("#boardLike_Btn").html('<button type="button" class="btn btn-default" onclick="likeBtn();">추천 하기</button>');
		} else {
		
		let board_no = ${board.board_no};
		let member_id = "${loginMember.member_id}";
		
		$.ajax({
			type : "post",
			dataType : "json", // 받을 데이터
			//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
			url : "/board/qa/like/check",// 서블릿 주소
			data : {
				board_no : board_no,
				member_id : member_id
			},
			success : function(data) {
				if (data == 1) {
					$("#boardLike_Btn").html('<button type="button" class="btn btn-default" onclick="likeBtn();">추천 취소</button>');
				} else {
					$("#boardLike_Btn").html('<button type="button" class="btn btn-danger" onclick="likeBtn();">추천</button>');
				}
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
		}
	}
	
	// 추천 버튼
	function likeBtn() {
		if (${loginMember.member_id == null}) {
			$("#modalText").text("로그인이 필요한 서비스 입니다");
			$(".modal-footer").html('<a href="/user/login"><button type="button" class="btn btn-default">로그인하러 가기</button></a>');
			$("#myModal").modal();
		} else {
			let board_no = ${board.board_no};
			let member_id = "${loginMember.member_id}";
			
			$.ajax({
				type : "post",
				dataType : "json", // 받을 데이터
				contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
				url : "/board/qa/like",// 서블릿 주소
				data : JSON.stringify({
					board_no : board_no,
					member_id : member_id
				}),
				success : function(data) {
					if(data.status == "on") {
						$("#boardLike_Btn").html('<button type="button" class="btn btn-default" onclick="likeBtn();">추천 취소</button>');
						$(".likeCnt").text(data.cnt);
						$("#modalText").text("추천이 완료 되었습니다");
						$("#myModal").modal();
					} else if (data.status == "off") {
						$("#boardLike_Btn").html('<button type="button" class="btn btn-danger" onclick="likeBtn();">추천</button>');
						$(".likeCnt").text(data.cnt);
						$("#modalText").text("추천이 취소 되었습니다");
						$("#myModal").modal();
					}
				}, // 통신 성공시
				error : function(data) {
				}, // 통신 실패시
				complete : function(data) {
				} // 통신 완료시
			});
		}
	}
	
	// 댓글 리스트 ajax 호출
	function replyList() {
		$.ajax({
			type : "get",
			dataType : "json", // 응답을 어떤 형식으로 받을지	
			url : "/board/qa/reply/all/" + ${board.board_no}, // 서블릿 주소
			success : function(data) {
				// 댓글 갯수 ajax로 가져오기
				$(".replyCnt").text(data.replyCnt);
				listOutput(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 댓글 리스트 출력 함수
	function listOutput(data) {
		let output = "";
		let step = 50;
		
		$.each(data, function(index, item) {
			// step
			if(item.replyBoard_step >= 1) {
				let step = 20 * item.replyBoard_step;
				output += "<li id="+item.replyBoard_no+" style='margin-left:"+step+"px'>";
			} else {
				output += "<li id="+item.replyBoard_no+">";
			}
			
			// 대댓글 이미지
			if(item.replyBoard_refOrder > 0) {
				output += "<div style='display:flex'><img src='/resources/cambak21/img/replyimg.png' width='15px' height='15px'><p class='comment-id'>"+item.member_id+"</p></div>";
			} else {
				output += "<p class='comment-id'>"+item.member_id+"</p>";
			}
			
			// 댓글 삭제 수정 버튼
			if ("${loginMember.member_id}" == item.member_id) {
				if(item.replyBoard_content != "[삭제된 댓글입니다.]") {
				output += "<button type='button' class='btn' style='float:right' onclick='deleteReply("+item.replyBoard_no+")'>삭제</button>";
				output += "<button type='button' class='btn' style='float:right' onclick='updateReplyForm("+item.replyBoard_no+")'>수정</button>";
				}
			}
			
			output += "<p class='comment-content' id='content"+item.replyBoard_no+"'>"+item.replyBoard_content+"</p>";
			output += "<p id='imgOutput'></div>";
			
			// 작성날짜, 답글 버튼
			if(item.replyBoard_content != "[삭제된 댓글입니다.]") {
				output += "<p>" + date_to_str(new Date(item.replyBoard_writeDate)); + "</p>";
				output += "<div class='"+item.replyBoard_no+"'><button type='button' class='btn' onclick='childReply("+item.replyBoard_no+");'>답글 달기</button></div>";	
			}
			
			output += "</li>";
		});
		
		$(".detail-bottom-comment").html(output);
	};
	
	// 부모 댓글 작성 함수
	function replyWrite() {
		// 로그인 여부 확인
		if (${loginMember.member_id == null}) {
			$("#modalText").text("로그인이 필요한 서비스 입니다");
			$(".modal-footer").html('<a href="/user/login/yet"><button type="button" class="btn btn-default">로그인하러 가기</button></a>');
			$("#myModal").modal();
		} else {
			let replyBoard_content = $("#replyBoard_content").val();
			
			if(replyBoard_content != "") {
				let board_no = "${board.board_no}";
				let member_id = "${loginMember.member_id}";
				
				$.ajax({
					type : "post",
					dataType : "text", // Controller단에서 "ok" 보냈기 때문에 text	
					contentType : "application/json",
					url : "/board/qa/reply/insert", // 서블릿 주소
					data : JSON.stringify({
						board_no : board_no,
						member_id : member_id,
						replyBoard_content : replyBoard_content
					}),
					success : function(data) {
						replyList();
						ajaxStatus(data);
						scrollMove();
					}, // 통신 성공시
					error : function(data) {
					}, // 통신 실패시
					complete : function(data) {
					} // 통신 완료시
				});
			} else {
				$("#modalText").text("댓글을 입력해 주세요");
				$("#myModal").modal();
			}
		
		}
	};
	
	// 자식댓글 작성폼 열기
	function childReply(replyno) {
		let replyBoard_no = "." + replyno
		
		let output = "<div class='inputForm' style='display:flex'>";
		output += "<input type='text' class='form-control' placeholder='댓글을 입력해주세요' id='replyId"+replyno+"'>";
		output += "<button type='button' class='btn btn-default' onclick='childRelpyWrite("+replyno+");'>답글 작성</button>";
		output += "<button type='button' class='btn btn-default' onclick='replyList();'>닫기</button>";
		output += "</div>";
		// 닫기 창 , css 수정
		$(replyBoard_no).html(output);
	}
	
	// 자식 댓글 작성
	function childRelpyWrite(replyno) {
		let replyId = "#replyId" + replyno;
		
		let replyBoard_content = $(replyId).val();
		
		let member_id = "${loginMember.member_id}";
		
			
		$.ajax({
			type : "post",
			dataType : "text", // Controller단에서 "ok" 보냈기 때문에 text	
			contentType : "application/json",
			url : "/board/qa/reply/insert", // 서블릿 주소
			data : JSON.stringify({
				replyBoard_no : replyno,
				replyBoard_content : replyBoard_content,
				member_id : member_id
			}),
			success : function(data) {
				replyList();
				ajaxStatus(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 댓글 삭제
	function deleteReply(replyBoard_no) {
		$.ajax({
			type : "delete",
			dataType : "text", // Controller단에서 "ok" 보냈기 때문에 text	
			url : "/board/qa/reply/delete/" + replyBoard_no, // 서블릿 주소
			success : function(data) {
				replyList();
				ajaxStatus(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 댓글 수정 폼 열기
	function updateReplyForm(replyno) {
		let replyBoard_no = "." + replyno;
		let contentNo = "#content" + replyno;
		let replyBoard_content = $(contentNo).text();
		console.log(replyBoard_content);
		
		let output = "<div class='inputForm' style='display:flex'>";
		output += "<input type='text' class='form-control' placeholder='댓글을 입력해주세요' id='replyId"+replyno+"' value='"+replyBoard_content+"'>";
		output += "<button type='button' class='btn btn-default' onclick='updateReply("+replyno+");'>댓글 수정</button>";
		output += "<button type='button' class='btn btn-default' onclick='replyList();'>닫기</button>";
		output += "</div>";
		
		$(replyBoard_no).html(output);
	}
	
	// 댓글 수정 함수
	function updateReply(replyno) {
		// input창 id값
		let replyId = "#replyId" + replyno;
		// 위에 위치에 있는 input value 가져오기
		let replyBoard_content = $(replyId).val();
		
		$.ajax({
			type : "put",
			dataType : "text", // 받을 데이터
			contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
			url : "/board/qa/reply/update/" + replyno,// 서블릿 주소
			data : JSON.stringify({
				replyBoard_no : replyno,
				replyBoard_content : replyBoard_content
			}),
			success : function(data) {
				replyList();
				ajaxStatus(data);
			}, // 통신 성공시
			error : function(data) {
			}, // 통신 실패시
			complete : function(data) {
			} // 통신 완료시
		});
	}
	
	// 게시글 작성 후 작성한 글로 올때, 해당 작업 완료 알림창 띄우기
	function statusOk() {
		if(${status == "writeOk"}) {
			$("#modalText").text("글 작성이 완료 되었습니다");
			$("#myModal").modal();
		} else if (${status == "modiOk"}) {
			$("#modalText").text("글 수정이 완료 되었습니다");
			$("#myModal").modal();
		}
	}
	
	// 댓글 ajax 작업 후 Modal 띄우기
	function ajaxStatus(msg) {
		if(msg == "writeOk") {
			$("#modalText").text("댓글 작성이 완료 되었습니다");
			$("#myModal").modal();
		} else if(msg == "deleteOk") {
			$("#modalText").text("댓글이 삭제 되었습니다");
			$("#myModal").modal();
		} else if(msg == "updateOk") {
			$("#modalText").text("댓글 수정이 완료 되었습니다");
			$("#myModal").modal();
		}
	}
	
	// 부모댓글 작성 후 스크롤 이동 함수
	function scrollMove() {
		let offset = $(".detail-bottom-comment li:last").offset();
	 	$('html, body').animate({scrollTop : offset.top}, 400);
	 	
	 	// input 창 비우기
		$("#replyBoard_content").val("");
	}
	
	// Date format
	function date_to_str(format) {
		let year = format.getFullYear();
		let month = format.getMonth() + 1;
		if (month < 10) month = '0' + month;
		let date = format.getDate();
		if (date < 10) date = '0' + date;
		let hour = format.getHours();
		if (hour < 10) hour = '0' + hour;
		let min = format.getMinutes();
		if (min < 10) min = '0' + min;
		let sec = format.getSeconds();
		if (sec < 10) sec = '0' + sec;
		return year + "-" + month + "-" + date + " " + hour + ":" + min + ":" + sec;
	};
	
	// 댓글에 첨부파일 표출
    function show() {
        let preview = document.querySelector('img');
        // console.log(preview);
        let file = document.querySelector('input[type=file]').files; // 배열
        console.log(file);
        $.each(file, function (index, item) {
            let reader = new FileReader();
            //console.log(reader);
            let out = "";
            reader.addEventListener("load", function () {
                out = "<img src='' id='loadImg" + index + "' width=''100px' height='100px' />";
                $('#imgOutput').append(out);
                $("#loadImg" + index).attr("src", reader.result);
                // console.log(preview.src);
                // reader = null;
            }, false);
            // console.log(preview.src);

            // console.log(file);
            reader.readAsDataURL(item);
        });
    }
	
</script>

<style>
	.btnImage {
		font-size: 25px;
		position: absolute;
		right: 0px;
		top: 0px;
		opacity: 0;
		filter: alpha(opacity=0);
		cursor: pointer;
	}
	
	.filebox input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;

        .filebox label {
            display: inline-block;
            padding: 10px 20px;
            color: #999;
            vertical-align: middle;
            background-color: #fdfdfd;
            cursor: pointer;
            border: 1px solid #ebebeb;
            border-radius: 5px;
        }
    }
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
							<h2>Q&A 게시판</h2>
							<span class="byline" id="rollNot"><a href="#">공지사항</a></span>
						</header>
					</section>

					<!-- 컨텐츠 시작 -->
					<div class="detail-wrap">
						<div class="detail-top">
							<div class="detail-top-title">
								<p>${board.board_title }</p>
								<p>
									<fmt:formatDate value="${board.board_writeDate }"
										pattern="yyyy-MM-dd HH:mm:ss" type="DATE" />
								</p>
							</div>
							<div class="detail-top-author">
								<p>${board.member_id }</p>
								<p class="view">
									조회수 <span>${board.board_viewCnt }</span>
								</p>
								<p class="like">
									추천수 <span>${board.board_likeCnt }</span>
								</p>
								<p class="reply">
									댓글 <span class="replyCnt">${board.board_replyCnt }</span>
								</p>
							</div>
						</div>
						<div class="detail-content">${board.board_content }</div>
						<div class="recommend-btn">
							<c:if test="${loginMember.member_id != null}">
							<div class="LikeCnt" id="boardLike_Btn">
								<button type="button" class="btn btn-danger" onclick="likeBtn()">추천</button>
							</div>
							</c:if>




							<!-- 로그인한 회원과 작성자와 비교 후 작성자에게만 표출 -->
							<c:if test="${loginMember.member_id == board.member_id }">
						      	<button class="btn btn-danger" onclick="location.href='../qa/delete?no=${board.board_no}'">삭제하기</button>
						   	</c:if>
							
							<!-- 로그인한 회원과 작성자와 비교 후 작성자에게만 표출 -->
							<c:if test="${loginMember.member_id == board.member_id}">
						      	<button class="btn btn-danger" onclick="location.href='../qa/modi?no=${board.board_no}&page=${param.page }'">수정하기</button>
						   	</c:if>
							
							<!-- 검색하지 않았을 시 전 주소 -->
							<c:if test="${param.searchWord == null }">
								<a href="/board/qa/list?page=${param.page}" id="listBtn">
									<button type="button" class="btn btn-danger">목록보기</button>
								</a>
							</c:if>
							
														
							<!-- 검색 했을 시 전 주소 -->
							<c:if test="${param.searchWord != null }">
								<a href="/board/qa/search?page=${param.page}&searchType=${param.searchType}&searchWord=${param.searchWord}" id="listBtn">
									<button type="button" class="btn btn-danger detailNext">목록보기</button>
								</a>
							</c:if>




							

						</div>
						<div class="detail-bottom-comment-write">
							<p>댓글 작성</p>
							<!-- 댓글 작성 Ajax -->
							<div class="form-group">
								<input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="replyBoard_content" name="replyBoard_content">
								<label for="file"><img style="width: 30px; height: 30px;" src="../../../../resources/img/photo-camera.png" /></label>
                            	<input type="file" id="file" name="replyBoard_img" class="btnImage" onchange="show()" multiple />
                            	<span id="imgOutput"></span>
								<button type="button" class="btn btn-success" onclick="replyWrite();" >댓글 작성</button>
							</div>
						</div>
						<div class="detail-bottom">
							<div class="detail-bottom-comment-wrap">
								<ul class="detail-bottom-comment">
								</ul>
							</div>

						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
	<!-- /Main -->

	<!-- modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">알림</h4>
				</div>
				<div class="modal-body" id="modalText">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../../cambak21Footer.jsp"%>
</body>

</html>