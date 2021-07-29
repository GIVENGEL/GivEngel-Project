$(function() {
	alert("개발 시작");
	
	$('#donationBtn_notlogin').click(function() {
		alert("로그인이 필요합니다");
		location.replace("loginForm.giv");
	});

	$('#donationBox_notlogin').click(function() {
		alert("로그인이 필요합니다");
		location.replace("loginForm.giv");
	});
	
	
	// 후원하기 클릭시 마일리지차감, 사용내역에 저장, 후원단체 금액 누적 -------------------------------------------------------

	$('#donationBtn').click(function(){
		
		if( $('#user_cashlog_price').val() > $('#user_cash').val() ) { // 입력한 금액이 유저의 마일리지보다 크다면
			$('#guideText').text('마일리지가 부족합니다');
			$('#guideText').css('color', 'red');
			//alert("마일리지가 부족합니다");
			//location.reload();
			
		} else {
			
			$.ajax({
				type : 'post',
				url : 'minusCash.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				data : {
					user_no : $('#user_cashlog_price').val(),
					user_id : $('#spon_com_writer').val()
				},
				success : function() {
					
					// 후원금액 사용내역
					$.ajax({
						type : 'post',
						url : 'addCashLog.giv',
						contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
						data : {
							user_no : $('#user_no').val(),
							user_cashlog_log : $('#spon_name').val(),
							user_cashlog_price :  $('#user_cashlog_price').val()								
						},
						success : function() {
							
							// 후원금액 누적하기
							$.ajax({
								type : 'post',
								url : 'addSponsorTotal.giv',
								contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
								data : {
									spon_name : $('#spon_name').val(),
									spon_no : $('#user_cashlog_price').val()
								},
								success : function() {
									alert("후원해주셔서 감사합니다");
									location.reload();
									
								}
							})// ajax
							
						}
						
					})
				}
			})// ajax
			
			
		} //else
		
		
	}); // click
	
	
	// 누적금액 바로 업데이트 ------------------------------------------------------------------
	
	function showSponTotal() {
		$.ajax({
			type : 'post',
			url : 'showSponTotal.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				spon_name : $('#spon_name').val()
			},
			success : function(data) {
				$('#spon_total').append(data.spon_total);
			}
		});
	}
	
	
	
	// 댓글 목록 -------------------------------------------------------------------------------------------------------
	
	function listSponCom() {
		
	$.ajax({
			type : 'post',
			url : 'listSponsorCom.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				spon_no : $('#spon_no').val()
			},
			success : function(data) {
				$('#listSponCom').empty;
				for(i=0; i<data.listSponCom.length; i++) {	
					$('#listSponCom').append('<div class="card p-3 mb-5"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-center"><img src="https://i.imgur.com/hczKIze.jpg"width="30"class="user-img rounded-circle mr-2"><div class="sponComWriter"><small class="font-weight-bold text-primary">'+data.listSponCom[i].spon_com_writer+'</small></div><div><small class="font-weight-bold">'+data.listSponCom[i].spon_com_content+'</small></div></div><small>'+data.listSponCom[i].spon_com_date+'</small></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div style="float:left"><input type="button"class="modifySponComBtn"value="수정"><input type="button"class="deleteSponComBtn"style="margin-left:7px"value="삭제"></div><div style="display: none">'+data.listSponCom[i].spon_com_no+'</div></div></div>');
					
					//$('#listSponCom').append('');
					// $('#listSponCom').append('<div class="card p-3 mb-5"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-center"><img src="https://i.imgur.com/hczKIze.jpg"width="30"class="user-img rounded-circle mr-2"><span><small class="font-weight-bold text-primary">'+data.listSponCom[i].spon_com_writer+'</small></span></div><small>'+data.listSponCom[i].spon_com_date+'</small></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div class="reply px-4"><input type="button"class="deleteSponComBtn"value="삭제하기"><div style="display: none">'+data.listSponCom[i].spon_com_no+'</div><span class="dots"></span><input type="button"class="modifySponComBtn"value="수정하기"><div style="display: none">'+data.listSponCom[i].spon_com_no+'</div><textarea class="sponComBox"style="display:none; width:100%;" row="3"></textarea><input type="button"class="saveSponComBtn"style="display:none"value="확인"><span class="dots"><small class="font-weight-bold">'+data.listSponCom[i].spon_com_content+'</small></span></div><div class="icons align-items-center"><i class="fa fa-star text-warning"></i><i class="fa fa-check-circle-o check-icon"></i></div></div></div>');				
				} // for
				$('#countSponCom').append('총 ' + data.count + '개');
				$('.countSponCom').append('응원댓글 ( ' + data.count + '개)');
				$('#countSponCom2').append( data.count + '개');
			}, // success
			error:function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		}); //ajax
	}
	
	listSponCom();

	
	// 댓글입력 -------------------------------------------------------------------------------------------------------
	$('#sponComBtn').click(function(){
		
		$.ajax({
			type : 'post',
			url : 'saveSponsorCom.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				spon_no : $('#spon_no').val(),
				spon_com_content : $('#spon_com_content').val(),
				spon_com_writer : $('#spon_com_writer').val()
			},
			success : function() {
				alert("댓글이 입력되었습니다");
				location.reload();
				} // seuccess
			
		}) // ajax
		
	}) // click
	
	
	
	
	// 댓글 수정 -----------------------------------------------------------------------------------------------
	
	
	$(document).on('click','.modifySponComBtn',function(){
		
		if( $('#userId').val() != $(this).parent().parent().prev().children().children().next('.sponComWriter').text() ) {
			alert("아이디를 확인해주세요!");
		}
		else {
			
			var text = $(this).parent().parent().prev().children().children().next().next().text();
			var num = $(this).parent().next().text();
			
			$(this).parent().parent().replaceWith('<textarea class="form-control"id="editSponCom"name="spon_com_content"rows="3">'+ text +'</textarea><div style="float:left"><input type="button"class="saveSponComBtn"value="수정"></div><div style="display: none">'+ num +'</div>');
			//$(this).parent().replaceWith('');
			
			$('#editSponCom').focus();
			
			$(document).on('click', '.saveSponComBtn', function(){
				
				$.ajax({
					type : 'post',
					url : 'modifySponCom.giv',
					contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
					data : {
						spon_com_no : num,
						spon_com_content : $('#editSponCom').val()
					},
					success : function() {
						alert("댓글이 수정되었습니다");
						location.reload();
						} // ajax seuccess
					
				}) // ajax	
				
			})
		}
	
		
	
		
	})
	
	
	
		// 댓글 삭제 -----------------------------------------------------------------------------------------------
	
	
	$(document).on('click','.deleteSponComBtn',function(){
		
		var userid = $('#spon_com_writer').val();
		
		if(userid == null) {
			alert("로그인이 필요합니다.");
		} else {
			
			$.ajax({
				type : 'post',
				url : 'deleteSponCom.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				data : {
					spon_com_no : $(this).next().next().text()
				},
				success : function() {
					alert("댓글이 삭제 되었습니다.");
					location.reload();
					} // seuccess
			}); // ajax	
			
		}
		
	}) // click
	
	
	
	// 총 댓글 수 ------------------------------------------------------------------------
	
	function countSponCom() {
		
		$.ajax({
			type : 'post',
				url : 'countSponCom.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				data : {
					spon_no : $('#spon_no')
				},
				success : function(data) {
					
		
					
				}, // seuccess
				
		})
	}
	countSponCom();
	
	
	
	
	
	
})
	
	
	
	
	
	
	
	

