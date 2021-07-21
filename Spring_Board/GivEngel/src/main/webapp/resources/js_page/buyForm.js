$(function(){
	

	var good_no = getParameter("good_no");
	alert(good_no);
	
	
//	김민주
//	카테고리의 링크 클릭시 각 베너에 맞게 파라매터 전송
	$('#categories li a').click(function(){
		var categories = $(this).text();
		if(categories == '전체 상품'){
			$(this).attr('href','buyList.giv');
		}else{
			$(this).attr('href','buyList.giv?categories='+categories);			
		}
	})
	

	
	
		

	
})