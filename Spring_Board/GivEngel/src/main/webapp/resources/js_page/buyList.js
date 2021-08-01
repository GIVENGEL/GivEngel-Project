$(function(){
	
//	김민주

	
	
	
	
	

	
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