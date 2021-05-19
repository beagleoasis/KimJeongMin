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
	
	function calcIncrease() {
		let thisMonthRevenue = $("#thisMonthRevenue").text();
		let prevMonthRevenue = $("#prevMonthRevenue").text();
		let thisMonthRefund = $("#thisMonthRefund").text();
		let prevMonthRefund = $("#prevMonthRefund").text();
		let calcThisMonth = thisMonthRevenue - thisMonthRefund;
		let calcPrevMonth = prevMonthRevenue - prevMonthRefund;
		$("#calcThisMonth").text(calcThisMonth);
		$("#calcPrevMonth").text(calcPrevMonth);
		let revenuePercent = Math.round((thisMonthRevenue - prevMonthRevenue) / prevMonthRevenue * 100);
		let refundPercent =  Math.round((thisMonthRefund - prevMonthRefund) /prevMonthRefund * 100);
		let pureRevPercent =  Math.round((calcThisMonth - calcPrevMonth) / calcPrevMonth * 100);
		console.log(100 / 0);
		
		if(isNaN(revenuePercent)){
			$("#revenuePercent").html("<span>0</span><span>%</span>");
			
		}else if(revenuePercent > 0){
			$("#revenuePercent").html("<span style='color:red'>"+ revenuePercent  +"</span><span style='color:red'>%</span>");
		}else if(revenuePercent < 0){
			$("#revenuePercent").html("<span style='color:blue'>-"+ revenuePercent  +"</span><span style='color:blue'>%</span>");
		}else if(isFinite(revenuePercent)){
			$("#revenuePercent").html("<span style='color:red'>Infinity</span><span style='color:red'>%</span>");
		}
		
		if(isNaN(refundPercent)){
			$("#refundPercent").html("<span>0</span><span>%</span>");
		}else if(revenuePercent > 0){
			$("#revenuePercent").html("<span style='color:red'>"+ refundPercent  +"</span><span style='color:red'>%</span>");
		}else if(revenuePercent < 0){
			$("#revenuePercent").html("<span style='color:blue'>-"+ refundPercent  +"</span><span style='color:blue'>%</span>");
		}else if(isFinite(refundPercent)){
			$("#revenuePercent").html("<span style='color:red'>Infinity</span><span style='color:red'>%</span>");
		}
		
		if(isNaN(pureRevPercent)){
			$("#pureRevPercent").html("<span>0</span><span>%</span>");
		}else if(pureRevPercent > 0){
			$("#pureRevPercent").html("<span style='color:red'>"+ pureRevPercent  +"</span><span style='color:red'>%</span>");
		}else if(pureRevPercent < 0){
			$("#pureRevPercent").html("<span style='color:blue'>-"+ pureRevPercent  +"</span><span style='color:blue'>%</span>");
		}else if(isFinite(pureRevPercent)){
			$("#pureRevPercent").html("<span style='color:red'>Infinity</span><span style='color:red'>%</span>");
		}
		
	}
	
	
	function revenueMonthlys(){
		revenueMonthly = $("#revenueMonthly").val()
		console.log(revenueMonthly);
		 $.ajax({
	  			type : "get",
	  			dataType : "json", // 받을 데이터
	  			//contentType : "application/json", // 보낼 데이터, json 밑에 데이터를 제이슨으로 보냈기 때문에
	  			url : "revenue/selectMonthly",// 서블릿 주소
	  			data : {revenueMonthly : revenueMonthly},
	  			success : function(result) {
	  				if (result != null) {
	  					console.log(result);
	  					window.setTimeout(200);
	  					google.charts.setOnLoadCallback(drawChart(result));
	  				}
	  				
	  				
	  			}, // 통신 성공시
	  			error : function(result) {
	  				
	  			}, // 통신 실패시
	  			complete : function(result) {
	  				console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	  				console.log(result);
//	   				if(result != null){
	  					
//	   				}
	  				
	  				
	  			} // 통신 완료시
	  		});
		
	}
	
