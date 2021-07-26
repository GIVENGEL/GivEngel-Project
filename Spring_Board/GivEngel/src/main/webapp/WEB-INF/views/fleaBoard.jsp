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
		data-setbg="${path}/resources/img/flea/details_flea.jpg" width="1920px">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>중고 장터 게시판</h2>
						<a href=""> 2021 SUMMER SEASON</a>
						<div class="breadcrumb__option">
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

<!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <jsp:include page="module/sidebar.jsp" />
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                        
                        <c:forEach items="${fleaList }" var="flea">
                        <input type="hidden" value="${flea.flea_no }" name="flea_no" id="flea_no">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic" style="border:2px solid #f9f9f9">
                                    <c:choose>
									<c:when test= "${flea.flea_isokay == '0' }"><a href="fleaView.giv?flea_no=${flea.flea_no }"><img src="${path}/resources/img/flea/soon.jpg" alt=""></a></c:when>
									<c:otherwise><a href="fleaView.giv?flea_no=${flea.flea_no }"><img src="${path}/resources/img/flea/${flea.flea_img }" alt="${flea.flea_no }" ></a></c:otherwise>
									</c:choose>
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i> ${flea.flea_date }</li>
                                        <li><i class="fa fa-comment-o"></i><span id="countSponCom2"></span></li>
                                    </ul>
                                    <h5><a href="#">${flea.flea_title }</a></h5>
                                    <p>${flea.flea_price }원 </p>
                                    <a href="fleaView.giv?flea_no=${flea.flea_no }" class="blog__btn">자세히 보기 <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                      
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                                <c:if test="${sessionScope.user != null}">
                                <button type="button" class="btn btn-success float-right"><a href="fleaWrite.giv">신청하기</a></button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
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