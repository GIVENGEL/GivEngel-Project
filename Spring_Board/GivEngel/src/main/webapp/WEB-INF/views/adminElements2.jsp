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
			<li class="parent active"><a data-toggle="collapse" href="#sub-item-2">
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
					<li>후원 단체 관리</li>
					<li class="active">후원 단체 등록</li>
				</ol>
			</div>
			<!--/.row-->

			<div class="row">
				<div class="col-lg-12">
					<h1>후원 단체 등록</h1>
				</div>
			</div>
			<!--/.row-->


			<div class="row">


				<!-- /.row -->


				<div class="panel panel-default">

					<div class="panel-body">
					<div class="panel-body tabs">
									<ul class="nav nav-tabs">
									<li class="active"><a href="#tab1" data-toggle="tab">후원 단체</a></li>
									<li><a href="#tab2" data-toggle="tab">캠페인</a></li>
									
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade in active" id="tab1">
											<h4>후원 단체</h4>
											<form id="insertfrm1" action="adminInsertSpon.giv" method="post"
							enctype="multipart/form-data">
							<div class="col-md-6">
								<input name="url" class="form-control" value="${path }"
									type="hidden">
								<div class="form-group">
									<label>후원 단체명</label> <input id="spon_name"
										name="spon_name" class="form-control"
										placeholder="후원 단체명">

								</div>
								<div class="form-group">
									<label>후원 단체 링크</label> <input id="spon_url"
										name="spon_url" class="form-control"
										placeholder="후원 단체 링크">
								</div>

								<div class="form-group">
									<label>등록 관리자</label> <input id="admin" type="text"
										name="admins" value="${sessionScope.admin.admin_id }"
										class="form-control" disabled>
								</div>

								<div class="form-group">
									<label>파일 이미지</label> <input id="file" name="file" type="file">
									<p class="help-block">단체를 대표하는 이미지를 넣어주세요.</p>
								</div>
								<div class="form-group">
									<label>후원 단체 설명</label>
									<textarea name="spon_comment" id="spon_comment"
										class="form-control" rows="3"></textarea>
								</div>
								
								<button id="submitbtn1" type="button" class="btn btn-primary">후원 단체 
									등록하기</button>
								<button type="reset" class="btn btn-default">양식 초기화</button>
							</div>
							<div class="col-md-6">
							
							</div>
						</form>
											
										</div>
										<div class="tab-pane fade" id="tab2">
											<h4>캠페인 작성 양식</h4>
											<form id="insertfrm2" action="adminInsertSpon.giv" method="post"
							enctype="multipart/form-data">
							<div class="col-md-6">
								<input name="url" class="form-control" value="${path }"
									type="hidden">
								<div class="form-group">
									<label>캠페인 단체명</label> <input id="spon_name"
										name="spon_name" class="form-control"
										placeholder="캠페인 단체명">

								</div>
								<div class="form-group">
									<label>후원 단체 링크</label> <input id="spon_url"
										name="spon_url" class="form-control"
										placeholder="후원 단체 링크">
								</div>

								<div class="form-group">
									<label>등록 관리자</label> <input id="admin" type="text"
										name="admins" value="${sessionScope.admin.admin_id }"
										class="form-control" disabled>
								</div>

								<div class="form-group">
									<label>파일 이미지</label> <input id="file" name="file" type="file">
									<p class="help-block">단체를 대표하는 이미지를 넣어주세요.</p>
								</div>
								<div class="form-group">
									<label>캠페인 단체 설명</label>
									<textarea name="spon_comment" id="spon_comment"
										class="form-control" rows="3"></textarea>
								</div>
								
								<button id="submitbtn2" type="button" class="btn btn-primary">캠페인 단체 
									등록하기</button>
								<button type="reset" class="btn btn-default">양식 초기화</button>
							</div>
							<div class="col-md-6">
							<h4>[캠페인 종료 날짜] <span id="endDate"></span></h4>
							<div class="panel-body">
						<div id="calendar"></div>
						<input type="hidden" id="spon_end" name="spon_end" value="">
					</div>
							</div>
						</form>
										</div>

									</div>
								</div>
						
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

				 $('#calendar').datepicker({
					format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
						//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
					 //생략

					    
					}).on("changeDate", function(e) {
			                 //이벤트의 종류
			                 //show : datePicker가 보이는 순간 호출
			                 //hide : datePicker가 숨겨지는 순간 호출
			                 //clearDate: clear 버튼 누르면 호출
			                 //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
			                 //changeMonth : 월이 변경되면 호출
			                 //changeYear : 년이 변경되는 호출
			                 //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
			                 $("#endDate").text(e.date);
							var temp ="2021-12-31";
							temp = $("#endDate").text();
							temp = temp.split(" ");
			                 temp[0];	// 요일
			                 temp[1];	// 월
			                 if(temp[1]=="Jan"){
			                	 temp[1]="01";
			                 }else if(temp[1]=="Feb"){
			                	 temp[1]="02";
			                 }else if(temp[1]=="Mar"){
			                	 temp[1]="03";
			                 }else if(temp[1]=="Apr"){
			                	 temp[1]="04";
			                 }else if(temp[1]=="May"){
			                	 temp[1]="05";
			                 }else if(temp[1]=="Jun"){
			                	 temp[1]="06";
			                 }else if(temp[1]=="Jul"){
			                	 temp[1]="07";
			                 }else if(temp[1]=="Aug"){
			                	 temp[1]="08";
			                 }else if(temp[1]=="Sep"){
			                	 temp[1]="09";
			                 }else if(temp[1]=="Oct"){
			                	 temp[1]="10";
			                 }else if(temp[1]=="Nov"){
			                	 temp[1]="11";
			                 }else if(temp[1]=="Dec"){
			                	 temp[1]="12";
			                 }
			                 temp[2];	// 일
			                 temp[3];	// 년
			                 var formatDate = temp[3]+"-"+temp[1] +"-"+temp[2];
			                 $("#endDate").text(temp[3]+"년 "+temp[1]+"월 "+ temp[2]+ "일 ("+temp[0]+")");
			                 $("#spon_end").val(formatDate);
			                 console.log(e);// 찍어보면 event 객체가 나온다.
			                 //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
			                 // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
			                 // 위와 같은 형태로 보인다. 
			                 // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
			            })

				function checkform() {
					var spon_name = $("#spon_name").val();
					var admin = $("#admin");
					var file = $("#file").val();
					var spon_comment = $("#spon_comment").val();

					if (spon_name == "") {
						alert("후원 단체명을 입력해주세요");
						return false;
					}
					if (admin == "") {
						alert("잘못된 접근입니다.");
						return false;
					}
					if (spon_comment == "") {
						alert("후원 단체 설명을 적어주세요");
						return false;
					}
					return true;
				}

				$("#submitbtn1").on("click", function() {
					if (checkform()) {
						alert("성공");
						$("#insertfrm1").submit();
					}
				})
				
				function checkform2() {
					var spon_name = $("#insertfrm2 #spon_name").val();
					var admin = $("#insertfrm2 #admin");
					var file = $("#insertfrm2 #file").val();
					var spon_comment = $("#insertfrm2 #spon_comment").val();
					var spon_end = $("#insertfrm2 #spon_end").val();

					if (spon_name == "") {
						alert("캠페인명을 입력해주세요");
						return false;
					}
					if (admin == "") {
						alert("잘못된 접근입니다.");
						return false;
					}
					if (spon_comment == "") {
						alert("캠페인 설명을 적어주세요");
						return false;
					}
					if (spon_end == "") {
						alert("캠페인 종료일을 적어주세요");
						return false;
					}
					return true;
				}

				$("#submitbtn2").on("click", function() {
					if (checkform2()) {
						alert("성공");
						$("#insertfrm2").submit();
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
