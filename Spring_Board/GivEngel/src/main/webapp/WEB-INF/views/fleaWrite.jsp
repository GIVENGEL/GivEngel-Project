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
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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

	<!--  navbar &  side over wrap -->
	<jsp:include page="module/navbar.jsp" />


	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>All Categories</span>
						</div>
						<ul>
							<li><a href="#">전체 상품</a></li>
							<li><a href="#">TOP</a></li>
							<li><a href="#">BOTTOM</a></li>
							<li><a href="#">BAG</a></li>
							<li><a href="#">ACC</a></li>
							<li><a href="#">SHOES</a></li>
							<li><a href="#">SALES</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									All Categories <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="어떤 상품을 원하세요?">
								<button type="submit" class="site-btn">검색</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>010-9159-5358</h5>
								<span>24시간 상담 가능</span>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>


	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>물품 등록</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <a href="./index.html">[
								중고 장터 게시판]</a> <span>[물품 등록]</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6>
						<span class="icon_tag_alt"></span> 앗! 중고 장터는 처음이신가요? <a href="fleaManual.giv">[여기를 눌러주세요!]</a> 안내해드릴게요!
					</h6>
				</div>
			</div>
			<div class="checkout__form">
				<h4>상품 등록</h4>
				<form action="fleaWriteAction.giv" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="row">
								<div class="col-lg-12">
									<div class="checkout__input">
										<p>
											상품명<span>*</span>
										</p>
										<input type="text" name="flea_title" id="flea_title">
									</div>
								</div>

							</div>
							<div class="checkout__input">
								<p>
									상품가격<span>*</span>
								</p>
								<input type="number" name="flea_price" id="flea_price">
							</div>
							<div class="checkout__input">
								<p>
									상품 설명<span>*</span>
								</p>
								<textarea class="w-100" rows="5" cols="" name="flea_content" id="flea_content"></textarea>
							</div>


						
						
						<div class="checkout__input__checkbox">
							<label for="diff-acc"> 운송 정책에 동의하십니까? <input
								type="checkbox" id="diff-acc"> <span class="checkmark"></span>
							</label>
						</div>
						<div class="checkout__input__checkbox">
							<label for="acc"> GivEngel 이용 정책에 동의하십니까? <input
								type="checkbox" id="acc"> <span class="checkmark"></span>
							</label>
						</div>
						<p><span onclick="location.href='fleaManual.giv'">[GivEngel 이용 정책 설명]</span></p>
						<div class="checkout__input">
						<input type="hidden" value="${user.user_pw }" name="user_pw" id="user_pw">
						<input type="hidden" value="${user.user_id }" name="flea_writer" id="flea_writer">
							<p>
								판매 확인 비밀번호 입력<span>*</span>
							</p>
							<input type="password" id="password">
						</div>
						
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="checkout__order">
							<h4>이미지 등록</h4>
							<div class="checkout__order__products">
								이것만은 지켜주세요! 
							</div>
							<ul>
								<li>상품의 상태가 이미지에 잘 담기도록! <span></span></li>
								<li>GivEngel 중고장터에 위배되는 상품은 금지! </li>
								<li>부적절한 판매 행위는 제재당할 수 있습니다. </li>
							</ul>
							<div class="checkout__order__subtotal" id="inputImageView">
								<img id="inputImage" style="width:500px;" onerror="imgAreaError()" /> <br><br><br>
							</div>

							<input type="file" class="site-btn" id="file" name="file" onclick="setThumbnail(event);">
						</div>
					</div>
			</div>
			<button type="submit" class="site-btn w-50 " id="submitBtn">상품 등록하기</button>
			</form>
		</div>
		</div>
	</section>
	<!-- Checkout Section End -->
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<hr>
	
	<!-- Related Product Section End -->



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
	<script src="${path}/resources/js_page/flea.js"></script>


</body>

</html>