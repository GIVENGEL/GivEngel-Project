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

<script type="text/javascript">
//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "buyList.giv";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize) {
		var url = "buyList.giv";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}
  
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "buyList.giv";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>


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
	
	<!-- 사이드바 + 서브 헤더 -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All Categories</span>
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
               <div class="col-lg-6 card-margin"  style="margin-bottom:50px">
			        <div class="search-form">
			            <div class="card-body p-0">
			                <form id="searchForm" action="buyList.giv" method="post">
			                    <div class="row">
			                        <div class="col-12">
			                            <div class="row no-gutters">
			                                <div class="col-lg-3 col-md-3 col-sm-3 p-0" style="padding:0px">
			                                    <select class="form-control" id="searchType" name="searchType" style="margin-left:10px" >
			                                        <option value="good_name">상품 이름</option>
			                                        <option value="good_tag">상품 태그</option>
			                                        <option value="good_detail">상품 설명</option>
			                                    </select>
			                                </div>
			                                <div class="col-lg-8 col-md-3 col-sm-3 p-0" style="padding:0px">
			                                    <input type="text" placeholder="검색 내용" style="margin-left:10px" class="form-control" id="keyword" name="keyword" >
			                                </div>
			                                <div class="col-lg-1 col-md-1 col-sm-1 p-0" style="padding:0px">
			                                    <input id="submitbtn" type="submit" class="btn btn-success float-right" style="background-color:#7fad39" value="검색">
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </form>
			            </div>
			        </div>
			        
    			</div>
    			<div class="hero__search__phone col-3">
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
    </section>
   <!-- 사이드바 + 서브 헤더 end -->
	

	<!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>상품 카테고리</h4>
                        <!-- ********************************** -->
                        <!-- 김민주 -->
                        <!-- 제이쿼리 사용하기 위한 id 부여 -->
                            <ul id='categories'>
                                <li><a href="#">TOP</a></li>
                                <li><a href="#">BOTTOM</a></li>
                                <li><a href="#">ACC</a></li>
                                <li><a href="#">BAG</a></li>
                                <li><a href="#">CAMPAIGN</a></li>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>가격</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item sidebar__item__color--option" id='selectColor'>
                            <h4>색깔</h4>
                            <!-- **************************** -->
                            <!-- 김민주 -->
                            <!-- 변경내용 : label 속성중 for 앞글자 대문자로 변환 -->
                            <!-- 변환해도 문제가 없어보여서 우선 진행했습니다. -->
                            <div class="sidebar__item__color sidebar__item__color--white">
                                <label for="White">
                                    White
                                    <input type="radio" id="white">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--gold">
                                <label for="Gold">
                                    Gold
                                    <input type="radio" id="Gold">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--silver">
                                <label for="Silver">
                                    Silver
                                    <input type="radio" id="Silver">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--red">
                                <label for="Red">
                                    Red
                                    <input type="radio" id="red">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--black">
                                <label for="Black">
                                    Black
                                    <input type="radio" id="black">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--blue">
                                <label for="Blue">
                                    Blue
                                    <input type="radio" id="blue">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--brown">
                                <label for="Brown">
                                    Brown
                                    <input type="radio" id="Brown">
                                </label>
                            </div>
                        </div>
                        
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>최신 상품</h4>
                                
                                <!-- ******************************** -->
                                <!--김민주 -->
                                <!-- 이미지 크기 고정을 위한 style 속성 추가 -->
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${ latestGood1}" var="latestGood1" begin="0" end ="2">
                                        <a href="buyForm.giv?good_no=${latestGood1.good_no}" class="latest-product__item" >
                                            <div class="latest-product__item__pic">
                                                <img style="width:130px; height:150px;" src="${path}/resources/img/good/${latestGood1.good_img}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${latestGood1.good_name}</h6>
                                                <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${latestGood1.good_price }" /></span>
                                            </div>
                                        </a>
                                 	</c:forEach> 
                                    </div>
                                     <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${ latestGood1}" var="latestGood1" begin="3" end ="5">
                                        <a href="buyForm.giv?good_no=${latestGood1.good_no}" class="latest-product__item" id="buyForm">
                                            <div class="latest-product__item__pic">
                                                <img style="width:130px; height:150px;" src="${path}/resources/img/good/${latestGood1.good_img}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${latestGood1.good_name}</h6>
                                                <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${latestGood1.good_price }" /></span>
                                            </div>
                                        </a>
                                 	</c:forEach> 
                                    </div>
                                     <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${ latestGood1}" var="latestGood1" begin="5" end ="7">
                                        <a href="buyForm.giv?good_no=${latestGood1.good_no}" class="latest-product__item" id="buyForm">
                                            <div class="latest-product__item__pic">
                                                <img style="width:130px; height:150px;" src="${path}/resources/img/good/${latestGood1.good_img}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${latestGood1.good_name}</h6>
                                                <span><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${latestGood1.good_price }" /></span>
                                            </div>
                                        </a>
                                 	</c:forEach> 
                                    </div>
                                </div>
                                <!-- 반복문 end -->
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                <!-- **************************************************************************************** -->
                <!-- 김민주 상품 리스트 -->
                <!-- 인기상품 -->
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>인기 상품</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                   
                                <!-- 인기상품 반복문 최대 출력 개수 3개로 제한 -->
                                <c:forEach items="${getPopularGoodList }" var="popularList" end='8'>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${path}/resources/img/good/${popularList.good_img}" onclick="location.href='buyForm.giv?good_no=${popularList.good_no}'" style="cursor:pointer">
                                            <!-- 할인율 DIV 주석 -->
									<!--<div class="product__discount__percent">-20%</div> -->
                                            <ul class="product__item__pic__hover">
                                            	<li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                          				<c:if test="${popularList.good_stock > 0}">
                                           					<span>재고 / ${popularList.good_stock}</span>
                                           				</c:if>
                                           				<c:if test="${popularList.good_stock <= 0}">
                                           					<span>재고 / 품절입니다.</span>
                                           				</c:if>
                                            <h5><a href="buyGood.do?good_no=${popularList.good_no }" >${popularList.good_name} </a></h5>
                                            <div class="product__item__price"><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${popularList.good_price }" /></div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- 인기상품 반복문 end -->
                                
                            </div>
                        </div>
                    </div>
                    <!-- 인기상품 end -->
                    
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select id='sorting' name='sorting'>
                                        <option value="1">최신 순</option>
                                        <option value="2">가격 높은 순</option>
                                        <option value="3">가격 낮은 순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${pagingVO.listCnt} </span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ********************************** -->
                    <!-- 김민주 -->
                    <!-- 전체상품 리스트 출력(현재 카테고리별 출력까지 구현) -->
                    <div class="row">
                    <c:forEach items="${goodList }" var="goodVO">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${path}/resources/img/good/${goodVO.good_img}" onclick="location.href='buyForm.giv?good_no=${goodVO.good_no}'" style="cursor:pointer">
                                    <ul class="product__item__pic__hover">
                                   		<li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    </ul>
                                </div>
                                 <div class="product__discount__item__text">
                                          				<c:if test="${goodVO.good_stock > 0}">
                                           					<span>재고 / ${goodVO.good_stock}</span>
                                           				</c:if>
                                           				<c:if test="${goodVO.good_stock <= 0}">
                                           					<span>재고 / 품절입니다.</span>
                                           				</c:if>
                                            <h5><a href="buyGood.do?good_no=${goodVO.good_no }">${goodVO.good_name} </a></h5>
                                            <div class="product__item__price"><fmt:setLocale value="ko_KR" /><fmt:formatNumber type='currency' value="${goodVO.good_price }" /></div>
                                 </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                    <!-- pagination{s} -->

					<div id="paginationBox" class="row">
					<div class="col-4">
					</div>
						<ul class="pagination col-4">
							<c:if test="${pagingVO.prev}">
								<li class="page-item"><a class="page-link" href="javascript:void(0)" onClick="fn_prev('${pagingVO.page}', '${pagingVO.range}', '${pagingVO.rangeSize}')">Previous</a></li>
							</c:if>
							<c:forEach begin="${pagingVO.startPage}" end="${pagingVO.endPage}" var="idx">
								<li class="page-item <c:out value="${pagingVO.page == idx ? 'active' : ''}"/> "><a class="page-link" href="javascript:void(0)" onClick="fn_pagination('${idx}', '${pagingVO.range}', '${pagingVO.rangeSize}')"> ${idx} </a></li>
							</c:forEach>
							<c:if test="${pagingVO.next}">
								<li class="page-item"><a class="page-link" href="javascript:void(0)" onClick="fn_next('${pagingVO.range}', '${pagingVO.range}', '${pagingVO.rangeSize}')" >Next</a></li>
							</c:if>
						</ul>
						<div class="col-4">
						</div>
					</div>
					<!-- pagination{e} -->
					


                    
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
	



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
	<script src="${path}/resources/js_page/buyList.js"></script>


</body>

</html>