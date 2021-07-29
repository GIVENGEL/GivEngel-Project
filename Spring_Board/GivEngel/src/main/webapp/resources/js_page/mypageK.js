
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
	
function birthDetect() {
		$.ajax({ 
			type:'post',
			url:'birthDetect.giv',
			data:{user_no: $("hiddenno").val()},
			success(data) {
				alert(data.birthDetect.slice(1,2))
			
				if(data.birthDetect.slice(7,8)=='1' || data.birthDetect.slice(7,8)=='2'){
					$("#birthDetect").text('19'+data.birthDetect.slice(0,2)+'년'+data.birthDetect.slice(2,4)+'월'+data.birthDetect.slice(4,6)+'일') 
				} else if(data.birthDetect.slice(7,8)=='3' || data.birthDetect.slice(7,8)=='4') {
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
					$("#genderDetect").text("중성") 
				}
			} 
			 
		})
		  
	}
genderDetect();
	
let onepagethose = 7;
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
			$(".myCashListBox").append('<h3 class="mb-5">마일리지 사용내역</h3>')
			for(var i=0; i<onepagethose; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
			}
			for(var a=1; a<maxpage; a++){  
				$(".mycashPaging").append('<li class="page-item"><a class="page-link paging3" style="cursor:pointer;">'+a+'</a></li>')
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
			$(".myCashListBox").append('<h3 class="mb-5">마일리지 사용내역</h3>')
			if(data.CashList.length>=end){
			for(var i=start; i<end; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
		}  
		} else { for(var i=start; i<data.CashList.length; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
		}
			
		}
		
		} 
	 
	 
})
	
	
})

$(document).on('click', '.nextcash', function(){
	page = page+1
	if(page>=maxpage){
		
	}
	else{
	
	 
	var start = onepagethose*(page)-onepagethose;
	var end = onepagethose*(page+1)-onepagethose;
	$.ajax({
		url : "myCashList.giv",
		type : "post",
		success: function(data) {
			$(".myCashListBox").empty();
			$(".myCashListBox").append('<h3 class="mb-5">마일리지 사용내역</h3>')
			for(var i=start; i<end; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
		}   
		} 
	});
	 
	}
})

$(document).on('click', '.precash', function(){
	page = page-1
	if(page<=1){
		
	}
	else{
	
	
	var start = onepagethose*(page)-onepagethose;
	var end = onepagethose*(page+1)-onepagethose;
	$.ajax({
		url : "myCashList.giv",
		type : "post",
		success: function(data) {
			$(".myCashListBox").empty();
			$(".myCashListBox").append('<h3 class="mb-5">마일리지 사용내역</h3>')
			for(var i=start; i<end; i++){
			$(".myCashListBox").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">['+data.CashList[i].user_cashlog_log+']</h3><div class="subheading mb-3">['+data.CashList[i].user_cashlog_price+']</div></div><div class="flex-shrink-0"><span class="text-primary">['+data.CashList[i].user_cashlog_date+']</span></div></div><hr/>')
		}   
		} 
	});
	
	}
})  
	
	





