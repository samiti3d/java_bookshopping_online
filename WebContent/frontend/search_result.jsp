<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

.bloc_left_price {
	color: #c01508;
	text-align: center;
	font-weight: bold;
	font-size: 150%;
}

.category_block li:hover {
	background-color: #007bff;
}

.category_block li:hover a {
	color: #ffffff;
}

.category_block li a {
	color: #343a40;
}

.add_to_cart_block .price {
	color: #c01508;
	text-align: center;
	font-weight: bold;
	font-size: 200%;
	margin-bottom: 0;
}

.add_to_cart_block .price_discounted {
	color: #343a40;
	text-align: center;
	text-decoration: line-through;
	font-size: 140%;
}

.product_rassurance {
	padding: 10px;
	margin-top: 15px;
	background: #ffffff;
	border: 1px solid #6c757d;
	color: #6c757d;
}

.product_rassurance .list-inline {
	margin-bottom: 0;
	text-transform: uppercase;
	text-align: center;
}

.product_rassurance .list-inline li:hover {
	color: #343a40;
}

.reviews_product .fa-star {
	color: gold;
}

.pagination {
	margin-top: 20px;
}

footer {
	background: #343a40;
	padding: 40px;
}

footer a {
	color: #f8f9fa !important
}
</style>
</head>
<body>

	<jsp:directive.include file="header/navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-ms-8">
				<form class="form-inline justify-content-center" action="search" method="Get">
					<div class="form-group form-group-lg mx-lg-12 my-3 text-center">
						<label for="inputSearch" class="sr-only">Search</label> <input
							type="text" name="keyword" class="form-control" id="textSearch"
							placeholder="Searching Items" size="40">
					</div>
					<button size="5" type="submit" class="btn btn-primary">Search</button>
				</form>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<div class="container">
		<h3 class="h3">Search Result</h3>

		<div class="row">
			<c:if test="${status != null }">
				<c:out value="${status }" />
			</c:if>

		</div>
		<!--  end row -->
	</div>
	<!--  end container -->
	<hr>
	<!-- Search Content -->
	<div class="container">
		<div class="row">
			<div class="col-12 col-sm-3">
				<div class="card bg-light mb-3">
					<div class="card-header bg-primary text-white text-uppercase">
						<i class="fa fa-list"></i> Categories
					</div>
					<ul class="list-group category_block">
						<li class="list-group-item"><a href="category.html">Cras
								justo odio</a></li>
						<li class="list-group-item"><a href="category.html">Dapibus
								ac facilisis in</a></li>
						<li class="list-group-item"><a href="category.html">Morbi
								leo risus</a></li>
						<li class="list-group-item"><a href="category.html">Porta
								ac consectetur ac</a></li>
						<li class="list-group-item"><a href="category.html">Vestibulum
								at eros</a></li>
					</ul>
				</div>
				<div class="card bg-light mb-3">
					<div class="card-header bg-success text-white text-uppercase">Last
						product</div>
					<div class="card-body">
						<img class="img-fluid"
							src="https://dummyimage.com/600x400/55595c/fff" />
						<h5 class="card-title">Product title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<p class="bloc_left_price">99.00 $</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<c:if test="${fn:length(result) == 0 }">
						<h4>No Result for  <span style="color:red">"${keyword }"</span> - Please check another keyword.</h4>
					</c:if>
					<c:if test="${fn:length(result) > 0 }">
						<c:forEach items="${result }"  var="book" >
							<div class="col-12 col-md-6 col-lg-4" >
								<div class="card">
									<img class="card-img-top"
										src="data:image/jpg;base64,${book.base64Image}"
										alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title">
											<a href="view_book?id=${book.bookId }" title="View Product">${book.title }</a>
										</h4>
										<p class="card-text">${fn:substring(book.description,0,35) }...</p>
										<div class="row">
											<div class="col-md-12">
												<p class="btn btn-danger btn-block">${book.price } $</p>
											</div>
											<div class="col-md-12">
												<a href="#" class="btn btn-success btn-block">Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					<div class="col-12">
						<nav aria-label="...">
							<ul class="pagination">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2
										<span class="sr-only">(current)</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
					</div>
					</c:if>
					<!-- End Pagination -->
					
				</div>
			</div>

		</div>
	</div>
	<!--  End Search Content -->

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