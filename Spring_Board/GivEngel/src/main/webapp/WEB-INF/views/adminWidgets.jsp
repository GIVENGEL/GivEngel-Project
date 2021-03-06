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
				<input type="hidden" id="level" value="one">
			</c:if>
			<c:if test="${admin.admin_level ==2 }">
				<img src="${path}/resources/img/admin/lv2.png" class="img-responsive" alt="">
				<input type="hidden" id="level" value="two">
			</c:if>
			<c:if test="${admin.admin_level ==3 }">
				<img src="${path}/resources/img/admin/lv3.png" class="img-responsive" alt="">
				<input type="hidden" id="level" value="three">
			</c:if>
			<c:if test="${admin.admin_level ==4 }">
				<img src="${path}/resources/img/admin/lv4.png" class="img-responsive" alt="">
				<input type="hidden" id="level" value="four">
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
			<li ><a href="adminMode.giv"><em class="fa fa-dashboard">&nbsp;</em> 누적통계</a></li>
			<li class="active"><a href="adminWidgets.giv"><em class="fa fa-calendar">&nbsp;</em> 개발자보드</a></li>
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
				<li><a href="adminMode.giv">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">개발자 보드</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">개발자 보드</h1>
			</div>
		</div><!--/.row-->

		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default articles">
					<div class="panel-heading">
						최근 공지
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
					<div class="panel-body articles-container" id="notice_list">
						
						
						
						
	
				</div>
					<c:if test="${admin.admin_level > 3 }">
					<div class="panel-footer">
						<div class="input-group">
							<input name="notice_detail" id="notice_detail" type="text" class="form-control input-md" placeholder="제목#공지 내용" /><span class="input-group-btn">
								<input type="button" class="btn btn-primary btn-md" id="noticesubmit" value="등록">
								
						</span></div>
					</div>
					</c:if>
					</div>
				
				<div class="panel panel-default ">
					<div class="panel-heading">
						이번달 실적
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
						<div class="col-md-12 no-padding">
							<div class="row progress-labels">
								<div class="col-sm-6">주문량</div>
								<div class="col-sm-6" style="text-align: right;">80%</div>
							</div>
							<div class="progress">
								<div data-percentage="0%" style="width: 80%;" class="progress-bar progress-bar-blue" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="row progress-labels">
								<div class="col-sm-6">수입</div>
								<div class="col-sm-6" style="text-align: right;">60%</div>
							</div>
							<div class="progress">
								<div data-percentage="0%" style="width: 60%;" class="progress-bar progress-bar-orange" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="row progress-labels">
								<div class="col-sm-6">신규 가입자</div>
								<div class="col-sm-6" style="text-align: right;">40%</div>
							</div>
							<div class="progress">
								<div data-percentage="0%" style="width: 40%;" class="progress-bar progress-bar-teal" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="row progress-labels">
								<div class="col-sm-6">후원편차</div>
								<div class="col-sm-6" style="text-align: right;">20%</div>
							</div>
							<div class="progress">
								<div data-percentage="0%" style="width: 20%;" class="progress-bar progress-bar-red" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<span id="admin_id">${admin.admin_id}</span>님의 할 일
						
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
						<ul id="todo_list" class="todo-list">
							
							
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input name="todo_detail" id="todo_detail" type="text" class="form-control input-md" placeholder="Add new task" /><span class="input-group-btn">
								<input type="button" class="btn btn-primary btn-md" id="todosubmit" value="등록">
								
						</span></div>
					</div>
				</div>
				<div class="panel panel-default chat">
					<div class="panel-heading">
						메시지함
						<ul class="pull-right panel-settings panel-button-tab-right">
							<li class="dropdown"><a class="pull-right dropdown-toggle" data-toggle="dropdown" href="#">
								<em class="fa fa-cogs"></em>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li>
										<ul class="dropdown-settings">
											<li id="status_all"><a href="#">
												<em class="fa fa-cog"></em> 전체 메시지함
											</a></li>
											<li class="divider"></li>
											<li id="status_given"><a href="#">
												<em class="fa fa-cog"></em> 받은 메시지함
											</a></li>
											<li class="divider"></li>
											<li id="status_send"><a href="#">
												<em class="fa fa-cog"></em> 보낸 메시지함
											</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body" id="allmsgBox">
						<ul id="msgBox">
							
							
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="btn-input" type="text" class="form-control input-md" placeholder="Type your message here..." /><span class="input-group-btn">
								<button class="btn btn-primary btn-md" id="btn-chat">Send</button>
						</span></div>
					</div>
				</div>
			</div><!--/.col-->
			
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						달력
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
						<div id="calendar"></div>
					</div>
				</div>
				<div class="panel panel-default ">
					<div class="panel-heading">
						<div id="timeLine">타임라인</div>
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
						<ul class="timeline" id="timeDiv">
							
						</ul>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						메시지 보내기
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
						<form class="form-horizontal" action="SendMsg.giv" method="post">
							<fieldset>
								<!-- Name input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">받는 사람</label>
									<div class="col-md-9">
										<input id="msg_to" name="msg_to" type="text" placeholder="받는 사람" class="form-control">
									</div>
								</div>								
								<!-- Message body -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="message">메시지</label>
									<div class="col-md-9">
										<textarea class="form-control" id="msg_detail" name="msg_detail" placeholder="메시지를 입력해주세요..." rows="5"></textarea>
									</div>
								</div>
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<input type="button" id="msgSubmit" class="btn btn-success" style="float:right" value="Submit">
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div><!--/.col-->
			<div class="col-sm-12">
				<p class="back-link">Lumino Theme by <a href="https://www.medialoot.com">Medialoot</a></p>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	  

