$(function() {

	// 로그인 안했을때
	$('#donationBtn_notlogin').click(function() {
		alert("로그인이 필요합니다");
	});

	$('#donationBox_notlogin').click(function() {
		alert("로그인이 필요합니다");
	});

	
	// 로그인
	$('#donationBtn').click(function() {
		var price = $("#donationBox").val();
		
		if($('user_cash') > 0) {
		$.ajax({
			type : 'post',
			url : 'addCashLog.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				user_no : $('#user_no').val(),
				user_cashlog_log : '후원단체 후원',
				user_cashlog_price : price								
			},
			success : function() {
				alert("후원해주셔서 감사합니다");
				
				$.ajax({
					type : 'post',
					url : 'minusCash.giv',
					contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
					data : {
						user_cash : $('user_cash').val(),
						user_cashlog_price : price,
						user_no : $('#user_no').val()
					},
					success : function() {
						alert("성공!");
					}
				})
			},
			error:function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		});
		
		}
		
	});

	
	// 댓글 입력
	$('#sponComBtn').click(function() {
		$.ajax({
			type : 'post',
			url : 'saveSponsorCom.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				spon_no : $('spon_no').val(),
				spon_com_content : $('#spon_com_content').val(),
				spon_com_writer : $('#spon_com_writer').val()
			},
			success : function() {
				alert("댓글이 입력되었습니다");
				location.reload();
			}
		});
	});
	
	
	// 댓글 삭제하기
	$('#deleteSponCom').click(function() {
		$.ajax({
			type : 'post',
			url : 'deleteSponCom.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				spon_com_no : $('spon_com_no').val()
			},
			success : function() {
				alert("댓글이 삭제되었습니다");
				location.reload();	
			}
		});
	});
	
	
	
	
	
	
	
	
})
