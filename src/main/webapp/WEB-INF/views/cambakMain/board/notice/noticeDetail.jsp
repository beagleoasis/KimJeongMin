<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 공지사항 </title>

<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<link rel="icon" type="image/x-icon" href="/resources/cambak21/assets/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/cambak21/css/skel-noscript.css" />

<link rel="stylesheet" href="../../../resources/cambak21/css/style.css" />
<link rel="stylesheet" href="../../../resources/cambak21/css/style-desktop.css" />

<!-- bbskCSS -->
<link rel="stylesheet" href="/resources/cambak21/css/bbskCSS.css" />

<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 템플릿 js, css 파일 -->
<script src="/resources/cambak21/js/SHWtamplet.js"></script>
<script src="/resources/cambak21/js/rolling.js"></script>
<script src="/resources/cambak21/js/notice.js"></script>
<script src="/resources/cambak21/js/bbskJS.js"></script>
<script src="/resources/cambak21/js/cambakBoard.js"></script>

<!-- include summernote css/js -->
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
let replyCnt = 0;
let isreply = 0;

  
function callReplyList(){
	
	let board_no = '${param.no}';
	let output = '<ul class="list-group">';
	
	$.getJSON("/board/notice/user/getReply/" + board_no, function(data){

		if(data.length == 0){
			
			output += '<li class="list-group-item">작성된 댓글이 없습니다.</li>';
			
		}
			
			
		$(data).each(function(index, item){
			
			replyCnt++;	
			
			let date = new Date(this.replyBoard_writeDate);
			var now = date.getFullYear() + "-" + (date.getMonth() + 1)  + "-" + date.getDate() + "     " + date.getHours() + ":" + date.getMinutes();
			let go = Number(item.replyBoard_no);
			$("#replyBoard_no").val(go);
			let date111 = new Date(this.replyBoard_updateDate);
			
			
			if(this.member_id != '${loginMember.member_id}'){
				output += '<li class="list-group-item"><input type="hidden" id="replyid" value="' + this.board_no + '"/><div>' + this.replyBoard_content + '</div><div><span style="float:right; margin:-10px;">' 
				+ now + '&nbsp&nbsp&nbsp</span></div><div><span>' + this.member_id + '</span><input type="hidden" id="replyWriter" value="' + this.member_id + '"/></div><div id="modifyBox' +  item.replyBoard_no + '" style="display:none;"><div><input type="hidden" name="replyBoard_no" id="replyBoard_no" /><input type="text" style="width:600px;" onkeyup="enterkey(' + this.replyBoard_no + ');" id="replyBoard_contentModi' + this.replyBoard_no + '" name="replyBoard_content" placeholder="수정할 댓글 내용을 입력하세요"><button type="button" id="replyModBtn" style="margin: 0px 5px 0px 20px;" onclick="modiProc(' + this.replyBoard_no + ');">수정</button><button type="button" id="replyModClose" onclick="modiboxclose(' + this.replyBoard_no + ');">닫기</button></div></div></div></li>';
			}else{
				output += '<li class="list-group-item"><input type="hidden" id="replyid" value="' + this.board_no + '"/><div>' + this.replyBoard_content + '</div><div><span style="float:right; margin:-10px;">' 
				+ now + '&nbsp&nbsp&nbsp<img src="/resources/cambak21/images/x.png" onclick="goDelete(' + item.replyBoard_no + ');" style="width:25px; height:30px; float:right;"><img src="/resources/cambak21/images/edit.png" onclick="goModify(' + item.replyBoard_no + ');" style="width:30px; height:30px; float:right;"></div></span style="float:right; margin:-10px;">' + 
				'<div><span>' + this.member_id + '</span><input type="hidden" id="replyWriter" value="' + this.member_id + '"/></div><div id="modifyBox' +  item.replyBoard_no + '" style="display:none;"><div><input type="hidden" name="replyBoard_no" id="replyBoard_no" /><input type="text" style="width:600px;" onkeyup="enterkey(' + this.replyBoard_no + ');" id="replyBoard_contentModi' + this.replyBoard_no + '" name="replyBoard_content" placeholder="수정할 댓글 내용을 입력하세요"><button type="button" id="replyModBtn" style="margin: 0px 5px 0px 20px;" onclick="modiProc(' + this.replyBoard_no + ');">수정</button><button type="button" id="replyModClose" onclick="modiboxclose(' + this.replyBoard_no + ');">닫기</button></div></div></div></li>';
			}
				
			});
	
		
		output += "</ul>";
		$("#responsereplyCnt").val(replyCnt);
		$("#replyBox").html(output);
		replyCnt = 0;
	});
}	