/*<div class="d-flex flex-column flex-md-row justify-content-between mb-5">
<div class="flex-grow-1">
    <h3 class="mb-0">[구입한 물품]</h3>
    <div class="subheading mb-3">[사용한 금액]</div>
    <div>[상품번호]</div>
    <p>[구입한 개수 ]</p>
</div>
<div class="flex-shrink-0"><span class="text-primary">[로그 날짜]</span></div>
</div> */
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
			$(".myBuyPaging").append('<li class="page-item"><a class="page-link" style="cursor:pointer;">이전</a></li>')
			$(".myBuyList").append('<div><h2 style="color:#808080"class="mb-5">내 구매내역</h2></div>') 
			for(var i=0; i<onepagethose; i++){     
			$(".myBuyList").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">상품 이름: '+data[i].good_name+'</h3><div class="subheading mb-3">총 구매액: '+data[i].user_buylog_price+'</div><div>[상품 번호: '+data[i].good_no+']</div><p> 구매 갯수:'+data[i].user_buylog_price/data[i].good_price+'개 ]</p></div><div class="flex-shrink-0"><span class="text-primary">['+data[i].user_buylog_date+']</span></div></div><hr/>')
			}  
			for(var a=1; a<maxpage1; a++){ 
			$(".myBuyPaging").append('<li class="page-item paging1"><a class="page-link" style="cursor:pointer;">'+a+'</a></li>')
			}  
			$(".myBuyPaging").append('<li class="page-item"><a class="page-link" style="cursor:pointer;">다음</a></li>') 
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
	
	
	
	page1 = $(this).text();
	
	
	
	start1 = onepagethose*(page1-(1))
	end1 = onepagethose*page1
	if(end1>length)
	
	$.ajax({ 
			type:'post',
			url:'myBuyList.giv',
			success: function(data) {
				$(".myBuyList").empty();
				$(".myBuyList").append('<div><h2 style="color:#808080"class="mb-5">내 구매내역</h2></div>')
				if(data.length>=end1) {
				for(var i=start1; i<end1; i++){ 
				$(".myBuyList").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">상품 이름: '+data[i].good_name+'</h3><div class="subheading mb-3">총 구매액: '+data[i].user_buylog_price+'</div><div>[상품 번호: '+data[i].good_no+']</div><p> 구매 갯수:'+data[i].user_buylog_price/data[i].good_price+'개 ]</p></div><div class="flex-shrink-0"><span class="text-primary">['+data[i].user_buylog_date+']</span></div></div>')
				} 
				}else {
					for(var i=start1; i<data.length; i++){ 
						$(".myBuyList").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">상품 이름: '+data[i].good_name+'</h3><div class="subheading mb-3">총 구매액: '+data[i].user_buylog_price+'</div><div>[상품 번호: '+data[i].good_no+']</div><p> 구매 갯수:'+data[i].user_buylog_price/data[i].good_price+'개 ]</p></div><div class="flex-shrink-0"><span class="text-primary">['+data[i].user_buylog_date+']</span></div></div>')
						}
					 
				}
				
			} 
		
		
	})
	
})



 
/*<tr>
<td class="shoping__cart__item"><img
	src="${path}/resources/img/cart/cart-1.jpg" alt="">
	<h5>[물품1 이름]</h5></td>
<td class="shoping__cart__price">[물품 1 가격]</td>
<td class="shoping__cart__quantity">
	<div class="quantity">
		<div class="pro-qty">
			<input type="text" value="1">
		</div>
	</div>
</td>
<td class="shoping__cart__total">[계산한 가격]</td>
<td class="shoping__cart__item__close"><span
	class="icon_close"></span></td>
</tr>*/

/*var length = $('input[name=hiddenCartNum'+i+']').length;
 var arr = new Array(length);
 for(var a=0; a<length; a++){
	 arr[a] = $('input[name=hiddenCartNum'+i+']').eq(a).val();
	 alert(arr[a].slice(0,1) + "배열임");
	 arr[a].slice(0)  
	 arr[a].slice(1)
 }*/

/*$.ajax({
	type:'post',
	url:'mycountGoodStock.giv',
	data: { good_stock: $('#hiddenCartCount'+a+'').val(),
		  	good_no: $('#hiddenCartNum'+a+'').val() },
	success : function(data) {
		alert(data + "성공")
	} 
})//에이작스
*/


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
				if(result == "1"){
					alert("마일리지적립 성공")
				}else{
					alert("돈 업데이트 실패") 
				}
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
				if(result == "1"){
					alert("마일리지 로그 업데이트 성공")
				}else{ 
					alert("마일리지 로그 업데이트")
				}
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
				alert("구매 로그 업데이트 성공")
				location.herf='index.giv';
			}else{
				alert("구매 로그 업데이트 실패")
			}
		}
		
	})  
	} 
	
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
	
 

var cartCnt;	
function myCartList(){
	$.ajax({
		type:'post',
		url:'myCartList.giv',
		success: function(cart) {
			cartCnt = cart.length;
			var path = $("#pathes").val();
			$(".myCartListBody").empty();
			 var i;
			 let sum = 0;
			for(i=0; i<cartCnt; i++){
		 	$(".myCartListBody").append('<tr><input type="hidden" id="myHiddenTotalBuy'+i+'" value='+cart[i].cart_count*cart[i].good_price+'><input type="hidden" class="hiddencart" id="hiddenCartNum'+i+'" value='+cart[i].good_no+'><td class="shoping__cart__item"><img style="height:150px; width:150px;" src="'+path+'/resources/img/good/'+cart[i].good_img+'"><h5>['+cart[i].good_name+']</h5></td><input type:"hidden" class="hiddencartcart" value="'+cart[i].cart_no+'"><td class="shoping__cart__price">['+cart[i].good_price+']</td><td class="good__details__quantity"><div class="quantity"><div class="pro-qty"><span id="minus'+i+'" class="minusbutton" style="cursor:pointer">-</span><input id="hiddenCartCount'+i+'" class="hiddenCartCount" type="text" value="'+cart[i].cart_count+'"><span class="plusbutton" id="plus'+i+'" style="cursor:pointer">+</span></div></div></td><td class="shoping__cart__total" id="sumtotalprice'+'">['+cart[i].cart_count*cart[i].good_price+']</td><td class="shoping__cart__item__close"><span class="icon_close"></span></td></tr>')
		 	   sum += parseInt(cart[i].cart_count*cart[i].good_price)   
			}       	 
			 $('#myTotalBuyAc').text(sum+'원');  
			 $('.mysaveCashNow').text(0.1*sum+'점');
			  
		}	
	}) 
}
myCartList(); 
 
