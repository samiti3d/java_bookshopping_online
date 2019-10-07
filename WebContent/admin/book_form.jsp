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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css">
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
			<div class="col-md-5">
				<c:if test="${book != null }">
					<h2>Edit Book</h2>
					<form id="book_form"  action="update_book" method="post"  enctype="multipart/form-data">
						<input type="hidden" name="bookId" value="${book.bookId }" />
				</c:if>
				<c:if test="${book == null }">
					<h2>Create New Book</h2>
					<form id="book_form"  class="summernote" action="create_book" method="post"  enctype="multipart/form-data">
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
					<textarea name="description"  id="my-summernote">${book.description}</textarea>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">ISBN</label> 
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bs4-summernote@0.8.10/dist/summernote-bs4.min.js"></script>
	<script>
        $(document).ready(function() {
            $('#my-summernote').summernote({
                height: 300,   //set editable area's height
            });
        });
    </script> 

	<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
		type="text/javascript"></script>
	<script src="../js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="../js/admin.js"></script>
<!-- 	<script>
		$(document).ready(function(){
			$('#my-summernote').summernote({
				  minHeight: 200,
				  placeholder: 'Write here ...',
				  focus: false,
				  airMode: false,
				  fontNames: ['Roboto', 'Calibri', 'Times New Roman', 'Arial'],
				  fontNamesIgnoreCheck: ['Roboto', 'Calibri'],
				  dialogsInBody: true,
				  dialogsFade: true,
				  disableDragAndDrop: false,
				  toolbar: [
				    // [groupName, [list of button]]
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['para', ['style', 'ul', 'ol', 'paragraph']],
				    ['fontsize', ['fontsize']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['height', ['height']],
				    ['misc', ['undo', 'redo', 'print', 'help', 'fullscreen']]
				  ],
				  popover: {
				    air: [
				      ['color', ['color']],
				      ['font', ['bold', 'underline', 'clear']]
				    ]
				  },
				  print: {
				    //'stylesheetUrl': 'url_of_stylesheet_for_printing'
				  }
				});
				$('#my-summernote2').summernote({airMode: true,placeholder:'Try the airmode'});		});
	</script> -->
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