  
  function changeView(getVal){
		
			if(getVal == 'active'){
				$("#active").css('color','blue');
				$("#completed").css('color','#777');
				$("#clickAll").css('color','#777');
				$('li[name=noncheckedList]').css('display','');
				$('li[name=checkedCompleted]').css('display','none');
			}else if(getVal == 'completed'){
				$("#active").css('color','#777');
				$("#completed").css('color','blue');
				$("#clickAll").css('color','#777');
				$('li[name=checkedCompleted]').css('display','');
				$('li[name=noncheckedList]').css('display','none');
			}else if(getVal == 'all'){
			$("#active").css('color','#777');
				$("#completed").css('color','#777');
				$("#clickAll").css('color','blue');
				$('li[name=checkedCompleted]').css('display','');
				$('li[name=noncheckedList]').css('display','');
			}
		}
	
	function deleteAll(){
		
		noncheckedCnt = 0;
			if(checkedCnt != 0){
				$.ajax({
			 		type: "POST", // method(토신 방식, get / post)
			 		dataType: "text", // 응답을 어떤 형식으로 받을지	
			 		url: "/myPage/checkList/ajax/deleteAll/" + member_id, // 서블릿 주소
			 		headers: {	// 요청 하는 데이터의 헤더에 전송
						"Content-Type" : "application/json"
					},success: function(data){
						getAjaxCheckListAll();
				     }, 
			 	 // 통신 성공시
			 		error: function(data){
			 			
			 		}, // 통신 실패시
			 		complete: function(data){
			 		} // 통신 완료시
			 	});	
			};
		}
	
	function deleteThis(checkList_no){
		checkedCnt = 0;
		noncheckedCnt = 0;
		
		$.ajax({
	 		type: "get", // method(토신 방식, get / post)
	 		dataType: "text", // 응답을 어떤 형식으로 받을지	
	 		url: "/myPage/checkList/ajax/deleteThis/" + checkList_no, // 서블릿 주소
	 		headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
			},success: function(data){
				getAjaxCheckListAll();
	 		
	 	}, // 통신 성공시
	 		error: function(data){     
	 		}, // 통신 실패시
	 		complete: function(data){
	 		} // 통신 완료시
	 	});
	}
	
	
	
	
	
	
	function enterkey() {
	    if (window.event.keyCode == 13) {
	    
	   let checkLength = $(".checkListInputBox").val();
	   		let totChkCnt = checkedCnt + noncheckedCnt;
	   		
	    	if($(".checkListInputBox").val() == ""){
	    		alert("내용을 입력해주세요.");
	    	}else if(checkLength.length >= 27){
	    		alert("글자수는 최대 26자까지 가능합니다.");
	    	}else if(totChkCnt >= 10){
	    	 	alert("최대 10개 까지만 등록 가능합니다.");
	    	}else{
	    		checkedCnt = 0;
	    		noncheckedCnt = 0;
	    		let member_id = $("#checkListmember_id").val();
		    	let checkList_content = $(".checkListInputBox").val();
		 
				$.ajax({
					method: "post",
					url: "/myPage/checkList/ajax/saveList/",
					headers: {	// 요청 하는 데이터의 헤더에 전송
					"Content-Type" : "application/json"
					},
					dataType: "text", // 응답 받는 데이터 타입
					data : JSON.stringify({	// 요청하는 데이터
						member_id : member_id,
						checkList_content : checkList_content
					}),
					success : function(result){
							$(".checkListInputBox").val("");
							
							getAjaxCheckListAll();
					}
				});
		 	}
	    }
	}

	function changeCheck(checkList_no){
		checkList_checked = $("#checkcheck" + checkList_no).val();
		checkedCnt = 0;
		noncheckedCnt = 0;
		
		$.ajax({
	 		type: "get", // method(토신 방식, get / post)
	 		dataType: "text", // 응답을 어떤 형식으로 받을지	
	 		url: "/myPage/checkList/ajax/change/" + checkList_checked  + "/" + checkList_no, // 서블릿 주소
	 		headers: {	// 요청 하는 데이터의 헤더에 전송
				"Content-Type" : "application/json"
			},success: function(data){
				getAjaxCheckListAll();
	 		
	 	}, // 통신 성공시
	 		error: function(data){     
	 		}, // 통신 실패시
	 		complete: function(data){
	 		} // 통신 완료시
	 	});
	}
	

		
		
	function getAjaxCheckListAll(){
	
	$.getJSON("/myPage/checkList/ajax/" + member_id, function(data){
	
		output = "";
		output += "<ul class='listCheck'>"
		
		if(data == null){
			
			alert("없습니다.");
			
			}
	
		
		$(data).each(function(index, item){
			let R = Math.floor(Math.random()*255);
			let G = Math.floor(Math.random()*255);
			let B = Math.floor(Math.random()*255);
			
						
			
			if(this.checkList_checked == 'Y'){
				output += "<li name='checkedCompleted'><div><div style='display: contents;'><img style='width:30px; height:30px; margin-right:20px; margin-bottom: -1px; cursor:pointer;' src='../../resources/img/check1.png' id='check_box" + this.checkList_no + "' onclick='changeCheck(" + this.checkList_no + ");' /></div><label for='check_box" + this.checkList_no + "'></label><input id='checkcheck" + this.checkList_no + "' type='hidden' value='" + this.checkList_checked + "'><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span></div><img onclick='deleteThis(" + this.checkList_no + ")' style='float:right; margin: -20px 5px 0px 0px; width:20px; height:20px;' src='../../resources/img/x.png'/></li>";
				checkedCnt++;
				
			}else{
				output += "<li name='noncheckedList'><div><div style='display: contents;'><img style='width:30px; margin-bottom: -1px; height:30px; margin-right:20px; cursor:pointer;' src='../../resources/img/noncheck.png' id='check_box" + this.checkList_no + "' onclick='changeCheck(" + this.checkList_no + ");' /></div><label for='check_box" + this.checkList_no + "'></label><input id='checkcheck" + this.checkList_no + "' type='hidden' value='" + this.checkList_checked + "'><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span></div><img onclick='deleteThis(" + this.checkList_no + ")' style='float:right; margin: -20px 5px 0px 0px; width:20px; height:20px;' src='../../resources/img/x.png'/></li>";
				noncheckedCnt++;
			}
			
//				output += "<li><label for='check_box'><div><img name='checkimg'style='width:30px; height:30px; margin-right:20px;' src='../../resources/img/noncheck.png'></div><input type='checkbox' id='check_box" + this.checkList_no + "'/></label><input id='listno" + this.checkList_no + "' type='hidden' value='" + this.checkList_no + "'><span style='color: rgb(" + R + "," +  G + "," + B + ")'>" + this.checkList_content + "</span><span>"  + this.checkList_checked + "</span></li>";
		});
		output += "<li style='border-bottom-style:outset; line-height: 35px; border-bottom-width: thick;'><span id='noncheckCnt'></span>" + noncheckedCnt + "items left<ul id='changeView_ul' class='filters'><li id='clickAll' style='font-weight: bolder; color:blue;' onclick='changeView(\"all\");' >All</li><li id='active' onclick='changeView(\"active\")'>Active</li><li id='completed' onclick='changeView(\"completed\");' >Completed</li><li  onclick='deleteAll();' style='margin-left: 60px;'>Clear completed</li></ul></li>";
		output += "</ul>";
	    
			$("#inputTodo").html (output);
			
		});
	}
	
	function printClock() {
              
              var clock = document.getElementById("clock");            // 출력할 장소 선택
              var amPmView = document.getElementById("amPmView"); // AM, PM 표시
              var currentDate = new Date();                                     // 현재시간
              var week = new Array('일', '월', '화', '수', '목', '금', '토')
              var calendar = currentDate.getFullYear() + "년 " + (currentDate.getMonth()+1) + "월 " + currentDate.getDate() + "일 " + week[currentDate.getDay()] + "요일"; // 현재 날짜
              
              var amPm = 'AM'; // 초기값 AM
           	  var currentHours = addZeros(currentDate.getHours(),2); 
              var currentMinute = addZeros(currentDate.getMinutes() ,2);
              var currentSeconds =  addZeros(currentDate.getSeconds(),2);
              
              if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
                amPm = 'PM';
                currentHours = addZeros(currentHours - 12,2);
              }
              days.innerHTML = calendar;
              if(currentSeconds >= 50){
                 currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
              }
              clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +"&nbsp;<span style='font-size:50px;'>"+ amPm+"</span>";           // 현재시간을 출력
              
              setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
          }
          
          function addZeros(num, digit) { // 자릿수 맞춰주기
              var zero = '';
              num = num.toString();
              if (num.length < digit) {
                for (i = 0; i < digit - num.length; i++) {
                  zero += '0';
                }
              }
              return zero + num;
          }
           
           
	
	