$(document).on('click', '.minusbutton', function(){
	var minus = parseInt($(this).parent().parent().parent().parent().find(".hiddenCartCount").val())
	minus +=-1
	let minusminus = $(this).parent().parent().parent().parent().find(".hiddenCartCount").val(minus)
	$.ajax({  
		type:'post',
		url:'minusCart.giv',  
		data: {cart_no: $(this).parent().parent().parent().parent().parent().find(".hiddencartcart").val(),
			   cart_count: $(this).parent().parent().parent().parent().parent().find(".hiddenCartCount").val()
		}, success: function(data) {
			alert(data + "성공?")  
			  
		}
		 
		  
		 
	})
	  
})
 
$(document).on('click', '.plusbutton', function(){
	var plus = parseInt($(this).parent().parent().parent().parent().find(".hiddenCartCount").val())
	plus +=1
	let plusplus = $(this).parent().parent().parent().parent().find(".hiddenCartCount").val(plus)
	$.ajax({ 
		type:'post',
		url:'plusCart.giv',  
		data: { cart_no : $(this).parent().parent().parent().parent().parent().find(".hiddencartcart").val(),
				cart_count : $(this).parent().parent().parent().parent().parent().find(".hiddenCartCount").val() 
		   
		}, success: function(data) {
			alert(data  + "플러스성공") 
			  
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
			alert(flea[0].flea_price)
			$(".myfleaMarket").empty();
			$(".myfleaMarket").append('<div><h2 style="color:#808080"class="mb-5">내 구매내역</h2></div>')
			for(var i=0; i<onepagethose; i++){
				$(".myfleaMarket").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">글 제목:'+flea[i].flea_title+'</h3><div class="subheading mb-3">['+flea[i].flea_price+'원]</div><div>[중고상품번호:'+flea[i].flea_no+']</div><p id="myfleaisokay'+i+'">'+flea[i].flea_isokay+'</p></div><div class="flex-shrink-0"><span class="text-primary">['+flea[i].flea_date+']</span></div></div>')
				if(flea[i].flea_isokay==true){
					$('#myfleaisokay'+i+'').text('등록 됨');
					} else {
						$('#myfleaisokay'+i+'').text('등록되지 않음');
					}
				}
			$(".myfleaPaging").append('<li class="page-item"><a class="page-link" style="cursor:pointer;">이전</a></li>') 
			for(var a=1; a<maxpage2; a++){ 
			$(".myfleaPaging").append('<li class="page-item"><a class="page-link paging2" style="cursor:pointer;">'+a+'</a></li>')
			}  
			$(".myfleaPaging").append('<li class="page-item"><a class="page-link" style="cursor:pointer;">다음</a></li>') 
		    
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
	
	
	
	page2 = $(this).text(); 
	start2 = onepagethose*(page2-(1)) 
	end2 = onepagethose*page2
	$.ajax({  
			type:'post',
			url:'myfleaMarket.giv',
			success : function(fl){
				
				 $(".myfleaMarket").empty();
				$(".myfleaMarket").append('<div><h2 style="color:#808080"class="mb-5">내 구매내역</h2></div>')
				if(fl.length>=end2) {
				for(var i=start2; i<end2; i++) { 
					$(".myfleaMarket").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">글 제목:'+fl[i].flea_title+'</h3><div class="subheading mb-3">['+fl[i].flea_price+'원]</div><div>[중고상품번호:'+fl[i].flea_no+']</div><p id="myfleaisokay'+i+'">'+fl[i].flea_isokay+'</p></div><div class="flex-shrink-0"><span class="text-primary">['+fl[i].flea_date+']</span></div></div>')
		if(fl[i].flea_isokay==true){
			$('#myfleaisokay'+i+'').text('등록 됨');
			} else {
				$('#myfleaisokay'+i+'').text('등록되지 않음'); 
				}
			}
				}else {
					for(var i=start2; i<fl.length; i++) { 
						$(".myfleaMarket").append('<div class="d-flex flex-column flex-md-row justify-content-between mb-5"><div class="flex-grow-1"><h3 class="mb-0">글 제목:'+fl[i].flea_title+'</h3><div class="subheading mb-3">['+fl[i].flea_price+'원]</div><div>[중고상품번호:'+fl[i].flea_no+']</div><p id="myfleaisokay'+i+'">'+fl[i].flea_isokay+'</p></div><div class="flex-shrink-0"><span class="text-primary">['+fl[i].flea_date+']</span></div></div>')
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



function userGradeBuy(){
	$.ajax({
		type:'post',
		url:'userGradeBuy.giv',
		success : function(data){
			alert(data + "총구매금액확인");
		}
		
	})
}
userGradeBuy();






 
	 
	
})