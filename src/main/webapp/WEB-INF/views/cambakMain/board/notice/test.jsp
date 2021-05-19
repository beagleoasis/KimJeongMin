<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <titler>공지사항 게시판 </title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
	<script>

	$(function(){
	  $('.box').click(function(){ 
	      $(this).css('-webkit-animation-name','box_ani');
	  });
	  
	  $('div#target').click(function(){ 
		  console.log("1");
		  
	      $('.box').css('-webkit-animation-name','box_anireturn');
	  });
	  
	  
	  
	});

  	  	
    </script>
  <style> 
  *{margin:0; padding:10px;} 
  .box{width:150px; height:150px; color:#fff; position: relative; background:red; animation-duration:1s; animation-fill-mode: forwards;} 
  /*animation-duration:5s; animation-timing-function: linear; animation-delay:0; animation-iteration-count:infinite; animation-direction:alternate; animation-play-state: running;*/ 

  
  @-webkit-keyframes box_ani{ 
   0%{background:red; transform:translate(0,0) scale(0.3,0.3) rotate(0deg);}  
/*   10%{background:orange;}  */
/*   20%{background:yellow;}  */
/*   30%{background:green;}  */
   100%{background:blue; width:450px; height:450px; transform:translate(150px, 20px) scale(1,1) rotate(360deg);} 
  from {top: 0px;}
  to {top: 200px; background-color: antiquewhite;}
 
  } 
   @-webkit-keyframes box_anireturn{ 
   0%{background:red; transform:translate(0,0) scale(0.3,0.3) rotate(0deg);}  
/*   10%{background:orange;}  */
/*   20%{background:yellow;}  */
/*   30%{background:green;}  */
  100%{background:blue; width:450px; height:450px; transform:translate(150px, 20px) scale(1,1) rotate(360deg);} 
  
  from {top: 200px; background-color: antiquewhite;}
  to {top: 0px;}
  } 
  
  
  
  </style>


  
</head>
<body>

   <div class="content-wrapper">
      <div class="container">
      
      <div class="box">animation<img class="boxClose" src="/resources/cambak21/images/check1.png" style="width:30px; height:30px;"/></div>



      </div>
        </div>
        
        
</body>
</html>