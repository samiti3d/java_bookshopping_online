<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrative Dashboard - add user</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Date Picker -->
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<h2>Administrative Dashboard</h2>
		<jsp:directive.include file="welcome_logout.jsp" />
		<hr />
		<jsp:directive.include file="navigation.jsp" />
		<hr />
		<div class="row">
			<c:if test="${status != null }">${status }</c:if>
		</div>
		<div class="row">
			<div class="col-md-12">
				<c:if test="${book != null }">
					<h2>Edit Book</h2>
					<form id="book_form"  action="update_book" method="post"  enctype="multipart/form-data">
						<input type="hidden" name="bookId" value="${book.bookId }" />
				</c:if>
				<c:if test="${book == null }">
					<h2>Create New Book</h2>
					<form id="book_form"  action="create_book" method="post"  enctype="multipart/form-data">
				</c:if>
				<div class="form-group">
					<label for="bookTitle">Title</label> 
					<input type="text"
						name="title" class="form-control" id="title"
						aria-describedby="emailHelp" placeholder="Full Name"
						value="${book.title }" value="${book.title }">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Author</label> <input type="text"
						name="author" class="form-control" id="author"
						aria-describedby="emailHelp" placeholder="author"
						value="${book.author }">
				</div>
				<div class="form-group">
					<label for="description">Description</label>
					<textarea class="form-control" rows="5" name="description"  id="description"
						placeholder="description" >${book.description}</textarea>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Isbn</label> 
					<input type="text"
						name="isbn" class="form-control" id="isbn" placeholder="isbn"
						value="${book.isbn }">
				</div>
				<div class="form-group">
					<div class="main-img-preview">
						<img  id="thumbnail" alt="Image Preview" class="thumbnail img-preview"
							title="Preview Logo"  style="width: 50px;" src="data:image/jpg;base64,${book.base64Image }">
					</div>
					<div class="input-group">
						<label for="exampleInputPassword1">Image</label> 
						<input type="file"
							name="bookImage" class="form-control" id="bookImage"
							value="${book.image }">
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Price</label> <input type="text"
						name="price" class="form-control" id="price" placeholder="price"
						value="${book.price}">
				</div>
				<div class="form-group">
					<label for="datePicker">Date</label> <input id="publishDate"
						type="text" name="publishDate" class="form-control"  value="<fmt:formatDate pattern='MM/DD/YYYY'  value='${book.publishedDate }'/>">
					<div class="input-group-addon">
						<span class="glyphicon glyphicon-th"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="category">Select list:</label> 
					<select class="form-control"  id="category" name="categoryId">
					<c:if test="${book  == null }">
						<c:forEach items="${ categories }" var="category">
							<option value="" selected></option>
							<option value="${category.categoryId }">${ category.name }
							</option>
						</c:forEach>
					</c:if>
				
					<c:if test="${book != null }">
							<c:forEach items="${ listCategory }" var="category">
								<c:if test="${category.categoryId eq book.category.categoryId }">
										<option value="${category.categoryId }" selected>
								</c:if>
								<c:if test="${category.categoryId ne book.category.categoryId }">
										<option value="${category.categoryId }">
								</c:if>${ category.name }</option>
							</c:forEach>
					</c:if>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="button" class="btn btn"
					onClick="javascript:history.go(-1)">Cancel</button>
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
		crossorigin="anonymous">
		
	</script>
	<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
		type="text/javascript"></script>
	<script src="../js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="../js/admin.js"></script>

	<script type="text/javascript">
		$('#publishDate').datepicker({
			uiLibrary : 'bootstrap4'
		});
		
		$('#bookImage').change(function(){
			showImageThumbnail(this);
		});
		 
		$(document).ready(function() {
			$("#book_form").validate({
				rules : {
					title: "required",
					author: "required",
					description: "required",
					isbn: "required",
					<c:if test="${book == null}">
					bookImage: "required",
					</c:if>
					publishDate: "required",
					price: "required",
					description: "required",
					categoryId: "required",
				},
				messages : {
					title: "Please enter title",
					author : "Please enter author",
					description: "Please fill the description",
					isbn: "Please enter isbn",
					bookImage: "Please choose image of book",
					publishDate: "Please enter publish date",
					price: "Please enter the price",
					categoryId: "Please select category."
				}
			});
		});
		
		function showImageThumbnail(fileInput){
			var file = fileInput.files[0];
			console.log(file);
			var reader = new FileReader();
			reader.onload = function(e){
				$('#thumbnail').attr('src', e.target.result);
			};
		    reader.readAsDataURL(file);
		}
	</script>
</body>
</html>