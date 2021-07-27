$(function(){
	
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
	
	
	
	
	
	$('#selectColor > div label').click(function(){
		var color = $(this).attr('for')
		location.href = 'buyList.giv?color='+color;
	})
	
	
	// 상품 정렬순서 클릭 시 
	$('#sorting').change(function(){
		var sorting = $('#sorting option:selected').val();
		
		if(sorting == 1){
			sorting = 'good_date DESC';
		}else if(sorting == 2){
			sorting = 'good_price DESC';
		}else if(sorting == 3){
			sorting = 'good_price';
		}else{
			sorting = 'good_date DESC'
		}
		
		
		location.href = 'buyList.giv?sorting='+sorting;	
	
	})
		
		$('#imgCursor').css("cursor","pointer");
		

	
})