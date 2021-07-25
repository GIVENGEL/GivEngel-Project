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
                        <span class="text-primary">${user.user_name}님<p style="font-size:30px">GIVENGEL입니다. 환영합니다</p></span>
                        <input id="hiddenmypw" type="hidden" value="${user.user_pw}">
                        <input id="hiddenmyno" type="hidden" value="${user.user_no}">
                        <input ud="hiddenmynick" type="hidden" value="${user.user_name}">
                        <input id="hiddenmytel" type="hidden" value="${user.user_tel}">
                        <input id="hiddenmyaddr" type="hidden" value="${user.user_addr}">
                    </h2>   
                    <div class="subheading mb-5">
                        <a class="myInfoModify" href="myPageModify.giv">회원 정보 수정하기</a>
                        <br/><br/><br/>  
                        <section class="hero">
		<div class="container">
			<div class="row"> 

				<div class="col-lg-9">
					<div>

    
						<div>
							<section class="container">     
								<section class="login-form">
									<hr style="border: solid 1px">
									<label class="display-4 text-dark">회원 정보 수정</label>
										<table class="table table-boardered">
										 										
											<tr>
												<th>명예등급</th>
												<td>명예등급임</td>
											</tr>
											<tr>
												<th>아이디</th>
												<td class="row">&nbsp;&nbsp;&nbsp;&nbsp;${user.user_id }</td>
											
											</tr>  
											<tr>
												<th>비밀번호</th>
												<td>********				
												<input type="button" style="float:right" class="btn btn-success btn-sm" id="pwModifybtn"  value="비밀번호 변경">
												</td>
											</tr>
											
											<tr class="pwdShow" style="display:none">  
											<th style="float:right">현재 비밀번호</th>
											<td><input id="myNowPass" type="password"></td>
											</tr>
											<tr class="pwdShow" style="display:none">
											<th style="float:right">신규 비밀번호</th>
											<td><input id="myNewPass" type="password"></td>
											</tr>
											<tr class="pwdShow" style="display:none">
											<th style="float:right">신규 비밀번호 재입력</th>
											<td><input id="myNewPassOK" type="password"></td>
											</tr> 
											<tr class="pwdShow" style="display:none">
											<td style="float:right"><input type="button" value="변경" class="btn btn-success" id="pwdButton"></td>
											</tr>
											
											<tr>
												<th>이름</th> 
												<td>${user.user_name}
												<input type="button" style="float:right" class="btn btn-success btn-sm" id="nameModifybtn" value="닉네임 변경">
												</td>
											
											</tr>     
											<tr class="nickShow" style="display:none">  
											<th style="float:right">변경 할 닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
											<td style="align:right"><input id="myNewNick" type="text"></td>
											</tr>  
											<tr class="nickShow" style="display:none">  
											<td><input type="button" style="float:right" class="pull-right" id="nickModifybtn" value="변경"></td>
											</tr>   
     
											
											<tr>
												<th>전화번호</th>
												<td>${user.user_tel }
												<input type="button" style="float:right" class="btn btn-success btn-sm" id="telModifybtn" value="전화번호 변경">
												</td>
											</tr>
											<tr class="telShow" style="display:none">
											<th> 변경 할 번호</th>
											<td><input type="tel" id="myNewTel"></td>
											</tr>
											<tr class="telShow" style="display:none">
											<td style="float:right"><input type="button" id="telModifybutton" value="변경"></td>
											</tr>
											<tr>
												<th>주소</th>
												<td>${user.user_addr}
												<input type="button" style="float:right" class="btn btn-success btn-sm" id="addrModifybtn" value="배송주소 변경">
												</td>
											</tr>  
											<tr class="addrShow" style="display:none">
											<th> 변경 할 주소</th>
											<td><input type="text" id="myNewAddr"></td>
											</tr>  
											<tr class="addrShow" style="display:none">
											<td style="float:left"><input type="button" id="addrModifybutton" value="주소지 찾기" ></td>
											<td style="float:right"><input type="button" id="addrModifyConfirm" value="변경" ></td>
											</tr> 
											  
											
											<br/> r
											<br/>
										</table>
										<input id="cancle" type="button" class="btn btn-block btn-success btn-lg"
													value="되돌아가기" style="width:25%">  
										<br/><br/><br/>
										<table class="table table-boardered">
										<h3 class="display-6">기타 유저 정보</h3>
										<tr>  
											<th>생년월일</th>
											<td>생년월일임</td>
										</tr>
										<tr>
											<th>성별</th>
											<td>성별임</td>
										</tr>
										<tr>
											<th>마일리지</th>
											<td>마일리지총액임</td>
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
                    <p class="lead mb-5">'${user.user_name}'이라는 천사를 드릴게요.&nbsp;&nbsp;&nbsp;&nbsp; from GIVENGEL</p> 
                    <div class="social-icons">
                        <a class="social-icon" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-github"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-twitter"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-facebook-f"></i></a>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Experience-->
            <section class="resume-section" id="experience">
                <div class="resume-section-content">
                    <h2 class="mb-5">장바구니[ajax 페이징처리]</h2>
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
							<tbody>
								<tr>
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
								</tr>
								<tr>
									<td class="shoping__cart__item"><img
										src="${path}/resources/img/cart/cart-1.jpg" alt="">
										<h5>[물품2 이름]</h5></td>
									<td class="shoping__cart__price">[물품2 가격]</td>
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
								</tr>
								<tr>
									<td class="shoping__cart__item"><img
										src="${path}/resources/img/cart/cart-1.jpg" alt="">
										<h5>[물품3 이름]</h5></td>
									<td class="shoping__cart__price">[물품3 가격]</td>
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
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
			
				<div class="col-lg-6 ">
				<div class="shoping__cart__btns">
						<a href="#" class="primary-btn cart-btn">쇼핑 계속하기</a> 
					</div>
				</div>
				<div class="col-lg-6 ">
					<div class="shoping__checkout">
						<h5>장바구니 전체 결제액</h5>
						<ul>
							<li>총 가격 <span>[가격 계산]</span></li>
							<li>적립 마일리지 <span>[적립될 마일리지]</span></li>
						</ul>
						<a href="#" class="primary-btn">구매하기</a>
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
                <div class="resume-section-content" id="myCashListBox">
                    <h2 class="mb-5">마일리지 사용내역[ajax 페이징 처리]</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">[마일리지 내역 로그]</h3>
                            <div class="subheading mb-3">[사용/얻은 마일리지]</div>
                            <div>[관련 후원단체]</div>
                            <p>[관련 캠페인]</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">[로그 날짜]</span></div>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Skills-->
            <section class="resume-section" id="skills">
                <div class="resume-section-content">
                    <h2 class="mb-5">구매내역[ajax 페이징 처리]</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">[구입한 물품]</h3>
                            <div class="subheading mb-3">[사용한 금액]</div>
                            <div>[상품번호]</div>
                            <p>[구입한 개수 ]</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">[로그 날짜]</span></div>
                    </div>
                    
                </div>
            </section>
            <hr class="m-0" />
            <!-- Interests-->
            <section class="resume-section" id="interests">
                <div class="resume-section-content">
                    <h2 class="mb-5">중고장터 등록상품</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">[등록한 물품]</h3>
                            <div class="subheading mb-3">[등록한 금액]</div>
                            <div>[중고상품번호]</div>
                            <p>[통과 여부 ]</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">[로그 날짜]</span></div>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Awards-->
            <section class="resume-section" id="awards">
                <div class="resume-section-content">
                    <h2 class="mb-5">Awards & Certifications</h2>
                    <ul class="fa-ul mb-0">
                        <li>
                            <span class="fa-li"><i class="fas fa-trophy text-warning"></i></span>
                            Google Analytics Certified Developer
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-trophy text-warning"></i></span>
                            Mobile Web Specialist - Google Certification
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-trophy text-warning"></i></span>
                            1
                            <sup>st</sup>
                            Place - University of Colorado Boulder - Emerging Tech Competition 2009
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-trophy text-warning"></i></span>
                            1
                            <sup>st</sup>
                            Place - University of Colorado Boulder - Adobe Creative Jam 2008 (UI Design Category)
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-trophy text-warning"></i></span>
                            2
                            <sup>nd</sup>
                            Place - University of Colorado Boulder - Emerging Tech Competition 2008
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-trophy text-warning"></i></span>
                            1
                            <sup>st</sup>
                            Place - James Buchanan High School - Hackathon 2006
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-trophy text-warning"></i></span>
                            3
                            <sup>rd</sup>
                            Place - James Buchanan High School - Hackathon 2005
                        </li>
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
<jsp:include page="module/footer.jsp" />


</html>