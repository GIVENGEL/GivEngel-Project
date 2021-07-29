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
			<li class=""><a href="adminMode.giv"><em class="fa fa-dashboard">&nbsp;</em> 누적통계</a></li>
			<li><a href="adminWidgets.giv"><em class="fa fa-calendar">&nbsp;</em> 개발자보드</a></li>
			<c:if test="${admin.admin_level > 0 }">
			<li ><a href="adminCharts.giv"><em class="fa fa-bar-chart">&nbsp;</em> 분석/통계</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 1 }">
			<li class="parent active"><a data-toggle="collapse" href="#sub-item-1">
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
			<li><a href="adminFlea.giv"><em class="fa fa-toggle-off">&nbsp;</em> 중고 상품 관리</a></li>
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
				<li>상품 관리</li>
				<li class="active">상품 등록</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1>상품 등록</h1>
			</div>
		</div>
		<!--/.row-->


		<div class="row">
			<div class="col-lg-12">

				<h2>최근 등록된 상품</h2>
			</div>
			<div class="col-lg-12" id="goodDiv">
			
			</div>
			
			<!-- /.row -->


			<div class="panel panel-default">
				<div class="panel-body">
				
				<form id="insertfrm" action="adminInsertGood.giv" method="post" enctype="multipart/form-data">
					<div class="col-md-6" style="margin-top:20px">
						<input  name="url" class="form-control" value="${path }"  type="hidden">
							<div class="form-group">
							
								<label>상품명</label> <input id="good_name" name="good_name" class="form-control" placeholder="상품명">
							
							</div>
							<div class="form-group">
								<label>상품가격</label> <input id="good_price" name="good_price" type="number" class="form-control"
									placeholder="상품 가격">
							</div>
							<div class="form-group">
								<label>상품재고</label> <input id="good_stock" name="good_stock" type="number" class="form-control"
									placeholder="상품 재고">
							</div>
							<div class="form-group">
								<label>등록 관리자</label> <input id="admin" type="text" name="admin"
									value="${sessionScope.admin.admin_id }" class="form-control"
									disabled>
							</div>

							<div class="form-group">
								<label>파일 이미지</label> <input id="file" name="file" type="file">
								<p class="help-block">상품을 대표하는 이미지를 넣어주세요.</p>
							</div>
							<div class="form-group">
								<label>상품 설명</label>
								<textarea name="good_detail" id="good_detail" class="form-control" rows="3"></textarea>
							</div>
							<label>상품 태그 입력</label>
							<div class="form-group has-success">
								<input type="text" name="good_tags" id="good_tags" class="form-control" placeholder="#태그특징">
							</div>
					</div>
					<div class="col-md-6" style="margin-top:20px">
					<br/><hr/>
						<div class="form-group"></div>
						<div class="form-group">
							<label>상품 카테고리</label>
							<div class="radio">
								<label> <input type="radio" name="good_tag"
									id="optionsRadios1" value="ACC" checked>ACC
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="good_tag"
									id="optionsRadios2" value="TOP">TOP
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="good_tag"
									id="optionsRadios3" value="BOTTOM">BOTTOM
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="good_tag"
									id="optionsRadios3" value="BAG">BAG
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="good_tag"
									id="optionsRadios3" value="SHOES">SHOES
								</label>
							</div>
						</div>
						<div class="form-group">
							<label>후원단체 등록</label> <select name="spon_no" class="form-control" id="selectSpon">
								<option value=-1>none</option>
								
							</select>
						</div>
						
						<button id="submitbtn" type="button" class="btn btn-primary">상품 등록하기</button>
						<button type="reset" class="btn btn-default">양식 초기화</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /.panel-->
	</div>
	<!-- /.col-->
	<div class="col-sm-12">
		<p class="back-link">
			Lumino Theme by <a href="https://www.medialoot.com">Medialoot</a>
		</p>
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

			/* <div class="col-md-3">
			<div class="panel panel-success">
				<div class="panel-heading">[상품명]</div>
				<div class="panel-body">
					<p>[상품 디테일]</p>
				</div>
			</div>
			</div> */
			$.ajax({
				url : "adminSelectSpon.giv",
				type : "post",
				success : function(data) {
					var list = data.list;
					$("#selectSpon").append("<option>none</option>")

					$("#selectSpon").empty();
					for(var i=0;i<list.length;i++){
						$("#selectSpon").append("<option value="+data.list[i].spon_no+">"+data.list[i].spon_name+"</option>")
						
				
					}
					
				}
			});
			

			function updateGood() {
				$.ajax({
					url : "adminSelectGood.giv",
					type : "post",
					success : function(data) {
						var list = data.list;

						$("#goodDiv").empty();
						for(var i=0;i<4;i++){
							$("#goodDiv").append('<div class="col-md-3"><div class="panel panel-success"><div class="panel-heading name">'+data.list[i].good_name+'</div><div class="panel-body"><p>'+data.list[i].good_detail+'</p></div></div></div>')
						}
						
					}
				});

			}

			setInterval(updateGood, 2000);
			
			
			function checkform(){
				var good_name = $("#good_name").val();
				var good_price = /[0-9]/;
				var good_stock = /[0-9]/;
				var admin = $("#admin");
				var file = $("#file").val();
				var good_detail = $("#good_detail").val();
				var good_tags = $("#good_tags").val();
				
				if(good_name==""){
					alert("상품명을 입력해주세요");
					return false;
				}
				if(!good_price.test($("#good_price").val())){
					alert("상품 가격을 입력해주세요");
					return false;
				}
				if(!good_stock.test($("#good_stock").val())){
					alert("상품 재고를 입력해주세요");
					return false;
				}
				if(admin==""){
					alert("잘못된 접근입니다.");
					return false;
				}
				if(good_detail==""){
					alert(" 상품 설명을 적어주세요");
					return false;
				}
				if(good_tags==""){
					alert("적어도 하나 이상의 태그를 입력해주세요");
					return false;
				}
				
				return true;	
			}
			
			$("#submitbtn").on("click",function(){
				if(checkform()){
					alert("성공");
					$("#insertfrm").submit();
				}
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
