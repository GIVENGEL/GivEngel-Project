<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="/GivEngel/Givengel?cmd=main-page"><img src="img/logo.png" alt=""></a>
        </div>
        
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">마이페이지 <span></span></div>
        </div>
        <div class="humberger__menu__widget">
           
            <div class="header__top__right__auth">
                <a href="/GivEngel/Givengel?cmd=login-page"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="/GivEngel/Givengel?cmd=main-page">Home</a></li>
                <li><hr></li>
					<li><a href="#">Products</a>
					<ul class="header__menu__dropdown">
							<li><a href="./shop-details.html">ALL</a></li>
							<li><a href="./shoping-cart.html">TOP</a></li>
							<li><a href="./checkout.html">BOTTOM</a></li>
							<li><a href="./blog-details.html">BAG</a></li>
							<li><a href="./blog-details.html">ACC</a></li>
							<li><a href="./blog-details.html">SHOES</a></li>
							<li><hr></li>
						</ul></li>
					<li><a href="/GivEngel/Givengel?cmd=campaign-page">Campaign</a></li>
					<li><a href="/GivEngel/Givengel?cmd=sponsor-page">Sponsor</a></li>
					<li><a href="./blog.html">Flea Market</a></li>
                
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
							<li></a><i class="fa fa-envelope"></i><a href="/GivEngel/Givengel?cmd=contact-page"> GivEngel?</a></li>
							<li>기부와 후원으로 세상을 밝게 만드세요.</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__top__right">
						<div class="header__top__right__social">
							<a href="#"><i class="fa fa-facebook"></i></a>
						</div>
						<!-- 로그인 섹션 --------------------------------------------- -->
						<div class="header__top__right__auth">
							<a href="/GivEngel/Givengel?cmd=login-page"><i
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
					<a href="/GivEngel/Givengel?cmd=main-page"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-9">
				<nav class="header__menu">
				<ul>
					<li class="active"><a href="/GivEngel/Givengel?cmd=main-page">Home</a></li>
					
					<li><a href="#">Products</a>
					<ul class="header__menu__dropdown">
							<li><a href="./shoping-cart.html">TOP</a></li>
							<li><a href="./checkout.html">BOTTOM</a></li>
							<li><a href="./blog-details.html">BAG</a></li>
							<li><a href="./blog-details.html">ACC</a></li>
							<li><a href="./blog-details.html">SHOES</a></li>
						</ul></li>
					<li><a href="/GivEngel/Givengel?cmd=campaign-page">Campaign</a></li>
					<li><a href="/GivEngel/Givengel?cmd=sponsor-page">Sponsor</a></li>
					<li><a href="./blog.html">Flea Market</a></li>
					
					
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
</body>
</html>