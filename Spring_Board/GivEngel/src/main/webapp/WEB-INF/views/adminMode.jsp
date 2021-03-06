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
	<!-- ------------------------------------------------------------------------------------------------ -->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="adminMode.giv">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">누적통계</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">누적 통계</h1>
			</div>
		</div><!--/.row-->
		
		<div class="panel panel-container">
			<div class="row">
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-shopping-cart color-blue"></em>
							<div class="large"><span id="orderCount"></span></div>
							<div class="text-muted">총 주문</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-blue panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-comments color-orange"></em>
							<div class="large" ><span id="userCount"></span></div>
							<div class="text-muted" >총 유저</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-users color-teal"></em>
							<div class="large"><span id="saleCount"></span></div>
							<div class="text-muted">총 구입금액</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-red panel-widget ">
						<div class="row no-padding"><em class="fa fa-xl fa-search color-red"></em>
							<div class="large"><span id="cashCount"></span></div>
							<div class="text-muted">총 사용된 마일리지</div>
						</div>
					</div>
				</div>
			</div><!--/.row-->
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						시간 별 유저 판매 정보
						<ul class="pull-right panel-settings panel-button-tab-right">
							<li class="dropdown"><a class="pull-right dropdown-toggle" data-toggle="dropdown" href="#">
								<em class="fa fa-cogs"></em>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li>
										<ul class="dropdown-settings">
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 1
											</a></li>
											<li class="divider"></li>
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 2
											</a></li>
											<li class="divider"></li>
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 3
											</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>수익 성장률(일 단위)</h4>
						<c:if test="${priceRate<0 }">
						<div class="easypiechart" id="easypiechart-blue" data-percent="${priceRate }" ><span class="percent">${priceRate }%</span></div>
						</c:if>
						<c:if test="${priceRate>=0 }">
						<div class="easypiechart" id="easypiechart-blue" data-percent="${priceRate }" ><span class="percent">${priceRate }%</span></div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>가입자 수 성장률(일 단위)</h4>
						<c:if test="${userRate<0 }">
						<div class="easypiechart" id="easypiechart-orange" data-percent="${userRate }" ><span class="percent">${userRate }%</span></div>
						</c:if>
						<c:if test="${userRate>=0 }">
						<div class="easypiechart" id="easypiechart-orange" data-percent="${userRate }" ><span class="percent">${userRate }%</span></div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>저번 달 비교 구입금액</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="56" ><span class="percent">56%</span></div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>마일리지 환수율</h4>
						<c:if test="${cashRate<0 }">
						<div class="easypiechart" id="easypiechart-red" data-percent="${cashRate }" ><span class="percent">${cashRate }%</span></div>
						</c:if>
						<c:if test="${cashRate>=0 }">
						<div class="easypiechart" id="easypiechart-red" data-percent="${cashRate }" ><span class="percent">${cashRate }%</span></div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<!--/.row-->
		
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default chat">
					<div class="panel-heading">
						DEV LOG
						<ul class="pull-right panel-settings panel-button-tab-right">
							<li class="dropdown"><a class="pull-right dropdown-toggle" data-toggle="dropdown" href="#">
								<em class="fa fa-cogs"></em>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li>
										<ul class="dropdown-settings">
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 1
											</a></li>
											<li class="divider"></li>
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 2
											</a></li>
											<li class="divider"></li>
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 3
											</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body" id="alldevLog">
						<ul id="devLog">
						
							
							
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="btn-input" type="text" class="form-control input-md" placeholder="Type your message here..." /><span class="input-group-btn">
								<button class="btn btn-primary btn-md" id="btn-chat">Send</button>
						</span></div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						해야할 것
						<ul class="pull-right panel-settings panel-button-tab-right">
							<li class="dropdown"><a class="pull-right dropdown-toggle" data-toggle="dropdown" href="#">
								<em class="fa fa-cogs"></em>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li>
										<ul class="dropdown-settings">
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 1
											</a></li>
											<li class="divider"></li>
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 2
											</a></li>
											<li class="divider"></li>
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 3
											</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<ul class="todo-list">
							<li class="todo-list-item">
								<div class="checkbox">
									<input type="checkbox" id="checkbox-1" />
									<label for="checkbox-1">Make coffee</label>
								</div>
								<div class="pull-right action-buttons"><a href="#" class="trash">
									<em class="fa fa-trash"></em>
								</a></div>
							</li>
							<li class="todo-list-item">
								<div class="checkbox">
									<input type="checkbox" id="checkbox-2" />
									<label for="checkbox-2">Check emails</label>
								</div>
								<div class="pull-right action-buttons"><a href="#" class="trash">
									<em class="fa fa-trash"></em>
								</a></div>
							</li>
							<li class="todo-list-item">
								<div class="checkbox">
									<input type="checkbox" id="checkbox-3" />
									<label for="checkbox-3">Reply to Jane</label>
								</div>
								<div class="pull-right action-buttons"><a href="#" class="trash">
									<em class="fa fa-trash"></em>
								</a></div>
							</li>
							<li class="todo-list-item">
								<div class="checkbox">
									<input type="checkbox" id="checkbox-4" />
									<label for="checkbox-4">Make more coffee</label>
								</div>
								<div class="pull-right action-buttons"><a href="#" class="trash">
									<em class="fa fa-trash"></em>
								</a></div>
							</li>
							<li class="todo-list-item">
								<div class="checkbox">
									<input type="checkbox" id="checkbox-5" />
									<label for="checkbox-5">Work on the new design</label>
								</div>
								<div class="pull-right action-buttons"><a href="#" class="trash">
									<em class="fa fa-trash"></em>
								</a></div>
							</li>
							<li class="todo-list-item">
								<div class="checkbox">
									<input type="checkbox" id="checkbox-6" />
									<label for="checkbox-6">Get feedback on design</label>
								</div>
								<div class="pull-right action-buttons"><a href="#" class="trash">
									<em class="fa fa-trash"></em>
								</a></div>
							</li>
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="btn-input" type="text" class="form-control input-md" placeholder="Add new task" /><span class="input-group-btn">
								<button class="btn btn-primary btn-md" id="btn-todo">Add</button>
						</span></div>
					</div>
				</div>
			</div><!--/.col-->
			
			
			<div class="col-md-6">
				<div class="panel panel-default ">
					<div class="panel-heading">
						USER MESSAGE LOG
						<ul class="pull-right panel-settings panel-button-tab-right">
							<li class="dropdown"><a class="pull-right dropdown-toggle" data-toggle="dropdown" href="#">
								<em class="fa fa-cogs"></em>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li>
										<ul class="dropdown-settings">
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 1
											</a></li>
											<li class="divider"></li>
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 2
											</a></li>
											<li class="divider"></li>
											<li><a href="#">
												<em class="fa fa-cog"></em> Settings 3
											</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body timeline-container">
						<ul class="timeline" id="userMsgDiv">
							<li>
								<div class="timeline-badge"><em class="glyphicon glyphicon-pushpin"></em></div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h4 class="timeline-title">유저 아이디</h4>
									</div>
									<div class="timeline-body">
										<p>메시지 내용</p>
									</div>
								</div>
							</li>
							<li>
								<div class="timeline-badge primary"><em class="glyphicon glyphicon-link"></em></div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h4 class="timeline-title">Lorem ipsum dolor sit amet</h4>
									</div>
									<div class="timeline-body">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									</div>
								</div>
							</li>
							<li>
								<div class="timeline-badge"><em class="glyphicon glyphicon-camera"></em></div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h4 class="timeline-title">Lorem ipsum dolor sit amet</h4>
									</div>
									<div class="timeline-body">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer at sodales nisl. Donec malesuada orci ornare risus finibus feugiat.</p>
									</div>
								</div>
							</li>
							<li>
								<div class="timeline-badge"><em class="glyphicon glyphicon-paperclip"></em></div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h4 class="timeline-title">Lorem ipsum dolor sit amet</h4>
									</div>
									<div class="timeline-body">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div><!--/.col-->
			<div class="col-sm-12">
				<p class="back-link">Lumino Theme by <a href="https://www.medialoot.com">Medialoot</a></p>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	
	<script src="${path}/resources/js/admin/jquery-1.11.1.min.js"></script>
	<script src="${path}/resources/js/admin/bootstrap.min.js"></script>
	<script src="${path}/resources/js/admin/chart.min.js"></script>
	<script src="${path}/resources/js/admin/chart-data.js"></script>
	<script src="${path}/resources/js/admin/easypiechart.js"></script>
	<script src="${path}/resources/js/admin/easypiechart-data.js"></script>
	<script src="${path}/resources/js/admin/bootstrap-datepicker.js"></script>
	<script src="${path}/resources/js/admin/custom.js"></script>
	<script>
		window.onload = function () {
			updateDevLog()
			 setTimeout(function() {
				 var chart1 = document.getElementById("line-chart").getContext("2d");
					window.myLine = new Chart(chart1).Line(lineChartData, {
					responsive: true,
					scaleLineColor: "rgba(0,0,0,.2)",
					scaleGridLineColor: "rgba(0,0,0,.05)",
					scaleFontColor: "#c5c7cc"
					});
        },1);
	

	var beforeUser =0;
	var beforeSale=0;
	var beforeCash=0;
	var beforeOrder=0;
	function updateUserCount(){
		$.ajax({
			url:"adminUserCount.giv",
			type:"post",
			success:function(data){
				$("#userCount").text(data+"명");
				
				
			}
		});
		
	}
	function updateSaleCount(){
		$.ajax({
			url:"countSale.giv",
			type:"post",
			success:function(data){
				$("#saleCount").text(data +"원");
				
			}
		});
		
	}
	
	function updateCashCount(){
		$.ajax({
			url:"countCash.giv",
			type:"post",
			success:function(data){
				$("#cashCount").text(data +"원");
			}
		});
		
	}
	function updatOrderCount(){
		$.ajax({
			url:"adminOrderCount.giv",
			type:"post",
			success:function(data){
				$("#orderCount").text(data +"번");
			}
		});
		
	}
	/* <li class="left clearfix"><span class="chat-img pull-left">
	<img src="http://placehold.it/60/30a5ff/fff" alt="User Avatar" class="img-circle" />
	</span>
	<div class="chat-body clearfix">
		<div class="header"><strong class="primary-font">John Doe</strong> <small class="text-muted">32 mins ago</small></div>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ante turpis, rutrum ut ullamcorper sed, dapibus ac nunc.</p>
	</div>
</li> */





/* <li>
<div class="timeline-badge"><em class="glyphicon glyphicon-pushpin"></em></div>
<div class="timeline-panel">
	<div class="timeline-heading">
		<h4 class="timeline-title">유저 아이디</h4>
	</div>
	<div class="timeline-body">
		<p>메시지 내용</p>
	</div>
</div>
</li> */
$(document).on("click","#myMsgCheck",function(){

	$.ajax({
		url:"updateCheckMsg.giv",
		type:"post",
		
		success:function(data){
			$("#msgcount").text("0");
			
		}
	});



})

updateUserMsg();

	function updateUserMsg(){
	$.ajax({
		url:"selectUserMsg.giv",
		type:"post",
		success:function(data){
			
			var userMsgDiv = $("#userMsgDiv");
			userMsgDiv.empty();
			if(data.list.length <6){
				for(var i=0;i<data.list.length;i++){
					userMsgDiv.append('<li><div class="timeline-badge"><em class="glyphicon glyphicon-pushpin"></em></div><div class="timeline-panel"><div class="timeline-heading"><h4 class="timeline-title">'+data.list[i].msg_from+'</h4><small>'+data.list[i].msg_date+'</small></div><div class="timeline-body"><p>'+data.list[i].msg_detail+'</p></div></div></li>')
					
				}
			}
			else{
				for(var i=0;i<6;i++){
					userMsgDiv.append('<li><div class="timeline-badge"><em class="glyphicon glyphicon-pushpin"></em></div><div class="timeline-panel"><div class="timeline-heading"><h4 class="timeline-title">'+data.list[i].msg_from+'</h4><small>'+data.list[i].msg_date+'</small></div><div class="timeline-body"><p>'+data.list[i].msg_detail+'</p></div></div></li>')
					
				}
			}
			
			
		}
	});
}



	function updateDevLog(){
	$.ajax({
		url:"selectDevLog.giv",
		type:"post",
		success:function(data){
			$('#devLog').empty();
			var list = data.devLog;
			var src=""
			
			if(data.devLog.length<10){
				for(var i=0;i<data.devLog.length;i++){
					if(data.level[i]==1){
						 src = "${path}/resources/img/admin/lv1.png";
					}else if(data.level[i]==2){
						 src = "${path}/resources/img/admin/lv2.png";
					}else if(data.level[i]==3){
						 src = "${path}/resources/img/admin/lv3.png";
					}else if(data.level[i]==4){
						src = "${path}/resources/img/admin/lv4.png";
					}else{
					 src = "http://placehold.it/60/30a5ff/fff";
					}
					$('#devLog').append('<li class="left clearfix"><span class="chat-img pull-left"><div class="profile-userpic"><img src='+src+' alt="User Avatar" class="img-circle img-responsive" /></div></span><div class="chat-body clearfix"><div class="header"><strong class="primary-font">'+data.id[i]+'</strong> <small class="text-muted">'+data.devLog[i].log_date+'</small></div><p>'+ data.devLog[i].log_detail  +'</p></div></li>')
				}
			}else{
				for(var i=0;i<10;i++){
					if(data.level[i]==1){
						 src = "${path}/resources/img/admin/lv1.png";
					}else if(data.level[i]==2){
						 src = "${path}/resources/img/admin/lv2.png";
					}else if(data.level[i]==3){
						 src = "${path}/resources/img/admin/lv3.png";
					}else if(data.level[i]==4){
						src = "${path}/resources/img/admin/lv4.png";
					}else{
					 src = "http://placehold.it/60/30a5ff/fff";
					}
					$('#devLog').append('<li class="left clearfix"><span class="chat-img pull-left"><div class="profile-userpic"><img src='+src+' alt="User Avatar" class="img-circle img-responsive" /></div></span><div class="chat-body clearfix"><div class="header"><strong class="primary-font">'+data.id[i]+'</strong> <small class="text-muted">'+data.devLog[i].log_date+'</small></div><p>'+ data.devLog[i].log_detail  +'</p></div></li>')
				}
				}
			
		}, beforeSend: function () {
            var width = 0;
            var height = 0;
            var left = $("#alldevLog").position().left+ $("#alldevLog").width()/2-23;
            var top = $("#alldevLog").position().top+ $("#alldevLog").height()/2;

            width = 50;
            height = 50;



            if($("#div_ajax_load_image").length != 0) {
                   $("#div_ajax_load_image").css({
                          "top": $("#alldevLog").position().top + $("#alldevLog").height()/2  +"px",
                          "left": $("#alldevLog").position().left+ $("#alldevLog").width()/2-23+"px"
                   });
                   $("#div_ajax_load_image").show();
            }
            else {
                   $("#alldevLog").prepend('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#ffffff; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="${path}/resources/img/loading.gif" style="width:50px; height:50px;"></div>');
            }

     }
     , complete: function () {
                   $("#div_ajax_load_image").hide();
     }
	});
	
}
	
	
	setInterval(updateUserCount,2000);
	setInterval(updateSaleCount,2000);
	setInterval(updateCashCount,2000);
	setInterval(updatOrderCount,2000);
	
	

	
	
	
};
	</script>
		</c:if>
		<c:if test="${admin == null}">
		<script>
		 location. href="adminLogin.giv";
		</script>
		
		</c:if>
</body>
</html>