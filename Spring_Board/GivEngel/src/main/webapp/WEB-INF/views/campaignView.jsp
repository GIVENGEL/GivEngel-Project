<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">

<head>
 

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>살아숨쉬는 기부의 즐거움, GivEngel</title>

<!-- Google Font -->

<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">


<!-- Css Styles -->
<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/style.css" type="text/css">
</head>

<body>

  

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<input type="hidden" id="cam_user_id" value="${uvo.user_id}">

	<!--  navbar &  side over wrap -->
	<jsp:include page="module/navbar.jsp" />  

	<jsp:include page="module/sideCategory.jsp" />


	<!-- Blog Details Hero Begin -->
	<section class="blog-details-hero set-bg"
		data-setbg="${path}/resources/img/sponsor/givengelsponbanner.png">
		<div class="container">
			<div class="row"> 
				<div class="col-lg-12">
					<div class="blog__details__hero__text"> 
					<h2>${Campaign.spon_name }<h2> 
						<ul>  
							<li><h4 class="text-white">후원 만료일</h4></li>
							<li><h2 class="text-white">총 누적 금액</h2></li>
							<li><h4 class="text-white">댓글 수</h4></li>
						</ul> 
						<ul> 
							<li><h4 class="text-white">${Campaign.spon_end }</h4></li>
							<li><h2 class="text-white">${Campaign.spon_total_string}원</h2></li>
							<li><h4 class="text-white reviewplus2">${countReview}</h4></li>  
						</ul>  
					</div>  
				</div>
			</div> 
		</div>
	</section>
	<!-- Blog Details Hero End -->


	<!-- Blog Details Section Begin -->
	<section class="blog-details spad"> 
		<div class="container">
			<div class="row" style="float: none; margin:0 auto">
				<div class="col-lg-12 col-md-12 order-md-1 order-2" style="float: none; margin:0 auto">
					<div class="blog__sidebar" style="float: center; margin:0 auto">
						<h1 style="text-align:center; font-weight:bold;">  
							${Campaign.spon_name}
							</h1>     
							<hr />      
							<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${Campaign.spon_comment}</h4>
							<br>    
							<br>   
							<input type="hidden" id="cam_user_id" value="${uvo.user_id}">
							<input type="hidden" id="hiddenNo" value="${Campaign.spon_no}">
							<input type="hidden" id="hiddenName" value="${Campaign.spon_name }">
							<br>
 

							<div class="row" style="float: none; margin:0 auto">
								<div class="col-lg-6" style="float: none; margin:0 auto">
								<input id="pleasegive" type="number" class="form-control mb-4" name="id" placeholder="소유 마일리지:${user.user_cash}원">
									     
								 	<input id="pleasegivehidden" type="hidden" value="${uvo.user_cash}">
								</div>  
								<div class="col-lg-3" style="float: none; margin:0 auto">  
							
									<button type="button" name="donation"
										class="btn btn-block btn-success btn-lg" id="donation_btn">
										<spaa>후원하기!</spaa> 
									</button>   
									
								</div>
  
								<div class="col-lg-3" style="float: none; margin:0 auto">
									
								 	
								</div>
							</div>
							<br>
							<hr>
							<h3>From GivEngel...</h3>
							<br>
							<div class="col-lg-12 col-md-12" style="float: none; margin:0 auto; text-align:center;"> 
							<img style="text-align:center" src="${path}/resources/img/sponsor/${Campaign.spon_img}" />
							</div>    
							<br/>
							<br/> 
							<div class="col-lg-6 col-md-12" style="float: none; margin:0 auto">
							<input style="margin:5px" type="button" class="btn btn-block btn-success btn-lg urlmachan"  value="상품 사러가기">
							</div>
							<div class="col-lg-10" style="float: none; margin:0 auto"> 
							<hr/>      
							</div>     
							<div class="col-lg-6 col-md-12" style="float: none; margin:0 auto">   
							<input style="margin:5px;" type="button" class="btn btn-block btn-success btn-lg" value="후원단체 홈페이지" onclick="window.open('${Campaign.spon_url}')">
							</div>              
							  
					</div>
				</div>  
				 
			</div>

 
			<!--  캠페인 상품 리스트 출력 -->
			 
			<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">상품
									설명</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab" aria-selected="false">GivEngel 이용
									수칙</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">리뷰(<span id="reviewplus">${countReview}</span>)</a></li>
						</ul> 
						<div class="tab-content">
							<div class="tab-pane active text-center" id="tabs-1"
								role="tabpanel">
								<div class="product__details__tab__desc">
									<h6> 대표의 말</h6>
									<p>${Campaign.spon_comment}</p>
								</div>
							</div>
							<div class="tab-pane text-center" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>GivEngel 이용수칙</h6>
									<p>후원할 때 응원의 댓글 한마디 꼭 해주세요!</p>
									<p>마일리지 후원 뿐 아니라 관련 물품 구매도 꼭 해주세요!</p>
								</div>
							</div>
							<div class="tab-pane " id="tabs-3" role="tabpanel">
								<!-- 댓글 출력창 -->
								<div class="container mt-5 mb-5">
									<div class="row d-flex justify-content-center">
										<div class="col-md-12">
											<div
												class="headings d-flex justify-content-between align-items-center mb-3">
											
												<div class="buttons">
													<span
														class="badge bg-white d-flex flex-row align-items-center">
														<span class="text-primary">Comments "ON"</span>

													</span>
												</div>
											</div>

											<!-- 댓글 하나 --> 
											<div id="reviewtotal">
											
											</div>
											 <ul id="myreviewPaging" class="pagination" > 
                							 
											</ul> 
										
										</div>
									</div>
								</div>
								<!-- 댓글 출력창 end -->

								<!-- 댓글 입력창 -->
								<div class="card mb-2 col-lg-12">
									<div class="card-header bg-light">
										<i class="fa fa-comment fa"></i> REPLY
									</div>
									<div class="card-body">
										<ul class="list-group list-group-flush">
																									
											<li class="list-group-item">
												<div class="form-inline mb-2">
													<label for="replyId"><i
														class="fa fa-user-circle-o fa-2x"></i></label> <input type="text"
														class="form-control ml-2" placeholder="${uvo.user_id}" 
														id="replyId" value="${uvo.user_id}" readonly> <label for="replyPassword"
														class="ml-4"></label>	 		
												</div> <textarea class="form-control"
													id="Reviewcontent" rows="3"></textarea>
												<button type="button"
													class="btn btn-success bntReview"
													>답글 달기</button> 
											</li>																			
										</ul>
									</div>
								</div> 
								<!-- 댓글 입력창 end -->
							</div> 
						</div>
					</div>
				</div>
		   </div>
		</section>
	<!-- Blog Details Section End -->







	<!-- Footer -->
	<jsp:include page="module/footer.jsp" />


	<!-- Js Plugins -->
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${path}/resources/js/jquery-ui.min.js"></script>
	<script src="${path}/resources/js/jquery.slicknav.js"></script>
	<script src="${path}/resources/js/mixitup.min.js"></script>
	<script src="${path}/resources/js/owl.carousel.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	
	<%-- <div class="card p-3 mb-5">									
		<div class="d-flex justify-content-between align-items-center">									
			<div class="user d-flex flex-row align-items-center">
				 <img src="https://i.imgur.com/hczKIze.jpg" width="30"
					class="user-img rounded-circle mr-2"> <span><small
					class="font-weight-bold text-primary">[${reviewList[0].spon_com_writer}]</small> <small
					class="font-weight-bold">[${reviewList[0].spon_com_content}]</small></span>
			</div> 
				<small>${reviewList[0].spon_com_date}</small>
				<label><input type='hidden'>${reviewList[0].spon_com_no }</label>
		</div>
		<div class="action d-flex justify-content-between mt-2 align-items-center">
			<div class="reply px-4">
				<small>삭제하기</small> <span class="dots"></span> <small>수정하기</small>
					<span class="dots"></span>
			</div>
			<div class="icons align-items-center">
				<i class="fa fa-star text-warning"></i> <i
					class="fa fa-check-circle-o check-icon"></i>
			</div>
		</div>
	</div>											
	 --%> 
	
	 
	 

	<script type="text/javascript">
	
	 
	    
	
	/* $(function(){
		 
		 function directView() {
				 
				$.ajax({  
					type:'post',
					url:'reviewList.giv',
					
					success:function(data){
						alert("성공?");
						$("#reviewtotal").empty();
						
						for(var i=0; i<data.list.length; i++)
						{$("#reviewtotal").append('<div class="card p-3 mb-5"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-center"><img src="https://i.imgur.com/hczKIze.jpg" width="30"class="user-img rounded-circle mr-2"> <span><small class="font-weight-bold text-primary">[${list.list[i].spon_com_writer}]</small><small class="font-weight-bold">['+${data.list[i].spon_com_content}+']</small></span></div><small>'+${data.list[i].spon_com_date}+'</small><label><input type="hidden">'+${data.list[i].spon_com_no }+'</label></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div class="reply  px-4"><small>삭제하기</small> <span class="dots"></span> <small>수정하기</small><span class="dots"></span></div><div class="icons align-items-center"><i class="fa fa-star text-warning"></i> <i class="fa fa-check-circle-o check-icon"></i></div></div></div></div>)'} 
					} 
					      
					  
				})  
				  
			} 
		 
		 
		$('.bntReview').on('click', function(){
			$.ajax({ 
				 type:'post',
				 url:'reviewInsert.giv', 
				 data:{ spon_com_writer:$('#replyId').val(),
		 			   spon_com_content:$('#Reviewcontent').val(),
		 		       spon_no:${Campaign.spon_no}  
				 },              
				 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',  
				 success : function(data) {
							 directView();
					    
					 }
		 				  
						 
				  
			}) //에이작스 */
		   
			
		  
		 	 
		//}) //온 
	//}) //후입력
