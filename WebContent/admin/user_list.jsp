<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Lists - Admin Dashboard</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div class="container">
		<h2>Administrative Dashboard - List Users</h2>
		<p>
			Welcome Admin :) | <a href="logout">Logout</a>
		</p>
		<hr />
		<jsp:directive.include file="navigation.jsp" />
		<hr />
		
		<h2><a href="user_form.jsp">[  Create New User ]</a></h2>
		<c:if test="${ status != null }">
			<p>${ status}</p>
		</c:if>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">user id</th>
		      <th scope="col">full name</th>
		      <th scope="col">email</th>
		      <th scope="col">edit</th>
		    </tr>
		  </thead>
		  <tbody>
				<c:forEach var="user" items="${listUsers }" varStatus="status">
					<tr>
						<td>${status.index }</td>
						<td>${user.userId }</td>
						<td>${user.fullName }</td>
						<td>${user.email }</td>
						<td>
							<a href="edit_user?id=${user.userId }">Edit</a> |
							<a href="delete_user?id=${user.userId }" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
		crossorigin="anonymous">
		
	</script>
</body>
</html>