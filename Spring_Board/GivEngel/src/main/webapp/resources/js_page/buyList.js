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
	
	
		$(function(){
		$('#keywordBtn').click(function(){
			var keyword = $('#keyword').val()
			alert(keyword)
			location.href('buyList.giv?keyword='+keyword);
		})
		
	})
	
	
	
	
	$('#selectColor > div label').click(function(){
		var color = $(this).attr('for')
		location.href = 'buyList.giv?color='+color;
	})
	
	
	$('#sorting').change(function(){
		var sorting = $('#sorting option:selected').val();
		
		if(sorting == 1){
			sorting = 'DESC';
		}else{
			sorting = '';
		}		
			
		location.href = 'buyList.giv?sorting='+sorting;	
		
			
		})
		
		$('#imgCursor').css("cursor","pointer");
		

	
})