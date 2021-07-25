<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<link rel="stylesheet" href="${path}/resources/css/quantity.css" type="text/css">

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
						 <!-- ********************************** -->
                        <!-- 김민주 -->
                        <!-- 제이쿼리 사용하기 위한 id 부여 -->
                        <ul id='categories'>
                            <li><a href="#">전체 상품</a></li>
                            <li><a href="#">TOP</a></li>
                            <li><a href="#">BOTTOM</a></li>
                            <li><a href="#">BAG</a></li>
                            <li><a href="#">ACC</a></li>
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
		data-setbg="${path}/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>상품 구매 절차</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> 
							<a href="buyList.giv?categories=${categories}">${categories}</a> 
							<span>${goodVO.good_name}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${path}/resources/img/good/${goodVO.good_img}" alt="">
						</div>
						<div style='text-align: center;'>인기상품 추천</div>
						<div class="product__details__pic__slider owl-carousel">
							<c:forEach items="${rankingGood }" var='rankingGood'>
							<a href='buyForm.giv?good_no=${rankingGood.good_no }'><img src="${path}/resources/img/good/${rankingGood.good_img}" alt=""></a>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3 id=good_name>${goodVO.good_name}</h3>
						<div class="product__details__rating">
							<!--  별 찍는 방법 -->
							<!-- <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i> -->
							<span>댓글 / ${totalGoodCom}</span>
						</div>
						<div class="product__details__price" id='defalutPrice'><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${goodVO.good_price}" /></div>
						<input type="hidden" value='${goodVO.good_no}' id='good_no_cart' />
						<p>${goodVO.good_detail}</p>
						<div class="good__details__quantity">
							<div class="quantity">
								<div class="good-qty">
									<span id='minus'>-</span>
									<input id ='buyCntNow' type="text" value="1">
									<span id='plus'>+</span>
								</div>
							</div>
						</div>
						<a href="#" class="primary-btn" id='buyGoodBtn'>구매하기</a> 
						<a href="javascript:void(0);" onclick='addcart();' id='addCart'
							class="primary-btn">장바구니에 담기</a> 
						<a href="#" class="heart-icon"><span
							class="icon_heart"></span></a>
						<ul>
							<li><b>상품 카테고리</b> <span>${categories}</span></li>
							<li><b>남은 재고</b> <span id='goodStock'> ${goodVO.good_stock}</span><br></li>							
							<li><b>총 금액</b><span id='totalPrice'>${goodVO.good_price} 원</span></li>

							<li><b>공유하기</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
				</div>
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
								href="#tabs-3" role="tab" aria-selected="false">리뷰 <span>(${totalGoodCom})</span></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active text-center" id="tabs-1"
								role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>상품 설명</h6>
									<p>${goodVO.good_detail}</p>
								</div>
							</div>
							<div class="tab-pane text-center" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>GivEngel 이용수칙</h6>
									<p>이용 수칙~~</p>
									<p>2용 수칙~~</p>
								</div>
							</div>
							<div class="tab-pane " id="tabs-3" role="tabpanel">
								<!-- 댓글 출력창 -->
								<div class="container mt-5 mb-5">
									<div class="row d-flex justify-content-center">
										<div class="col-md-12">
											<div
												class="headings d-flex justify-content-between align-items-center mb-3" id='listGoodCom'>
												<h5>댓글  (${totalGoodCom}) </h5>
												<div class="buttons">
													<span
														class="badge bg-white d-flex flex-row align-items-center">
														<span class="text-primary">Comments "ON"</span>

													</span>
												</div>
											</div>

											<!-- 댓글 하나 -->
											<c:forEach items="${comVO }" var='voList'>
											<div class="card p-3 mb-5">
												<div class=" justify-content-between align-items-center w-75">
													<div class="d-flex flex-row align-items-center">
														<img src="https://i.imgur.com/hczKIze.jpg" width="30"
															class="user-img rounded-circle mr-2">
															
															
															<div class="container">
        														<div class="row">
          													 <small
															class="font-weight-bold text-primary" >${voList.good_com_writer } </small><small> . ${voList.good_com_date }</small><br> 
															<c:choose>
															<c:when test="${user.user_id == voList.good_com_writer}">
															<textarea
															class="font-weight-bold com_content w-100" >${voList.good_com_content }</textarea>
															</c:when>
															<c:otherwise>
															
															<small
															class="font-weight-bold w-100">${voList.good_com_content }</small>
															</c:otherwise>
															</c:choose>
															
       															 </div>
   															 </div>
															
															 
															
															
															
															<input class='com_no' type="hidden" value='${voList.good_com_no }'>
													</div>
													
												</div>
												<c:if test="${user.user_id == voList.good_com_writer}">
												<div class="action d-flex justify-content-between mt-2 align-items-center">
													<div class="row w-100">
													<div class="col-8" style="height:1px">
													</div>
													<div class="col-4">
													<button type="button"  class='btn btn-light btn-lg  comModify float-right' >
														<small>수정하기</small>
														<span class="dots"></span>
														</button>
														<button type="button" class='btn btn-dark btn-lg comDelete float-right'  style="margin-right:10px">
														<small>삭제하기</small> <span class="dots"></span> 
														</button>
													</div>
														
													</div>
												</div>
												</c:if>
											</div>
											</c:forEach>
											
										</div>
									</div>
								</div>
								<!-- 댓글 출력창 end -->

								<!-- 댓글 입력창 -->
								<c:if test="${user != null}">
								<div class="card mb-2 col-lg-12">
									<div class="card-header bg-light">
										<i class="fa fa-comment fa"></i> REPLY
									</div>
									<div class="card-body">
										<ul class="list-group list-group-flush">
											<li class="list-group-item">
												<div class="form-inline mb-2">
													<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label> 
													<input type="text" class="form-control ml-2" id='good_com_writer' value='${user.user_id}' readOnly> 
													<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
													<input type="password" class="form-control ml-2"
														   placeholder="Enter password" id="user_pw" name='user_pw'>														   
												</div> 
												<textarea class="form-control"
													id="good_com_content" rows="3" name='good_com_content'></textarea>
												<button type="button" class="btn btn-success mt-3 float-right" id='goodComBtn'>답글 달기</button>
											</li>
										</ul>
									</div>
								</div>
								</c:if>
								<!-- 댓글 입력창 end -->
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<hr>
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>Related Product</h2>
					</div>
				</div>
			</div>
			<div class="row">
			<!-- start foreach -->
			<c:forEach items="${ latestGood1}" var='latestGood1'>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="${path}/resources/img/good/${latestGood1.good_img}" style="cursor:pointer" onclick='location.href="buyForm.giv?good_no=${latestGood1.good_no}"'>
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart-o"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">${latestGood1.good_name}</a>
							</h6>
							<h5>${latestGood1.good_price}</h5>
						</div>
					</div>
				</div>
