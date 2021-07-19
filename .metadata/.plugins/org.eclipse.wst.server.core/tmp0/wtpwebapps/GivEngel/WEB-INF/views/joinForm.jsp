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
	<jsp:include page="module/navbar.jsp" />


	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">

				<div class="col-lg-6">
					<div>


						<div>
							<section class="container">
								<section class="login-form">
									<hr style="border: solid 1px">
									<label class="display-4">회원 가입</label>
									<form action="joinAction.giv" id="joinfrm" method="post">
										<table class="table table-boardered">
											<tr>
												<th>아이디</th>
												<td class="row"><input type="email" id="userId"
													class="form-control col-6" name="user_id"
													placeholder="아이디를 입력하세요.">
													<div class="col-2"></div>
													<input type="button" id="idCheck" class="btn btn-success col-4 float-right" value="아이디 중복체크"></td>
											</tr>
											<tr>
												<th>패스워드</th>
												<td><input type="password" id="passwd"
													class="form-control w-75" name="user_pw"
													placeholder="비밀번호를 입력해주세요"></td>
											</tr>

											<tr>
												<th>패스워드확인</th>
												<td><input type="password" id="passwdCheck"
													class="form-control w-75" name="confirm_pw"></td>
											</tr>
											<tr>
												<th>이름</th>
												<td><input type="text" class="form-control w-50"
													name="user_name"></td>
											</tr>

											<tr>
												<th>주민번호</th>
												<td><input type="password" class="form-control"
													placeholder="'-' 없이  입력해주세요." name="user_jumin"></td>
											</tr>

											<tr>
												<th>전화번호</th>
												<td><input type="tel" class="form-control"
													name="user_tel"></td>
											</tr>

											<tr>
												<th>주소</th>
												<td><input type="text" class="form-control"
													name="user_addr"></td>
											</tr>

											<tr>
												<th>하고 싶은 말</th>
												<td><textarea rows="5" cols="40" name="info"
														class="form-control"></textarea></td>
											</tr>


											<tr>
												<td colspan="2"><input id="signUp" type="button"
													class="btn btn-block btn-success" value="회원가입"> <input
													id="cancle" type="button" class="btn btn-block btn-success"
													value="되돌아가기"></td>
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
	<script src="js_page/joinForm.js"></script>


</body>
<script type="text/javascript">
	$(document).ready(function(e) {
		alert("시작");
		var idx = false;

		$('#signUp').click(function() {
			if ($.trim($('#userId').val()) == '') {
				alert("아이디 입력.");
				$('#userId').focus();
				return;
			} else if ($.trim($('#passwd').val()) == '') {
				alert("패스워드 입력.");
				$('#passwd').focus();
				return;
			}
			//패스워드 확인
			else if ($('#passwd').val() != $('#passwdCheck').val()) {
				alert('패스워드가 다릅니다.');
				$('#passwd').focus();
				return;
			}

			else if (idx == false) {
				alert("아이디 중복체크를 해주세요.");
				return;
			} else {
				$('#joinfrm').submit();
			}
		});
		
		
		$('#idCheck').click(function(){
			$.ajax({
				url: "idCheck.giv",
				type: "POST",
				data:{
					"userId":$('#userId').val()
				},
				success: function(data){
					
					if(data == 0 && $.trim($('#userId').val()) != '' ){
						idx=true;
						$('#userId').attr("readonly",true);
						alert('사용가능한 아이디입니다!');
					}else{

						var html="<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
						alert('중복된 아이디입니다.');
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});

	});
</script>


</html>