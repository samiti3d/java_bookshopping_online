<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Evergreen Books - Online Store</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="css/shopping.css" type="text/css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style>
body {
	padding-top: 56px;
}
</style>
</head>
<body>

	<jsp:directive.include file="header/navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-ms-8">
				<form class="form-inline justify-content-center" action="search"
					method="GET">
					<div class="form-group form-group-lg mx-lg-12 my-3 text-center">
						<label for="inputSearch" class="sr-only">search</label> <input
							type="text" class="form-control" name="keyword" id="textSearch"
							placeholder="Searching Items" size="40">
					</div>
					<button size="5" type="submit" class="btn btn-primary">Search</button>
				</form>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<div class="container">
		<ul class="list-inline d-flex justify-content-center mb-5">
			<c:forEach var="category" items="${listCategory }" varStatus="status">
				<li class="list-inline-item"><a
					href="view_category?id=${category.categoryId }"> <font
						size="+1"><b><c:out value="${category.name }" /> </b></font>
				</a> <c:if test="${ not status.last }">
							&nbsp; | &nbsp; 
						</c:if></li>
			</c:forEach>
		</ul>
		<h3 class="h3">New Arrivals</h3>
		<div class="row">

			<c:forEach items="${listNewBooks}" var="book">
				<div class="col-md-3 col-sm-6">
					<div class="product-grid3">
						<div class="product-image3">
							<a href="view_book?id=${book.bookId }"> 
							<img 
								class="pic-1"
								src="data:image/jpg;base64, ${book.base64Image}"> 
							<img
								class="pic-2"
								src="http://bestjquery.com/tutorial/product-grid/demo4/images/img-2.jpg">
							</a>
							<ul class="social">
								<li><a href="#"><i class="fa fa-shopping-bag"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
							<span class="product-new-label">New</span>
						</div>
						<div class="product-content">
							<h3 class="title">
								<a href="#">${book.title }</a>
							</h3>
							<div class="price">
								$63.50 <span>${book.price }</span>
							</div>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star disable"></li>
								<li class="fa fa-star disable"></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!--  end row -->
	</div>
	<hr>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>