<!-- 				<div class="col-lg-3 col-md-4 col-sm-6"> -->
<!-- 					<div class="product__item"> -->
<!-- 						<div class="product__item__pic set-bg" -->
<%-- 							data-setbg="${path}/resources/img/product/product-2.jpg"> --%>
<!-- 							<ul class="product__item__pic__hover"> -->
<!-- 								<li><a href="#"><i class="fa fa-heart"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-retweet"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="product__item__text"> -->
<!-- 							<h6> -->
<!-- 								<a href="#">Crab Pool Security</a> -->
<!-- 							</h6> -->
<!-- 							<h5>$30.00</h5> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-3 col-md-4 col-sm-6"> -->
<!-- 					<div class="product__item"> -->
<!-- 						<div class="product__item__pic set-bg" -->
<%-- 							data-setbg="${path}/resources/img/product/product-3.jpg"> --%>
<!-- 							<ul class="product__item__pic__hover"> -->
<!-- 								<li><a href="#"><i class="fa fa-heart"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-retweet"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="product__item__text"> -->
<!-- 							<h6> -->
<!-- 								<a href="#">Crab Pool Security</a> -->
<!-- 							</h6> -->
<!-- 							<h5>$30.00</h5> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-3 col-md-4 col-sm-6"> -->
<!-- 					<div class="product__item"> -->
<!-- 						<div class="product__item__pic set-bg" -->
<%-- 							data-setbg="${path}/resources/img/product/product-7.jpg"> --%>
<!-- 							<ul class="product__item__pic__hover"> -->
<!-- 								<li><a href="#"><i class="fa fa-heart"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-retweet"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="product__item__text"> -->
<!-- 							<h6> -->
<!-- 								<a href="#">Crab Pool Security</a> -->
<!-- 							</h6> -->
<!-- 							<h5>$30.00</h5> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</c:forEach>
			<!--end foreach  -->
			</div>
		</div>
	</section>
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
	<!-- **************************************** -->
	<!-- 김민주 -->
	<!-- 제이쿼리 연동 -->
	<script src="${path}/resources/js_page/buyForm.js"></script>


</body>

</html>