<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="blog__sidebar">

		<div class="blog__sidebar__search">
			<form name="searchForm" action="fleaSearchList.giv">
				<select name="searchType" class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
					<option value="flea_title" name="flea_title" class="dropdown-item">제목</option>
					<option value="flea_writer" name="flea_writer" class="dropdown-item">작성자</option>
					<option value="flea_content" name="flea_content" class="dropdown-item">내용</option>
				</select> <input type="text" name="keyword" value="${keyword}"
					placeholder="상품 검색하기">
				<button type="submit">
					<span class="icon_search"></span>
				</button>
			</form>
		</div>

		<div class="blog__sidebar__item">
			<h4>중고 상품 보러가기</h4>
			<ul>
				<li><a id="isOkay">확정 상품순</a></li>
				<li><a href="#">최신순</a></li>
				<li><a href="newFleaList.giv" onclick="">댓글순</a></li>
				<li><a href="#">가격 낮은순</a></li>
				<li><a href="#">가격 높은순</a></li>
			</ul>
		</div>
		  
		<!-- <div class="blog__sidebar__item">
			<h4>Hot한 중고 물품</h4>
			<div class="blog__sidebar__recent">
			
			<c:forEach items=""></c:forEach>
				<a href="sponsorList.giv" class="blog__sidebar__recent__item">
					<div class="blog__sidebar__recent__item__pic">
						<img src="${path}/resources/img/blog/sidebar/sr-1.jpg" alt="">
					</div>
					<div class="blog__sidebar__recent__item__text">
						<h6>
							[중고물품 1]<br /> [중고 물품 가격]
						</h6>
						<span>[등록일]</span>
					</div>
				</a>
				
				<a href="#" class="blog__sidebar__recent__item">
					<div class="blog__sidebar__recent__item__pic">
						<img src="${path}/resources/img/blog/sidebar/sr-1.jpg" alt="">
					</div>
					<div class="blog__sidebar__recent__item__text">
						<h6>
							[중고물품 2]<br /> [중고 물품 가격]
						</h6>
						<span>[등록일]</span>
					</div>
				</a> <a href="#" class="blog__sidebar__recent__item">
					<div class="blog__sidebar__recent__item__pic">
						<img src="${path}/resources/img/blog/sidebar/sr-1.jpg" alt="">
					</div>
					<div class="blog__sidebar__recent__item__text">
						<h6>
							[중고물품 3]<br /> [중고 물품 가격]
						</h6>
						<span>[등록일]</span>
					</div>
				</a>
			</div>
		</div> -->

	</div>
	
	<script src="${path}/resources/js_page/flea.js"></script>
	
</body>
</html>