<input type="hidden" id="src" value="${path}/resources/img/admin/">
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
			 updateToDoLog();
			 updateNoticeLog();
			 updateMsg();
			 
			 
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
			                
			 					
							var temp = ""+e.date;
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
			                 $("#timeLine").text("타임라인 : " + temp[3]+"년 "+temp[1]+"월 "+ temp[2]+ "일 ("+temp[0]+")");
			                 
			                 console.log(e);// 찍어보면 event 객체가 나온다.
			                 //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
			                 // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
			                 // 위와 같은 형태로 보인다. 
			                 // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
			                 
			                 
			                 
			                 
			                 
			                  /* 문자 처리일 경우
			 <li>
				<div class="timeline-badge"><i class="glyphicon glyphicon-pushpin"></i></div>
				<div class="timeline-panel">
					<div class="timeline-heading">
						<h4 class="timeline-title">제목 문자열</h4>
						<small>날짜</samll>
					</div>
					<div class="timeline-body">
						<p>내용 문자열</p>
					</div>
				</div>
			</li>
			 
 */	
			                 
			                 
			               /*   문자 메시지의 경우
			                 <li>
								<div class="timeline-badge primary"><i class="glyphicon glyphicon-link"></i></div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h4 class="timeline-title">제목 문자열</h4>
										<small>날짜</samll>
									</div>
									<div class="timeline-body">
										<p>내용 문자열</p>
										
									</div>
								</div>
							</li>
			                  */
			                  $.ajax({
			                	 
							url:"timeLine.giv",
							type:"post",
							data:{"formatDate": formatDate},
							success:function(data){
								
								$("#timeDiv").empty();
								for(var i=0;i<data.list.length;i++){
									$("#timeDiv").append(' <li><div class="timeline-badge primary"><i class="glyphicon glyphicon-link"></i></div><div class="timeline-panel"><div class="timeline-heading"><h4 class="timeline-title">'+data.list[i].msg_from+' 님으로부터 온 메시지</h4><small>'+data.list[i].msg_date+'</samll></div><div class="timeline-body"><p>'+data.list[i].msg_detail+'</p></div></div></li>')
								}
								
								
									
									
								}
			                  });
			            })
			 
			 
		
			
			
			var status = "all";
			
			$(document).on("click","#status_all",function(){
				status = "all";
				updateMsg();
			})
			$(document).on("click","#status_given",function(){
				status = "given";
				updateMsg();
			})
			$(document).on("click","#status_send",function(){
				status = "send";
				updateMsg();
			})
			
			// 보낸 메시지
			/* 	 <li class="left clearfix"><span class="chat-img pull-left">
				<img src=이미지 alt="User Avatar" class="img-circle" />
				</span>
				<div class="chat-body clearfix">
					<div class="header"><strong class="primary-font">받은사람 에게..</strong> <small class="text-muted">날짜</small></div>
					<p>내용</p>
				</div>
			</li> */
			
			// 받은 메시지
			/* 	 <li class="right clearfix"><span class="chat-img pull-right">
			<img src=경로 alt="User Avatar" class="img-circle" />
			</span>
			<div class="chat-body clearfix">
				<div class="header"><strong class="pull-left primary-font">보낸사람 (으)로 부터..</strong> <small class="text-muted">시간</small></div>
				<p>내용</p>
			</div>
		</li> */
			
			function updateMsg(){
			
			
			var admin = "${admin.admin_id}"

				if(admin != null){
					 $.ajax({
							url:"selectMsg.giv",
							type:"post",
							data:{"status": "all"},
							success:function(data){

								var srcs;
								
								
								$("#msgBox").empty();
								for(var i=0;i<data.msgList.length;i++){
									if(data.senderList[i].admin_level ==1){ srcs="${path}/resources/img/admin/lv1.png"	}
									if(data.senderList[i].admin_level ==2){ srcs="${path}/resources/img/admin/lv2.png"	}
									if(data.senderList[i].admin_level ==3){ srcs="${path}/resources/img/admin/lv3.png"	}
									if(data.senderList[i].admin_level ==4){ srcs="${path}/resources/img/admin/lv4.png"	}
									
									var me;
									if(data.giverList[i].admin_level ==1){ me="${path}/resources/img/admin/lv1.png"	}
									if(data.giverList[i].admin_level ==2){ me="${path}/resources/img/admin/lv2.png"	}
									if(data.giverList[i].admin_level ==3){ me="${path}/resources/img/admin/lv3.png"	}
									if(data.giverList[i].admin_level ==4){ me="${path}/resources/img/admin/lv4.png"	}
									
									if(data.msgList[i].msg_to == admin){
										$("#msgBox").append('<li class="left clearfix"><span class="chat-img pull-left" ><div class="profile-userpic"><img src='+me+' alt="User Avatar" class="img-circle img-responsive" /></div></span><div class="chat-body clearfix"><div class="header"><strong class="primary-font">'+ data.msgList[i].msg_from + '님으로 부터</strong> <small class="text-muted">'+data.msgList[i].msg_date+'</small></div><p>'+data.msgList[i].msg_detail+'</p></div></li>')
										
									}
									if(data.msgList[i].msg_from == admin){
										$("#msgBox").append('<li class="right clearfix"><span class="chat-img pull-right"><div class="profile-userpic"><img src='+srcs+' alt="User Avatar" class="img-circle img-responsive" /></div></span><div class="chat-body clearfix"><div class="header"><strong class="pull-left primary-font">'+ data.msgList[i].msg_to + '님에게 </strong> <small class="text-muted">'+data.msgList[i].msg_date+'</small></div><p>'+data.msgList[i].msg_detail+'</p></div></li>')			
									}
									
									
								}


								
								
								
							}, beforeSend: function () {
					              var width = 0;
					              var height = 0;
					              var left = $("#allmsgBox").position().left + $("#allmsgBox").width()/2-30;
					              var top = $("#allmsgBox").position().top + $("#allmsgBox").height()/2+150;

					              width = 50;
					              height = 50;


					              

					 

					              if($("#div_ajax_load_image").length != 0) {
					                     $("#div_ajax_load_image").css({
					                            "top": $("#allmsgBox").position().top + $("#allmsgBox").height()/2+150  +"px",
					                            "left": $("#allmsgBox").position().left + $("#allmsgBox").width()/2-30  +"px"
					                     });
					                     $("#div_ajax_load_image").show();
					              }
					              else {
					                     $("#allmsgBox").append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#ffffff; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="${path}/resources/img/loading.gif" style="width:50px; height:50px;"></div>');
					              }

					       }
					       , complete: function () {
					                     $("#div_ajax_load_image").hide();
					       }
						});
				}
			}
			
			 
			 
			 
			 $(document).on("click","#msgSubmit",function(){
				 if($("#msg_to").val() != ""){
					 $.ajax({
							url:"SendMsg.giv",
							type:"post",
							data:{"msg_to": $("#msg_to").val(),
								"msg_detail": $("#msg_detail").val()},
							success:function(data){
								$("#msg_to").val("");
								$("#msg_detail").val("");
								updateMsg();
								
							}
						});
					 
				 }
				 
			 })
			 
			 
			 
			 
			 $(document).on("click","#myMsgCheck",function(){

					$.ajax({
						url:"updateCheckMsg.giv",
						type:"post",
						
						success:function(data){
							$("#msgcount").text("0");
							
						}
					});
			
				
				
			})
			 
			 
			 
			 
			$(document).on("click","#todosubmit",function(){
				if($("#todo_detail").val()!=""){
					$.ajax({
						url:"insertToDoLog.giv",
						type:"post",
						data:{"todo_detail": $("#todo_detail").val()},
						success:function(data){
							$("#todo_detail").val("");
							updateToDoLog();
						}
					});
				}else{
					alert("할 일을 입력하세요")
				}
				
				
			})
			
			
			
				$(document).on("click","#noticesubmit",function(){
				if($("#notice_detail").val()!=""){
					if($("#notice_detail").val().indexOf("#")!=-1){
						$.ajax({
							url:"insertNoticeLog.giv",
							type:"post",
							data:{"notice_detail": $("#notice_detail").val()},
							success:function(data){
								$("#notice_detail").val("");
								updateNoticeLog();
							}
						});
					}else{
						alert("제목과 내용을 #으로 분리시켜주세요")
					}
					
				}else{
					alert("공지를 입력하세요")
				}
				
				
			})
			
			$(document).on("click",".todo_list",function(){
				var log_no = $(this).next().val();

				$.ajax({
					url:"deleteToDoLog.giv",
					type:"post",
					data:{"log_no":log_no},
					success:function(data){
						$(this).remove();
						updateToDoLog();
					}
				});
				
			})
			
			
			/* <li class="todo-list-item">
			
				<div class="checkbox">
					<input type="checkbox" class="checkboxs" />
						<label for="checkbox-1">data.todolog[i].log_detail</label>
						
				</div>
				<div class="pull-right action-buttons"><a href="#" class="trash"><em class="fa fa-trash"></em></a></div>
			</li>
			<input type="hidden"  value='+data.todolog[i].log_no+'>*/
			function updateToDoLog(){
				$.ajax({
					url:"selectToDoLog.giv",
					type:"post",
					data:{"admin_id":$("#admin_id").text()},
					success:function(data){
						$("#todo_list").empty();
						for(var i=0;i<data.todolog.length;i++){
							$("#todo_list").append('<li class="todo-list-item todo_list"><div class="checkbox"><input type="checkbox" class="checkboxs" /><label for="checkbox-1">'+data.todolog[i].log_detail+'</label></div><div class="pull-right action-buttons"><a href="#" class="trash"><em class="fa fa-trash"></em></a></div></li><input type="hidden"  value='+data.todolog[i].log_no+'>');
						}						
					}
				});
				
			}
			
			 setInterval(updateToDoLog,5000); 
			 setInterval(updateMsg(),3000); 
			 
					 /* <div class="article border-bottom">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-2 col-md-2 date">
							<div class="large">날짜 일 자르기</div>
							<div class="text-muted">날짜 월 자르기</div>
						</div>
						<div class="col-xs-10 col-md-10">
							<h4><a href="#">제목</a></h4>
							<p>내용</p>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div> */
			 function updateNoticeLog(){
				var length=4;
					$.ajax({
						url:"selectNoticeLog.giv",
						type:"post",
						
						success:function(data){
							$("#notice_list").empty();
							if(data.notice.length > length){
							for(var i=0;i<4;i++){
								var notice = data.notice[i].split("-");
								$("#notice_list").append('<div class="article border-bottom"><div class="col-xs-12"><div class="row"><div class="col-xs-2 col-md-2 date"><div class="large">'+notice[3]+'</div><div class="text-muted">'+notice[2]+'</div></div><div class="col-xs-10 col-md-10"><h4><a href="#">'+notice[0]+'</a></h4><p>'+notice[1]+'</p></div></div></div><div class="clear"></div></div>');
							}	
							}else{
								for(var i=0;i<data.notice.length;i++){
									var notice = data.notice[i].split("-");
									$("#notice_list").append('<div class="article border-bottom"><div class="col-xs-12"><div class="row"><div class="col-xs-2 col-md-2 date"><div class="large">'+notice[3]+'</div><div class="text-muted">'+notice[2]+'</div></div><div class="col-xs-10 col-md-10"><h4><a href="#">'+notice[0]+'</a></h4><p>'+notice[1]+'</p></div></div></div><div class="clear"></div></div>');
								}	
								
							}
						}
					});
					
				}
			
			 setInterval(updateNoticeLog,5000); 


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
