<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CambakMall</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../../resources/mallMain/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/style.css" type="text/css">
    <link rel="stylesheet" href="../../resources/mallMain/css/cambakMallCommon.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="../../resources/mallMain/js/cambakMallCommon.js"></script>
</head>
<script>
	
	 let member_id = '${loginMember.member_id}';
	 window.name = "destinationsList";
     var url="";
     var option="width=530, height=650, top=200, left=200, resizeable = no, scrollbars = no";
     
     // ????????? ?????? ??? ?????? ????????? opener??? ?????? //
	 function popup(data){
		 
		  url = "/mall/destinationsList/register?no=" + data;
		  var openWin = window.open(url, "registerDestinationForm", option);
	
     }
	 
	
	
	$(function(){
		
		if(${loginMember == null}){
			alert("????????? ??? ?????? ???????????????.");
			location.href="/user/login/yet";
		}
		
		getDestinationsList();
		
		
	});
	
	// ?????? ????????? ????????? ?????? ????????? ?????? ??? ????????? ????????? //
	function defaultDestiny(dstno){
	
	     $.ajax({
	         
	            method: "post",
	            url: "/mall/destinationsList/ajax/" + member_id + "/" + dstno,
	            dataType: "text", // ?????? ?????? ????????? ??????
	            
	            success : function(result){
	            	
	                alert("?????? ??????.");
	                getDestinationsList();
	            }
	        });
	}	
	
	// ????????? ????????? ????????? ????????? ?????? = Y ??? ?????? ??? ????????? ????????? //
	function deleteDestiny(dstno){
		   $.ajax({
	            method: "get",
	            url: "/mall/destinationsList/deleteDestiny/" + member_id + "/" + dstno,
	            dataType: "text", // ?????? ?????? ????????? ??????
	            success : function(result){
	            	
	                alert("?????? ??????.");
	                getDestinationsList();
	            }
	        });
		
	}
	
// ?????????????????? ???????????? ???????????? ?????? ????????? ?????? ?????? //
function getDestinationsList(){
	
	$.getJSON("/mall/destinationsList/ajax/" + member_id, function(data){
	
		DestinyList = "";
		let DestinyInsertBtn = "";
		
		if(data.length == 0){
			$("#infoList").html(" ??? &nbsp ????????? ???????????? ????????????.");
		}else{
			$("#infoList").html(" ??? &nbsp ?????? 3????????? ?????? ???????????????.");
		}
		
		
		$(data).each(function(index, item){
			
		
			
		
		if(this.default_address == this.destination_no){
			// ?????? ???????????? ???????????? ?????? ?????? //
			DestinyList += "<tr><td><div><input type='text' class='modiform" + this.destination_no + "' readonly id='nickname" + this.destination_no + "' value='" + this.destination_nickname + "'/><input type='text' class='modiform" + this.destination_no + "'  readonly id='toUser" + this.destination_no + "' value='" + this.destination_toUser + "'/><div style='color: chocolate; border: solid 0.5px chocolate; margin: 5px 45px; padding: 4px 2px; width:80px;'>???????????????</div><div></td><td><span>(" + this.destination_zipCode + "<input type='hidden' class='modiform" + this.destination_no + "' id='postCode" + this.destination_no + "' readonly value='" + this.destination_zipCode + "'/>)</span><br /><input type='text' class='modiform" + this.destination_no + "' id='address" + this.destination_no + "' readonly value='" + this.destination_address + "'/><br /><input type='text' class='modiform" + this.destination_no + "' readonly id='addressDetail" + this.destination_no + "' value='" + this.destination_addressDetail + "'/></td><td><input type='text' class='modiform" + this.destination_no + "' id='mobile" + this.destination_no + "' readonly value='" + this.destination_mobile + "'/></td><td><input type='button' id='openModyBtn" + this.destination_no + "' style='border-style: double; color:white; background-color: dimgrey; border-color: dimgrey; padding: 2px 8px;' onclick='popup(" + this.destination_no + ");' value='??????'/>&nbsp<input type='button' style='border-style: double; color:white; background-color: dimgrey; border-color: dimgrey; padding: 2px 8px;' id='deleteBtn" + this.destination_no + "' onclick='deleteDestiny(" + this.destination_no + ");' value='??????'/></td><td><span style='font-weight: bold; color: palevioletred;'>?????? ?????????</span></td></tr>"
			
		}else{
			// ?????? ???????????? ???????????? ?????? ?????? ?????? //
			DestinyList += "<tr><td><div><input type='text' class='modiform" + this.destination_no + "' readonly id='nickname" + this.destination_no + "' value='" + this.destination_nickname + "'/><input type='text' class='modiform" + this.destination_no + "'  readonly id='toUser" + this.destination_no + "' value='" + this.destination_toUser + "'/><div></td><td><span>(" + this.destination_zipCode + "<input type='hidden' class='modiform" + this.destination_no + "' id='postCode" + this.destination_no + "' readonly value='" + this.destination_zipCode + "'/>)</span><br /><input type='text' class='modiform" + this.destination_no + "' id='address" + this.destination_no + "' readonly value='" + this.destination_address + "'/><br /><input type='text' class='modiform" + this.destination_no + "' readonly id='addressDetail" + this.destination_no + "' value='" + this.destination_addressDetail + "'/></td><td><input type='text' class='modiform" + this.destination_no + "' id='mobile" + this.destination_no + "' readonly value='" + this.destination_mobile + "'/></td><td><input type='button' id='openModyBtn" + this.destination_no + "' style='border-style: double; color:white; background-color: dimgrey; border-color: dimgrey; padding: 2px 8px;' onclick='popup(" + this.destination_no + ");' value='??????'/>&nbsp<input type='button' style='border-style: double; color:white; background-color: dimgrey; border-color: dimgrey; padding: 2px 8px;' id='deleteBtn" + this.destination_no + "' onclick='deleteDestiny(" + this.destination_no + ");' value='??????'/></td><td><input type='button' style='border-style: double; color:white; background-color: dimgrey; border-color: dimgrey; border: 1px;'  onclick='defaultDestiny(" + this.destination_no + ");' value='?????????????????? ??????' /></td></tr>"
		}
		
		if(data.length < 3){
			 // ????????? ????????? 3??? ????????? ????????? ????????? ??? ????????? ?????? //
			 $(".green_bg").css("display","");
		}else{
			$(".green_bg").css("display","none");
		}	
		
		});

			$("#tbodyDestinyList").html(DestinyList);
		
			
		});

	}
	
	
	
	
