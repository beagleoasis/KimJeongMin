		let index = 0;
		let notices = new Array();
		
	$(function(){
				$.getJSON("/board/notice/listall", function(data){
				$(data).each(function(index, item){
					notices.push("<a href='/board/notice/read?no=" + item.board_no + "&page=1'>" + item.board_title + "<a>");
					
				});
			});
			setInterval(rolling(), 500);
		});
			
		function rolling() {
		
		$("#rollNot").fadeOut(
				3000,function() {
				for (let j = 0; j < 10; j++) {
					if (index == j) {
						$("#rollNot").html(notices[j - 1]).fadeIn(3000);
					};
				};
				index++;
				rolling();
				if (index >= notices.length) {
					index = 0;
				}
			});
					
		$(".row").on("click", ".heartIcon", function() {
			fix(this);
		});
	
		$(".row").on("click", ".commentIcon", function() {
			fix2(this);
		});
					
	}


