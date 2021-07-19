<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/style.css"
	type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>



	 <!--  navbar &  side over wrap -->
    <jsp:include page="module/navbar.jsp"/>



	<!-- Hero Section Begin -->
	<section class="hero">
	<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div>
						<div>
							<section class="container">

								<section class="login-form">
									<form action="findAction.giv" method="post">
										<table class="table table-boardered">
										
											<hr style="border: solid 1px">
											<label class="display-4">아이디 찾기</label>
											<br />
											<br />
											<tr>
												<th>이름</th>
												<td><input type="text" class="form-control"
													
													id="user_name" name="userName"
													placeholder="찾으시려는 계정의 이름을 입력해주세요"></td>
											</tr>
											<tr>
												<th>전화번호</th>
											
												<td><input id="user_tel" type="tel" id="userTel"
													class="form-control" name="tel"></td>
											</tr>
										

											<tr>
												<td colspan="2"><input id="idFind" type="button"
													class="btn btn-block btn-success" value="아이디 조회하기">
												</td>

											</tr>
											<tr>
												<td><span id="ids"></span></td>
											</tr>
										</table>
									</form>
									
									<br />
									<br />
									<br />
									<form action="findAction.giv" method="post">
										<table class="table table-boardered">
										
											<hr style="border: solid 1px">
											<label class="display-4">비밀번호 찾기</label>
											<br />
											<br />
											<tr>
												<th>아이디</th>
						
												<td><input name="user_id" id="userId" type="email"
													class="form-control"></td>
											</tr>
											<tr>
												<th>이름</th>
												<td><input type="text" class="form-control"
													
													name="user_name" id="userName"
													placeholder="찾으시려는 계정의 이름을 입력하세요"></td>
											</tr>
											<tr>
												<th>전화번호</th>
											
												<td><input type="tel" id="userTel" class="form-control"
													name="user_tel"></td>

											</tr>
											<tr>
												<th>주민번호</th>
												<td><input type="text" id="userJumin"
													class="form-control" name="user_jumin"></td>
											</tr>
											
			
											<tr>
												<td colspan="2"><input id="pwFind" type="button"
													 
													class="btn btn-block btn-success" value="비밀번호 조회하기">

												</td>
											</tr>
											<tr>
											<td>
												<span id="pws"></span>
												</td>
											</tr>
										</table>
									</form>
								</section>
								</section>
						</div>
					</div>
				</div>
				<div class="hidden-md hidden-lg col-lg-6">
					<img class="" src="${path}/resources/img/join.jpg" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->


	<!-- Footer Section Begin -->
	<jsp:include page="module/footer.jsp" />

	<!-- Footer Section End -->

	<!-- Js Plugins -->
   
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${path}/resources/js/jquery-ui.min.js"></script>
	<script src="${path}/resources/js/jquery.slicknav.js"></script>
	<script src="${path}/resources/js/mixitup.min.js"></script>
	<script src="${path}/resources/js/owl.carousel.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>

	<!--  페이지 제어 제이쿼리  -->
	<script src="${path}/resources/js_page/joinForm.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(function(e) {
		alert("시작");
		
		$('#idFind').click(function(){
			
			var vo = {
					user_name:$('#user_name').val(),
					user_tel:$('#user_tel').val()
					
			}
			$.ajax({
				url: "idFind.giv",
				type: "POST",
				data:vo,
				success: function(data){
					
					
					if(data=="err" ){
					
						
						alert('일치하는 계정이 없습니다.');
					}else{
						
						
						$("#ids").text("아이디 : " + data);
					}
				},
				error: function(){
					alert("일치하는 계정이 없습니다!");
				}
			});
			
		});
		
		$('#pwFind').click(function(){
			var vo = {
					user_name:$('#userName').val(),
					user_tel:$('#userTel').val(),
					user_jumin:$("#userJumin").val(),
					user_id:$("#userId").val()
			}
			$.ajax({
				url: "pwFind.giv",
				type: "POST",
				data:vo,
				success: function(data){
					if(data=="err" ){
						alert('일치하는 계정이 없습니다.');
					}else{
						
						
						$("#pws").text("비밀번호 : " + data);
					}
				},
				error: function(){
					alert("일치하는 계정이 없습니다!");
				}
			});
			

		});

	});
</script>
</html>