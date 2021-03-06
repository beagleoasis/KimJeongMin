<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>

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
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script>
	
	let member_id = '${loginMember.member_id}';
	
	 function popup(){
		 
         var url="/mall/destinationsList/register";
         var option="width=530, height=650, top=200, left=200";
         window.open(url, "", option);
     }
	 
	 
	function goInsertDestiny(member_id){
		
		let destination_nickname = $("#nickname" + member_id).val();
		let destination_toUser = $("#toUser" + member_id).val();
		let destination_address = $("#address" + member_id).val();
		let destination_addressDetail = $("#addressDetail" + member_id).val();
		let destination_mobile = $("#mobile" + member_id).val();
	
		$.ajax({
			
			method: "POST",
			url: "/mall/destinationsList/insertDestiny/",
			headers: {	// ?????? ?????? ???????????? ????????? ??????
				"Content-Type" : "application/json"
			},
			dataType: "text", // ?????? ?????? ????????? ??????
			data : JSON.stringify({	// ???????????? ?????????
			member_id : member_id,
			destination_nickname : destination_nickname,
			destination_address : destination_address,
			destination_addressDetail : destination_addressDetail,
			destination_toUser : destination_toUser,
			destination_mobile : destination_mobile
			}),
			
			success : function(result){
				
					alert('????????? ?????? ?????? ??????!');
					getDestinationsList();
					
			}
		});
	}
	
	function goModyContent(destination_no){
		
		let destination_nickname = $("#nickname" + destination_no).val();
		let destination_toUser = $("#toUser" + destination_no).val();
		let destination_address = $("#address" + destination_no).val();
		let destination_addressDetail = $("#addressDetail" + destination_no).val();
		let destination_mobile = $("#mobile" + destination_no).val();
		
	
		$.ajax({
			
			method: "POST",
			url: "/mall/destinationsList/modiajax/",
			headers: {	// ?????? ?????? ???????????? ????????? ??????
				"Content-Type" : "application/json"
			},
			dataType: "text", // ?????? ?????? ????????? ??????
			data : JSON.stringify({	// ???????????? ?????????
			destination_no : destination_no,
			member_id : member_id,
			destination_nickname : destination_nickname,
			destination_address : destination_address,
			destination_addressDetail : destination_addressDetail,
			destination_toUser : destination_toUser,
			destination_mobile : destination_mobile
			}),
			
			success : function(result){
				
					alert('????????? ?????? ??????!');
					getDestinationsList();
					
			}
		});
	
		
		
	}
	
	
	
	
	$(function(){
		
		if(${loginMember == null}){
			alert("????????? ??? ?????? ???????????????.");
			location.href="/user/login/yet";
		}
		
		getDestinationsList();
		
		
	});
	
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
	
	
	
	
	function returnCancle(dstno){
		$("#cancleMody" + dstno).css('display','none');
		$("#sumbitCommit" + dstno).css('display', 'none');
		$(".modiform" + dstno).attr('readonly', true).css('border-style','none');
		$("#openModyBtn" + dstno).css('display', '');
		$("#deleteBtn" + dstno).css('display', '');
		
	}
	
	// ????????? ????????? ?????? 
	function returnInsert(id){
		
		$("#insertDestiny" + id + " input").css('display', 'none').css('border-style','none');
	
	}
	
	function showInputDestiny(id){
		
		$("#insertDestiny" + id + " input").css('display', '').css('border-style','solid');
	}

	
	
	
	
	// ??? ????????? ????????? ?????? ???//
	
	
	

	function modefyDestiny(dstno){
				
		$(".modiform" + dstno).attr('readonly', false).css('border-style','solid');
		$("#openModyBtn" + dstno).css('display', 'none');
		$("#deleteBtn"+ dstno).css('display', 'none');
		$("#sumbitCommit"+ dstno).css('display', '');
		$("#cancleMody"+ dstno).css('display', '');
		
		
		 // ???????????? ?????? textarea?????? ????????? ?????? ?????? ??? ????????? ?????? ??????
// 	     $("#writeReplyContent").bind("mousedown", function(event) {
// 	          // ???????????? ??????????????? ????????????
// 	         if (loginMember == "") {
// 	            if (confirm("????????? ?????? ????????? ???????????????. ????????? ???????????? ?????????????????????????") == true) { //??????
// 	               location.href='/user/login/yet';
// 	            } else { //??????
// 	                return false;
// 	            }
// 	         }
	   
// 	         });

	}
	
	

