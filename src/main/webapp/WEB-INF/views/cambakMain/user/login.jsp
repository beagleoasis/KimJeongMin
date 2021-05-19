<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
   <title>Cambark's</title>
   <meta http-equiv="content-type" content="text/html; charset=utf-8" />
   <meta name="description" content="" />
   <meta name="keywords" content="" />
   
   <link rel="icon" type="image/png" href="../../resources/cambak21/images/icons/favicon.ico"/>
   <link rel="stylesheet" type="text/css" href="../../resources/cambak21/css/loginUtil.css">
   <link rel="stylesheet" type="text/css" href="../../resources/cambak21/css/login.css">
   
   
   <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
   <script src="../../resources/cambak21/js/skel.min.js"></script>
   <script src="../../resources/cambak21/js/skel-panels.min.js"></script>
   <script src="../../resources/cambak21/js/init.js"></script>

   <link rel="icon" type="image/x-icon" href="../../resources/cambak21/assets/favicon.ico" />
   <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
   <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
   <link rel="stylesheet" href="../../resources/cambak21/css/skel-noscript.css" />
   
   <link rel="stylesheet" href="../../resources/cambak21/css/style.css" />
   <link rel="stylesheet" href="../../resources/cambak21/css/style-desktop.css" />
   
   <script src="/resources/cambak21/lib/jquery-3.5.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   <!-- 템플릿 js, css 파일 -->
   <script src="/resources/cambak21/js/SHWtamplet.js"></script>
   <script>
   $(document).ready(function() {
	   modifyResultMsg(); 
   });
   
   function loginOK(){
      let member_id = $("#member_id").val();
      let member_password = $("#member_password").val();
      
      console.log("qqqqqqqqqq : " + member_id );
      console.log("qqqqqqqqqq : " + member_password );
      
      $.ajax({
         method: "POST",
         url: "/user/loginCheck",
         dataType: "text",
         data : {member_id : member_id, member_password : member_password},
         success : function(data) {
            console.log(data);
            if (data == "memberCheck") {
               $.ajax({
                  method: "POST",
                  url: "/user/login",
                  dataType: "text",
                  data : {member_id : member_id, member_password : member_password}
               });

           } else {
              alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다");
           }
        }, error : function(data) {
           alert(data);
      }
           
      });
   }
   
   function modifyResultMsg() {
		if ('${kakaoLogin }' == "fail") {
			   alert("등록되지 않은 회원입니다.");
		   }
	}
   
   function chkCookie() {
      chkCookie = $("#chkCookie").prop("checked");
      console.log(chkCookie);
      if(chkCookie == true){
         alert("자동 로그인 기능은 공공장소에서는 사용하지 마세요!");
         return true;
      }
   }
   
   function loginRequestCheck() {
      
   }
   </script>
   <style>
      @import url(../../resources/cambak21/css/SHWtamplet.css);
   .\34 u {
    width: 100%;
   }
   
   .main {
      width: auto;
   }
   
   #login100-form validate-form {
      min-width: 400px;
   }

   </style>



</head>

<body>
    <%@include file="../cambak21Header.jsp"%>

<!-- Main -->
   <div id="main">
      <div class="container">
         <div class="row">

<!--          사이드바 템플릿 -->
<%--       <%@include file="../cambak21Aside2.jsp"%> --%>
      
      <!-- Content -->
            <div id="content" class="8u skel-cell-important">
      <section>
            
            
    <!-- Main -->
          <div class="limiter" >
            <div class="container-login100">
              <div class="wrap-login100">
             <c:if test="${loginMember == null}">   
              <form class="login100-form validate-form" action="/user/login" method="post">
              <span class="login100-form-title p-b-34">
                    Account Login
                  </span>
                  <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
                    <input class="input100" type="text" id="member_id" name="member_id" value="" placeholder="아이디">
                    <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
                    <input class="input100" type="password" id="member_password" name="member_password" value=""  placeholder="비밀번호">
                    <span class="focus-input100"></span>
                  </div>
                  
                  <div class="container-login100-form-btn">
                    <input type="submit" class="login100-form-btn" value="로그인" onclick="return loginOK();"><br/>
                    <input type="checkbox" name="member_cookie" id="chkCookie" />자동 로그인  <br/>
                  </div>
                  
                    <div class="w-full text-center p-t-27 p-b-239">
					<p><a href="https://kauth.kakao.com/oauth/authorize?client_id=b3f3cf086449d274d79c8ab8a463ea84&redirect_uri=http://goot6.cafe24.com/user/kakaoLogin&response_type=code"><img src="/resources/img/kakaoLogin.png"></a></p>
                    <a href="../find_idPwd" class="txt2">
                      아이디 / 비밀번호 찾기
                    </a>
                  </div>
                  
<!--                   <div class="w-full text-center"> -->
<!--                     <a href="buggo_signUp.html" class="txt3"> -->
<!--                       회원 가입 -->
<!--                     </a> -->
<!--                   </div> -->
                  
               </form>
                         
           </c:if>
           
           <c:if test="${loginMember != null}">
           <form class="login100-form validate-form" action="/user/logout" method="post">
               <span class="login100-form-title p-b-34">
                    접속한 유저 
                  </span>
                  <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
                    <input id="first-name" class="input100" type="text" value="${loginMember.member_id }">
                    <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
                    <input class="input100" type="text" value="${loginMember.member_name }">
                    <span class="focus-input100"></span>
                  </div>
                  <div class="container-login100-form-btn">
                  <input type="text" class="login100-form-btn" value="${loginMember.grade_name }"><br/>
                    <input type="submit" style="width:200px; height:100px;"value="로그아웃" />  <br/>
                  </div>
              
                  <div class="w-full text-center p-t-27 p-b-239">
                    <span class="txt1">
                      
                    </span>
        
<!--                     <a href="../find_idPwd" class="txt2"> -->
<!--                       아이디 / 비밀번호 찾기 -->
<!--                     </a> -->
                  </div>
        
                  </form>
                       
            </c:if>
      
                <div class="login100-more" style="background-image: url('../../resources/img/logFront.png');"></div>
              </div>
            </div>
          </div>
   <!-- /Main -->
            
            
            
        </section>   
    
   
      </div>
  
   </div>
   </div>
   </div>
    <%@include file="../cambak21Footer.jsp"%>
   
</body>

</html>