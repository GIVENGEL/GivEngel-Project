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
			<li class="active"><a href="adminMode.giv"><em class="fa fa-dashboard">&nbsp;</em> 누적통계</a></li>
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
				<li class="active">Forms</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1>개발자 등록</h1>
			</div>
		</div>
		<!--/.row-->


		<div class="row">
			<div class="col-lg-12">

				<h2>등록 양식</h2>
			</div>
			<div id="goodDiv">
			
			</div>
			<!-- /.row -->


			<div class="panel panel-default">
				
				<div class="panel-body">
				<form id="insertfrm" action="adminAccountInsertAction.giv" method="post" >
					<div class="col-md-6">
						<input  name="url" class="form-control" value="${path }"  type="hidden">
							<div class="form-group">
								<label>개발자 아이디</label> <input id="admin_id" name="admin_id" class="form-control" placeholder="아이디">
							<hr/>
							<label>개발자 비밀번호</label>
							<div class="form-group has-success">
								<input type="password" name="admin_pw" id="admin_pw" class="form-control" placeholder="비밀번호">
							</div>
							<div class="form-group has-success">
								<input type="password" name="pwCheck" id="pwCheck" class="form-control" placeholder="비밀번호 확인">
							</div>
							<hr/>
							<div class="form-group">
							<label>개발자 권한 등급</label>
							<div class="radio">
								<label> <input type="radio" name="admin_level"
									id="optionsRadios1" value="1" checked>level-1
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="admin_level"
									id="optionsRadios2" value="2">level-2
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="admin_level"
									id="optionsRadios3" value="3">level-3
								</label>
							</div>
						
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group"></div>
						</div>
						
						<button id="submitbtn" type="button" class="btn btn-primary">계정 등록하기</button>
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
	</div>
	<!-- /.row -->
	</div>
	<!--/.main-->

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
			
	
			
			function checkform(){
var admin_id = $("#admin_id").val();
				
				var admin = $("#admin");
				
				var admin_pw = $("#admin_pw").val();
				var pwCheck = $("#pwCheck").val();
				
				if(admin_id==""){
					alert("아이디를 입력해주세요");
					return false;
				}
				
				if(admin_pw==""){
					alert("비밀번호를 적어주세요");
					return false;
				}
				if(admin_pw != pwCheck){
					alert("비밀번호를 다시 확인해주세요");
					return false;
				}

				return true;	
			}
			
			$("#submitbtn").on("click",function(){
				var admin_id = $("#admin_id").val();
				
				var admin = $("#admin");
				
				var admin_pw = $("#admin_pw").val();
				var pwCheck = $("#pwCheck").val();
				if(checkform()){
					$.ajax({
						url : "checkAdminId.giv",
						type : "post",
						data : {"admin_id" : admin_id },
						success : function(data) {
							if(data!="0"){
								alert("이미 존재하는 아이디입니다. 다른 아이디를 이용해주세요");
							}
							else{
								alert("등록이 완료되었습니다");
								$("#insertfrm").submit();
							}
						}
					});
					
				}
			})
			
			
		}
	</script>
	</c:if>
</body>
</html>
