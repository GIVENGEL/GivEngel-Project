<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  로그인이 안된 경우 (게스트) -->
<c:if test="${user == null}">
<div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="index.giv"><img src="${path}/resources/img/logo.png" alt=""></a>
        </div>
        
        <div class="humberger__menu__cart">
            
            <div class="header__cart__price">마이페이지 <span></span></div>
        </div>
        <div class="humberger__menu__widget">
           
            <div class="header__top__right__auth">
                <a href="loginForm.giv"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="index.giv">Home</a></li>
                <li><hr></li>
					<li><a href="buyList.giv">Products</a>
					<ul class="header__menu__dropdown" id='categories'>
							<li><a href="#">전체 상품</a></li>
                            <li><a href="#">TOP</a></li>
                            <li><a href="#">BOTTOM</a></li>
                            <li><a href="#">BAG</a></li>
                            <li><a href="#">ACC</a></li>
                            <li><a href="#">CAMPAIGN</a></li>
							<li><hr></li>
						</ul></li>
					<li><a href="campaign.giv">Campaign</a></li>
					<li><a href="sponsorList.giv">Sponsor</a></li>
					<li><a href="fleaBoard.giv">Flea Market</a></li>
                
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i>github.com/GIVENGEL</li>
                <li>멋진 상품과 후원을 동시에 - GivEngel</li>
            </ul>
        </div>
    </div>
	<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="header__top__left">
						<ul>
							<li></a><i class="fa fa-envelope"></i><a href="contact.giv"> GivEngel?</a></li>
							<li>기부와 후원으로 세상을 밝게 만드세요.</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__top__right">
						
						<!-- 로그인 섹션 --------------------------------------------- -->
						<div class="header__top__right__auth">
							<a href="loginForm.giv"><i
								class="fa fa-user"></i> Login</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  nav bar 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="index.giv"><img src="${path}/resources/img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-9">
				<nav class="header__menu">
				<ul>
					<li><a href="index.giv">Home</a></li>
					
					<li><a href="buyList.giv">Products</a>
					<ul class="header__menu__dropdown" id='categories'>
							<li><a href="#">전체 상품</a></li>
                            <li><a href="#">TOP</a></li>
                            <li><a href="#">BOTTOM</a></li>
                            <li><a href="#">BAG</a></li>
                            <li><a href="#">ACC</a></li>
                            <li><a href="#">CAMPAIGN</a></li>
							<li><hr></li>
						</ul></li>
					<li><a href="campaign.giv">Campaign</a></li>
					<li><a href="sponsorList.giv">Sponsor</a></li>
					<li><a href="fleaBoard.giv">Flea Market</a></li>
					
					
				</ul>
				</nav>
			</div>
			
		</div>
		<div>

			</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
	
	</header>
	</c:if>
	
	
	
	
	
	
	
	<!-- --------------------------------------------------------- -->
	
	
	
	
	
	
	
	<!--  로그인이 된 경우 (유저) -->
<c:if test="${user != null}">
<div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="index.giv"><img src="${path}/resources/img/logo.png" alt=""></a>
        </div>
        
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price"><a href="myPage.giv">마이페이지</a>  </div>
        </div>
        <div class="humberger__menu__widget">
           
            <div class="header__top__right__auth">
            <p>환영합니다 ${user.user_id}님.</p>
                <a href="logout.giv"><i class="fa fa-user"></i> Logout</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li ><a href="index.giv">Home</a></li>
                <li><hr></li>
					<li><a href="buyList.giv">Products</a>
					<ul class="header__menu__dropdown" id='categories'>
							<li><a href="#">전체 상품</a></li>
							  <li><a href="#">TOP</a></li>
                                <li><a href="#">BOTTOM</a></li>
                                <li><a href="#">ACC</a></li>
                                <li><a href="#">BAG</a></li>
                                <li><a href="#">CAMPAIGN</a></li>
							<li><hr></li>
						</ul></li>
					<li><a href="campaign.giv">Campaign</a></li>
					<li><a href="sponsorList.giv">Sponsor</a></li>
					<li><a href="fleaBoard.giv">Flea Market</a></li>
                
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i>github.com/GIVENGEL</li>
                <li>멋진 상품과 후원을 동시에 - GivEngel</li>
            </ul>
        </div>
    </div>
	<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="header__top__left">
						<ul>
							<li></a><i class="fa fa-envelope"></i><a href="contact.giv"> GivEngel?</a></li>
							<li>기부와 후원으로 세상을 밝게 만드세요.</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__top__right">
						
						<!-- 로그인 섹션 --------------------------------------------- -->
						<div class="header__top__right__auth">
							
                <div class="row">환영합니다. &nbsp&nbsp<a href="myPage.giv">${user.user_name}님.</a>  &nbsp&nbsp&nbsp&nbsp&nbsp<a href="logout.giv"><i class="fa fa-user"></i> Logout</a> 
                
                 
                 </div>
						마일리지 :  ${user.user_cash}
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  nav bar 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="index.giv"><img src="${path}/resources/img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-9">
				<nav class="header__menu">
				<ul>
					<li><a href="index.giv">Home</a></li>
					
					<li><a href="buyList.giv">Products</a>
					<ul class="header__menu__dropdown" id='categories'>
							 <li><a href="#">TOP</a></li>
                                <li><a href="#">BOTTOM</a></li>
                                <li><a href="#">ACC</a></li>
                                <li><a href="#">BAG</a></li>
                                <li><a href="#">CAMPAIGN</a></li>
						</ul></li>
					<li><a href="campaign.giv">Campaign</a></li>
					<li><a href="sponsorList.giv">Sponsor</a></li>
					<li><a href="fleaBoard.giv">Flea Market</a></li>
					
					
				</ul>
				</nav>
			</div>
			
		</div>
		<div>

			</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
	
	</header>
	</c:if>
</body>
</html>