<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino UI Elements</title>
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
<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<jsp:include page="module/adminSidebar.jsp" />
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive"
					alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">Adminname</div>
				<div class="profile-usertitle-status">
					<span class="indicator label-success"></span>Online
				</div>
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
			<li><a href="adminMode.giv"><em class="fa fa-dashboard">&nbsp;</em>
					Dashboard</a></li>
			<li><a href="adminWidgets.giv"><em class="fa fa-calendar">&nbsp;</em>
					Widgets</a></li>
			<li><a href="adminCharts.giv"><em class="fa fa-bar-chart">&nbsp;</em>
					Charts</a></li>
			<li class="active"><a href="adminElements.giv"><em
					class="fa fa-toggle-off">&nbsp;</em> UI Elements</a></li>
			<li><a href="adminPanels.giv"><em class="fa fa-clone">&nbsp;</em>
					Alerts &amp; Panels</a></li>
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
					<em class="fa fa-navicon">&nbsp;</em> Multilevel <span
					data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em
						class="fa fa-plus"></em></span>
			</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 1
					</a></li>
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 2
					</a></li>
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 3
					</a></li>
				</ul></li>
			<li><a href="index.giv"><em class="fa fa-power-off">&nbsp;</em>
					Logout</a></li>
		</ul>
	</div>
	<!--/.sidebar-->

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
				<h1 class="page-header">상품 등록</h1>
			</div>
		</div>
		<!--/.row-->


		<div class="row">
			<div class="col-lg-12">

				<h2>최근 등록된 상품</h2>
			</div>
			
			<div class="col-md-3">
				<div class="panel panel-success">
					<div class="panel-heading">[상품명]</div>
					<div class="panel-body">
						<p>[상품 디테일]</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-success">
					<div class="panel-heading">[상품명]</div>
					<div class="panel-body">
						<p>[상품 디테일]</p>
					</div>
				</div>
			</div><div class="col-md-3">
				<div class="panel panel-success">
					<div class="panel-heading">[상품명]</div>
					<div class="panel-body">
						<p>[상품 디테일]</p>
					</div>
				</div>
			</div><div class="col-md-3">
				<div class="panel panel-success">
					<div class="panel-heading">[상품명]</div>
					<div class="panel-body">
						<p>[상품 디테일]</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->


		<div class="panel panel-default">
			<div class="panel-heading">Forms</div>
			<div class="panel-body">
				<div class="col-md-6">
					<form role="form">
						<div class="form-group">
							<label>Text Input</label> <input class="form-control"
								placeholder="Placeholder">
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password"
								class="form-control">
						</div>
						<div class="form-group checkbox">
							<label> <input type="checkbox">Remember me
							</label>
						</div>
						<div class="form-group">
							<label>File input</label> <input type="file">
							<p class="help-block">Example block-level help text here.</p>
						</div>
						<div class="form-group">
							<label>Text area</label>
							<textarea class="form-control" rows="3"></textarea>
						</div>
						<label>Validation</label>
						<div class="form-group has-success">
							<input class="form-control" placeholder="Success">
						</div>
						<div class="form-group has-warning">
							<input class="form-control" placeholder="Warning">
						</div>
						<div class="form-group has-error">
							<input class="form-control" placeholder="Error">
						</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Checkboxes</label>
						<div class="checkbox">
							<label> <input type="checkbox" value="">Checkbox
								1
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="">Checkbox
								2
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="">Checkbox
								3
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="">Checkbox
								4
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>Radio Buttons</label>
						<div class="radio">
							<label> <input type="radio" name="optionsRadios"
								id="optionsRadios1" value="option1" checked>Radio Button
								1
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="optionsRadios"
								id="optionsRadios2" value="option2">Radio Button 2
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="optionsRadios"
								id="optionsRadios3" value="option3">Radio Button 3
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="optionsRadios"
								id="optionsRadios3" value="option3">Radio Button 4
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>Selects</label> <select class="form-control">
							<option>Option 1</option>
							<option>Option 2</option>
							<option>Option 3</option>
							<option>Option 4</option>
						</select>
					</div>
					<div class="form-group">
						<label>Multiple Selects</label> <select multiple
							class="form-control">
							<option>Option 1</option>
							<option>Option 2</option>
							<option>Option 3</option>
							<option>Option 4</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">Submit
						Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
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

</body>
</html>
