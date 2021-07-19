
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		data-setbg="img/blog/details/details-hero.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__details__hero__text">
						<h2>Select 로 받아온 후원 단체 이름 넣기</h2>
						<ul>
							<li>후원 만료일</li>
							<li><h3 class="text-white">총 누적 금액</h3></li>
							<li>댓글 수</li>
						</ul>
						<ul>
							<li>~21.07.31</li>
							<li><h3 class="text-white">1,001,514 원</h3></li>
							<li>43 개</li>
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
			<div class="row">
				<div class="col-lg-8 col-md-5 order-md-1 order-2">
					<div class="blog__sidebar">
						<h2>
							[단체명] 후원 하기
							</h3>
							<hr />
							<p>대충 해당 후원단체에 대한 설명 데이터베이스에서 가져오기</p>
							<br>
							<br>
							<br>


							<div class="row">
								<div class="col-lg-3"></div>
								<div class="col-lg-6">
									<hr>
									<input type="number" class="form-control mb-4" name="id"
										placeholder="후원 금액을 입력하세요!">
								</div>

								<div class="col-lg-3">
									<hr>
									<button type="button" name="donation"
										class="btn btn-block btn-success">
										<spaa>후원하기!</spaa>
									</button>
								</div>
							</div>
							<br>
							<hr>
							<h3>From GivEngel...</h3>
							<br>
							<p>대충 후원은 어떤 사회적 발전을 가져오는지 설명하는 GivEngel 가이드 불라불라</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-7 order-md-1 order-1">
					<div class="blog__details__text">
						<img src="img/blog/details/details-pic.jpg" alt="">

					</div>
					<div class="blog__details__content">
						<div class="row">
							<div class="col-lg-6">
								<div class="blog__details__author">
									<div class="blog__details__author__pic">
										<img src="img/blog/details/details-author.jpg" alt="">
									</div>
									<div class="blog__details__author__text">
										<h6>GivEngel 이미지 사진 넣기</h6>
										<span>Admin</span>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="blog__details__widget">
									<ul>
										<li><span>Categories:</span> Campaign</li>
										<li><span>Tags:</span> 태그 내용 넣기</li>
									</ul>
									<div class="blog__details__social">
										<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
											class="fa fa-twitter"></i></a> <a href="#"><i
											class="fa fa-google-plus"></i></a> <a href="#"><i
											class="fa fa-linkedin"></i></a> <a href="#"><i
											class="fa fa-envelope"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!--  캠페인 상품 리스트 출력 -->
			<div class="filter__item">
				<div class="row">
					<div class="col-lg-4 col-md-5">
						<div class="filter__sort">
							<span>정렬</span> <select>
								<option value="0">낮은 가격순</option>
								<option value="0">높은 가격순</option>
							</select>
						</div>
					</div>
					<div class="col-lg-4 col-md-4">
						<div class="filter__found">
							<h6>
								<span>[숫자]</span> 검색된 상품 개수 출력
							</h6>
						</div>
					</div>
					<div class="col-lg-4 col-md-3">
						<div class="filter__option">
							<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-1.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">상품명</a>
							</h6>
							<h5>가격</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-2.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-3.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-4.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-5.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-6.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-7.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-8.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-9.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-10.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-11.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-12.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
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
								href="#tabs-3" role="tab" aria-selected="false">리뷰 <span>(댓글
										수)</span></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active text-center" id="tabs-1"
								role="tabpanel">
								<div class="product__details__tab__desc">
									<h6> 대표의 말</h6>
									<p>[캠페인 설명]</p>
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
												class="headings d-flex justify-content-between align-items-center mb-3">
												<h5>댓글 (댓글수)</h5>
												<div class="buttons">
													<span
														class="badge bg-white d-flex flex-row align-items-center">
														<span class="text-primary">Comments "ON"</span>

													</span>
												</div>
											</div>

											<!-- 댓글 하나 -->
											<div class="card p-3 mb-5">
												<div
													class="d-flex justify-content-between align-items-center">
													<div class="user d-flex flex-row align-items-center">
														<img src="https://i.imgur.com/hczKIze.jpg" width="30"
															class="user-img rounded-circle mr-2"> <span><small
															class="font-weight-bold text-primary">[유저 아이디]</small> <small
															class="font-weight-bold">[유저가 남긴 메시지]</small></span>
													</div>
													<small>[작성일]</small>
												</div>
												<div
													class="action d-flex justify-content-between mt-2 align-items-center">
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
											<!-- 댓글 하나 -->
											<div class="card p-3 mb-5">
												<div
													class="d-flex justify-content-between align-items-center">
													<div class="user d-flex flex-row align-items-center">
														<img src="https://i.imgur.com/hczKIze.jpg" width="30"
															class="user-img rounded-circle mr-2"> <span><small
															class="font-weight-bold text-primary">[유저 아이디]</small> <small
															class="font-weight-bold">[유저가 남긴 메시지]</small></span>
													</div>
													<small>[작성일]</small>
												</div>
												<div
													class="action d-flex justify-content-between mt-2 align-items-center">
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
											<!-- 댓글 하나 -->
											<div class="card p-3 mb-5">
												<div
													class="d-flex justify-content-between align-items-center">
													<div class="user d-flex flex-row align-items-center">
														<img src="https://i.imgur.com/hczKIze.jpg" width="30"
															class="user-img rounded-circle mr-2"> <span><small
															class="font-weight-bold text-primary">[유저 아이디]</small> <small
															class="font-weight-bold">[유저가 남긴 메시지]</small></span>
													</div>
													<small>[작성일]</small>
												</div>
												<div
													class="action d-flex justify-content-between mt-2 align-items-center">
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
														class="form-control ml-2" placeholder="Enter yourId"
														id="replyId"> <label for="replyPassword"
														class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
													<input type="password" class="form-control ml-2"
														placeholder="Enter password" id="replyPassword">
												</div> <textarea class="form-control"
													id="exampleFormControlTextarea1" rows="3"></textarea>
												<button type="button"
													class="btn btn-success mt-3 float-right"
													onClick="javascript:addReply();">답글 달기</button>
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



</body>

</html>