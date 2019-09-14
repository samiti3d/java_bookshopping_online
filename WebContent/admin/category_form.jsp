<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrative Dashboard - Add Category</title>

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
				<c:if  test="${category != null }">
					<h2>Edit Category</h2>
					<form action="update_category" method="post" onsubmit="return validateFormInput()">	
					<input type="hidden" name="categoryId" value="${category.categoryId}" />
				</c:if>
				<c:if  test="${category == null }">
					<h2>Create Category</h2>
					<form action="create_category" method="post" onsubmit="return validateFormInput()">
				</c:if> 
					<div class="form-group" class="mt-5">
						<label for="exampleInputEmail1">Category</label> 
						<input
							type="text" name="category" class="form-control" id="category"
							aria-describedby="categoryHelp" placeholder="Category Name"  value="${category.name }">
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
				var fieldCategory= document.getElementById("category");				
				if(fieldCategory.value.length == 0 ){
					alert("Category Name cannot be empty.");
					fieldCategory.focus();
					return false;
				}	
				return true;
		}
	</script>
</body>
</html>