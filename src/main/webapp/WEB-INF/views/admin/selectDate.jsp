<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/assets/images/favicon.png">
    <title>Matrix Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="../../resources/adminAssets/libs/flot/css/float-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../../resources/adminDist/css/style.min.css" rel="stylesheet">
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://www.gstatic.com/charts/loader.js"></script>
   <!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
        
    function checkDate() {
    	let bool = true;
    	
		let startDate = $("#startDate").val();
		
		let endDate =  $("#endDate").val();
		
		if(startDate == '' || endDate == ''){
			alert("????????? ????????? ?????????");
			
			bool = false
			return bool;
		}
		
		return bool;
		
	}
    
   
	function defaultDate() {
		var now = new Date();
	
		var day = ("0" + now.getDate()).slice(-2);
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
	
		var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
		$("#endDate").val(today);
		$("#startDate").val(today);
	    
	}
	function changeDate() {
		var now = new Date();
		
		var day = ("0" + now.getDate()).slice(-2);
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
	
		var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
		
		if($("#endDate").val() > today){
			alert("?????????????????? ??? ?????? ????????? ??? ????????????.");
			$("#endDate").val(today);
		}
	}
	function changeStartDate() {
		var now = new Date();
		
		var day = ("0" + now.getDate()).slice(-2);
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
	
		var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
		
		if($("#startDate").val() > today){
			alert("?????????????????? ??? ?????? ????????? ??? ????????????.");
			console.log($("#startDate").val());
			$("#startDate").val(today);
		}
	}

    
    function testAjax(obj) {
    	let dateVal = 0;
    	
    	if(obj != null){
    		dateVal = obj.id;
    		console.log(dateVal);
    	}else{
    		dateVal = 1;
    		console.log(dateVal);
    	}
    	 $.ajax({
  			type : "get",
  			dataType : "json", // ?????? ?????????
  			//contentType : "application/json", // ?????? ?????????, json ?????? ???????????? ??????????????? ????????? ?????????
  			url : "revenue/perDate",// ????????? ??????
  			data : {dateVal : dateVal},
  			success : function(result) {
  				if (result != null) {
  					window.setTimeout(200);
  					google.charts.setOnLoadCallback(drawChart(result));
  				}
  				
  				
  				console.log("1");
  			}, // ?????? ?????????
  			error : function(result) {
  				
  			}, // ?????? ?????????
  			complete : function(result) {
  				console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
  				console.log(result);
//   				if(result != null){
  					
//   				}
  				
  				
  			} // ?????? ?????????
  		});
	}
    
    function drawChart(result) {
    	console.log(result)
    	
    	var data = new google.visualization.DataTable();
    	data.addColumn('string', '??????');
    	data.addColumn('number', '??????');
    	 
    	
    	
		console.log(result);
         
    	 for(var i = 0; i < result.length; i++){
    		 
    		 var time = result[i].payment_date;
    		 var date = new Date(time);
    		 var dateTime = date.getFullYear()+ "/ "+ (date.getMonth()+1)+"/ "+date.getDate()
    		 data.addRow([dateTime, result[i].buyProduct_totPrice]);
    	 }
    	 
    	 
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1]);

      var options = {
        title: "????????? ??????",
        width: 800,
        height: 400,
        bar: {groupWidth: "50%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
    
    $(function(){
    	
    	let obj = JSON.stringify("${selectDate}");
    	var dateArray = new Array();
    	let price11 = ("${selectDate[0].buyProduct_totPrice}");
    	for(var i = 0; i < 2; i++){
    		dateArray.push("${selectDate[i].buyProduct_totPrice}");
    	}
    	console.log(dateArray);
    	console.log(obj);
    	console.log("${selectDate}");
//     	console.log(Object.entries(obj));
//     	console.log(${selectDate});
//     	google.charts.setOnLoadCallback(drawChart(${selectDate})
    	defaultDate();
    });
  </script>
</head>
<body>
<div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
<div id="main-wrapper">
	<!-- ?????? -->
	<%@ include file="adminTop.jsp" %>
	<!-- ???????????? -->
	<%@ include file="adminAside.jsp" %>
	
	<div class="page-wrapper">
	<div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">??????</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
	<!-- ?????? ??????  -->
	<div class="container-fluid">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">?????? ??????</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">?????? ??????</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">?????? ??????</a>
    </li>
   
  </ul>
</nav>

<form action="selectDate" onsubmit="return checkDate();" method="get">
<div style="margin-top: 50px;height:150px;background-color:#ddd;" >
	<table class="table table-bordered h-25">
    <thead>
      <tr style="height:80px;background-color:#ddd;margin-top: 50px">
        <td style="vertical-align: middle;text-align: center" class="w-25">??????</td>
        <td style="vertical-align: middle;text-align: left">  <div class="btn-group btn-group-lg">
    <button type="button" class="btn btn-primary" id="1" onclick='testAjax(this);'>??????</button>
    <button type="button" class="btn btn-primary" id="3" onclick='testAjax(this);'>3???</button>
    <button type="button" class="btn btn-primary" id="7" onclick='testAjax(this);'>7???</button>
    <button type="button" class="btn btn-primary" id="30" onclick='testAjax(this);'>30???</button>
    <button type="button" class="btn btn-primary" id="90" onclick='testAjax(this);'>90???</button>
    <input type="hidden" id="hidVal" value="1"/>
    <input type="date" style="margin-left:10px;margin-right: 10px" id = "startDate" name="startDate" onchange="changeStartDate();"> ~ 
    <input type="date" style="margin-left:10px;margin-right: 10px" id="endDate" name="endDate" onchange="changeDate();"/>
    
  </div>
  </td>
        
      </tr>
    </thead>
   
  </table>
  <input type="submit" class="btn btn-primary btn-lg" style="position: absolute; left: 50%; " value="??????"/>
</div>
</form>
<div>
	<div id="columnchart_values" style="width: 100%; height: 300px;"></div>
</div>
	</div>
	<!-- ?????? ?????? ???  -->
     <%@ include file="adminFooter.jsp" %>    
     <%@ include file="adminJs.jsp" %> 
	</div>
	
</div>
 
</body>
</html>