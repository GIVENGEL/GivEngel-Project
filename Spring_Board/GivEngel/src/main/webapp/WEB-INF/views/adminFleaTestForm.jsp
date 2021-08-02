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
<link href="${path}/resources/css/admin/bootstrap.min.css"
	rel="stylesheet">
<link href="${path}/resources/css/admin/font-awesome.min.css"
	rel="stylesheet">
<link href="${path}/resources/css/admin/datepicker3.css"
	rel="stylesheet">
<link href="${path}/resources/css/admin/styles.css" rel="stylesheet">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
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
			<li class=""><a href="adminMode.giv"><em class="fa fa-dashboard">&nbsp;</em> 누적통계</a></li>
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
					<li class="active">중고 상품 심사</li>
				</ol>
			</div>
			<!--/.row-->

			<div class="row">
				<div class="col-lg-12">
					<h1>중고 상품 관리</h1>
				</div>
			</div>
			<!--/.row-->


			<div class="row">
				<div class="col-lg-12">

					<h2>${flea.flea_title }, 심사 Form</h2>
				</div>

				<!-- /.row -->
				
				<section class="product-details spad">
		<div style="margin-left:50px; padding-right:100px">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${path}/resources/img/flea/${flea.flea_img}" alt="">
						</div>
						
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
					

					
					
						<div >
						<h2>${flea.flea_title}</h2>
						<div id="status">
						
						<c:if test="${flea.flea_isokay ==null}">
					<button type="button" class="btn btn-warning" >심사중</button>
					</c:if>
					<c:if test="${flea.flea_isokay ==true }">
					<button type="button" class="btn btn-success">통과</button>
					</c:if>
					<c:if test="${flea.flea_isokay ==false }">
					<button type="button" class="btn btn-danger" >탈락</button>
					</c:if>
						</div>
						
						
						</div>
						<div class="product__details__rating">
							<!--  별 찍는 방법 -->
							<!-- <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i> -->
                            <div  class="text-danger">
							<h3>상품 가격 : ${flea.flea_price} 원</h3>
                            </div>
						</div>
						<hr style="border: solid 1px black;">
						<h4>상품 설명</h4>
						<p>${flea.flea_content}</p>
						<div class="good__details__quantity">
							
						</div>
						<hr style="border: solid 1px black;">
						<p><h2>상품 등록 일자 : ${flea.flea_date }</h2></p>
						
						<br>
						<hr style="border: solid 1px black;">
						<h3>심사 상태 변경하기</h3>
						<button type="button" id="testing" class="btn btn-warning" >심사중</button>
						<button type="button" id="test_yes" class="btn btn-success">통과</button>
						<button type="button" id="test_no" class="btn btn-danger" >탈락</button>
					</div>
				</div>
				

			</div>
		</div>
	</section>
				


				
			</div>
			<!-- /.panel-->
		</div>


	<input type="hidden" id="path" value="${path}"> 
	<input type="hidden" id="flea_no" value=${flea.flea_no}>
	
	
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
				
				 $(document).on("click","#myMsgCheck",function(){

						$.ajax({
							url:"updateCheckMsg.giv",
							type:"post",
							
							success:function(data){
								$("#msgcount").text("0");
								
							}
						});
				
					
					
				})
				
				$("#testing").on("click",function(){
			
					$.ajax({
						url : "adminFleaTestAction.giv",
						type : "post",
						data : {"test" : "testing",
							"flea_no" : $("#flea_no").val() },
						success : function(data) {
			
							$("#status").empty();
							$("#status").append('<button type="button" class="btn btn-warning" >심사중</button>');
						}
					});
					
					
				})
				
				$("#test_yes").on("click",function(){
			
					$.ajax({
						url : "adminFleaTestAction.giv",
						type : "post",
						data : {"test" : "test_yes",
								"flea_no" : $("#flea_no").val()
							},
						success : function(data) {
							
							$("#status").empty();
							$("#status").append('<button type="button" class="btn btn-success" >통과</button>');
			
						}
					});
					
					
				})
				
				$("#test_no").on("click",function(){
			
					$.ajax({
						url : "adminFleaTestAction.giv",
						type : "post",
						data : {"test" : "test_no",
							"flea_no" : $("#flea_no").val() },
						success : function(data) {
					
							$("#status").empty();
							$("#status").append('<button type="button" class="btn btn-danger" >탈락</button>');
			
						}
					});
					
					
				})
				
				
				 
				 
				
			
		
				
			}
		</script>
	</c:if>
		<c:if test="${admin == null}">
		<script>
		 location. href="adminLogin.giv";
		</script>
		
		</c:if>
</body>
</html>
