<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lumino - Login</title>
	<link href="${path}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="${path}/resources/css/admin/datepicker3.css" rel="stylesheet">
	<link href="${path}/resources/css/admin/styles.css" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div class="row">
	
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
		<h1>GIVENGEL DEV.LOGIN</h1>
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Log in</div>
				<div class="panel-body">
					<form method="post" action="adminLoginAction.giv"  role="login">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="dev-id" name="admin_id" type="text" autofocus="">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="admin_pw" type="password" value="">
							</div>
							<button type="submit" name="go"
											class="btn btn-primary float-right">Sign in</button>
							</fieldset>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	
	

<script src="${path}/resources/js/admin/jquery-1.11.1.min.js"></script>
	<script src="${path}/resources/js/admin/bootstrap.min.js"></script>
</body>
</html>
