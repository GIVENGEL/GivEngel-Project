$(function(){
	
	$('#submitBtn').click(function(){
		
		var pattern_num = /[0-9]/;	// 숫자 
		var pattern_eng = /[a-zA-Z]/;	// 문자 
		var pattern_spc = /[~!@#$%^&*_+|<>?:{}]/; // 특수문자
		var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
		
		 if($('#flea_title').val() == ""){
	           alert("상품명을 입력해주세요");
	           return false;
	           
		 }
		 
		 if(pattern_spc.test($('#flea_title').val())) {
	    	  alert("제목에 특수문자를 입력할 수 없습니다.")
	    	  return false;
	      }
		 
		 if(!pattern_num.test($('#flea_price').val())){
	           alert("가격을 정확히 입력해주세요");
	           return false;
	     }
		 
		 if($('#flea_price').val()==""){
	           alert("가격을 입력해주세요");
	           return false;
	     }
		 
		if(!$("input:checked[id='diff-acc']").is(":checked")) {
	         alert("모든 항목에 동의해주세요");
	         return false;
	      }
	      
	    if(!$("input:checked[id='acc']").is(":checked")) {
	         alert("모든 항목에 동의해주세요");
	         return false;
	      }
		
	      if($('#file').val() == ""){
	           alert("한장 이상의 이미지를 업로드해주세요");
	           return false;    
	      }
	      
	      if($('#user_pw').val() != $('#password').val()) {
		         alert("비밀번호를 확인해주세요");
		         return false;
		      }
	      
	      else {
	         alert("물품등록 되었습니다. 판매확정은 2~3일 소요될 수 있습니다. 감사합니다.");
	      }   
	      
	   }) // submitBtn end
	   
	   
	   
	// 게시물 삭제------------------------------------------------------------------
		
		
		$('#deleteFleaBtn').click(function(){
			
			alert("정말로 삭제하시겠습니까?")
			
			$.ajax({
				type : 'post',
				url : 'deleteFleaView.giv',
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				data : {
					flea_no : $('#flea_no').val()
				},
				success : function() {
					alert("삭제되었습니다.");
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
		$('#cartFleaBtn').click(function(){
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
					$('#countFleaComTotal').text('리뷰 (' + (parseInt($('#countFleaCom').val()) + 1) + '개)');
					listFleaCom();
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
					$('#listFleaCom').empty();
					
					
					
					for(i=0; i<data.listFleaCom.length; i++) {	
						$('#listFleaCom').append('<div class="card p-3 mb-5"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-center"><img src="https://i.imgur.com/hczKIze.jpg"width="30"class="user-img rounded-circle mr-2"><div class="fleaComWriter"><small class="font-weight-bold text-primary">'+data.listFleaCom[i].flea_com_writer+'</small></div><small class="font-weight-bold">'+data.listFleaCom[i].flea_com_content+'</small></div><small>'+data.listFleaCom[i].flea_com_date+'</small></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div style="float:left"><input type="button"class="modifyFleaComBtn"value="수정"><input type="button"class="deleteFleaComBtn"style="margin-left:7px"value="삭제"></div><div style="display: none">'+data.listFleaCom[i].flea_com_no+'</div></div></div>');
						
						//$('#listFleaCom').append('');

					} // for

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
						$('#countFleaComTotal').text('리뷰 (' + (parseInt($('#countFleaCom').val()) - 1) + '개)');
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
							listFleaCom();
							} // ajax seuccess
						
					}) // ajax	
					
				})
			}
		
			
		})
		
		
		
		// ---------------------------------------------------------------
		
			$('.product__pagination a:visited').css({
				'background': '#7fad39',
				'border-color': '#7fad39',
				'color': '#ffffff'
			})
			
			
			
			
			

		
		

	
	
	
	
})