$(function(){
	checkPage();
	rolling();
  	callReplyList();
    let boardUri = searchUriAddress();
    asideBarDraw(boardUri);
    
	$('#summernote').summernote({
		height : 500
	});
	
	
  });

function goDelete(replyno){
	
	let bno = '${param.no}';
	let no = replyno;
		$.ajax({
			method: "get",
			url: "/board/notice/user/dropReply/" + no + "/" + bno,
			headers: {	// 요청 하는 데이터의 헤더에 전송
			"X-HTTP-Method-Override" : "DELETE"
			},
			dataType: "text", // 응답 받는 데이터 타입
			data : no, 
			success : function(result){
					alert('댓글 삭제 완료!');
					$("#replyWriter").val('${loginMember.member_id}');
					console.log($("#replyWriter"));
					callReplyList();
			}
		});
	}

function enterkey(replyBoard_no) {
    if (window.event.keyCode == 13) {

       modiProc(replyBoard_no);
    }
}

function enterkeyReplyAdd(){
	
    if (window.event.keyCode == 13) {
    		replyAddBtn();
     }
}


function modiProc(replyBoard_no){
		// 유효성 검사 하고...
		
		let replyBoard_content = $("#replyBoard_contentModi" + replyBoard_no).val();

		if(replyBoard_content != ""){
	
		$.ajax({
			method: "POST",
			url: "/board/notice/user/modiReply/" + replyBoard_no,
			headers: {	// 요청 하는 데이터의 헤더에 전송
		"Content-Type" : "application/json"
			},
		dataType: "text", // 응답 받는 데이터 타입
			data : JSON.stringify({	// 요청하는 데이터
			replyBoard_no : replyBoard_no,
			replyBoard_content : replyBoard_content
			}),
			success : function(result){
				console.log(result);
				if(result == 'Success'){
					alert('댓글 수정 완료!');
					
					callReplyList();
					$('#modifyBox' + replyBoard_no).hide();
				}
			}
		});

	}else{
		alert("댓글 내용 입력은 필수 입니다.");
	}
		
	};
	
function goModify(replyBoard_no){

	$('#modifyBox' + replyBoard_no).show();
	$("#replyBoard_no").val(replyBoard_no);
	$("#replyBoard_contentModi" + replyBoard_no).focus();
}

function modiboxclose(replyBoard_no){
	$('#modifyBox' + replyBoard_no).hide();
}

		
// function inputReplyBox1(){
// 	if(${loginMember.member_id == null}){
// 		alert("로그인 후 이용 가능합니다.");
// 	}else{
// 		$("#inputReplyBox").show();	
// 	}
	


function replycancleBtn(){
	$("#inputReplyBox").hide();	
}


function replyAddBtn(){
		
	
		
			// 유효성 검사 하고...
			let member_id = $("#newReplyMember").val();
			let replyBoard_content = $("#newReplyContent").val();
			let board_no = '${param.no}';
			$.ajax({
				method: "post",
				url: "/board/notice/user/insertReply/",
				headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
				},
				dataType: "text", // 응답 받는 데이터 타입
				data : JSON.stringify({	// 요청하는 데이터
					board_no : board_no,
					member_id : member_id,
				replyBoard_content : replyBoard_content
				}),
				success : function(result){
						alert('댓글 등록 완료!');
						$("#newReplyContent").val("");
						callReplyList();
						$("#inputReplyBox").css('display', 'none');
				}
			});
	
		
	};


</script>


<style>
@import url(/resources/cambak21/css/SHWtamplet.css);

#modifyBox{
	width: 400px;  height: 100px;
	background-color: lightgray;;
	top: 50%;  		left: 50%;
	margin: -50px 0p 0px -150px;
	z-index: 999;
	padding: 15px;
	}

.formContent{ margin: 40px;}

input:focus {outline:none;}

form, form input{
	border:none;
	color:black;
	font-weight: 500;
} 

