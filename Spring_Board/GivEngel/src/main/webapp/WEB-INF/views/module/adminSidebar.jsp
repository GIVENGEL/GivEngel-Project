<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminMode.giv"><span>GivEngel</span>Admin</a>
				<ul class="nav navbar-top-links navbar-right">
					<li id="msgDropBtn" class="dropdown"><a id="myMsgCheck" class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <em class="fa fa-envelope"></em><span
							class="label label-danger" id="msgcount">${msgCnt}</span>
					</a>
						<ul id="msgDrop" class="dropdown-menu dropdown-messages">
							
							<c:if test="${msgCnt >3 }">
							<li class="divider"></li>
							<c:set var="i" value="0" />
							<c:forEach items="${myMsg }" var="msgVO">
							<c:if test="${i <3 }">
							<li>
								<div class="all-button">
									<a href="adminWidgets.giv"> <em class="fa fa-inbox"></em> <strong>${msgVO.msg_from }</strong>
									님으로 부터 메시지가 왔습니다!
									</a>
									<small>${msgVO.msg_date }</small>
								</div>
							</li>
							<li class="divider"></li>
							<c:set var="i" value="${i+1 }" />
							</c:if>
							</c:forEach>
							</c:if>
							
							
							
							<c:if test="${msgCnt <=3 }">
							<li class="divider"></li>
							<c:set var="i" value="0" />
							<c:forEach items="${myMsg }" var="msgVO">
							<li>
								<div class="all-button">
									<a href="adminWidgets.giv"> <em class="fa fa-inbox"></em> <strong>${msgVO.msg_from }</strong>
									님으로 부터 메시지가 왔습니다!
									</a>
									<small>${msgVO.msg_date }</small>
								</div>
							</li>
							<li class="divider"></li>
							</c:forEach>
							</c:if>
							
							<li>
								<div class="all-button">
									<a href="adminWidgets.giv"> <em class="fa fa-inbox"></em> <strong>All
											Messages</strong>
									</a>
								</div>
							</li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <em class="fa fa-bell"></em><span
							class="label label-info">${msgCnt+todayUserCnt+adminCnt }</span>
					</a>
						<ul class="dropdown-menu dropdown-alerts">
							<li><a href="adminWidgets.giv">
									<div>
										<em class="fa fa-envelope"></em> ${msgCnt } 개의 메시지가 오늘 도착했습니다! <span
											class="pull-right text-muted small">Latest Message : ${msgVO.msg_date }</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="adminUserAccount.giv">
									<div>
										<em class="fa fa-heart"></em> 오늘 가입 유저 : ${todayUserCnt }  <span
											class="pull-right text-muted small">4 mins ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="adminAccount.giv">
									<div>
										<em class="fa fa-user"></em> 개발 동료들 : ${adminCnt }  명 <span
											class="pull-right text-muted small">마지막 가입일자 : </span>
									</div>
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>

</body>

</html>