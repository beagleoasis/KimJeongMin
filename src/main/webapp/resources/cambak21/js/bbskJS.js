// 글자수 줄임 ...
function textLimit(len) {
	$(".board-title-a").each(function() {
		var length = len; //표시할 글자수 정하기

		$(this).each(function() {
			
			if ($(this).text().length >= length) {
				$(this).text($(this).text().substr(0, length) + '  ...  ')
				//지정할 글자수 이후 표시할 텍스트
			}
		});
	});
};

