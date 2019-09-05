<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrative Dashboard</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="../css/admin.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="container">
		<h2>Administrative Dashboard</h2>
		<p>
			Welcome Admin :) | <a href="logout">Logout</a>
		</p>
		<hr />
		<jsp:directive.include file="navigation.jsp" />
		<hr />
		<jsp:directive.include file="quick-action.jsp" />
		<div class="row">
			<div class="col-md-12">
				<h2>Recent Sales</h2>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
				<h2>Recent Reviews</h2>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12">
				<h2>Statistics</h2>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
		crossorigin="anonymous">
		
	</script>
	<script src="../js/admin.js">
		
	</script>
</body>
</html>