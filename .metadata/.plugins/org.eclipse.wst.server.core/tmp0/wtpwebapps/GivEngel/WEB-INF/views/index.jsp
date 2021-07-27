
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
                        <ul class="categoryGoodList">
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
                            <a href="sponsorList.giv"  class="primary-btn">돈쭐내주기</a>
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
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/TOP-1.jpg">
                            <h5><a href="buyList.giv?categories=TOP">TOP</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/BOTTOM-1.jpg">
                            <h5><a href="buyList.giv?categories=BOTTOM">BOTTOM</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/BAG-1.jpg">
                            <h5><a href="buyList.giv?categories=BAG">BAG</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/ACC-1.jpg">
                            <h5><a href="buyList.giv?categories=ACC">ACC</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${path}/resources/img/categories/cat-5.jpg">
                            <h5><a href="buyList.giv?categories=CAMPAIGN">CAMPAIGN</a></h5>
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
                            <li data-filter=".TOP">TOP</li>
                            <li data-filter=".BOTTOM">BOTTOM</li>
                            <li data-filter=".BAG">BAG</li>
                            <li data-filter=".ACC">ACC</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            	<c:forEach items="${listTOP }" var='listTOP' end="2">
                <div class="col-lg-3 col-md-4 col-sm-6 mix TOP">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/good/${listTOP.good_img}" onclick="location.href='buyForm.giv?good_no=${listTOP.good_no}'" style="cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${listTOP.good_name }</a></h6>
                            <h5><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${listTOP.good_price }" /></h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <c:forEach items="${listBOTTOM }" var='listBOTTOM' end="2">
                <div class="col-lg-3 col-md-4 col-sm-6 mix BOTTOM">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/good/${listBOTTOM.good_img}" onclick="location.href='buyForm.giv?good_no=${listBOTTOM.good_no}'" style="cursor:pointer" >
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${listBOTTOM.good_name }</a></h6>
                            <h5><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${listBOTTOM.good_price }" /></h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <c:forEach items="${listBAG }" var='listBAG' end="2">
                <div class="col-lg-3 col-md-4 col-sm-6 mix BAG">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/good/${listBAG.good_img}" onclick="location.href='buyForm.giv?good_no=${listBAG.good_no}'" style="cursor:pointer" >
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${listBAG.good_name }</a></h6>
                            <h5><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${listBAG.good_price }" /></h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <c:forEach items="${listACC }" var='listACC' end="2">
                <div class="col-lg-3 col-md-4 col-sm-6 mix ACC">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${path}/resources/img/good/${listACC.good_img}" onclick="location.href='buyForm.giv?good_no=${listACC.good_no}'" style="cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${listACC.good_name }</a></h6>
                            <h5><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${listACC.good_price }" /></h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
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
                                <c:forEach items="${latestGood1 }" var='latestGood1' begin='0' end='2'>
                                <a href="buyForm.giv?good_no=${latestGood1.good_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/good/${latestGood1.good_img}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${latestGood1.good_name}</h6>
                                        <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${latestGood1.good_price }" /></span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                 <c:forEach items="${latestGood1 }" var='latestGood1' begin='3' end='5'>
                                <a href="buyForm.giv?good_no=${latestGood1.good_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/good/${latestGood1.good_img}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${latestGood1.good_name}</h6>
                                        <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${latestGood1.good_price }" /></span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>최고 인기 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                             <c:forEach items="${rankingGood }" var='rankingGood' begin='0' end='2'>
                                <a href="buyForm.giv?good_no=${rankingGood.good_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/good/${rankingGood.good_img }" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${rankingGood.good_name }</h6>
                                        <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${rankingGood.good_price }" /></span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <c:forEach items="${rankingGood }" var='rankingGood' begin='3' end='5'>
                                <a href="buyForm.giv?good_no=${rankingGood.good_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/good/${rankingGood.good_img }" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${rankingGood.good_name }</h6>
                                        <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${rankingGood.good_price }" /></span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>리뷰 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                               <c:forEach items="${goodComRanking }" var='goodComRanking' begin="0" end="2">
                                <a href="buyForm.giv?good_no=${goodComRanking.good_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/good/${goodComRanking.good_img}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${goodComRanking.good_name}</h6>
                                        <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${goodComRanking.good_price }" /></span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                               <c:forEach items="${goodComRanking }" var='goodComRanking' begin="3" end="5">
                                <a href="buyForm.giv?good_no=${goodComRanking.good_no }" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${path}/resources/img/good/${goodComRanking.good_img}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${goodComRanking.good_name}</h6>
                                        <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${goodComRanking.good_price }" /></span>
                                    </div>
                                </a>
                                </c:forEach>
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