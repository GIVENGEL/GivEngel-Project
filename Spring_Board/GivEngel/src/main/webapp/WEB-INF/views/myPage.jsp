<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/style.css"
	type="text/css">
<input type="hidden" id="pathes" value="${path }">	

	<link rel="icon" type="image/x-icon" href="${path}/resources/img/mypage/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/resources/css/myPage.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>




        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="index.giv">
                <span class="d-block d-lg-none">[유저 이름]</span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="${path}/resources/img/mypage/logo.png" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">유저 정보(수정)</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">장바구니</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">마일리지 사용내역</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#skills">구매 내역</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#interests">중고 장터 등록 상품</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#awards">Givengel</a></li>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0"> 
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    <h2 class="mb-1">   
                        	반갑습니다. 
                        <span class="text-primary">${myvo.user_name}님<p style="font-size:30px">GIVENGEL입니다. 환영합니다</p></span>
                        <input id="hiddenmypw" type="hidden" value="${myvo.user_pw}">
                        <input id="hiddenmyno" type="hidden" value="${myvo.user_no}">
                        <input ud="hiddenmynick" type="hidden" value="${myvo.user_name}">
                        <input id="hiddenmytel" type="hidden" value="${myvo.user_tel}">
                        <input id="hiddenmyaddr" type="hidden" value="${myvo.user_addr}">
                    </h2>   
                    <div class="subheading mb-5">
                    
                        <br/> 
                        <section class="hero">
		<div class="container">
			<div class="row"> 

				<div class="col-lg-9">
					<div>

    
						<div>
							<section class="container">     
								<section  class="login-form"> 
									<hr style="border: solid 1px">  
									<label class="display-4 text-dark">회원 정보 수정</label>
										<table class="table  table-boardered"> 
										 					 		 			
											<tr>
												<th style="width:200px">명예등급</th>
												<td><label id="honorgrade">명예등급임</label></td>    
											</tr>  
											<tr>
												<th>아이디</th>
												<td>${myvo.user_id }</td>
											   
											</tr>  
											<tr>
												<th>비밀번호</th>
												<td colspan="3">********				
												<input type="button" style="float:right" class="btn btn-success btn-sm" id="pwModifybtn"  value="비밀번호 변경">
												</td>
											</tr>
											
											<tr class="pwdShow" style="display:none">  
											<th style="float:left; font-size:20px;">현재 비밀번호</th>
											<td colspan="3"><input id="myNowPass" style="float:center; height:40px;" type="password"></td>
											</tr>   
											<tr class="pwdShow" style="display:none">
											<th style="float:left; font-size:20px;">신규 비밀번호</th>
											<td colspan="3"><input id="myNewPass" style="float:center; height:40px;" type="password"></td>
											</tr>
											<tr class="pwdShow" style="display:none">
											<th style="float:left; font-size:20px;">비밀번호 재입력</th>
											<td colspan="2" ><input id="myNewPassOK" style="float:center; height:40px;" type="password"></td>
											<td><input type="button" value="변경" class="btn btn-outline-success" style="float:right" id="pwdButton"></td> 
											</tr>  
											
											<tr> 
												<th>이름</th>  
												<td colspan="3"><label style="float:center; align:right; margin:0;" id="imodifyname">${myvo.user_name}</label>  
												<input type="button" style="float:right; vertical-align:middle;" class="btn btn-success btn-sm" id="nameModifybtn" value="닉네임 변경"> 
												</td>       
											  
											</tr>     
											<tr class="nickShow" style="display:none">  
											<th style="float:left; font-size:20px;">변경 할 닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
											<td style="align:right;"><input style="height:40px;" id="myNewNick" type="text"></td>
											<td><input type="button" style="float:right" class="btn btn-outline-success" id="nickModifybtn" value="변경"></td> 
											</tr>   
									
     
											
											<tr>
												<th>전화번호</th> 
												<td colspan="3">${myvo.user_tel}  
												<input type="button" style="float:right" class="btn btn-success btn-sm" id="telModifybtn" value="전화번호 변경">
												</td>
											</tr>
											<tr class="telShow" style="display:none">
											<th style="font-size:20px;"> 변경 할 번호</th>
											<td><input type="tel" style="height:40px;" id="myNewTel"></td>
											<td style="float:right"><input type="button" class="btn btn-outline-success" id="telModifybutton" value="변경"></td>
											</tr>
											
											<tr>
												<th>주소</th>
												<td colspan="3">${myvo.user_addr} 
												<input type="button" style="float:right" class="btn btn-success btn-sm" id="addrModifybtn" value="배송주소 변경">
												</td>
											</tr>   
											<tr class="addrShow" style="display:none">
											<th style="font-size:20px;">변경 할 주소</th>
											
											<td><input style="height:30px;" readonly type="text" id="sample6_postcode" placeholder="우편번호"></td>
											<td><input style="height:30px;" readonly type="text" id="sample6_address" placeholder="주소"></td>
											<td><input class="btn btn-success btn-sm"style="float:left" type="button" id="addrModifybutton" value="주소지 찾기"></td>
											</tr>  
											
											<tr class="addrShow" style="display:none">
											<td colspan="3"><input style="width:500px; height:40px; float:right;" readonly type="text" id="sample6_detailAddress" placeholder="상세주소"></td>
											</tr> 
											 
											<tr class="addrShow" style="display:none">
											<td colspan="3"><input style="width:500px; height:40px; float:right;'" type="text" id="sample6_extraAddress" placeholder="참고항목"></td>
											<td><input class="btn btn-outline-success"style="float:right" type="button" id="addrModifyConfirm" value="변경" ></td>
											</tr> 
											
											<br/> 
											<br/>
										</table>
										<a href="index.giv"><input id="cancle" type="button" class="btn btn-block btn-success btn-lg"
													value="홈으로" style="width:25%"></a>  
										<br/><br/><br/> 
										<table class="table table-boardered">
										<h3 class="display-6">기타 유저 정보</h3>
										<tr>  
											<th>생년월일</th>
											<td><label id="birthDetect"></label></td>
										</tr>
										<tr>
											<th>성별</th>
											<td><label id="genderDetect"></label></td>
										</tr>  
										<tr>
											<th>마일리지</th>
											<td>${myvo.user_cash}</td>
										</tr>
										</table> 
										
								</section>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
                        <label>서비스문의:</label><a href="mailto:name@email.com">name@email.com</a>
                    </div>
                    <p class="lead mb-5">'${myvo.user_name}'이라는 천사를 드릴게요.&nbsp;&nbsp;&nbsp;&nbsp; from GIVENGEL, to everyone</p> 
                    <div class="social-icons">
                        <a class="social-icon" href="https://www.instagram.com/"><i class="fab fa-linkedin-in"></i></a>
                        <a class="social-icon" href="https://github.com/GIVENGEL"><i class="fab fa-github"></i></a>
                        <a class="social-icon" href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                        <a class="social-icon" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                    </div>
                </div> 
            </section>
            <hr class="m-0" />
            <!-- Experience-->
            <section class="resume-section" id="experience">
                <div class="resume-section-content"> 
                    <h2 style="color:#FF9D62" class="mb-5">&nbsp;&nbsp;&nbsp;장바구니</h2>
                  <section class="shoping-cart spad"> 
		<div class="container">
			<div class="row"> 
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">담은 물품</th>
									<th>가격</th>
									<th>수량</th>
									<th>합계</th>
									<th></th>
								</tr>
							</thead>
							<tbody class="myCartListBody">
						<%-- 		<tr>
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
</tr> --%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
			
				<div class="col-lg-6 ">
				<div class="shoping__cart__btns">
						<a href="buyList.giv" class="primary-btn cart-btn">쇼핑 계속하기</a> 
					</div>
				</div>
				<div class="col-lg-6 ">
					<div class="shoping__checkout">
						<h5>장바구니 전체 결제액</h5>
						<ul>
							<li><label style="font-size:25px">총 가격</label>&nbsp;&nbsp;&nbsp;<label style="font-size:18px; color:red;" id="myTotalBuyAc"></label><label style="font-size:18px; color:red;">원</label></li>
							<li><label style="font-size:22px">적립 마일리지</label>&nbsp;&nbsp;&nbsp;<label style="font-size:18px; color:red;" class="mysaveCashNow"></label><label style="font-size:18px; color:red;">점</label></li>
						</ul>     
						<a href="#" class="primary-btn myCartBuybtn">구매하기</a>
					</div> 
				</div>
			</div>
		</div>
	</section>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Education-->
            <section class="resume-section" id="education">
            <div class="container">
            	<div class="row">
                <div class="resume-section-content myCashListBox" id="myCashListBox">
                </div>
                </div>
                 <ul class="pagination mycashPaging">
                
				</ul> 
                </div>
            </section>
            <hr class="m-0" /> 
            <!-- Skills-->
          
            <section class="resume-section" id="skills">
            <div class="container">
            	<div class="row">
                <div class="resume-section-content myBuyList" >
             
                      
                      
                </div> 
                 <ul class="pagination myBuyPaging">
				</ul>
				</div> 
			</div>
            </section>
            <hr class="m-3" />
            <!-- Interests-->
            <section class="resume-section" id="interests">
            <div class="container">
            <div class="row">
                <div class="resume-section-content myfleaMarket">
                    
                </div>
               </div>
                <ul class="pagination myfleaPaging">
                
				</ul> 
             </div>
            </section>
            
        </div>
        
        




	<!-- Footer Section Begin -->
	
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${path}/resources/js/jquery-ui.min.js"></script>
	<script src="${path}/resources/js/jquery.slicknav.js"></script>
	<script src="${path}/resources/js/mixitup.min.js"></script>
	<script src="${path}/resources/js/owl.carousel.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	
	
	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${path}/resources/js_page/myPage.js"></script>
        
	<!-- mypageK -->
	   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	   <script src="${path}/resources/js_page/mypageK.js"></script>
 
</body>



</html>