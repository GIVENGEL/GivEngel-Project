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

    <jsp:include page="module/navbar.jsp"/>

	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">

				<div class="col-lg-6">
					<div>
						<div>
							<label class="display-4 text-center">Welcome to GivEngel</label>
						</div>

						<div >
							<section class="container">
								<section class="login-form">
									<form method="post" action="" role="login">
										<h2>로그인</h2>
										<p>등록하신 계정을 입력하세요.</p>
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<span class="text-primary glyphicon glyphicon-envelope"></span>
												</div>
												<input type="email" name="email" placeholder="이메일 아이디"
													required class="form-control" />
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon">
													<span class="text-primary glyphicon glyphicon-lock"></span>
												</div>
												<input type="password" name="password" placeholder="비밀번호"
													required class="form-control" />
											</div>
										</div>
										<button type="submit" name="go"
											class="btn btn-block btn-success">Sign in</button>
										<a href="/GivEngel/Givengel?cmd=find-page" class="btn btn-block btn-default">계정을 잊어버리셨나요?</a>
										<a href="/GivEngel/Givengel?cmd=join-page" class="btn btn-block btn-default">GivEngel
											가입하기</a>
									</form>
								</section>
							</section>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
				<img class="hidden-xs hidden-sm mt-4" src="${path}/resources/img/login.jpg" alt="">
				</div>
			</div>
			</div>
	</section>
	<!-- Hero Section End -->


	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.html"><img src="${path}/resources/img/logo.png" alt=""></a>
						</div>
						<ul>
							<li>주소 : 대한민국 서울특별시 금천구 가산디지털로 123</li>
							<li>연락처 : 82+ 010-9159-5358</li>
							<li>이메일: github.com/GIVENGEL</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>프로젝트 설명</h6>
						<ul>
							<li><a href="#">팀원 설명</a></li>
							<li><a href="#"></a>:D</li>
							<li><a href="#">프로젝트 설계</a></li>
							<li><a href="#">프로젝트 개발과정</a></li>
							<li><a href="#">프로젝트 후기</a></li>
							<li><a href="#">자료실</a></li>
						</ul>
						<ul>
							<li><a href="#">김승철 편이슬</a></li>
							<li><a href="#">김인철 김민주</a></li>
							<li><a href="#">찢었죠</a></li>
							<li><a href="#">잠못잤죠</a></li>
							<li><a href="#">힘들었죠</a></li>
							<li><a href="#">깃허브에 있죠</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>저희 깃허브 Organization 에 놀러오세요!</h6>
						<p>GivEngel 프로젝트를 성공적으로 마치..겠죠?</p>
						<form action="#">
							<input type="text" placeholder="Enter your Message">
							<button type="submit" class="site-btn">메시지 보내기</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>document.write(new Date().getFullYear());</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="${path}/resources/img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
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
	
	<!--  페이지 제어 제이쿼리  -->
	<script src="${path}/resources/js_page/loginForm.js"></script>



</body>

</html>