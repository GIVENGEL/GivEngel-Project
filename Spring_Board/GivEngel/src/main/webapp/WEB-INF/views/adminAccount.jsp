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
			<li><a href="adminFlea.giv"><em class="fa fa-toggle-off">&nbsp;</em> 중고 상품 관리</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 2 }">
			<li><a href="adminUserAccount.giv"><em class="fa fa-toggle-off">&nbsp;</em> 유저 계정 관리</a></li>
			</c:if>
			<c:if test="${admin.admin_level > 3 }">
			<li class="active"><a href="adminAccount.giv"><em class="fa fa-toggle-off">&nbsp;</em> 개발자 계정 관리</a></li>
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
					<h1>개발자 계정 관리</h1>
				</div>
			</div>
			<!--/.row-->


			<div class="row">
				<div class="col-lg-12">

					<h2>개발자 계정<a href="adminAccountInsertForm.giv"><button type="button" class="btn btn-success">등록하기</button></a></h2>
				</div>

				<!-- /.row -->
				<div class="col-lg-12 card-margin"  style="margin-bottom:50px">
        <div class="card search-form">
            <div class="card-body p-0">
                <form id="searchForm" action="searchAdmin.giv" method="post">
                    <div class="row">
                        <div class="col-12">
                            <div class="row no-gutters">
                                
                                <div class="col-lg-3 col-md-3 col-sm-3 p-0" style="padding:0px">
                                    <input type="text" placeholder="검색 내용" style="margin-left:30px" class="form-control" id="searchData" name="searchData">
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 p-0" style="padding:0px">
                                    <input id="submitbtn" type="button" class="btn btn-primary btn-lg" style="margin-left:30px" value="검색하기">

                                </div>
                                
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


				<div class="panel panel-default">
					<!-- 전체상품 리스트 출력(현재 카테고리별 출력까지 구현) -->
					<div class="row">
					<div id="searchResult">
					 <c:forEach items="${adminList }" var="adminVO">
					 	<div class="col-sm-3 col-md-2">
							<div class="thumbnail">
								<img src="${path}/resources/img/admin/lv${adminVO.admin_level}.png" alt="${adminVO.admin_id}">
								<div class="caption">
									<h3>${adminVO.admin_id}</h3>
									<p>권한 : ${adminVO.admin_available}</p>
									<p>
										<a href="adminAccountModifyForm.giv?admin_id=${adminVO.admin_id}" class="btn btn-warning" role="button">수정하기</a>
										<a href="adminAccountDeleteForm.giv?admin_id=${adminVO.admin_id}" class="btn btn-danger" role="button" style="margin:5px">삭제하기</a>
									</p>
								</div>
							</div>
						</div>
					 </c:forEach>
					</div>
					</div>
					<!-- 전체상품 리스트 end -->
					<div class="panel-body"></div>
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

				
				/* <div class="col-sm-3 col-md-2">
				<div class="thumbnail">
					<img src="${path}/resources/img/good/${goodVO.good_img}" alt="${goodVO.good_name}">
					<div class="caption">
						<h3>${goodVO.good_name}</h3>
						<p>${goodVO.good_price} 원</p>
						<p>
							<a href="adminGoodModifyForm.giv?good_no=${goodVO.good_no}" class="btn btn-primary" role="button">수정하기</a>
						</p>
					</div>
				</div>
			</div>
				 */
				$("#searchData").on("keyup",function(){
					var level = $("#level").val();
					var searchData = $("#searchData").val();
					$.ajax({
						url : "searchAdmin.giv",
						type : "post",
						data : {
							"level":level,
							"searchData":searchData
						},
						success : function(data) {
							var list = data.list;
							var paths = $("#path").val();
							$("#searchResult").empty();
							$("#searchResult").append('<div class="col-sm-3 col-md-2"><div class="thumbnail"><img src='+path+' "alt="'+data.list[i].admin_id+'"><div class="caption"><h3>'+data.list[i].admin_id+'</h3><p> 권한 :'+data.list[i].admin_available +'</p><p><a href="adminAccountModifyForm.giv?admin_id='+data.list[i].admin_id+'" class="btn btn-warning" role="button">수정하기</a><a href="adminAccountDeleteForm.giv?admin_id='+data.list[i].admin_id+'" class="btn btn-danger" role="button" style="margin:5px">삭제하기</a></p></div></div></div>')
							
						}
					});
				})
			
		
				
			}
		</script>
	</c:if>
</body>
</html>
