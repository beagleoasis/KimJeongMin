	
	
	function checkPage() {
	    let url = location.href; //url주소
	    let ispage = url.indexOf("page=");
	    console.log(url);
	     if(ispage == -1){
			 location.href = url + "&page=1";
		 }  
	}
  