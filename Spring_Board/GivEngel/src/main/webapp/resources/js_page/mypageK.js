

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
	function reload() {
		location.reload();
	}
	
	
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
					reload();
			 
				 
				}//석세스문
			})//에이작스
		}//if문 
			else {
				alert("새로운 비밀번호가 서로 일치하지 않습니다.")
			}
		
		}else if(!user_pwCheck.test($("#myNewPass").val())) {
			alert("비밀번호 형식이 잘못되었습니다.") 
		}else  {
			alert("현재 비밀번호를 다시 확인하세요.") 
		}
			
		
		 
	})//버튼
	
	 var user_pwCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
     var user_nameCheck = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/);
     var user_addrCheck = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/);
     var user_telCheck = RegExp(/^01[0179][0-9]{7,8}$/);
	
	
	
	//닉네임 변경 클릭시
	$("#nickModifybtn").on('click', function(){
		alert("눌리는지 확인")
		if($("#myNewNick").val()=="") {
			alert("변경할 닉네임을 입력해주세요.")
		} else if(!user_nameCheck.test($("#myNewNick").val())){
			alert("닉네임은 한글/영어/숫자로만 입력해주세요.")
			
		} else {
				$.ajax({
				type:'post',
				url: 'myNickConfirm.giv',
				data:{user_name:$('#myNewNick').val() },
				success:function(pwd){ 
					alert("닉네임 변경에 성공하였습니다.")
						$('#myNewNick').val("") 
						reload(); 
					}//석세스문
				})//에이작스
			
		}
	
	})
	
	//전화번호 변경 클릭시
	$("#telModifybutton").on('click', function(){
		if($("#myNewTel").val()==""){
			alert("변경할 번호를 입력해주세요.")
			return false;
		} else if(!user_telCheck.test($("#myNewTel").val())) {
			alert("전화번호를 다시 확인해주세요.")
		}
		else {
			$.ajax({
				type:'post',
				url: 'myTelConfirm.giv',
				data:{ user_tel:$('#myNewTel').val() },
				success:function(pwd){ 
					 window.location.reload();
					alert("연락처 수정에 성공하였습니다." + pwd)
						 $("#myNewTel").val("")
						 reload();
					}
				})
		}
	})
	 
	//주소 변경 클릭시
	$("#addrModifyConfirm").on('click', function(){
		var addd="";
		addd+=$('#sample6_postcode').val()
		addd+=$('#sample6_address').val()
		addd+=$('#sample6_detailAddress').val()
		addd+=$('#sample6_extraAddress').val()
		
		if(addd==""){
			alert("주소를 입력해주세요.")
		}else if(!user_addrCheck.test(addd)){
			("상세주소를 올바르게 입력해주세요")
		}
		else{
			$.ajax({
				type:'post',
				url: 'myAddrConfirm.giv',
				data:{ user_addr:addd },
				success:function(pwd){ 
					alert("주소 변경이 완료됐습니다.")
						$("#myNewAddr").val("") 
						reload();
						 
				 
				
					}//석세스문
				})//에이작스 
		}
	})
  
		 
	
	//주소 검색할 때
	$("#addrModifybutton").on('click', function(){
	  
		new daum.Postcode({
	        oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다. 
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open(); 
		 
	})
	
	
 
function birthDetect() {
		$.ajax({ 
			type:'post',
			url:'birthDetect.giv',
			data:{user_no: $("hiddenno").val()},
			success : function(data){
			  
				if(data.birthDetect.slice(6,7)=='1' || data.birthDetect.slice(6,7)=='2'){
					$("#birthDetect").text('19'+data.birthDetect.slice(0,2)+'년'+data.birthDetect.slice(2,4)+'월'+data.birthDetect.slice(4,6)+'일') 
				} else if(data.birthDetect.slice(6,7)=='3' || data.birthDetect.slice(6,7)=='4') {
					$("#birthDetect").text('20'+data.birthDetect.slice(0,2)+'년'+data.birthDetect.slice(2,4)+'월'+data.birthDetect.slice(4,6)+'일')
				}  else {  
					$("#birthDetect").text('주민번호가 제대로 입력되지 않았습니다.')
				}
				   
			}   
			 
		})
	}	
birthDetect();	
	
	
	
function genderDetect() {
		$.ajax({ 
			type:'post',
			url:'genderDetect.giv',
			data:{user_no: $("#hiddenno").val()},
			success(data){
				if(data.genderDetect=='1' || data.genderDetect=='3'){
					$("#genderDetect").text("남성")
				} else if(data.genderDetect=='2' || data.genderDetect=='4'){
					$("#genderDetect").text("여성")
				} else {  
					$("#genderDetect").text("주민번호가 제대로 입력되지 않았습니다.")  
				}
			} 
			 
		})
		  
	}
genderDetect();
	
let onepagethose = 5;
let page=1; 
let maxpage=0;
let start=0;
let end=0; 

function directMyCash() {
		$.ajax({ 
			type:'post', 
			url:'myCashList.giv',
			data:{user_no: $("#hiddenmyno").val()}, 
			success(data){
				let totalthose = data.CashList.length
				if(totalthose%onepagethose==0) {
				 maxpage = totalthose/onepagethose
				} else { 
				maxpage = totalthose/onepagethose + 1 }
				 
			$(".myCashListBox").empty();
			$(".mycashPaging").append('<li class="page-item"><a class="page-link precash" style="cursor:pointer;">이전</a></li>')
			$(".myCashListBox").append('<h2 class="mb-5" style="color:#FF9D62">마일리지 사용/적립</h2>')
			for(var i=0; i<onepagethose; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
			}
			for(var a=1; a<maxpage; a++){  
				$(".mycashPaging").append('<li class="page-item"><a id=paging3'+a+' class="page-link paging3" style="cursor:pointer;">'+a+'</a></li>')
				}  
				$(".mycashPaging").append('<li class="page-item"><a class="page-link nextcash" style="cursor:pointer;">다음</a></li>') 
			
			} 
			  
		}) 
	}
directMyCash();

$(document).on('click', '.paging3', function(){
	$(".paging3").css({
		"background":"none",
		"color": "#000000"
	})
	 
	
	$(this).css({
		"background":"orange",
		"color": "#ffffff"
	}) 
	
	
	
	page = parseInt($(this).text());
	start = onepagethose*(page-1);
	end = onepagethose*page;
	$.ajax({ 
		type:'post', 
		url:'myCashList.giv',
		data:{user_no: $("#hiddenmyno").val()},
		success: function(data) {
			
			$(".myCashListBox").empty();
			$(".myCashListBox").append('<h2 class="mb-5" style="color:#FF9D62">마일리지 사용/적립</h2>')
			if(data.CashList.length>=end){
			for(var i=start; i<end; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
		}  
		} else { for(var i=start; i<data.CashList.length; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
		}
			
		}
		
		} 
	 
	 
})
	
	
})

$(document).on('click', '.nextcash', function(){
	page = page+1
	$(".paging3").css({
		"background":"none",
		"color": "#000000"
	})
	$("#paging3"+page+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	
	if(page>=maxpage){
		
	}
	else{
	 
	 
	start=onepagethose*(page)-onepagethose;
	end=onepagethose*(page+1)-onepagethose;
	$.ajax({
		type : "post",
		url : "myCashList.giv",
		data : {user_no: $("#hiddenmyno").val()},
		success: function(data) {
			$(".myCashListBox").empty(); 
			$(".myCashListBox").append('<h2 class="mb-5" style="color:#FF9D62">마일리지 사용내역</h2>')
			for(var i=start; i<end; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
		}   
		}  
	}); 
	 
	}
})
 
$(document).on('click', '.precash', function(){
	page = page-1
	$(".paging3").css({
		"background":"none",
		"color": "#000000"
	})
	$("#paging3"+page+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	if(page<1){
		
	}
	else{
	
	
	var start = onepagethose*(page)-onepagethose;
	var end = onepagethose*(page+1)-onepagethose;
	
	$.ajax({
		url : "myCashList.giv",
		type : "post",
		data : {user_no: $("#hiddenmyno").val()},
		success: function(data) {
			$(".myCashListBox").empty();
			$(".myCashListBox").append('<h2 class="mb-5" style="color:#FF9D62">마일리지 사용내역</h2>')
			for(var i=start; i<end; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
		}   
		} 
	});
	
	}
})  
	

let page1=1;
let maxpage1=0;
let start1=0;
let end1=0;  	
 
function myBuyList() {
		$.ajax({ 
			type:'post',
			url:'myBuyList.giv',
			success: function(data) {
				let totalthose = data.length
				if(totalthose%onepagethose==0) {
				 maxpage1 = totalthose/onepagethose
				} else {
				maxpage1 = totalthose/onepagethose + 1 }
			$(".myBuyList").empty();
			$(".myBuyPaging").append('<li class="page-item"><a class="page-link prebuy" style="cursor:pointer;">이전</a></li>')
			$(".myBuyList").append('<div><h2 style="color:#FF9D62" class="mb-5 focusbuy">내 구매내역</h2></div>') 
			for(var i=0; i<onepagethose; i++){     
			$(".myBuyList").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/good/'+data[i].good_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">상품 이름: '+data[i].good_name+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">총 구매액: '+data[i].user_buylog_price+'</div><div>[상품 번호: '+data[i].good_no+']</div><p> 구매 갯수:'+data[i].user_buylog_price/data[i].good_price+'개 </p></div><div class="flex-shrink-0"><span class="text-primary">['+data[i].user_buylog_date+']</span></div></div></div></div></div><hr/>')
			}    
			for(var a=1; a<=maxpage1; a++){ 
			$(".myBuyPaging").append('<li class="page-item"><a class="page-link paging1" id="paging1'+a+'" style="cursor:pointer;">'+a+'</a></li>')
			}  
			$(".myBuyPaging").append('<li class="page-item"><a class="page-link nextbuy" style="cursor:pointer;">다음</a></li>') 
			}  
		})
	} 
  

myBuyList();

$(document).on('click','.paging1', function(){
	 
	$(".paging1").css({
		"background":"none",
		"color": "#000000"
	})
	
	  
	$(this).css({
		"background":"orange",             
		"color": "#ffffff"
	}) 
	
	$(".focusbuy").focus();
	
	
	
	page1 = parseInt($(this).text());
	
	
	
	start1 = onepagethose*((page1)-1)
	end1 = onepagethose*page1
	if(end1>length)
	
	$.ajax({ 
			type:'post',
			url:'myBuyList.giv',
			success: function(data) {
				$(".myBuyList").empty();
				$(".myBuyList").append('<div><h2 style="color:#FF9D62" class="mb-5">내 구매내역</h2></div>')
				if(data.length>=end1) {
				for(var i=start1; i<end1; i++){ 
				$(".myBuyList").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/good/'+data[i].good_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">상품 이름: '+data[i].good_name+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">총 구매액: '+data[i].user_buylog_price+'</div><div>[상품 번호: '+data[i].good_no+']</div><p> 구매 갯수:'+data[i].user_buylog_price/data[i].good_price+'개 </p></div><div class="flex-shrink-0"><span class="text-primary">['+data[i].user_buylog_date+']</span></div></div></div></div></div>')
				} 
				}else {
					for(var i=start1; i<data.length; i++){ 
						$(".myBuyList").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/good/'+data[i].good_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">상품 이름: '+data[i].good_name+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">총 구매액: '+data[i].user_buylog_price+'</div><div>[상품 번호: '+data[i].good_no+']</div><p> 구매 갯수:'+data[i].user_buylog_price/data[i].good_price+'개 </p></div><div class="flex-shrink-0"><span class="text-primary">['+data[i].user_buylog_date+']</span></div></div></div></div></div>')
						}
					 
				}
				
			} 
		
		
	})
	
})

$(document).on('click', '.nextbuy', function(){
	page1 = (page1)+1
	$(".paging1").css({
		"background":"none",
		"color": "#000000"
	}) 
	$("#paging1"+page1+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	 
	
	if(page1>maxpage1){
		
	}
	else{
	 
	 
	start1=onepagethose*(page1)-onepagethose;
	end1=onepagethose*((page1)+1)-onepagethose;
	$.ajax({
		type : "post",
		url : "myBuyList.giv",
		success: function(data) {
			$(".myBuyList").empty(); 
			$(".myBuyList").append('<div><h2 style="color:#FF9D62" class="mb-5">내 구매내역</h2></div>')
			for(var i=start1; i<end1; i++){
				$(".myBuyList").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/good/'+data[i].good_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">상품 이름: '+data[i].good_name+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">총 구매액: '+data[i].user_buylog_price+'</div><div>[상품 번호: '+data[i].good_no+']</div><p> 구매 갯수:'+data[i].user_buylog_price/data[i].good_price+'개 </p></div><div class="flex-shrink-0"><span class="text-primary">['+data[i].user_buylog_date+']</span></div></div></div></div></div>')
		}   
		}  
	}); 
	 
	}
})
 
$(document).on('click', '.prebuy', function(){
	page1 = (page1)-1
	$(".paging1").css({
		"background":"none",
		"color": "#000000"
	})
	$("#paging1"+page1+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	if(page1<1){
		
	} 
	else{
	
	
	start1 = onepagethose*(page1)-onepagethose;
	end1 = onepagethose*((page1)+1)-onepagethose;
	
	$.ajax({
		url : "myBuyList.giv",
		type : "post",
		success: function(data) {
			$(".myBuyList").empty();
			$(".myBuyList").append('<div><h2 style="color:#FF9D62" class="mb-5">내 구매내역</h2></div>')
			for(var i=start1; i<end1; i++){
				$(".myBuyList").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/good/'+data[i].good_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">상품 이름: '+data[i].good_name+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">총 구매액: '+data[i].user_buylog_price+'</div><div>[상품 번호: '+data[i].good_no+']</div><p> 구매 갯수:'+data[i].user_buylog_price/data[i].good_price+'개 </p></div><div class="flex-shrink-0"><span class="text-primary">['+data[i].user_buylog_date+']</span></div></div></div></div></div>')
		}   
		}  
	});
	
	}
})  


 


$(document).on('click','.myCartBuybtn', function() {
	myCartList(); 
	for(var i=0; i<cartCnt; i++){
		$.ajax({  
			type :'post',
			url : 'countGoodStock.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			async: false,
			data : {
				good_no :  $('#hiddenCartNum'+i+'').val(),
				good_stock : $('#hiddenCartCount'+i+'').val()
			}, success : function(result){
				
			} 
			
		})
			 
		
	}//포문 
	for(var a=0; a<cartCnt; a++){
		$.ajax({
			type :'post',
			url : 'addUserM.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			async: false,
			data : {
				good_no :  $('#hiddenCartNum'+a+'').val(),
				buy_totalPrice  : $('#myHiddenTotalBuy'+a+'').val()  
			}, success : function(result){
				
			}
		})
	}
	
	for(var b=0; b<cartCnt; b++){
		// 유저 마일리지 로그 업데이트
		$.ajax({
			type :'post',
			url : 'addUserMLog.giv',
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
			async: false,
			data : {
				user_cashlog_log : '상품 구매',
				user_cashlog_price : $('#myHiddenTotalBuy'+b+'').val()
			}, success : function(result){
				
			}
		})
		
		
	}
	for(var c=0; c<cartCnt; c++) {
	$.ajax({
		type : 'post',
		url : 'addUserBuyLog.giv',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		async: false,
		data : {
			good_no :  $('#hiddenCartNum'+c+'').val(),
			user_buylog_price : $('#myHiddenTotalBuy'+c+'').val()
		},success : function(result){
			if(result == "1"){
				
				location.herf='index.giv';
			}else{
				
			}
		}
		
	})  
	} 
	
	$.ajax({
		type: 'post',
		url: 'allCartComplete.giv',
		success : function(result) {
			alert("상품 구매에 성공했습니다.")  
			$(".myCartListBody").empty();
			$('#myTotalBuyAc').text('');
			$('.mysaveCashNow').text('');
		}
		
	})
	
	
	})
	
	/*<div class="good__details__quantity">
                     <div class="quantity">
                        <div class="good-qty">
                           <span id='minus'>-</span>
                           <input id ='buyCntNow' type="text" value="1">
                           <span id='plus'>+</span>
                        </div>
                     </div>
                     <td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<input type="text" value="1">
											</div>
										</div>
									</td>
                     
                     
                     
                  </div>*/
	
 
var path = $("#pathes").val();
var cartCnt;	
function myCartList(){
	$.ajax({
		type:'post',
		url:'myCartList.giv',
		success: function(cart) {
			cartCnt = cart.length;
			 
			$(".myCartListBody").empty();
			 var i;
			 let sum = 0;
			for(i=0; i<cartCnt; i++){
		 	$(".myCartListBody").append('<tr><input type="hidden" class="mycartStock" value='+cart[i].good_stock+'><input type="hidden" id="myHiddenTotalBuy'+i+'" value='+cart[i].cart_count*cart[i].good_price+'><input type="hidden" class="myhiddengoodno" id="hiddenCartNum'+i+'" value='+cart[i].good_no+'><td class="shoping__cart__item"><img style="height:150px; width:150px;" src="'+path+'/resources/img/good/'+cart[i].good_img+'"><h5>['+cart[i].good_name+']</h5></td><td class="shoping__cart__price mynowprice">'+cart[i].good_price+'</td><td class="good__details__quantity"><div class="quantity"><div class="pro-qty"><span id="minus'+i+'" class="minusbutton" style="cursor:pointer">-</span><input id="hiddenCartCount'+i+'" class="hiddenCartCount" type="text" value="'+cart[i].cart_count+'"><input type="hidden" class="hiddencartcartNo" value='+cart[i].cart_no+'><span class="plusbutton" id="plus'+i+'" style="cursor:pointer">+</span></div></div></td><td class="shoping__cart__total mytotalprice" id="sumtotalprice'+'">'+cart[i].cart_count*cart[i].good_price+'</td><td class="shoping__cart__item__close"><span class="icon_close mydeletebutton" style="cursor:pointer"></span></td></tr>')
		 	  
		 	   sum += parseInt(cart[i].cart_count*cart[i].good_price)   
			}       	   
			 $('#myTotalBuyAc').text(sum);  
			 $('.mysaveCashNow').text(0.1*sum);
	 		   
		}	
	})   
} 
myCartList(); 
  
$(document).on('click', '.minusbutton', function(){
	var minus = parseInt($(this).parent().parent().parent().parent().find(".hiddenCartCount").val())
	var totalbuy = parseInt($('#myTotalBuyAc').text())
	var totalcash = parseInt($('.mysaveCashNow').text())
	
	if(minus>1) {
	minus +=-1
	$(this).parent().parent().parent().parent().find(".hiddenCartCount").val(minus)

	var totalprice = parseInt($(this).parent().parent().parent().parent().find(".mytotalprice").text());
	totalprice += -parseInt($(this).parent().parent().parent().parent().find(".mynowprice").text());

	totalbuy += -parseInt($(this).parent().parent().parent().parent().find(".mynowprice").text());
	totalcash += -0.1*parseInt($(this).parent().parent().parent().parent().find(".mynowprice").text());
	$('.mysaveCashNow').text(totalcash)
	$('#myTotalBuyAc').text(totalbuy)
	
	
	$(this).parent().parent().parent().parent().find(".mytotalprice").text(totalprice); } else {
		return false;
	}
	
	$.ajax({  
		type:'post',
		url:'minusCart.giv',  
		data: {cart_no: $(this).parent().parent().parent().parent().find(".hiddencartcartNo").val(),
			   cart_count: $(this).parent().parent().parent().parent().find(".hiddenCartCount").val()
		}, success: function(data) {  
			  
			
			
			   
		}
		  
		   
		 
	})
	  
})


 
$(document).on('click', '.plusbutton', function(){
	
	var stock = parseInt($(this).parent().parent().parent().parent().find(".mycartStock").val());
	var plus = parseInt($(this).parent().parent().parent().parent().find(".hiddenCartCount").val())
	var totalprice = parseInt($(this).parent().parent().parent().parent().find(".mytotalprice").text());
	var totalbuy = parseInt($('#myTotalBuyAc').text())
	var totalcash = parseInt($('.mysaveCashNow').text())
	
	if(stock>plus){
	totalbuy += parseInt($(this).parent().parent().parent().parent().find(".mynowprice").text());
	totalcash += 0.1*parseInt($(this).parent().parent().parent().parent().find(".mynowprice").text());
	$('.mysaveCashNow').text(totalcash)
	$('#myTotalBuyAc').text(totalbuy)	
		

	plus +=1 
	$(this).parent().parent().parent().parent().find(".hiddenCartCount").val(plus)
	totalprice += parseInt($(this).parent().parent().parent().parent().find(".mynowprice").text());
	$(this).parent().parent().parent().parent().find(".mytotalprice").text(totalprice); 	} else {
		alert("재고가 없습니다.")
		return false; 
	}		
	
	
	$.ajax({ 
				type:'post',
				url:'plusCart.giv',  
				data: { cart_no : $(this).parent().parent().parent().parent().find(".hiddencartcartNo").val(),
						cart_count : $(this).parent().parent().parent().parent().find(".hiddenCartCount").val()
				      
				}, success: function(data) {
					
					  
				} //성공 
				
				 
				
			})//ajax
			
			
	
	
})//클릭


$(document).on('click', '.mydeletebutton', function(){

	var totalbuy = parseInt($('#myTotalBuyAc').text())
	var totalcash = parseInt($('.mysaveCashNow').text())
	var temp = $(this).parent().parent().find(".hiddencartcartNo").val();
 
	totalbuy -= parseInt($(this).parent().parent().find(".mytotalprice").text());
	totalcash -= 0.1*parseInt($(this).parent().parent().find(".mytotalprice").text());
	$(this).parent().parent().empty(); 
	$('.mysaveCashNow').text(totalcash)  
	$('#myTotalBuyAc').text(totalbuy)	  
 

	$.ajax({ 
		type:'post', 
		url:'mydeleteCart.giv', 
		data: { cart_no : temp },
		success :  function() { 
			 
		}
		
		
	})
	
})






let page2=1;
let maxpage2=0;
let start2=0;
let end2=0; 

 
$.ajax({
		
		type:'post',
		url:'myfleaMarket.giv',
		success: function(flea) {
			let totalthose = flea.length
			if(flea.length%onepagethose==0) {
			maxpage2 = totalthose/onepagethose
			} else {
			maxpage2 = totalthose/onepagethose + 1 }
			 
			$(".myfleaMarket").empty();
			$(".myfleaMarket").append('<div><h2 style="color:#FF9D62" class="mb-5">중고장터 신청 현황</h2></div>')
			for(var i=0; i<onepagethose; i++){
				$(".myfleaMarket").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/flea/'+flea[i].flea_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">글 제목:'+flea[i].flea_title+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+flea[i].flea_price+'원]</div><div>[중고상품번호:'+flea[i].flea_no+']</div><p id="myfleaisokay'+i+'">'+flea[i].flea_isokay+'</p></div><div class="flex-shrink-0"><span class="text-primary">['+flea[i].flea_date+']</span></div></div></div></div></div></hr>')
				if(flea[i].flea_isokay==true){ 
					$('#myfleaisokay'+i+'').text('등록 됨');
					} else {
						$('#myfleaisokay'+i+'').text('등록되지 않음');
					} 
				}
			$(".myfleaPaging").append('<li class="page-item"><a class="page-link prepage2" style="cursor:pointer;">이전</a></li>') 
			for(var a=1; a<=maxpage2; a++){ 
			$(".myfleaPaging").append('<li class="page-item"><a id="paging2'+a+'" class="page-link paging2" style="cursor:pointer;">'+a+'</a></li>')
			}  
			$(".myfleaPaging").append('<li class="page-item"><a class="page-link nextpage2" style="cursor:pointer;">다음</a></li>') 
		     
		}
	}) 
     

$(document).on('click', '.paging2', function(){
	$(".paging2").css({
		"background":"none",
		"color": "#000000"
	})
	
	$(this).css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	
	
	page2 = parseInt($(this).text()); 
	start2 = onepagethose*((page2)-1) 
	end2 = onepagethose*page2
	$.ajax({  
			type:'post',
			url:'myfleaMarket.giv',
			success : function(fl){
				
				 $(".myfleaMarket").empty();
				$(".myfleaMarket").append('<div><h2 style="color:#FF9D62"class="mb-5">중고장터 신청 현황</h2></div>')
				if(fl.length>=end2) {
				for(var i=start2; i<end2; i++) { 
					$(".myfleaMarket").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/flea/'+fl[i].flea_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">글 제목:'+fl[i].flea_title+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+fl[i].flea_price+'원]</div><div>[중고상품번호:'+fl[i].flea_no+']</div><p id="myfleaisokay'+i+'">'+fl[i].flea_isokay+'</p></div><div class="flex-shrink-0"><span class="text-primary">['+fl[i].flea_date+']</span></div></div></div></div></div>')
		if(fl[i].flea_isokay==true){
			$('#myfleaisokay'+i+'').text('등록 됨');
			} else {
				$('#myfleaisokay'+i+'').text('등록되지 않음'); 
				}  
			}
				}else {
					for(var i=start2; i<fl.length; i++) { 
						$(".myfleaMarket").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/flea/'+fl[i].flea_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">글 제목:'+fl[i].flea_title+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+fl[i].flea_price+'원]</div><div>[중고상품번호:'+fl[i].flea_no+']</div><p id="myfleaisokay'+i+'">'+fl[i].flea_isokay+'</p></div><div class="flex-shrink-0"><span class="text-primary">['+fl[i].flea_date+']</span></div></div></div></div></div>')
			if(fl[i].flea_isokay==true){
				$('#myfleaisokay'+i+'').text('등록 됨');
				} else {
					$('#myfleaisokay'+i+'').text('등록되지 않음'); 
					}
				}
					
				}
				 
				 
				
				
				
		}
	})  
	 
})

$(document).on('click', '.nextpage2', function(){
	
	page2 = (page2)+1
	 
	$(".paging2").css({
		"background":"none",
		"color": "#000000"
	})
	$("#paging2"+page2+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	 
	
	if(page2>maxpage2){
		   
	} 
	else{ 
	  
	 
	start2=onepagethose*(page2)-onepagethose;
	end2=onepagethose*((page2)+1)-onepagethose;
	$.ajax({
		type : "post",
		url : "myfleaMarket.giv",
		success: function(flea) {
			$(".myfleaMarket").empty(); 
			$(".myfleaMarket").append('<h2 class="mb-5" style="color:#FF9D62">중고장터 신청 현황</h2>')
			for(var i=start2; i<end2; i++){
				$(".myfleaMarket").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/flea/'+flea[i].flea_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">글 제목:'+flea[i].flea_title+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+flea[i].flea_price+'원]</div><div>[중고상품번호:'+flea[i].flea_no+']</div><p id="myfleaisokay'+i+'">'+flea[i].flea_isokay+'</p></div><div class="flex-shrink-0"><span class="text-primary">['+flea[i].flea_date+']</span></div></div></div></div></div></hr>')
		}   
		}  
	}); 
	 
	}
})
 
$(document).on('click', '.prepage2', function(){
	page2 = (page2)-1
	$(".paging2").css({
		"background":"none",
		"color": "#000000" 
	})
	$("#paging2"+page2+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	 
	if(page2<1){
		
	}
	else{
	
	
	start2 = onepagethose*(page2)-onepagethose;
	end2 = onepagethose*((page2)+1)-onepagethose;
	
	$.ajax({
		url : "myfleaMarket.giv",
		type : "post", 
		success: function(fl) {
			$(".myfleaMarket").empty();
			$(".myfleaMarket").append('<h2 class="mb-5" style="color:#FF9D62">마일리지 사용내역</h2>')
			for(var i=start2; i<end2; i++){
			$(".myfleaMarket").append('<div class="container"><div class="row"><div class="col-lg-3"><img style="width:180px; border=1" src="'+path+'/resources/img/flea/'+fl[i].flea_img+'"></div><div class="col-lg-9"><div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">글 제목:'+fl[i].flea_title+'</h3><div class="subheading mb-3" style="font-size:30px; color:#FF9D62;">['+fl[i].flea_price+'원]</div><div>[중고상품번호:'+fl[i].flea_no+']</div><p id="myfleaisokay'+i+'">'+fl[i].flea_isokay+'</p></div><div class="flex-shrink-0"><span class="text-primary">['+fl[i].flea_date+']</span></div></div></div></div></div>')
		}    
		} 
	});
	
	}
})  



function userGradeBuy(){
	$.ajax({
		type:'post',
		url:'userGradeBuy.giv',
		success : function(data){
			if(data<30000){
			$("#honorgrade").text('브론즈')
			} else if(data>=30000) {
			$("#honorgrade").text('실버')	
			} else if (data>=100000) {
			$("#honorgrade").text('골드')	
			} else if (data>=300000) {
			$("#honorgrade").text('다이아')  
			} else {
			$("#honorgrade").text('VIP')
			}
			
		}
		
	})
}
userGradeBuy();

	 
	
})