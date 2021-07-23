$(function(){
	
	alert('시발')
	
	
	
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
		var defalutPrice = $('#defalutPrice').text();	// 물품 한개의 가격
		var totalPrice;
		
		
		
		if(buyInt>=goodStock){
			alert('수량을 확인해 주세요');
			$('#buyCntNow').attr('value',buyInt);
			totalPrice = defalutPrice*buyInt;
			$('#totalPrice').text(totalPrice)
			
		}else{
			buyInt = buyInt+1;
			$('#buyCntNow').attr('value',buyInt);
			var goodPrice = $('#totalPrice').text();
			totalPrice = defalutPrice*buyInt;
			$('#totalPrice').text(totalPrice);
		}
	})
	
	$('#minus').css("cursor","pointer").click(function(){
		var buyCntNow = $('#buyCntNow').val();
		var buyInt = parseInt($('#buyCntNow').val()) // 인트형변환
		var goodStock = $('#goodStock').text(); // 재고
		var defalutPrice = $('#defalutPrice').text();	// 물품 한개의 가격
		var totalPrice;
		
		
		if(buyInt <= 1){
			alert('재고가 부족합니다')
			$('#buyCntNow').attr('value',buyInt);
			totalPrice = defalutPrice*buyInt;
			$('#totalPrice').text(totalPrice)
		}else{
			buyInt = buyInt-1;
			$('#buyCntNow').attr('value',buyInt);
			var goodPrice = $('#totalPrice').text();
			totalPrice = defalutPrice*buyInt;
			$('#totalPrice').text(totalPrice);
		}
	})
	
	

	
	
	// 댓글 입력
	$('#goodComBtn').click(function(){
		
		$.ajax({
			type : 'post',
			url : 'checkGoodComPW.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
					 user_no : $('#user_no').val(),
					 user_pw : $('#user_pw').val(),
					},
				success : function(){
					$.ajax({
						type : 'post',
						url : 'saveGoodCom.giv',
						contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
						data : {
								 good_com_writer : $('#good_com_writer').val(),
								 good_no : $('#good_no').val(),
								 good_com_content : $('#good_com_content').val()
								},
					success : function(){
							alert("댓글이 입력되었습니다.");
							location.reload();
							location.href('#tabs-3');
						}
					})
			}, // 유효성검사 실패시
			error : function(data){
				alert('비밀번호를 확인해주세요.')
				$('#user_pw').focus();
			}
			
		})
	})

//	댓글 삭제
	$('#comDelete').css("cursor","pointer").click(function(){
				$.ajax({
					type : 'post',
					url : 'deleteGoodCom.giv',
					contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
					data : {
						good_com_no : $('#com_no').val(),
						user_no : $('#user_no').val()
					},
					success : function(){
						alert("댓글이 삭제되었습니다.");
						location.reload();
						location.href('#tabs-3');
					},
			error : function(data){
				alert('회원님의 게시글이 아닙니다.')
				$('#user_pw').focus();
			}
			
		})
	})
	
	
//	댓글 수정
		$('#comModify').css("cursor","pointer").click(function(){
			alert($('#com_content').val())
				$.ajax({
					type : 'post',
					url : 'modifyGoodCom.giv',
					contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
					data : {
						good_com_no : $('#com_no').val(),
						good_com_content : $('#com_content').val()
					},
					success : function(){
						alert("댓글이 수정되었습니다.");
						location.reload();
						location.href('#tabs-3');
					},
					error : function(){
						alert('수정된 내용이 없습니다.')
					}
				})	
		})
	
//	구매버튼 클릭시 
	
	$('#buyGoodBtn').click(function(){
		var user_no =  $('#user_no').val();
		var good_no =  $('#good_no').val();
		var user_buylog_price = $('#totalPrice').text(); // 총 구입금액
		var buyCnt = $('#buyCntNow').val();
		var good_stock = $('#goodStock').text().trim();
		alert((user_buylog_price * 0.1));
	
		console.log($('#buyCntNow').val());
		console.log($('#goodStock').text());
		
		//수량 확인 후 재고 업데이트
		if(good_stock>=buyCnt){
			// 재고 업데이트 에이작스
			$.ajax({
				type :'post',
				url : 'countGoodStock.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				data : {
					good_no :  good_no,
					good_stock : buyCnt
				},success : function(){
					// 재고업데이트 성공 시 유저 마일리지 적립
					alert("1");
					$.ajax({
						type : 'post',
						url : 'addUserM.giv',
						contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
						data : {
							user_no :  $('#user_no').val(),
							buy_totalPrice : $('#totalPrice').text(),
							good_no :  $('#good_no').val()
						},success : function(){
							// 유저 마일리지 적립 성공시 유저 마일리지 로그 업데이트
							alert("2");
							$.ajax({
								type : 'post',
								url : 'addUserMLog.giv',
								contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
								data : {
									user_no : user_no,
									user_cashlog_log : '상품 구매',
									user_cashlog_price : (user_buylog_price * 0.1)
								},success : function(){
									// 마일리지 로그 성공시 구매로그 업데이트
									alert("3");
									$.ajax({
										type : 'post',
										url : 'addUserBuyLog.giv',
										contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
										data : {
											user_no :  $('#user_no').val(),
											good_no :  $('#good_no').val(),
											user_buylog_price : $('#totalPrice').text()
											},
											success : function(){
												alert("4");
												location.href='buyAfter.giv?user_no='+user_no+'&good_no='+good_no+'&user_buylog_price='+user_buylog_price;
											},error : function(){
												alert('구매 실패');
											}
									})
								}
								
							})
						}
						
					})
				}
			})
		}
		
	})

	
//	구매하기 비로그인시
	$('#buyGoodBtn-notLogin').click(function(){
		alert('로그인이 필요한 서비스입니다.')
		location.href='loginForm.giv'
	})
	
	
//	장바구니담기 비 로그인시
	$('#addCart-notLogin').click(function(){
		alert('로그인이 필요한 서비스입니다.')
		location.href='loginForm.giv'
	})
	
//	이거 -notLogin 지워아햠
	$('#addCart').click(function(){
		// 유저번호
		var user_no = $('#user_no_cart').val();
		alert("user_no :"+user_no);
		// 물품번호
		var good_no = $('#good_no_cart').val();
		alert("good_no : "+good_no);
		// 선택한 수량
		var good_Cnt = $('#buyCntNow').val();
		alert("good_Cnt :"+good_Cnt);
		$.ajax({
			type : 'post',
			url : 'addCart.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				user_no : user_no,
				good_no	: good_no,
				cart_count : good_Cnt
			},
			success : function(){
				alert("장바구니에 추가되었습니다.");
				location.reload();
			},
			error : function(){
				alert('장바구니 오류.')
			}
		})	
		
	})
	
	
		
	
})