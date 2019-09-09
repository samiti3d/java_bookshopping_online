<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="col-md-12">
				<h2>Add User</h2>
				<form action="create_user" method="post" onsubmit="return validateFormInput()">
					<div class="form-group">
						<label for="exampleInputEmail1">Full Name</label> <input
							type="text" name="fullname" class="form-control" id="fullname"
							aria-describedby="emailHelp" placeholder="Full Name">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" name="email" class="form-control" id="email"
							aria-describedby="emailHelp" placeholder="Enter Email"> <small
							id="emailHelp" class="form-text text-muted">We'll never
							share your email with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password"  name="password" class="form-control"  id="password"
							placeholder="Password">
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
	<script src="../js/admin.js">
	</script>
	<script type="text/javascript">
		function validateFormInput(){
				var fieldEmail = document.getElementById("email");
				var fieldFullName = document.getElementById("fullname");
				var fieldPassword = document.getElementById("password");

				if(fieldEmail.value.length == 0 ){
					alert("Email is required");
					fieldEmail.focus();
					return false;
				}
				
				if(fieldFullName.value.length == 0 ){
					alert("Full Name is required");
					fieldFullName.focus();
					return false;
				}
				
				if(fieldPassword.value.length == 0 ){
					alert("Password is required");
					fieldPassword.focus();
					return false;
				}
				
				return true;
		}
	</script>
</body>
</html>