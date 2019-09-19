<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrative Dashboard - add user</title>

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
		<div class="row">
		<c:if test="${status != null }">${status }</c:if>
		</div>
		<div class="row">
			<div class="col-md-12">
				<c:if  test="${user != null }">
					<h2>Edit User</h2>
					<form id="user_form" action="update_user" method="post" >	
					<input type="hidden" name="userId" value="${user.userId}" />
				</c:if>
				<c:if  test="${user == null }">
					<h2>Create User</h2>
					<form  id="user_form" action="create_user" method="post" >
				</c:if> 
					<div class="form-group">
						<label for="exampleInputEmail1">Full Name</label> <input
							type="text" name="fullname" class="form-control" id="fullname"
							aria-describedby="emailHelp" placeholder="Full Name"  value="${user.fullName }">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" name="email" class="form-control" id="email"
							aria-describedby="emailHelp" placeholder="Enter Email"  value="${user.email }"> <small
							id="emailHelp" class="form-text text-muted"  >We'll never
							share your email with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password"  name="password" class="form-control"  id="password"
							placeholder="Password" value="${user.password }">
					</div>
				
					<button type="submit" class="btn btn-primary">Submit</button>
					<button type="button" class="btn btn" onClick="javascript:history.go(-1)">Cancel</button>
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
		crossorigin="anonymous">
	</script> 
   <script  src="../js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="../js/admin.js">
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#user_form").validate({
					rules: {
						fullname: "required",
						password: "required",
						email: {
							required: true,
							email: true
						}
					},
					messages: {
						fullname: "Please enter your firstname",
						password: "Please enter password",
						email: "Please enter email"
					}
				});
			}); 
	</script>
</body>
</html>