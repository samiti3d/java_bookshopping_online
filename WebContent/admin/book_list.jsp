<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Lists - Admin Dashboard</title>
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
		<jsp:directive.include file="welcome_logout.jsp" />
		<hr />
		<jsp:directive.include file="navigation.jsp" />
		<hr />
		
		<h2><a href="book_form.jsp">[  Create New Book ]</a></h2>
		<c:if test="${ status != null }">
			<p>${ status}</p>
		</c:if>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">ID</th>
		      <th scope="col">Image</th>
		      <th scope="col">Title</th>
		      <th scope="col">Author</th>
		      <th scope="col">Category</th>
		      <th scope="col">Price</th>
		      <th scope="col">ISBN</th>
		      <th scope="col">Last Updated</th>
		      <th scope="col">Actions</th>
		    </tr>
		  </thead>
		  <tbody>
				<c:forEach var="book" items="${listBooks }" varStatus="status">
					<tr>
						<td>${status.index }</td>
						<td>${book.bookId }</td>
						<td>
							<img src="data:image/jpg;base64, ${book.base64Image }" />
						</td>
						<td>${book.title }</td>
						<td>${book.author}</td>
						<td>${book.category.name }</td>
						<td>${book.price }</td>
						<td>${book.isbn }</td>
						<td>${book.lastUpdateTime }</td>
						<td>
							<a href="edit_user?id=${user.userId }">Edit</a> |
							<a href="delete_user?id=${user.userId }" 
							onclick="if(${user.userId}==38){ alert('Sorry, You cannot delete Admin ID')
							return false }else{ return confirm('Confirm again to delete this user');}">Delete</a>
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