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
										<a href="findForm.giv" class="btn btn-block btn-default">계정을 잊어버리셨나요?</a>
										<a href="joinForm.giv" class="btn btn-block btn-default">GivEngel
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
	<jsp:include page="module/footer.jsp" />
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