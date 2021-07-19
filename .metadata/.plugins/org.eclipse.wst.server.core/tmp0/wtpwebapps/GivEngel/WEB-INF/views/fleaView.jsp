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
<title>Ogani | Template</title>

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
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>[상품 명]</h2>
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
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-5 order-md-1 order-2">
					<jsp:include page="module/sidebar.jsp" />

				</div>
				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<div class="blog__details__text">
						<img src="img/blog/details/details-pic.jpg" alt="">
						<p>[상품 설명]</p>
						<h3>[상품 가격]</h3>
						<hr>
						<p>[GivEngel 중고 장터 이용수칙]</p>
					</div>
					<div class="blog__details__content">
						<div class="row">
							<div class="col-lg-6">
								<div class="blog__details__author">
									<div class="blog__details__author__pic">
										<img src="img/blog/details/details-author.jpg" alt="">
									</div>
									<div class="blog__details__author__text">
										<h6>[중고상품 판매자]</h6>
										<span>[명예등급]</span>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="blog__details__widget">
									<ul>
										<li><span>등록일</span> [상품 등록일]</li>
										<li><span>Tags:</span> All, Trending, Cooking, Healthy
											Food, Life Style</li>
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
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="img/blog/blog-1.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> [캠페인 만료일]</li>
								<li><i class="fa fa-comment-o"></i> [캠페인 댓글수]</li>
							</ul>
							<h5>
								<a href="#">[캠페인 이름]</a>
							</h5>
							<p>[캠페인 설명 20글자 까지 ...]</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="img/blog/blog-2.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5>
								<a href="#">6 ways to prepare breakfast for 30</a>
							</h5>
							<p>Sed quia non numquam modi tempora indunt ut labore et
								dolore magnam aliquam quaerat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="img/blog/blog-3.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5>
								<a href="#">Visit the clean farm in the US</a>
							</h5>
							<p>Sed quia non numquam modi tempora indunt ut labore et
								dolore magnam aliquam quaerat</p>
						</div>
					</div>
				</div>
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



</body>

</html>