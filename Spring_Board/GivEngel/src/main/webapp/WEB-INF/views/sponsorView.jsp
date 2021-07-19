
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
							<br><br><br>


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
											class="btn btn-block btn-success" >
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