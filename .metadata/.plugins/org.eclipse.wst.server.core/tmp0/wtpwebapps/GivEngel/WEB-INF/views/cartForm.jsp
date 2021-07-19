
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


	<!--  navbar &  side over wrap -->
	<jsp:include page="module/navbar.jsp" />

	<jsp:include page="module/sideCategory.jsp" />

	<!-- Blog Details Hero Begin -->
	<section class="blog-details-hero set-bg"
		data-setbg="${path}/resources/img/blog/details/details-hero.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__details__hero__text">
						<h1 class="text-white"]>장바구니</h1>
						

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Hero End -->

	<!-- Shoping Cart Section Begin -->
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
	<!-- Shoping Cart Section End -->






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



</body>

</html>