#replyWindow{

    width: 900px;  height: 400px;  margin: 40px;  overflow-x: hidden; }

#buttonWindow{

	margin: -45px 40px -15px;
}
   	
   	
 .list-group-item{
     font-weight: bold;
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
							<h2>최근 공지사항</h2>
							<span class="byline" id="rollNot"><a href="/board/notice/listCri">공지사항 상세페이지</a></span>
						</header>
					
					</section>
				<!--  게시판 상세내용  -->	
					<section>
					<form>
					
				    <div class="formContent"> 
				    <div>
				    <input type="text" readonly style="font-size:25px; font-weight:900;max-width: 750px;" name="board_title" value="${noticeBoard.board_title }" />
				    <c:if test="${loginMember.member_id == noticeBoard.member_id }">	
         			<button type="button" class="btn btn-success" id="rewriteBoard" onclick="location.href='/board/notice/user/modi?no=${noticeBoard.board_no}&page=${param.page}'">수정</button>
				    </c:if>
		            </div>
		              <div>
		            작성일: <fmt:formatDate value="${noticeBoard.board_writeDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
				    <span style="margin-left:15px;">작성자: <input readonly type="text" name="member_id" value="${noticeBoard.member_id }" /></span>
				    <span style="float:right; margin-left:15px;">조회수 <input readonly type="text" style="width:50px;" value="${noticeBoard.board_viewCnt }" /> </span>
				    <span style="float:right; ">댓글수 <input readonly id="responsereplyCnt" type="text" style="width:20px;" value="${noticeBoard.board_replyCnt }" /> </span>
			  		 </div>
		               <div>
		               <hr style="margin:1em 0 0 0; padding: 1em 0 0 0;"/>
				    <div name="board_content" style="min-width:895px; min-height:500px;" >${noticeBoard.board_content }</div>
				    <hr style="margin:1em 0 0 0; padding: 1em 0 0 0;"/>
		            </div>
		               
            </form>
        </section>   
        <!--  로그인 한 유저와 작성자가 같을 때만 수정하기 삭제하기 버튼이 보여짐  -->
        <div id="buttonWindow">
        <c:if test="${loginMember.member_id == noticeBoard.member_id }">	
         <button type="button" class="btn btn-info" id="deleteBoard" onclick="location.href='/board/notice/user/remove/${noticeBoard.board_no}'">삭제하기</button>
         </c:if>
	
		<c:choose>
			<c:when test='${param.searchType != null }'>
		<button type="button" class="btn btn-primary" onclick="location.href='search?searchType=${param.searchType }&searchWord=${param.searchWord }&page=${param.page }'">리스트페이지로</button>
		
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary" onclick="location.href='/board/notice/listCri?page=${param.page}'">리스트페이지로</button>
				
			</c:otherwise>
		</c:choose>
		
    
    <!-- 댓글 보드 시작 -->
    
    <section id="replySection">
		<header>
		<span class="byline" >댓글 목록</span>
		</header>
	
	
    <div id="replyWindow">
      <div id="replyBox">
      		
      </div>
      
        <div style="border: solid 1px #ddd; padding: 2px; margin: 15px 0px;">  
        
        <c:if test="${loginMember != null }">
      	<input type="text" name="member_id"  style="border:none; width:130px; margin-left:12px; font-weight: bold;" readonly id="newReplyMember" value="${loginMember.member_id }"/><input type="text" style="width:690px;" onkeydown="enterkeyReplyAdd();" name="replyBoard_content" id="newReplyContent" /><img src="/resources/cambak21/images/check1.png" style="width:30px; height:30px; margin-left: 15px; margin-bottom: -10px;" onclick="replyAddBtn();" />
      </c:if>
	  <c:if test="${loginMember == null }">
      	<a href="/user/login/yet"><input type="text"  style="border:none; width:130px; margin-left:12px; font-weight: bold;" readonly value="로그인 정보 없음"/><span>비회원은 댓글을 작성할 수 없습니다. >> Click (페이지 이동)</span></a>
      </c:if>      
      
      </div>
        <div>

      </div>
     
    </div>  
    	
        
    
	</section>
					
			</div>
		</div>
	</div>
</div>
	<!-- /Main -->

	<%@include file="../../cambak21Footer.jsp"%>
	
	
</body>

</html>