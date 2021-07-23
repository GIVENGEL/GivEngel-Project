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
	<input name="spon_no" type="hidden" value="${spon.spon_no }" />
	<section class="blog-details-hero set-bg"
		data-setbg="${path}/resources/img/sponsor/details_${spon.spon_img }" width="1920px">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__details__hero__text">
						<h2>${spon.spon_name }</h2>
						<ul>
							<li>후원 만료일</li>
							<li><h3 class="text-white">총 누적 금액</h3></li>
							<li>댓글 수</li>
						</ul>
						<ul>
							<li>~21.07.31</li>
							<li id="spon_total"><h3 class="text-white">${spon.spon_total }</li>
							<li id="countSponCom"></li>
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

				<!-- 로그인 했을때 -->
				<c:if test="${user != null}">
					<div class="col-lg-8 col-md-5 order-md-1 order-2">
						<div class="blog__sidebar">
							<!-- 유저번호, 후원단체 이름 히든으로 받기 -->
							<input type="hidden" id="user_no" name="user_no" value="${user.user_no }">
							<input type="hidden" id="user_cash" name="user_cash" value="${user.user_cash }">
							<input type="hidden" id="spon_name" name="spon_name" value="${spon.spon_name }">
							<h2>[${spon.spon_name }] 후원 하기</h2>
							<hr />
							<p>${spon.spon_comment }</p>
							<br> <br> <br>


							<div class="row">

								<div class="col-lg-3"></div>
								<div class="col-lg-6">
									<hr>
									<input type="number" class="form-control mb-4" name="user_cashlog_price"
										id="user_cashlog_price" placeholder="${user.user_cash }">
								</div>

								<div class="col-lg-3">
									<hr>
									<button type="button" name="donation" id="donationBtn"
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
				</c:if>


				<!-- 로그인 안했을때 -->
				<c:if test="${user == null}">
					<div class="col-lg-8 col-md-5 order-md-1 order-2">
						<div class="blog__sidebar">
							<h2>
								[${spon.spon_name }] 후원 하기
								</h3>
								<hr />
								<p>${spon.spon_comment }</p>
								<br> <br> <br>


								<div class="row">

									<div class="col-lg-3"></div>
									<div class="col-lg-6">
										<hr>
										<input type="number" class="form-control mb-4" name="id"
											id="donationBox_notlogin" placeholder="${user.user_cash }">
									</div>

									<div class="col-lg-3">
										<hr>
										<button type="button" name="donation"
											id="donationBtn_notlogin" class="btn btn-block btn-success">
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
				</c:if>


				<!-- 후원단체 이미지 -->
				<div class="col-lg-4 col-md-7 order-md-1 order-1">
					<div class="blog__details__text" style="border:1px solid lightgrey">
						<img src="${path}/resources/img/sponsor/${spon.spon_img }" alt="">

					</div>
					<div class="blog__details__content">
						<div class="row">
							<div class="col-lg-6">
								<div class="blog__details__author">
									<div class="blog__details__author__pic">
										<img src="resources/img/blog/details/details-author.jpg"
											alt="">
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
			<!-- end of "row" -->


			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">후원단체
								소개</a></li>
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
								<h6>대표의 말</h6>
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
										<div class="headings d-flex justify-content-between align-items-center mb-3">
											<h5><span class="countSponCom"></span></h5>
											<div class="buttons">
												<span
													class="badge bg-white d-flex flex-row align-items-center">
													<span class="text-primary">Comments "ON"</span>

												</span>
											</div>
										</div>
										
										<!-- 댓글 목록 불러오기 ----------------------------------------- -->
										<div id="listSponCom">
									

										<!-- 댓글 하나 -->
										<!-- 
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
													<i class="fa fa-star text-warning"></i>
													<iclass="fa fa-check-circle-o check-icon"></i>
													</div>
												</div>
											</div> -->
										</div> 
										<!-- 댓글 목록불러오기 end ------------------------------------ -->
										
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
													<label for="replyId"><i
														class="fa fa-user-circle-o fa-2x"></i></label>
														<input type="text"
														class="form-control ml-2" placeholder="${user.user_id }"
														id="spon_com_writer" name="spon_com_writer"
														value="${user.user_id }"> <label
														for="replyPassword" class="ml-4"><i
														class="fa fa-unlock-alt fa-2x"></i></label> <input type="password"
														class="form-control ml-2" placeholder="Enter password"
														id="replyPassword">
												</div> <textarea class="form-control" id="spon_com_content" name="spon_com_content" rows="3"></textarea>
												<button type="button"
													class="btn btn-success mt-3 float-right" id="sponComBtn">답글
													달기</button> <!-- onClick="javascript:addReply(); -->
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
		<!-- end of container -->


		<!--  캠페인 상품 리스트 출력 -->
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
	<script src="${path}/resources/js_page/sponsor.js"></script>



</body>

</html>