$(function(){
	
//버튼 추가삭제	


/*****************************************************
    * 함수 기능       :   1. 로그인 안됐을시에 후원불가(미구현)
    * 				2. 값 입력 안할시 false
    				3. 캐시로그 / 후원 / 차감
    * 										 할일 = 로그인 확인하기
    									   	      100마일리지 이상 후원하게하기
    * 사용된 함수       :   insertAdminLogoutLog		   유저 마일리지 후원할 금액 이상 들고있어야함
    * 사용된 서비스       :   -
    * 마지막 수정      :   2021-07-21
    *****************************************************/
    var user_cashCheck = RegExp(/[0-9]/);
    
$('#donation_btn').on('click',function(){
	 if($('#pleasegive').val()=="") {
		alert("금액을 입력해주세요")
		$('#pleasegive').focus() 
		} else if(!user_cashCheck.test($("#pleasegivehidden").val())) {
			 alert("숫자만 입력해주세요.") 
		 }
	 	else if($('#pleasegive').val()<100){ 
		alert("100마일리지 이상 후원해주세요.")
		}  
	     else if(parseInt($('#pleasegive').val())>parseInt($('#pleasegivehidden').val()))
		 {   
		 alert("후원 할 마일리지가 부족해요.") 
		 $('#pleasegive').focus()
		 } else  {  
	    $.ajax({ 
	    	type:'post', 
	    	url:'camSponCash.giv',
	    	data: { 
	    		spon_no:$('#hiddenNo').val(),
	    		spon_total:$('#pleasegive').val()		
	    	}, success:function() {
	    		$('#pleasegive').val("");
	              window.location.reload();
	    		
	    	}
	    	 
	    	
	    	 
	    })
	     
		$.ajax({
			type:'post',
			url:'camUserCash.giv',
			data: {  
				user_cash:$('#pleasegive').val()
			}, success:function() {
				
			} 
			 
		})
		 
		
		 $.ajax({
			type:'post',   
			url:'campaignLog.giv',
			data:{ 
				user_cashlog_log:$('#hiddenName').val(), 
				user_cashlog_price:$('#pleasegive').val()   
			},
			success: function() {
				alert("후원되었습니다. 감사합니다") 
			}
		})
	 }//else문
})	
		
	
/*****************************************************
 	*함수 이름 : directView
    * 함수 기능       :  댓글창 즉시 업데이트 ( 에이작스 실행 후 새로고침 안해도 댓글창 리셋)
    * 
    * 사용된 함수       :   						할일 x
    * 사용된 서비스       :   -
    * 마지막 수정      :   2021-07-23
    *****************************************************/
var onepagethose=7;
var page=1;
var maxpage=0;
var start=0;  
var end=0; 


function directView() {
 
	$.ajax({   
		type:'post',
		url:'reviewList.giv', 
		data:{spon_no:$('#hiddenNo').val() },
		success:function(data){
			var list = data.listReview.length
			if(list%onepagethose==0){
				maxpage = list/onepagethose
			}else{
				maxpage = list/onepagethose + 1
			}
			$("#reviewtotal").empty();
			$("#myreviewPaging").empty();
			$("#myreviewPaging").append('<li class="page-item"><a class="page-link preview" href="">이전</a></li>')
			for(var a=1; a<=maxpage; a++)
			{  
			$("#myreviewPaging").append('<li class="page-item"><a id="paging4'+a+'" class="page-link paging4" style="cursor:pointer">'+a+'</a></li>')
				}
			$("#myreviewPaging").append('<li class="page-item"><a class="page-link nextreview" href="">다음</a></li>')	
			
		
			for(var i=0; i<onepagethose; i++)
			{$("#reviewtotal").append('<div class="card p-3 mb-5"><input type="hidden" id="hiddenwritergo'+i+'"  value='+data.listReview[i].spon_com_writer+'><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-start"><img src="https://i.imgur.com/hczKIze.jpg" width="30"class="user-img rounded-circle mr-2"> <span><small class="font-weight-bold text-primary idwriter">'+data.listReview[i].spon_com_writer+']</small>&nbsp;&nbsp;&nbsp;&nbsp;<small class="font-weight-bold">['+data.listReview[i].spon_com_content+']</small></span></div><div class="align-items-end" style="float:right;"><label><input type="button" id="modify_btn'+i+'" class="modify_btn btn btn-link" value="수정" style="align:right; display:none;"></label><label ><input style="display:none" id="deleteValue'+i+'" class="deleteValue btn btn-link" type="button" value="삭제"><small class="believe"></small></label></div></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div class="reply px-4 w-100" style="height:20px"><span class="dots" style="height:20px"></span><div class="modify_div_text" style="display:none" "height:20px"><textarea  class="w-100 lookingplz" ></textarea></div><span class="dots"></span></div><div class="modify_div"><input class="modify_button" type="button" value="확인" style="display:none"><input class="comcomnono" type="hidden" value="'+data.listReview[i].spon_com_no+'"></div></div></div></div>')
			 	if($("#cam_user_id").val()==$("#hiddenwritergo"+i+"").val()){
					$("#modify_btn"+i+"").css('display', 'block').show()  
		    		$("#deleteValue"+i+"").css('display', 'block').show()   
		    	}//if문 닫기 
			} 
			  
         } //석세스 닫기
		  
	}) 	//아작스	  
  
} //함수

directView();



$(document).on('click', '.paging4', function(){
	$(".paging4").css({
		"background":"none",
		"color": "#000000"
	})
	
	  
	$(this).css({
		"background":"orange",             
		"color": "#ffffff"
	}) 
	
	
	
	
	page = parseInt($(this).text());
	start = onepagethose*(page)-onepagethose;
	end = onepagethose*(page+1)-onepagethose;
	
	$.ajax({   
		type:'post',
		url:'reviewList.giv', 
		data:{spon_no:$('#hiddenNo').val() },
		success:function(data){
			var list = data.listReview.length
			
			$("#reviewtotal").empty();  
			if(list>=end){
			for(var i=start; i<end; i++)
			{$("#reviewtotal").append('<div class="card p-3 mb-5"><input type="hidden" id="hiddenwritergo'+i+'"  value="'+data.listReview[i].spon_com_writer+'"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-start"><img src="https://i.imgur.com/hczKIze.jpg" width="30"class="user-img rounded-circle mr-2"> <span><small class="font-weight-bold text-primary idwriter">'+data.listReview[i].spon_com_writer+']</small>&nbsp;&nbsp;&nbsp;&nbsp;<small class="font-weight-bold">['+data.listReview[i].spon_com_content+']</small></span></div><div class="align-items-end" style="float:right;"><label><input type="button" id="modify_btn'+i+'" class="modify_btn btn btn-link" value="수정" style="align:right; display:none;"></label><label ><input style="display:none" id="deleteValue'+i+'" class="deleteValue btn btn-link" type="button" value="삭제"><small class="believe"></small></label></div></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div class="reply px-4 w-100" style="height:20px"><span class="dots" style="height:20px"></span><div class="modify_div_text" style="display:none" "height:20px"><textarea  class="w-100 lookingplz" ></textarea></div><span class="dots"></span></div><div class="modify_div"><input class="modify_button" type="button" value="확인" style="display:none"><input class="comcomnono" type="hidden" value="'+data.listReview[i].spon_com_no+'"></div></div></div></div>')
			 	if($("#cam_user_id").val()==$("#hiddenwritergo"+i+"").val()){
					$("#modify_btn"+i+"").css('display', 'block').show()  
		    		$("#deleteValue"+i+"").css('display', 'block').show()   
		    	}//if문 닫기 
			
			}//for문 닫기 
			} else {
				for(var i=start; i<list; i++) 
				{$("#reviewtotal").append('<div class="card p-3 mb-5"><input type="hidden" id="hiddenwritergo'+i+'"  value="'+data.listReview[i].spon_com_writer+'"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-start"><img src="https://i.imgur.com/hczKIze.jpg" width="30"class="user-img rounded-circle mr-2"> <span><small class="font-weight-bold text-primary idwriter">'+data.listReview[i].spon_com_writer+']</small>&nbsp;&nbsp;&nbsp;&nbsp;<small class="font-weight-bold">['+data.listReview[i].spon_com_content+']</small></span></div><div class="align-items-end" style="float:right;"><label><input type="button" id="modify_btn'+i+'" class="modify_btn btn btn-link" value="수정" style="align:right; display:none;"></label><label ><input style="display:none" id="deleteValue'+i+'" class="deleteValue btn btn-link" type="button" value="삭제"><small class="believe"></small></label></div></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div class="reply px-4 w-100" style="height:20px"><span class="dots" style="height:20px"></span><div class="modify_div_text" style="display:none" "height:20px"><textarea  class="w-100 lookingplz" ></textarea></div><span class="dots"></span></div><div class="modify_div"><input class="modify_button" type="button" value="확인" style="display:none"><input class="comcomnono" type="hidden" value="'+data.listReview[i].spon_com_no+'"></div></div></div></div>')
				 	if($("#cam_user_id").val()==$("#hiddenwritergo"+i+"").val()){
						$("#modify_btn"+i+"").css('display', 'block').show()  
			    		$("#deleteValue"+i+"").css('display', 'block').show()   
			    	}//if문 닫기 
			    	
				
				}//for문 닫기 
				
			}	  
		  
		 
         } //석세스 닫기
		  
	}) 	//ajax
})

$(document).on('click', '.nextreview', function(){
	page = page+1
	$(".paging4").css({
		"background":"none",
		"color": "#000000"
	}) 
	$("#paging4"+page+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	 
	
	if(page>maxpage){
		
	}
	else{
	 
	 
	start=onepagethose*(page)-onepagethose;
	end=onepagethose*(page+1)-onepagethose;
	$.ajax({
		type : "post",
		url : "reviewList.giv",
		success: function(data) {
			$("#reviewtotal").empty(); 
			for(var i=start; i<end; i++){
				$("#reviewtotal").append('<div class="card p-3 mb-5"><input type="hidden" id="hiddenwritergo'+i+'"  value="'+data.listReview[i].spon_com_writer+'"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-start"><img src="https://i.imgur.com/hczKIze.jpg" width="30"class="user-img rounded-circle mr-2"> <span><small class="font-weight-bold text-primary idwriter">'+data.listReview[i].spon_com_writer+']</small>&nbsp;&nbsp;&nbsp;&nbsp;<small class="font-weight-bold">['+data.listReview[i].spon_com_content+']</small></span></div><div class="align-items-end" style="float:right;"><label><input type="button" id="modify_btn'+i+'" class="modify_btn btn btn-link" value="수정" style="align:right; display:none;"></label><label ><input style="display:none" id="deleteValue'+i+'" class="deleteValue btn btn-link" type="button" value="삭제"><small class="believe"></small></label></div></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div class="reply px-4 w-100" style="height:20px"><span class="dots" style="height:20px"></span><div class="modify_div_text" style="display:none" "height:20px"><textarea  class="w-100 lookingplz" ></textarea></div><span class="dots"></span></div><div class="modify_div"><input class="modify_button" type="button" value="확인" style="display:none"><input class="comcomnono" type="hidden" value="'+data.listReview[i].spon_com_no+'"></div></div></div></div>')
		}   
		}   
	}); 
	 
	}
})
 
$(document).on('click', '.preview', function(){
	page = page-1
	$(".paging4").css({
		"background":"none",
		"color": "#000000"
	})
	$("#paging4"+page+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	if(page<1){
		
	} 
	else{
	
	
	start = onepagethose*(page)-onepagethose;
	end = onepagethose*(page+1)-onepagethose;
	
	$.ajax({
		url : "reviewList.giv",
		type : "post",
		success: function(data) {
			$("#reviewtotal").empty();
			$("#reviewtotal").append('<div><h2 style="color:#FF9D62" class="mb-5">내 구매내역</h2></div>')
			for(var i=start; i<end; i++){
				$("#reviewtotal").append('<div class="card p-3 mb-5"><input type="hidden" id="hiddenwritergo'+i+'"  value="'+data.listReview[i].spon_com_writer+'"><div class="d-flex justify-content-between align-items-center"><div class="user d-flex flex-row align-items-start"><img src="https://i.imgur.com/hczKIze.jpg" width="30"class="user-img rounded-circle mr-2"> <span><small class="font-weight-bold text-primary idwriter">'+data.listReview[i].spon_com_writer+']</small>&nbsp;&nbsp;&nbsp;&nbsp;<small class="font-weight-bold">['+data.listReview[i].spon_com_content+']</small></span></div><div class="align-items-end" style="float:right;"><label><input type="button" id="modify_btn'+i+'" class="modify_btn btn btn-link" value="수정" style="align:right; display:none;"></label><label ><input style="display:none" id="deleteValue'+i+'" class="deleteValue btn btn-link" type="button" value="삭제"><small class="believe"></small></label></div></div><div class="action d-flex justify-content-between mt-2 align-items-center"><div class="reply px-4 w-100" style="height:20px"><span class="dots" style="height:20px"></span><div class="modify_div_text" style="display:none" "height:20px"><textarea  class="w-100 lookingplz" ></textarea></div><span class="dots"></span></div><div class="modify_div"><input class="modify_button" type="button" value="확인" style="display:none"><input class="comcomnono" type="hidden" value="'+data.listReview[i].spon_com_no+'"></div></div></div></div>')
		}   
		}  
	});
	
	}
})  






 
/*****************************************************
 * 함수 기능       :   댓글입력
 * 마지막 수정      :   2021-07-23                          제약조건= 빈칸, 로그인 거르기
 *****************************************************/
$('.bntReview').on('click', function(){
	var pluss = parseInt($('#reviewplus').text())+1
	var pluss2 = parseInt($(".reviewplus2").text())+1
	
	$.ajax({ 
		 type:'post',
		 url:'reviewInsert.giv', 
		 data:{ spon_no:$('#hiddenNo').val(),
			 	spon_com_writer:$('#replyId').val(),
 			   spon_com_content:$('#Reviewcontent').val() },     
		 contentType : 'application/x-www-form-urlencoded;charset=UTF-8',  
		 success : function(data) { 
			 $("#reviewtotal").empty();
			 directView(); 
			 $('#reviewplus').text(pluss+"개");
			 $(".reviewplus2").text(pluss2+"개");		
			 $('#Reviewcontent').val("");		
			 }  
	}) 
});

/*****************************************************
 * 함수 기능       :  댓글삭제
 *  (삭제조건 추가해야함)
 * 사용된 함수       :   
 * 사용된 서비스       :   -
 * 마지막 수정      :   2021-07-23					
 *****************************************************/
 
$(document).on('click','.deleteValue', function(){
	 
	$.ajax({
		type:'post',
		url:'deleteReview.giv',
		data:{spon_com_no:$(this).parent().parent().parent().parent().find(".comcomnono").val()}, 
		success : function(result) {    
			directView(); 
			alert("선택한 댓글을 삭제하셨습니다.")
		}
		 
	 	
	})   
		
});

//수정하기 버튼 보이기
 

/*****************************************************
    * 함수 기능       :  수정하기 버튼 눌렀을 때 텍스트창, 선택적으로 this 찾아가기

    * 마지막 수정      :   2021-07-23
    *****************************************************/
    let flag=true;
$(document).on('click', '.modify_btn', function(){
	if(flag==true){
	$(this).parent().parent().parent().next().find(".modify_div_text").css('display','block');
	$(this).parent().parent().parent().next().find(".modify_div").find(".modify_button").css('display','block');
	return flag=false;
	 } else if(flag==false) {
	$(this).parent().parent().parent().next().find(".modify_div_text").css('display','none');
	$(this).parent().parent().parent().next().find(".modify_div").find(".modify_button").css('display','none');
	return flag=true;
	}   
	
}) 

/*****************************************************
    * 함수 기능       :   댓글수정     			
    * 
    * 사용된 함수       :   insertAdminLogoutLog
    * 사용된 서비스       :   -
    * 마지막 수정      :   2021-07-23
    *****************************************************/

$(document).on('click','.modify_button',function(){

	 
	
	$.ajax({ 
		type:'post',
		url:'updateReview.giv',
		data:{ spon_com_no:$(this).parent().parent().parent().find('.comcomnono').val(),
			spon_com_content:$(this).parent().parent().parent().find(".lookingplz").val()
		},
		success : function() {
			directView();
			
		
		}   
		
	})   
	
	//} //else문 spon_com_content:$(this).parent().prev().find(".modify_div").find(".w-100").val("_")
	
})
 
 

$(".urlmachan").on('click', function(){
	self.location = "buyList.giv"+ "?spon_no="+ ${Campaign.spon_no}
	   
})






//확인 눌렀을때 에이작스







	
})  

	</script>



</body>

</html>