function drawChart(result) {
    	
    	var data = new google.visualization.DataTable();
    	data.addColumn('string', '연도');
    	data.addColumn('number', '금액');
    	 
    	
    	
		console.log(result);
         
    	 for(var i = 0; i < result.length; i++){
    		 
    		 var time = result[i].payment_date;
    		 var date = new Date(time);
    		 var dateTime = date.getFullYear()+ "/ "+ (date.getMonth()+1);
    		
    		 data.addRow([dateTime, result[i].buyProduct_totPrice]);
    	 }
    	 
    	 
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1]);

      var options = {
        title: "일자별 매출",
        width: 800,
        height: 400,
        bar: {groupWidth: "50%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
$(function(){
	calcIncrease();
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
	<!-- 헤더 -->
	<%@ include file="adminTop.jsp" %>
	<!-- 어사이드 -->
	<%@ include file="adminAside.jsp" %>
	
	<div class="page-wrapper">
	<div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">매출</h4>
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
	<!-- 본문 작성  -->
	<div class="container-fluid">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="/admin/revenue">일별 매출</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/admin/revenueWeekly">주별 매출</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/admin/revenueMonthly">월별 매출</a>
    </li>
   
  </ul>
</nav>


<div style="margin-top: 50px;height:150px;background-color:#ddd;" >
	<table class="table table-bordered h-25">
    <thead>
      <tr style="height:80px;background-color:#ddd;margin-top: 50px">
        <td style="vertical-align: middle;text-align: center" class="w-25">기간</td>
        <td style="vertical-align: middle;text-align: left">  <div class="btn-group btn-group-lg">
   
   <select style="width: 100px" name="revenueMonthly" id="revenueMonthly">
   		<option value="1">1</option>
   		<option value="2">2</option>
   		<option value="3">3</option>
   		<option value="4">4</option>
   		<option value="5">5</option>
   		<option value="6">6</option>
   		<option value="7">7</option>
   		<option value="8">8</option>
   		<option value="9">9</option>
   		<option value="10">10</option>
   		<option value="11">11</option>
   		<option value="12">12</option>
   </select>
    <span style="margin-left: 20px">개월 전</span>
  </div>
  </td>
        
      </tr>
    </thead>
   
  </table>
  <input type="button" class="btn btn-primary btn-lg" style="position: absolute; left: 50%; " value="검색" onclick="revenueMonthlys();"/>
</div>

<div>
	<div id="columnchart_values" style="width: 100%; height: 300px;"></div>
</div>
<div style="margin-bottom: 120px"></div>
<%-- <div style="margin-top: 20px">
	<h2>증감 추이</h2>
	<div style="border: 1px;">
		<table class="table table-bordered" style="text-align: center;">
			<thead>
				<tr>
					<th>기간</th>
					<th colspan="2">결제합계</th>
					<th colspan="2">환불합계</th>
					<th colspan="2">순 매출</th>
				</tr>
			</thead>
			<tbody style="background-color: white;">
				<tr>
					<td>금월</td>
					<td id="thisMonthRevenue"><c:choose>
						<c:when test="${thisMonthRevenue == null }">
							0
						</c:when>
						<c:when test="${thisMonthRevenue != null }">
							${thisMonthRevenue.buyProduct_totPrice }
						</c:when>
					</c:choose> </td>
					<td rowspan="2" style="vertical-align: middle;" id="revenuePercent"></td>
					<td id="thisMonthRefund"><c:choose>
						<c:when test="${thisMonthRefund == null }">
							0
						</c:when>
						<c:when test="${thisMonthRefund != null }">
							${thisMonthRefund.buyProduct_totPrice }
						</c:when>
					</c:choose></td>
					<td rowspan="2" style="vertical-align: middle;" id="refundPercent"></td>
					<td id="calcThisMonth"></td>
					<td rowspan="2" style="vertical-align: middle;" id="pureRevPercent"></td>
		</tr>
		<tr>
			<td>전월</td>
			<td id="prevMonthRevenue"><c:choose>
						<c:when test="${prevMonthRevenue == null }">
							0
						</c:when>
						<c:when test="${prevMonthRevenue != null }">
							${prevMonthRevenue.buyProduct_totPrice }
						</c:when>
					</c:choose></td>
			<td id="prevMonthRefund"><c:choose>
						<c:when test="${prevMonthRefund == null }">
							0
						</c:when>
						<c:when test="${prevMonthRefund != null }">
							${prevMonthRefund.buyProduct_totPrice }
						</c:when>
					</c:choose></td>
			<td id="calcPrevMonth"></td>
		</tr>
			</tbody>
		</table>
	</div>
	
</div> --%>
<!-- <div style="margin-top: 30px">
	<h2>월별 통계</h2>
	<table class="table table-bordered" style="text-align: center;">
		<thead>
			<tr>
				<th rowspan="2">일자</th>
				<th colspan="3">결제완료 주문</th>
				<th rowspan="2">결제합계</th>
				<th rowspan="2">환불합계</th>
				<th rowspan="2">순매출</th>
			</tr>
			<tr>
				<th>주문수</th>
				<th>품목수</th>
				<th>상품구매금액</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
</div> -->
	</div>
	<!-- 본문 작성 끝  -->
     <%@ include file="adminFooter.jsp" %>    
     <%@ include file="adminJs.jsp" %> 
	</div>
	
</div>
 
</body>
</html>