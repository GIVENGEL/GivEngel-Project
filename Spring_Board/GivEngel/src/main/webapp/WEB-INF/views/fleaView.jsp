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

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="${path}/resources/img/flea/details_flea.jpg" width="1920px">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>SUMMER SEASON COMING SOON</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>중고 장터 게시판</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Details Section Begin -->
	<input type="hidden" value="${flea.flea_no }" name="flea_no" id="flea_no" >
	<input type="hidden" value="${user.user_id }" name="user_id" id="user_id">
	
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<a href="fleaView.giv?flea_no=${flea.flea_no }"><img src="${path}/resources/img/flea/${flea.flea_img }" alt="${flea.flea_no }"></a>
						</div>
					</div>
				</div>
				
				
					<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>[${flea.flea_title}]</h3>
						<p style="font-size: 22px; font-weight: 30px;">${flea.flea_content}</p>
						<div class="product__details__price" id='defalutPrice'>
						${flea.flea_price}원</div>
						
						<a href="#" class="primary-btn" id='buyFleaBtn'>구매하기</a> 
						<a href="#" id='cartFleaBtn' class="primary-btn">장바구니에 담기</a> 
						<a href="#" class="heart-icon"><span
							class="icon_heart"></span></a>
							
							<div class="blog__details__author" style="margin-top: 50px">
									<div class="blog__details__author__pic">
										<img src="${path}/resources/img/blog/details/details-author.jpg" alt="">
									</div>
									<div class="blog__details__author__text">
										<h6>${flea.flea_writer }</h6>
										<span>[명예등급]</span>
									</div>
								</div>
								
						<ul>
										<li><span>등록일</span> ${flea.flea_date }</li>
									</ul>
									<div class="blog__details__social">
										<a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
										<a href="https://twitter.com/?lang=ko"><i class="fa fa-twitter"></i></a>
										<a href="https://www.google.co.kr/"><i class="fa fa-google-plus"></i></a> <a href="https://www.google.co.kr/"><i
											class="fa fa-linkedin"></i></a> <a href="https://kr.linkedin.com/"><i
											class="fa fa-envelope"></i></a>
									</div>
									<c:if test="${user.user_id == flea.flea_writer && flea.flea_isokay == 'null'}">
									<button type="button" class="btn btn-outline-secondary float-right" id="deleteFleaBtn">삭제하기</button>
									</c:if>
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
								href="#tabs-3" role="tab" aria-selected="false" id="countFleaComTotal">리뷰 (${countFleaCom }개)</a></li>
								 <input type="hidden" id="countFleaCom" value="${countFleaCom }" />
						</ul>
						<div class="tab-content">
							<div class="tab-pane active text-center" id="tabs-1"
								role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>상품 설명</h6>
									<p>[상품 설명]</p>
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
								
								
								<!-- 댓글 목록 불러오기 ----------------------------------------- -->
										<div id="listFleaCom">
										<input type="hidden" value="${user.user_id }" id="user_id">
									

					
										</div> 
								<!-- 댓글 목록불러오기 end ------------------------------------ -->



								<!-- 댓글 입력창 -->
								<c:if test="${user != null }">
								<div class="card mb-2 col-lg-12">
									<div class="card-header bg-light">
										<i class="fa fa-comment fa"></i> REPLY
									</div>
									<div class="card-body">
										<ul class="list-group list-group-flush">
											<li class="list-group-item">
												<div class="form-inline mb-2">
													<label for="replyId"><i
														class="fa fa-user-circle-o fa-2x"></i></label>
														<input type="text" class="form-control ml-2" placeholder="${user.user_id }" value="${user.user_id }"
														id="flea_com_writer" name="flea_com_writer">
														</div> <textarea class="form-control"
													id="flea_com_content" name="flea_com_content" rows="3"></textarea>
												<button type="button"
													class="btn btn-success mt-3 float-right" id="sponComBtn">답글 달기</button>
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
	</section>
	<!-- Blog Details Section End -->

	<!-- Related Blog Section Begin -->
	<section class="related-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related-blog-title">
						<h2>지금 이 순간, 캠페인</h2>
					</div>
				</div>
			</div>
			<div class="row">
			<c:forEach var="campaign" items="${campaignList}" begin="0" end="2">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="${path}/resources/img/sponsor/${campaign.spon_img }" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i>${campaign.spon_end }</li>
							</ul>
							<h5>
								<a href="#">${campaign.spon_name }</a>
							</h5>
							<p>${campaign.spon_comment }</p>
						</div>
					</div>
				</div>
			</c:forEach>

			</div>
			
		</div>
	</section>
	<!-- Related Blog Section End -->

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
	<script src="${path}/resources/js_page/flea.js"></script>



</body>

</html>