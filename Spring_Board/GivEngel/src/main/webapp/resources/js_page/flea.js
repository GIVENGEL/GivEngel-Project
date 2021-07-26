$(function(){
	
	alert("개발시작");

	
	
	$('#submitBtn').click(function(){
		
		if($('#flea_title').val() == ""){
	        alert("상품명을 입력해주세요");
	        return false;
	      }		
		else if($('#flea_price').val() == ""){
	        alert("가격을 입력해주세요");
	        return false;
	      }		
		else if($('#flea_content').val() == ""){
	        alert("내용을 입력해주세요");
	        return false;
	      }
		else if(!$("input:checked[id='diff-acc']").is(":checked")) {
			alert("모든 항목에 동의해주세요");
			return false;
		}
		else if(!$("input:checked[id='acc']").is(":checked")) {
			alert("모든 항목에 동의해주세요");
			return false;
		}
		else if($('#user_pw').val() != $('#password').val()) {
			alert("비밀번호를 확인해주세요");
			return false;
		}
		else {
			alert("성공");
		}	
		
	}) // submitBtn end
	
	
	
	// 게시물 삭제------------------------------------------------------------------
	
	
	$('#deleteFleaBtn').click(function(){
		
		$.ajax({
			type : 'post',
			url : 'deleteFleaView.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				flea_no : $('#flea_no').val()
			},
			success : function() {
				alert("삭제되었습니다");
				location.replace("fleaBoard.giv");
			}
			
		}) // ajax
	
	});
	
	
	// 파일업로드 이미지 미리보기 -----------------------------------------------------------
	
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#inputImage').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(":input[name='file']").change(function() {
		if( $(":input[name='file']").val() == '' ) {
			$('#inputImage').attr('src' , '');  
		}
		$('#inputImageView').css({ 'display' : '' });
		readURL(this);
	});
	
	
	
	// 구매하기 버튼 누를때 -------------------------------------------------------------------------
	
	$('#buyFleaBtn').click(function(){
		alert("구매가능한 시즌이 아닙니다. 조금만 기다려 주세요.");
	})
	
	
	
	// 댓글입력 -------------------------------------------------------------------------------------------------------
	
	$('#sponComBtn').click(function(){
		
		$.ajax({
			type : 'post',
			url : 'saveFleaCom.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				flea_no : $('#flea_no').val(),
				flea_com_content : $('#flea_com_content').val(),
				flea_com_writer : $('#flea_com_writer').val()
			},
			success : function() {
				alert("댓글이 입력되었습니다");
				location.reload();
				} // seuccess
			
		}) // ajax
		
	}) // click
	
	
	
// 댓글 목록 -------------------------------------------------------------------------------------------------------
	
	function listFleaCom() {
		
	$.ajax({
			type : 'post',
			url : 'listFleaCom.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			data : {
				flea_no : $('#flea_no').val()
			},
			success : function(data) {
				$('#listFleaCom').empty;
				for(i=0; i<data.listFleaCom.length; i++) {	
					$('#listFleaCom').append('<div class="card p-3 mb-5"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-center"><img src="https://i.imgur.com/hczKIze.jpg"width="30"class="user-img rounded-circle mr-2"><div class="fleaComWriter"><small class="font-weight-bold text-primary">'+data.listFleaCom[i].flea_com_writer+'</small></div><small class="font-weight-bold">'+data.listFleaCom[i].flea_com_content+'</small></div><small>'+data.listFleaCom[i].flea_com_date+'</small></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div style="float:left"><input type="button"class="modifyFleaComBtn"value="수정"><input type="button"class="deleteFleaComBtn"style="margin-left:7px"value="삭제"></div><div style="display: none">'+data.listFleaCom[i].flea_com_no+'</div></div></div>');
					
					//$('#listFleaCom').append('');

				} // for
				$('.countSponCom').append('응원댓글 ( ' + data.count + '개)');
				$('#countSponCom2').append( data.count + '개');;
			}, // success
			error:function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		}); //ajax
	}
	
	listFleaCom();
	
	
	
	
// 댓글 삭제 -----------------------------------------------------------------------------------------------
	
	
	$(document).on('click','.deleteFleaComBtn',function(){
		
		if($('#user_id').val() == null) {
			alert("로그인이 필요합니다.");
		} else {
			
			$.ajax({
				type : 'post',
				url : 'deleteFleaCom.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				data : {
					flea_com_no : $(this).parent().next().text()
				},
				success : function() {
					alert("댓글이 삭제 되었습니다.");
					location.reload();
					} // seuccess
			}); // ajax	
			
		}
		
	}) // click
	
	
	
	
	
// 댓글 수정 -----------------------------------------------------------------------------------------------
	
	
	$(document).on('click','.modifyFleaComBtn',function(){
		
		if( $('#user_id').val() != $(this).parent().parent().prev().children().children().next('.fleaComWriter').text() ) {
			alert("아이디를 확인해주세요!");
		}
		else {
			
			var text = $(this).parent().parent().prev().children().children().next().next().text();
			var num = $(this).parent().next().text();
			
			$(this).parent().parent().replaceWith('<textarea class="form-control"id="editFleaCom"name="Flea_com_content"rows="3">'+ text +'</textarea><div style="float:left"><input type="button"class="saveFleaComBtn"value="수정"></div><div style="display: none">'+ num +'</div>');
			//$(this).parent().replaceWith('');
			
			$('#editFleaCom').focus();
			
			$(document).on('click', '.saveFleaComBtn', function(){
				
				$.ajax({
					type : 'post',
					url : 'modifyFleaCom.giv',
					contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
					data : {
						flea_com_no : num,
						flea_com_content : $('#editFleaCom').val()
					},
					success : function() {
						alert("댓글이 수정되었습니다");
						location.reload();
						} // ajax seuccess
					
				}) // ajax	
				
			})
		}
	
		
		
		
	
		
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})

