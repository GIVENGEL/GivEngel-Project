<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>GivEngel [개발자 모드]</title>
	<!-- Css Styles -->

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
	<link href="${path}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="${path}/resources/css/admin/font-awesome.min.css" rel="stylesheet">
	<link href="${path}/resources/css/admin/datepicker3.css" rel="stylesheet">
	<link href="${path}/resources/css/admin/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
</head>
<body>
<c:if test="${admin != null}">
	
	<jsp:include page="module/adminSidebar.jsp" />
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
			<c:if test="${admin.admin_level ==1 }">
				<img src="${path}/resources/img/admin/lv1.png" class="img-responsive" alt="">
			</c:if>
			<c:if test="${admin.admin_level ==2 }">
				<img src="${path}/resources/img/admin/lv2.png" class="img-responsive" alt="">
			</c:if>
			<c:if test="${admin.admin_level ==3 }">
				<img src="${path}/resources/img/admin/lv3.png" class="img-responsive" alt="">
			</c:if>
			<c:if test="${admin.admin_level ==4 }">
				<img src="${path}/resources/img/admin/lv4.png" class="img-responsive" alt="">
			</c:if>
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name"> ${admin.admin_id}</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="adminMode.giv"><em class="fa fa-dashboard">&nbsp;</em> 누적통계</a></li>
			<li><a href="adminWidgets.giv"><em class="fa fa-calendar">&nbsp;</em> 개발자보드</a></li>
			<c:if test="${admin.admin_level > 0 }">
			<li ><a href="adminCharts.giv"><em class="fa fa-bar-chart">&nbsp;</em> 분석/통계</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 1 }">
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> 상품 관리 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="adminElements.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 상품 추가
					</a></li>
					<li><a class="" href="adminGoodDelete.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 상품 삭제
					</a></li>
					<li><a class="" href="adminGoodModify.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 상품 수정
					</a></li>
				</ul>
			</li>
			</c:if>
			<c:if test="${admin.admin_level > 2 }">
			<li class="parent "><a data-toggle="collapse" href="#sub-item-2">
				<em class="fa fa-navicon">&nbsp;</em> 후원 단체 관리 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-2">
					<li><a class="" href="adminElements2.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 후원 단체 등록
					</a></li>
					<li><a class="" href="adminSponDelete.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 후원 단체 삭제
					</a></li>
					<li><a class="" href="adminSponModify.giv">
						<span class="fa fa-arrow-right">&nbsp;</span> 후원 단체 수정
					</a></li>
				</ul>
			</li>
			</c:if>
			<c:if test="${admin.admin_level > 2 }">
			<li class="active"><a href="adminFlea.giv"><em class="fa fa-toggle-off">&nbsp;</em> 중고 상품 관리</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 2 }">
			<li><a href="adminUserAccount.giv"><em class="fa fa-toggle-off">&nbsp;</em> 유저 계정 관리</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 3 }">
			<li><a href="adminAccount.giv"><em class="fa fa-toggle-off">&nbsp;</em> 개발자 계정 관리</a></li>
			</c:if>
			
			<li><a href="adminlogoutAction.giv"><em class="fa fa-power-off">&nbsp;</em> 로그아웃</a></li>
		</ul>
	</div>
		<!--/.sidebar-->
		<!-- ---------------------------------------------------------------------------------------- -->

		<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
			<div class="row">
				<ol class="breadcrumb">
					<li><a href="#"> <em class="fa fa-home"></em>
					</a></li>
					<li>중고 상품 관리</li>
					<li class="active">중고 상품 삭제 절차</li>
				</ol>
			</div>
			<!--/.row-->

			<div class="row">
				<div class="col-lg-12">
					<h1>상품 정보 삭제</h1>
				</div>
			</div>
			<!--/.row-->
			<form id="deletefrm1" action="adminFleaDeleteAction.giv" method="post">
											
							<div class="col-md-6">
								<input name="flea_no" id="flea_no" class="form-control" value="${flea.flea_no}" type="hidden">
								<div class="form-group">
									<h3>[${flea.flea_title }] 해당 상품을 삭제하시겠습니까?</h3>
									<label> 삭제하시려면 다음 번호를 입력해주세요 - [ ${flea.flea_no } ]</label>
									 <input id="flea_check" name="flea_check" class="form-control" type="number">
									 <label> "삭제"를 입력해주세요.</label>
									 <input id="flea_check2" name="flea_check2" class="form-control" type="text">

						<button id="submitbtn1" type="button" class="btn btn-primary mt-3">
									삭제하기</button>
								
								
								</div>
								
							</div>
							
						</form>


			<div class="row">


				
			</div>
			<!-- /.panel-->
		</div>



		<script src="${path}/resources/js/admin/jquery-1.11.1.min.js"></script>
		<script src="${path}/resources/js/admin/bootstrap.min.js"></script>
		<script src="${path}/resources/js/admin/chart.min.js"></script>
		<script src="${path}/resources/js/admin/chart-data.js"></script>
		<script src="${path}/resources/js/admin/easypiechart.js"></script>
		<script src="${path}/resources/js/admin/easypiechart-data.js"></script>
		<script src="${path}/resources/js/admin/bootstrap-datepicker.js"></script>
		<script src="${path}/resources/js/admin/custom.js"></script>
		<script>
			window.onload = function() {


				function checkform() {
					var flea_check = $("#flea_check").val();
					var flea_check2 = $("#flea_check2").val();
					var check1 = false;
					if (flea_check != $("#flea_no").val() ) {
						alert("번호가 틀렸습니다.");
						return false;
					}
					if (flea_check2 != "삭제") {
						alert("삭제를 입력해주세요.");
						return false;
					}
					return true;
				}

				$("#submitbtn1").on("click", function() {
					if (checkform()) {
						alert("성공");
						$("#deletefrm1").submit();
					}
				})
				
				
				

			}
		</script>
	</c:if>
</body>
</html>