function getDestinationsList(){
	
	$.getJSON("/mall/destinationsList/ajax/" + member_id, function(data){
	
		DestinyList = "";
		let DestinyInsertBtn = "";
		console.log(data + "????????????");
		
		$(data).each(function(index, item){
		
		
		if(this.default_address == this.destination_no){
			
			DestinyList += "<tr><td><div><input type='text' class='modiform" + this.destination_no + "' readonly id='nickname" + this.destination_no + "' value='" + this.destination_nickname + "'/><input type='text' class='modiform" + this.destination_no + "'  readonly id='toUser" + this.destination_no + "' value='" + this.destination_toUser + "'/><div style='color: chocolate; border: solid 1px chocolate; margin: 5px 0px;'>???????????????</div><div></td><td><input type='text' class='modiform" + this.destination_no + "' id='address" + this.destination_no + "' readonly value='" + this.destination_address + "'/><br /><input type='text' class='modiform" + this.destination_no + "' readonly id='addressDetail" + this.destination_no + "' value='" + this.destination_addressDetail + "'/></td><td><input type='text' class='modiform" + this.destination_no + "' id='mobile" + this.destination_no + "' readonly value='" + this.destination_mobile + "'/></td><td><input type='button' style='border-style: double; background-color: white; border-color: darkgrey;' id='deleteBtn" + this.destination_no + "' onclick='deleteDestiny(" + this.destination_no + ");' value='??????'/>&nbsp<input type='button' id='openModyBtn" + this.destination_no + "' style='border-style: double; background-color: white; border-color: darkgrey;' onclick='modefyDestiny(" + this.destination_no + ");' value='??????'/><input style='border-style: double; background-color: white; border-color: darkgrey; display:none;' id='sumbitCommit" + this.destination_no + "'  type='button' onclick='goModyContent(" + this.destination_no + ");' value='??????' />&nbsp<input style='border-style: double; background-color: white; border-color: darkgrey; display:none;' id='cancleMody" + this.destination_no + "' type='submit' onclick='returnCancle(" + this.destination_no + ");' value='??????' /></td><td><span>?????????</span></td></tr>"
			
		}else{
			
			DestinyList += "<tr><td><div><input type='text' class='modiform" + this.destination_no + "' readonly id='nickname" + this.destination_no + "' value='" + this.destination_nickname + "'/><input type='text' class='modiform" + this.destination_no + "'  readonly id='toUser" + this.destination_no + "' value='" + this.destination_toUser + "'/><div></td><td><input type='text' class='modiform" + this.destination_no + "' id='address" + this.destination_no + "' readonly value='" + this.destination_address + "'/><br /><input type='text' class='modiform" + this.destination_no + "' readonly id='addressDetail" + this.destination_no + "' value='" + this.destination_addressDetail + "'/></td><td><input type='text' class='modiform" + this.destination_no + "' id='mobile" + this.destination_no + "' readonly value='" + this.destination_mobile + "'/></td><td><input type='button' style='border-style: double; background-color: white; border-color: darkgrey;' id='deleteBtn" + this.destination_no + "' onclick='deleteDestiny(" + this.destination_no + ");' value='??????'/>&nbsp<input type='button' id='openModyBtn" + this.destination_no + "' style='border-style: double; background-color: white; border-color: darkgrey;' onclick='modefyDestiny(" + this.destination_no + ");' value='??????'/><input style='border-style: double; background-color: white; border-color: darkgrey; display:none;' id='sumbitCommit" + this.destination_no + "'  type='button' onclick='goModyContent(" + this.destination_no + ");' value='??????' />&nbsp<input style='border-style: double; background-color: white; border-color: darkgrey; display:none;' id='cancleMody" + this.destination_no + "' type='submit' onclick='returnCancle(" + this.destination_no + ");' value='??????' /></td><td><input type='button' style='border-style: double; background-color: white; border-color: chocolate; color:chocolate; border: 1px;'  onclick='defaultDestiny(" + this.destination_no + ");' value='?????????????????? ??????' /></td></tr>"
		}
		
		if(data.length < 3){
			 console.log(data);
			 DestinyInsertBtn = "<tr id='insertDestiny" + member_id + "'><td><div><input style='display:none;' type='text' placeholder='????????? ??????' class='modiform' id='nickname" + member_id + "' value=''/><input style='display:none;' type='text' class='modiform' placeholder='?????? ??????' id='toUser" + member_id + "' value=''/><div></td><td><input style='display:none' type='text' class='modiform' placeholder='????????? ????????? ??????' id='address" + member_id + "' value=''/><br /><input style='display:none' type='text' class='modiform' id='addressDetail" + member_id + "' placeholder='????????? ????????????' value=''/></td><td><input type='text' style='display:none;' class='modiform' id='mobile" + member_id + "' placeholder='???????????? ?????????' value=''/></td><td><input style='border-style: double; background-color: white; border-color: darkgrey; display:none;' id='sumbitCommit" + member_id + "'  type='button' onclick='goInsertDestiny(\"" + member_id + "\");' value='??????' />&nbsp<input style='border-style: double; background-color: white; border-color: darkgrey; display:none;' id='cancleMody" + member_id + "' type='button' onclick='returnInsert(\"" + member_id + "\");' value='??????' /></td><td>??????&nbsp<img src='../resources/cambak21/images/plus.png' style='width:25px; height:25px;cursor:pointer;' onclick='showInputDestiny(\"" + member_id + "\");' /></td></tr>"
			 console.log(DestinyInsertBtn);
		}else{
			DestinyInsertBtn = "  ";
		}	
		
		});
			if(DestinyInsertBtn == ""){
				DestinyInsertBtn = "<tr id='insertDestiny" + member_id + "'><td><div><input style='display:none;' type='text' placeholder='????????? ??????' class='modiform' id='nickname" + member_id + "' value=''/><input style='display:none;' type='text' class='modiform' placeholder='?????? ??????' id='toUser" + member_id + "' value=''/><div></td><td><input style='display:none' type='text' class='modiform' placeholder='????????? ????????? ??????' id='address" + member_id + "' value=''/><br /><input style='display:none' type='text' class='modiform' id='addressDetail" + member_id + "' placeholder='????????? ????????????' value=''/></td><td><input type='text' style='display:none;' class='modiform' id='mobile" + member_id + "' placeholder='???????????? ?????????' value=''/></td><td><input style='border-style: double; background-color: white; border-color: darkgrey; display:none;' id='sumbitCommit" + member_id + "'  type='button' onclick='goInsertDestiny(\"" + member_id + "\");' value='??????' />&nbsp<input style='border-style: double; background-color: white; border-color: darkgrey; display:none;' id='cancleMody" + member_id + "' type='button' onclick='returnInsert(\"" + member_id + "\");' value='??????' /></td><td>??????&nbsp<img src='../resources/cambak21/images/plus.png' style='width:25px; height:25px;cursor:pointer;' onclick='showInputDestiny(\"" + member_id + "\");' /></td></tr>"
			}	
			$("#tbodyDestinyList").html(DestinyList);
			$("#tbodyDestinyList").append(DestinyInsertBtn);	
			
		});

	}
	
	
	
	
</script>
<style>
	
	.MyaddrList{
		width: 100%;
	    height: 140px;
	    text-align: center;
	    font-size: 14px;
	}
	
	
	.MyaddrList th {
	text-align: center;
	font-size: 20px;
	border-bottom-style: double;
	    
	}
	
	.MyaddrList td {
	
	border-bottom-style: outset;
	    
	}
	
	input[class^="modiform"] {
	text-align: center;
	
	border-style: none;
	
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
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>????????? ??????</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
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
                                    <th style="width: 15%">?????? ??????</th>
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
        <div style="font-weight: bold; float: right; margin-right: 20%; margin-top: 10px; font-size: 15px; color: chocolate;"> ??? &nbsp ?????? 3????????? ?????? ???????????????.</div>
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