$(function(){
	
	//비밀번호 변경 클릭시
	let showbtn = true;
	
	$("#pwModifybtn").on('click', function(){
		if(showbtn){  
		$(".pwdShow").css('display',"");
		$(".nickShow").css('display',"none");
		$(".telShow").css('display',"none");
		$(".addrShow").css('display',"none");
		showbtn=false;
		showbtn1=true;
		showbtn2=true;
		showbtn3=true;
		} 
		else if(showbtn==false){
		$(".pwdShow").css('display','none');
		showbtn=true;
		}
	})
	let showbtn1 = true;
	
	//닉네임 변경 클릭시
	$("#nameModifybtn").on('click', function(){
	if(showbtn1){ 
		$(".nickShow").css('display',"");
		$(".pwdShow").css('display','none');
		$(".telShow").css('display','none');
		$(".addrShow").css('display','none');
		showbtn1=false;
		showbtn=true;
		showbtn2=true; 
		showbtn3=true;
	} else if(showbtn1==false){ 
		$(".nickShow").css('display','none')
		showbtn1=true; 
	} 
	}) 
	
	//핸드폰번호 변경 클릭시
	let showbtn2 = true;
	
	$("#telModifybtn").on('click', function(){
		if(showbtn2){ 
			$(".telShow").css('display','');
			$(".nickShow").css('display',"none");
			$(".pwdShow").css('display','none');
			$(".addrShow").css('display','none');
			showbtn2=false;
			showbtn=true;
			showbtn1=true;
			showbtn3=true;
		} else if(showbtn2==false){ 
			$(".telShow").css('display','none')
			showbtn2=true; 
		} 
		}) 
		
		let showbtn3 = true;
	
	//주소클릭시
	$("#addrModifybtn").on('click', function(){
		if(showbtn3){ 
			$(".addrShow").css('display','');
			$(".telShow").css('display','none');
			$(".nickShow").css('display',"none");
			$(".pwdShow").css('display','none');
			showbtn3=false;
			showbtn1=true;
			showbtn2=true; 
			showbtn=true;
		} else if(showbtn3==false){ 
			$(".addrShow").css('display','none')
			showbtn3=true; 
		} 
		}) 
	
	
	
	//패스워드 변경
	$("#pwdButton").on('click', function(){
		if($("#hiddenmypw").val()==$("#myNowPass").val()) {
		if($("#myNewPass").val()==$("#myNewPassOK").val()){
		$.ajax({
			type:'post',
			url: 'myPwdConfirm.giv',
			data:{ user_pw:$('#myNewPass').val() },
			success:function(pwd){
				alert("비밀번호 변경에 성공하였습니다." + pwd)
					$("#myNowPass").val("") 
					$("#myNewPass").val("")
					$("#myNewPassOK").val("")
					
			
				 
				}//석세스문
			})//에이작스
		}//if문 
			else {
				alert("새로운 비밀번호가 서로 일치하지 않습니다.")
			}
		
		}else {
			alert("현재 비밀번호를 다시 확인하세요.") 
		}
			
		
		 
	})//버튼
	
	//닉네임 변경 클릭시
	$("#nickModifybtn").on('click', function(){
		alert("눌리는지 확인")
		if($("#myNewNick").val()!="") {
			$.ajax({
				type:'post',
				url: 'myNickConfirm.giv',
				data:{user_name:$('#myNewNick').val() },
				success:function(pwd){ 
					alert("닉네임 변경에 성공하였습니다.")
						$('#myNewNick').val("") 
			 
					}//석세스문
				})//에이작스
		} else {
			alert("변경할 닉네임을 입력해주세요.") 
		}
	
	})
	
	//전화번호 변경 클릭시
	$("#telModifybutton").on('click', function(){
		if($("#myNewTel").val()!=""){
			$.ajax({
				type:'post',
				url: 'myTelConfirm.giv',
				data:{ user_tel:$('#myNewTel').val() },
				success:function(pwd){
					alert("연락처 수정에 성공하였습니다." + pwd)
						$("#myNewTel").val("") 
					
				
					}//석세스문
				})//에이작스
		} else {
			alert("변경할 번호를 입력해주세요.")
		}	
	})
	
	//주소 변경 클릭시
	$("#addrModifyConfirm").on('click', function(){
		alert("눌리는지확인")
		if($("#myNewAddr").val()!="")
			$.ajax({
				type:'post',
				url: 'myAddrConfirm.giv',
				data:{ user_addr:$('#myNewAddr').val() },
				success:function(pwd){
					alert("주소 변경이 완료됐습니다.")
						$("#myNewAddr").val("") 
						
						 
				
					 
					}//석세스문
				})//에이작스
	})
  
		 
	
	//주소 검색할 때
	$("#addrModifybutton").on('click', function(){
	  
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }
	    }).open(); 
		 
	})
	
	
/*	   <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
    <div class="flex-grow-1">
        <h3 class="mb-0">[마일리지 내역 로그]</h3>
        <div class="subheading mb-3">[사용/얻은 마일리지]</div>
        <div>[관련 후원단체]</div>

    </div>
    <div class="flex-shrink-0"><span class="text-primary">[로그 날짜]</span></div>
</div>*/
	

function directMyCash() {
		$.ajax({ 
			type:'post',
			url:'myCashList.giv',
			data:{user_no: $("#hiddenmyno").val()}, 
			success(data){
			$("#myCashListBox").empty();
			 
			for(var i=0; i<data.CashList.length; i++)
			$("#myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div>')
			
				
			}
			
		})
	}
directMyCash();	

 
	
function directMyBuy() {
		$.ajax({ 
			type:'post',
			url:'myBuyList.giv',
			data:{user_no: $("#hiddenmyno").val()}, 
			success(data){
			$("#myBuyListBox").empty();
			 
			for(var i=0; i<data.BuyList.length; i++)
			$("#myBuyListBox").append('')
			
				
			}
			
		})
	}
	
	
	
	

	
	

	
})