</script>
<style>
	
	.MyaddrList{
		width: 1140px;
	    text-align: center;
	    font-size: 14px;
	}
	
	
	.MyaddrList th {
	border-bottom-width: thin;
    border-color: darkgray;
    text-align: center;
    font-size: 20px;
    border-top-style: solid;
    border-bottom-style: solid;
}

	#tbodyDestinyList tr{
	
	height: 90px;

	}
	
	
	.MyaddrList td {
	
	border-bottom-style: outset;
	    
	}
	
	input[class^="modiform"] {
	text-align: center;
	width: 100%;
	border-style: none;
	margin: 2px 0px;
	
	}
	
	input[id^="nickname"] {
		font-size:15px;
	    font-weight: bold;
	}

.setting_btn {
	cursor: pointer;
	margin: 10px 0px;
	left: 74.3%;
    display: inline-block;
    position: relative;
    padding: 0 13px;
    border-color: dimgrey;
    background-color: dimgrey;
    border-radius: 0;
    line-height: 33px;
    color: #222;
    text-align: center;
    text-decoration: none;
    vertical-align: top;
}
.setting_btn .green_bg {
    border-color: dimgrey;
    background-color: dimgrey;
    color: #fff;
    text-decoration: none;
  	
    }
    
    .desc_delivery .setting_btn {
    position: absolute;
    right: 0;
    bottom: 0;
    font-size: 13px;
    font-weight: bold;
}
    
    
    
    
</style>
<body>


	<%@include file="mallHeader.jsp" %>

	
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> MyPage</a>
                        <span>????????? ??????</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad" style="margin-bottom: 200px;">
    	<a onclick="popup(0);" class="_insert setting_btn green_bg" style="color: white;">????????? ??????</a>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <table class="MyaddrList">
                            <thead>
                                <tr>
                                    <th style="width: 15%" >?????????</th>
                                    <th style="width: 40%">??????</th>
                                    <th style="width: 15%">?????????</th>
                                    <th style="width: 15%">?????? / ??????</th>
                                    <th style="width: 15%">?????? ?????????</th>
                                </tr>
                            </thead>
                            <tbody id="tbodyDestinyList">
                                
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        
        </div>
        <div id="infoList" style="font-weight: bold; margin-left:68%; font-size: 15px; color: chocolate;"> ??? &nbsp ?????? 3????????? ?????? ???????????????.</div>
        <div style="font-weight: bold; margin-left:75%; margin-top: 25px; font-size: 15px; color: chocolate;"><button onclick="window.history.back()">?????? ?????????</button></div>
   		
   
    </section>
    <!-- Shop Cart Section End -->

<!-- 	<div> -->
<!-- 		<iframe id="iframeForScroll" style="border: none; width: 100%;height:-webkit-fill-available; "src="/mall/destinationsList/register"></iframe> -->
		
<!-- 	</div> -->





<%@include file="mallFooter.jsp" %>


<!-- Js Plugins -->

<script src="../../resources/mallMain/js/bootstrap.min.js"></script>
<script src="../../resources/mallMain/js/jquery.magnific-popup.min.js"></script>
<script src="../../resources/mallMain/js/jquery-ui.min.js"></script>
<script src="../../resources/mallMain/js/mixitup.min.js"></script>
<script src="../../resources/mallMain/js/jquery.countdown.min.js"></script>
<script src="../../resources/mallMain/js/jquery.slicknav.js"></script>
<script src="../../resources/mallMain/js/owl.carousel.min.js"></script>
<script src="../../resources/mallMain/js/jquery.nicescroll.min.js"></script>
<script src="../../resources/mallMain/js/main.js"></script>


</body>
</html>