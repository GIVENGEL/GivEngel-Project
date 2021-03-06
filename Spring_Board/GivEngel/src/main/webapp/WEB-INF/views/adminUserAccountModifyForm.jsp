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
				<li>유저 계정 관리</li>
					<li class="active">유저 계정 수정</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
			<input type="hidden" id="original_user_id" value="${users.user_id}">
				<h1>${users.user_id} 님의 정보 수정</h1>
			</div>
		</div>
		<!--/.row-->


		<div class="row">
			
			<!-- /.row -->


			<div class="panel panel-default">
				
				<div class="panel-body">
				<form id="updatefrm" action="adminUserAccountModifyAction.giv" method="post">
					<div class="col-md-6">
						<input  name="url" class="form-control" value="${path }"  type="hidden">
						<input  name="user_no" class="form-control" value="${users.user_no }"  type="hidden">
							<div class="form-group">
								<label>유저 아이디</label> <input id="user_id" name="user_id" class="form-control" placeholder="아이디" value="${users.user_id }">
							
							</div>
							<div class="form-group">
								<label>유저 이름</label> <input id="user_name" name="user_name" class="form-control" placeholder="유저 이름" value="${users.user_name }">
							
							</div>
							<div class="form-group">
								<label>유저 비밀번호</label> <input id="user_pw" name="user_pw" type="text" class="form-control"
									placeholder="비밀번호" value="${users.user_pw}">
							</div>
							
							<div class="form-group">
								<label>유저 주소</label> <input id="user_addr" name="user_addr" type="text" class="form-control"
									placeholder="유저 주소" value="${users.user_addr}">
							</div>
							
							<div class="form-group">
								<label>유저 전화번호</label> <input id="user_tel" name="user_tel" type="text" class="form-control"
									placeholder="유저 전화번호" value="${users.user_tel}">
							</div>
							
							<div class="form-group">
								<label>유저 마일리지</label> <input id="user_cash" name="user_cash" type="number" class="form-control"
									placeholder="유저 마일리지" value="${users.user_cash}">
							</div>
							

							
							<button id="submitbtn" type="button" class="btn btn-primary">정보 수정하기</button>
						<button type="reset" class="btn btn-default">양식 초기화</button>
					</div>
					
					<div class="col-md-6">
					<div class="form-group"></div>
					
						
						
					</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /.panel-->
	</div>
	<!-- /.col-->
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
				
				var user_idCheck = RegExp(/^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z0-9]/);
				var user_pwCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
				var user_addrCheck = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/);
				var user_telCheck = RegExp(/^01[0179][0-9]{7,8}$/);
				var user_cashCheck = RegExp(/[0-9]/);
				
				var user_id=$("#user_id").val();
				var user_pw = $("#user_pw").val();
				var user_addr = $("#user_addr").val();
				var user_tel = $("#user_tel").val();
				var user_cash = $("#user_cash").val();
				
				
				 $(document).on("click","#myMsgCheck",function(){

						$.ajax({
							url:"updateCheckMsg.giv",
							type:"post",
							
							success:function(data){
								$("#msgcount").text("0");
								
							}
						});
				
					
					
				})
				
				
				if(user_id==""){
					alert("아이디을 입력해주세요");
					return false;
				}
				
				if(!user_idCheck.test(user_id)){
					alert("(아이디 양식 오류) [아이디는 이메일 형식으로 입력 가능합니다]")
					return false;
				}
				
				
				
				if(user_pw==""){
					alert("패스워드를 입력해주세요");
					return false;
				}
				if(!user_pwCheck.test(user_pw)){
					alert("(패스워드 양식 오류) - [영어 대문자 시작+소문자],[숫자와 특수기호 필히 입력],[8~16 자리]")
					return false;
				}
				
				
				
				if(user_addr==""){
					alert("주소를 입력해주세요");
					return false;
				}
				if(!user_addrCheck.test(user_addr)){
					alert("(주소 양식 오류) : [_ / - 를 제외한 특수문자는 사용이 불가합니다]");
					return false;
				}
				
				if(user_tel==""){
					alert("전화번호를 입력해주세요");
					return false;
				}
				if(!user_telCheck.test(user_tel)){
					alert("(전화번호 양식 오류) [ '-' 없이 입력해주세요]");
					return false;
				}
				
				if(user_cash == ""){
					alert("마일리지를 입력해주세요");
					return false
				}
				if(!user_cashCheck.test(user_cash)){
					alert("(마일리지 양식 오류) [숫자만 입력해주세요]");
					return false;
				}
				
				
				
				return true;	
			}
			
			$("#submitbtn").on("click",function(){
				var admin_id = $("#admin_id").val();
				if(checkform()){
					if($("#original").val() != admin_id){
						$.ajax({
							url : "checkAdminId.giv",
							type : "post",
							data : {"admin_id" : admin_id },
							success : function(data) {
								if(data!="0"){
									alert("아이디 중복");
								}
								else{
									alert("수정이 완료되었습니다!");
									  $("#updatefrm").submit();  
								}
							}
						});
					}else{
						$.ajax({
							url : "checkAdminId.giv",
							type : "post",
							data : {"admin_id" : admin_id },
							success : function(data) {
								
									alert("수정이 완료되었습니다!");
									  $("#updatefrm").submit();  
								
							}
						});
						
					}
					
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