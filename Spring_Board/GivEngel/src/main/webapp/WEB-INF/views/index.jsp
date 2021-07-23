
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

    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    
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
    <jsp:include page="module/navbar.jsp"/>
  
    <!-- 사이드 카테고리  -->
	<section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All Categories</span>
                        </div>
                        <ul id="categories">
 							<li><a href="#">TOP</a></li>
                            <li><a href="#">BOTTOM</a></li>
                            <li><a href="#">ACC</a></li>
                            <li><a href="#">BAG</a></li>
                            <li><a href="#">CAMPAIGN</a></li>                            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
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
                    <div class="hero__item set-bg" data-setbg="${path}/resources/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span style="color: red;">GivEngel .</span>
                            <h2 style="color: white">당신의 후원, <br />그들의 미소입니다.</h2>
                            <p style="color: red;">GivEngel는 당신들을 응원합니다.</p>
                            <a href="#"  class="primary-btn">돈쭐내주기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	
    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/cat-1.jpg">
                            <h5><a href="#">양키 캔들</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/cat-2.jpg">
                            <h5><a href="#">도자기 공예</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/cat-3.jpg">
                            <h5><a href="#">원예</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/cat-4.jpg">
                            <h5><a href="#">수제 비누</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/cat-5.jpg">
                            <h5><a href="#">악세사리</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>가장 많이 찾는 물품</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">전체</li>
                            <li data-filter=".sale">할인중</li>
                            <li data-filter=".hot">인기 상품</li>
                            <li data-filter=".gift">사은품 증정</li>
                            <li data-filter=".high">알찬 기부</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix hot sale">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">수공 원예 화분</a></h6>
                            <h5 style="color: red;">24,000원(-20%)</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix gift high">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">수공 가죽 파우치+기부뱃지</a></h6>
                            <h5>55,000원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix hot high">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">버튼 홀더</a></h6>
                            <h5>5,000원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix sale gift">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">유기농 조미료 세트+덤증정</a></h6>
                            <h5 style="color: red;">45,000원(-10%)</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix gift high">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/featured/feature-5.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">패럴림픽 후원 패키지</a></h6>
                            <h5>50,000원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix sale hot">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/featured/feature-6.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">수제 천연 비누</a></h6>
                            <h5 style="color: red;">8,000원(-20%)</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix high hot">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/featured/feature-7.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">희망을 그린 그림</a></h6>
                            <h5 >20,000원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix hot high">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/featured/feature-8.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">수제 캔들</a></h6>
                            <h5>12,000원</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>최신 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>최고 인기 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>리뷰 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/latest-product/prepare.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>준비중입니다</h6>
                                        <span>-원</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>블로그 글 소개</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${path}/resources/img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">도쿄올림픽, 패럴림픽 개최 중단..?</a></h5>
                            <p>올림픽의 마지막을 장식하는 패럴림픽, 그런데 다음 올릭픽에서는 개최가 안될지 모른다고..? </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${path}/resources/img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">고양이, 그리고 불편한 진실</a></h5>
                            <p>인간만이 신체적 결함에 부조리함을 느낀다고 생각하시나요? 고양이 로소의 이야기를 들어보세요. </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${path}/resources/img/blog/blog-3.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">지구 한 바퀴를 돌고 와도 변치않는 우정</a></h5>
                            <p>영국에 사는 두 소녀의 드라마같은 우정이야기 </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Footer -->
     <jsp:include page="module/footer.jsp"/>


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
	<script src="${path}/resources/js_page/index.js"></script>



</body>

</html>