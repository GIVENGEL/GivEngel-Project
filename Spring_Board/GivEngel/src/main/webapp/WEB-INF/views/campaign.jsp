
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
                   
                </div>
            </div>
        </div>
    </section>
   <!-- 사이드바 + 서브 헤더 end -->
	
    

    
    

   

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2 class="display-3">Campaign</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<!--  각 캠패인 출력 단위 표시 ****************-->
            	<c:set var='i' value='0'/>
                <c:forEach items="${spon_list }" var="campa">
                <c:set var="sysdate" value="${nowSysdate}"/>
                <c:if test="${campa.spon_end>=sysdate}">
               <div class="col-lg-4 col-md-4 col-sm-6">
                  <div class="blog__item">
                     <div class="blog__item__pic">
                        <a href="campaignView.giv?spon_no=${campa.spon_no}"><img src="${path}/resources/img/sponsor/${campa.spon_img}" height="300px" alt="${campa.spon_name}"></a>
                     </div> 
                     <div class="blog__item__text"> 
                        <ul>
                           <li><i class="fa fa-calendar-o"></i>${campa.spon_end }</li>  
                        </ul>
                        <ul>
                           <li><i class="fa fa-comment-o"></i>${CountReview[i]}개</li> 
                           <c:set var='i' value='${i+1}'/> 
                        </ul>   
                        <h5> 
                           <a href="campaignView.giv?spon_no=${campa.spon_no }">${campa.spon_name }</a> 
                        </h5>
                        <p>${campaign.spon_comment }</p>
                     </div>
                  </div>
               </div>
               </c:if>
            </c:forEach>  
                <!-- ****************************** -->
              
    </section>
    <!-- Blog Section End -->
    
    <!-- Categories Section Begin -->
    <section class="categories mb-4">
        <div class="container">
         <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>이런 후원 단체는 어떠세요?</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="categories__slider owl-carousel notCampaignList">
              <c:forEach items="${non_campaign}" var="non_campaign" begin="0" end="5">
             <div class="col-lg-3">   
        		<div onclick="location.href='sponsorView.giv?spon_no=${non_campaign.spon_no}'" class="categories__item set-bg" style="width:250px; height:250px; cursor:pointer" data-setbg="${path}/resources/img/sponsor/${non_campaign.spon_img}">
            		<h5><a href="sponsorView.giv?spon_no=${non_campaign.spon_no}">${non_campaign.spon_name}</a></h5>
       		    </div> 
   		     </div> 
             </c:forEach>      
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

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
    

    
    
    
    
	
	<script type="text/javascript">
	$(function(){
	   	
	
	 
})	
	</script>


</body>

</html>