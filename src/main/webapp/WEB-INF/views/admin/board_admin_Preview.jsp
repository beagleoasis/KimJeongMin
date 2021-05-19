<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 화면 너비 자동반응 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- 아이콘 및 타이틀 -->
<link rel="icon" type="image/x-icon"
	href="/resources/cambak21/assets/favicon.ico" />
<title>Cambak's - Admin Pages</title>
<!-- Custom CSS -->
<link href="../resources/adminAssets/libs/flot/css/float-chart.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>

<!-- include summernote css/js -->
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<script>
$(function(){
	
	$('#summernote').summernote({
		height : 400,
		width : 400
	});
	
// 	console.log("${adminBoard[0].board_no}");
	
});



</script>

<style>

/*  미리보기  */


table {
    table-layout: fixed;
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}






.mLayer > h2 {
    padding: 8px 50px 7px 20px;
    border-bottom: 1px solid #686868;
    color: #fff;
    font-size: 16px;
    text-align: left;
    font-weight: normal;
    background: #2f4363;
}

.mBoard.gSmall th {
    width: 100px;
}

.mBoard tbody th {
    border: 1px solid #d9dadc;
    text-align: left;
    font-weight: bold;
}

.mBoard th {
    font-weight: normal;
    background-color: #f5f4f4;
}

.mBoard th, .mBoard td {
    padding: 9px 9px 7px;
    vertical-align: top;
}

.mBoard.gSmall td {
    width: auto;
}


.mBoard tbody td {
    font-weight: bold;
    border: 1px solid #d9dadc;
}

.mBoard th, .mBoard td {
    padding: 9px 9px 7px;
    vertical-align: top;
}

.mBoard table {
    line-height: 1.5;
    background-color: #fff;
}

.mLayer {
    display: none;
    position: absolute;
    z-index: 110;
    left: 50%;
    border: 1px solid #2f4363;
    line-height: 1.5;
    background-color: #fff;
}

.mLayer .footer .btnNormal {
    min-width: 63px;
    height: 36px;
    line-height: 34px;
    font-size: 14px;
    color: #55a0ff;
    border-color: #55a0ff;
}
.mLayer .footer {
    padding: 15px 0;
    border-top: 1px solid #dedede;
    text-align: center;
    background-color: #fafafa;
}

html {
    width: 100%;
    height: 100%;
}

.board_contentPreview * {
	max-width: 385px;
}

</style>


</head>
<body>		
 <!--미리보기-->

<div class="mBoard gSmall">
        <table border="1" summary="">
            <caption>게시글 내용 미리보기</caption>
            <tbody>
            <tr>
                <th scope="row">제목</th>
                <td>
                    <div id="eSubject">${adminBoard[0].board_title}</div>
                    
                </td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${adminBoard[0].member_id}</td>
            </tr>
            <tr id="view_area">
                <th scope="row" colspan="2">원글</th>
                
            </tr>
            <tr>
            <td colspan="2"><div name="board_content" class="board_contentPreview" style="width:400px; min-height:245px;" >${adminBoard[0].board_content}</div></td>
            </tr>
          
            </tbody>
        </table>
    </div>
    
    
    
	
<!-- 			 <div class="mLayer ui-draggable ui-resizable" -->
<!-- 					style="width: auto; display: none;  width: auto; position: absolute; z-index: 200; left: 395px; top: 167px;" id="layerPreview"> -->
					
<!-- 					<h2>게시글 내용 미리보기</h2> -->
<!-- 					<div class="wrap" style="width: 400px; height: 400px;" -->
<!-- 						id="eBulletinContentWrap"> -->
<!-- 						<iframe id="eBulletinContent" frameborder="0" width="400px" -->
<!-- 							height="400px" marginwidth="0" marginheight="0" scrolling="auto"></iframe> -->
<!-- 					</div> -->
<!-- 					<div class="footer"> -->
<!-- 						<a href="javascript:closePreviewFrame();" class="btnNormal eClose"><span>닫기</span></a> -->
<!-- 					</div> -->
			
				
<!-- 				</div> -->

	 <!--미리보기-->

	
            
            
            
</body>
</html>