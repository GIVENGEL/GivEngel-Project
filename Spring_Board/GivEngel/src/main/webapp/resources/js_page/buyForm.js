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
	

	
	
	// 수량 선택 시 총 가격 산정
	$('#plus').css("cursor","pointer").click(function(){
		var buyCntNow = $('#buyCntNow').val();
		var buyInt = parseInt($('#buyCntNow').val()) // 벨류 인트형변환
		var goodStock = $('#goodStock').text(); // 재고
		var defalutPrice = $('#defalutPrice').text().slice(1).replace(/,/gi,"").trim()	// 물품 한개의 가격
		var totalPrice;
		
		
		
		if(buyInt>=goodStock){
			alert('수량을 확인해 주세요');
			$('#buyCntNow').attr('value',buyInt);
			totalPrice = defalutPrice*buyInt;
			$('#totalPrice').text(totalPrice + " 원")
			
		}else{
			buyInt = buyInt+1;
			$('#buyCntNow').attr('value',buyInt);
			var goodPrice = $('#totalPrice').text();
			totalPrice = defalutPrice*buyInt;
			$('#totalPrice').text(totalPrice + " 원");
		}
	})
	
	$('#minus').css("cursor","pointer").click(function(){
		var buyCntNow = $('#buyCntNow').val();
		var buyInt = parseInt($('#buyCntNow').val()) // 인트형변환
		var goodStock = $('#goodStock').text(); // 재고
		var defalutPrice = $('#defalutPrice').text().slice(1).replace(",","").trim()	// 물품 한개의 가격
		var totalPrice;
		
		
		if(buyInt <= 1){
			alert('수량을 확인해주세요')
			$('#buyCntNow').attr('value',buyInt);
			totalPrice = defalutPrice*buyInt;
			$('#totalPrice').text(totalPrice + " 원")
		}else{
			buyInt = buyInt-1;
			$('#buyCntNow').attr('value',buyInt);
			var goodPrice = $('#totalPrice').text();
			totalPrice = defalutPrice*buyInt;
			$('#totalPrice').text(totalPrice + " 원");
		}
	})
	// 구매수량 ,총가격 end
	
	
	
	
	
	//	구매버튼 클릭시 
	$('#buyGoodBtn').click(function(){
		var good_no =  $('#good_no_cart').val();
		var totalPrice = $('#totalPrice').text().replace("원","").trim(); // 총 구입금액
		var buyCnt = $('#buyCntNow').val();
		var good_stock = $('#goodStock').text().trim();
		
		if(good_stock>=1){
		//  재고 업데이트
			$.ajax({
				type :'post',
				url : 'countGoodStock.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				async: false,
				data : {
					good_no :  good_no,
					good_stock : buyCnt
				}, success : function(result){
					if(result == "1"){
						alert("재고업데이트성공")
					}
				}
				
			})
			
		//  유저 마일리지 적립	
			$.ajax({
				type :'post',
				url : 'addUserM.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				async: false,
				data : {
					good_no :  good_no,
					buy_totalPrice  : totalPrice
				}, success : function(result){
					if(result == "1"){
						alert("마일리지적립 성공")
					}
				}
			})
			
		// 유저 마일리지 로그 업데이트
			$.ajax({
				type :'post',
				url : 'addUserMLog.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				async: false,
				data : {
					user_cashlog_log : '상품 구매',
					user_cashlog_price : totalPrice
				}, success : function(result){
					if(result == "1"){
						alert("마일리지 로그 업데이트 성공")
					}
				}
			})
			
			//구매로그 업데이트
			$.ajax({
				type : 'post',
				url : 'addUserBuyLog.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				async: false,
				data : {
					good_no :  good_no,
					user_buylog_price : totalPrice,
				},success : function(result){
					if(result == "1"){
						alert("구매 로그 업데이트 성공")
						window.location.reload();
					}else{
						alert("로그인이 필요한 서비스입니다.")
						location.href='loginForm.giv'
					}
				}
				
			})
		}else{
			alert("재고가 부족합니다.")
		}
			
			
	})
	// 구매버튼 end
	
	
		
	//	장바구니 추가
	$('#addCart').click(function(){
		// 물품번호
		var good_no = $('#good_no_cart').val();
		// 선택한 수량
		var good_Cnt = $('#buyCntNow').val();
		$.ajax({
			type : 'post',
			url : 'addCart.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				good_no	: good_no,
				cart_count : good_Cnt
			},
			success : function(result){
				if(result == '1'){					
				alert('장바구니 추가 완료');
				}else if(result == '-1'){
					alert('로그인이 필요한 서비스 입니다.');
					location.href='loginForm.giv'
				}
			}
		})	
		
	})
	
	
	
	
	
	// 댓글 입력
	$('#goodComBtn').click(function(){
		$.ajax({
			type : 'post',
			url : 'loginCheckCom.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
					 user_pw : $('#user_pw').val()
					},
				success : function(result){
					if(result == "1"){
					$.ajax({
						type : 'post',
						url : 'saveGoodCom.giv',
						contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
						data : {
								 good_com_writer : $('#good_com_writer').val(),
								 good_no : $('#good_no_cart').val(),
								 good_com_content : $('#good_com_content').val(),
								 loginresult : result	
								},
					success : function(result){
							if(result == "1"){
							alert("댓글이 입력되었습니다.");
							location.reload();
							}else{
								alert("댓글 입력 실패, 로그인 다시")
							}
						}
								
					})
					}else{
						alert('비밀번호를 확인하세요')
						$('#user_pw').focus();
					}
			}
			
			
		})
	})

//	댓글 삭제
	$('.comDelete').css("cursor","pointer").click(function(){
		var com_no =  $(this).parent().parent().parent().parent().find($('.com_no')).val()
				$.ajax({
					type : 'post',
					url : 'deleteGoodCom.giv',
					contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
					data : {
						good_com_no : com_no,
					},
					success : function(result){
						if(result == "1"){
							alert("댓글이 삭제되었습니다.");
							location.reload();
							location.href('#tabs-3');							
						}else{
							alert("삭제 실패.")
						}
					}
			
		})
	})
	
	
//	댓글 수정
		$('.comModify').css("cursor","pointer").click(function(){
			var com_content =  $(this).parent().parent().parent().parent().find($('.com_content')).val()
			var com_no =  $(this).parent().parent().parent().parent().find($('.com_no')).val()
			if(com_content != null){
				$.ajax({
					type : 'post',
					url : 'modifyGoodCom.giv',
					contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
					data : {
						good_com_no : com_no,
						good_com_content : com_content
					},success : function(result){
						if(result == "1"){
							alert("댓글이 수정되었습니다.");
							location.reload();
							location.href('#tabs-3');							
						}else{
							alert("수정 실패.")
						}
					}
				})
			}else{
				alert("댓글을 입력해주세요")
			}
		})
	



	
		
	
})