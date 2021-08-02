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
	
	
	<div class="blog__sidebar__search" style="width:350px">
			<form name="searchForm" action="fleaSearchList.giv">
			<div class="row">
			<div class="col-3">
			<select name="searchType" type="button" style="border-radius: 20px;">
					<option value="flea_title" name="flea_title" class="dropdown-item">제목</option>
					<option value="flea_writer" name="flea_writer" class="dropdown-item">작성자</option>
					<option value="flea_content" name="flea_content" class="dropdown-item">내용</option>
				</select>
			</div>
			<div class="col-9">
			<input type="text" name="keyword" value="${keyword}" 
					placeholder="상품 검색하기" style="width:275px; float: left;">
				<button type="submit" style="none">
					<span class="icon_search"></span>
				</button>
			</div>
				
			</div>
				
			</form>
		</div>
 
	
		<div class="blog__sidebar__item">
			<h4>중고 상품 보러가기</h4>
			<ul>
				<li><a id="isOkay">확정 상품순</a></li>
				<li><a href="#">최신순</a></li>
				<li><a href="#" onclick="">댓글순</a></li>
				<li><a href="#">가격 낮은순</a></li>
				<li><a href="#">가격 높은순</a></li>
			</ul>
		</div>


	</div>
	
	<script src="${path}/resources/js_page/flea.js"></script>
	
</body>
</html>