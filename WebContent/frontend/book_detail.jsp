<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

    <title>eCommerce Product Detail</title>
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
		/*****************globals*************/
	body {
	  font-family: 'open sans';
	  overflow-x: hidden; }
	
	img {
	  max-width: 100%; }
	
	.preview {
	  display: -webkit-box;
	  display: -webkit-flex;
	  display: -ms-flexbox;
	  display: flex;
	  -webkit-box-orient: vertical;
	  -webkit-box-direction: normal;
	  -webkit-flex-direction: column;
	      -ms-flex-direction: column;
	          flex-direction: column; }
	  @media screen and (max-width: 996px) {
	    .preview {
	      margin-bottom: 20px; } }
	
	.preview-pic {
	  -webkit-box-flex: 1;
	  -webkit-flex-grow: 1;
	      -ms-flex-positive: 1;
	          flex-grow: 1; }
	
	.preview-thumbnail.nav-tabs {
	  border: none;
	  margin-top: 15px; }
	  .preview-thumbnail.nav-tabs li {
	    width: 18%;
	    margin-right: 2.5%; }
	    .preview-thumbnail.nav-tabs li img {
	      max-width: 100%;
	      display: block;
	      height:80px;
	        
	    }
	    .preview-thumbnail.nav-tabs li a {
	      padding: 0;
	      margin: 0; }
	    .preview-thumbnail.nav-tabs li:last-of-type {
	      margin-right: 0; }
	
	.tab-content {
	  overflow: hidden; }
	  .tab-content img {
	    width: 100%;
	    -webkit-animation-name: opacity;
	            animation-name: opacity;
	    -webkit-animation-duration: .3s;
	            animation-duration: .3s; }
	
	.card {
	  margin-top: 50px;
	  background: #eee;
	  padding: 3em;
	  line-height: 1.5em; }
	
	@media screen and (min-width: 997px) {
	  .wrapper {
	    display: -webkit-box;
	    display: -webkit-flex;
	    display: -ms-flexbox;
	    display: flex; } }
	
	.details {
	  display: -webkit-box;
	  display: -webkit-flex;
	  display: -ms-flexbox;
	  display: flex;
	  -webkit-box-orient: vertical;
	  -webkit-box-direction: normal;
	  -webkit-flex-direction: column;
	      -ms-flex-direction: column;
	          flex-direction: column; }
	
	.colors {
	  -webkit-box-flex: 1;
	  -webkit-flex-grow: 1;
	      -ms-flex-positive: 1;
	          flex-grow: 1; }
	
	.product-title, .price, .sizes, .colors {
	  text-transform: UPPERCASE;
	  font-weight: bold; }
	
	.checked, .price span {
	  color: #ff9f1a; }
	
	.product-title, .rating, .product-description, .price, .vote, .sizes {
	  margin-bottom: 15px; }
	
	.product-title {
	  margin-top: 0; }
	
	.size {
	  margin-right: 10px; }
	  .size:first-of-type {
	    margin-left: 40px; }
	
	.color {
	  display: inline-block;
	  vertical-align: middle;
	  margin-right: 10px;
	  height: 2em;
	  width: 2em;
	  border-radius: 2px; }
	  .color:first-of-type {
	    margin-left: 20px; }
	
	.add-to-cart, .like {
	  background: #ff9f1a;
	  padding: 1.2em 1.5em;
	  border: none;
	  text-transform: UPPERCASE;
	  font-weight: bold;
	  color: #fff;
	  -webkit-transition: background .3s ease;
	          transition: background .3s ease; }
	  .add-to-cart:hover, .like:hover {
	    background: #b36800;
	    color: #fff; }
	
	.not-available {
	  text-align: center;
	  line-height: 2em; }
	  .not-available:before {
	    font-family: fontawesome;
	    content: "\f00d";
	    color: #fff; }
	
	.orange {
	  background: #ff9f1a; }
	
	.green {
	  background: #85ad00; }
	
	.blue {
	  background: #0076ad; }
	
	.tooltip-inner {
	  padding: 1.3em; }
	
	@-webkit-keyframes opacity {
	  0% {
	    opacity: 0;
	    -webkit-transform: scale(1.2);
	            transform: scale(1.2); }
	  100% {
	    opacity: 1;
	    -webkit-transform: scale(1);
	            transform: scale(1); } }
	
	@keyframes opacity {
	  0% {
	    opacity: 0;
	    -webkit-transform: scale(1.2);
	            transform: scale(1.2); }
	  100% {
	    opacity: 1;
	    -webkit-transform: scale(1);
	            transform: scale(1); } }
	@media (max-width:576px){
	    .preview-thumbnail.nav-tabs li img{
	        height:50px;
	    }
	    .preview-thumbnail.nav-tabs li{
	        margin-right:1.5%;
	    }
	}
	</style>
	<base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />

  </head>

  <body>
	<jsp:directive.include file="header/navigation.jsp" />
	<div class="container">
	<c:if test="${status != null }"><c:out value="${status }"/></c:if>
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-3 col-xs-12">
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img class="pop"  src="data:image/jpg; base64,${book.base64Image }"  /></div>
						  <div class="tab-pane" id="pic-2"><img class="pop" src="https://mahirfloralevents.com/wp-content/uploads/2018/10/Scentsational.png" /></div>
						  <div class="tab-pane" id="pic-3"><img class="pop" src="https://mahirfloralevents.com/wp-content/uploads/2018/10/Glorious-Gloriosa.jpg" /></div>
						  <div class="tab-pane" id="pic-4"><img class="pop" src="https://mahirfloralevents.com/wp-content/uploads/2018/10/DSC4331.jpg" /></div>
						  <div class="tab-pane" id="pic-5"><img class="pop" src="https://mahirfloralevents.com/wp-content/uploads/2018/10/pp.jpg" /></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="data:image/jpg;base64,${book.base64Image }" /></a></li>
						  <li><a data-target="#pic-2" data-toggle="tab"><img src="https://mahirfloralevents.com/wp-content/uploads/2018/10/Scentsational.png" /></a></li>
						  <li><a data-target="#pic-3" data-toggle="tab"><img src="https://mahirfloralevents.com/wp-content/uploads/2018/10/Glorious-Gloriosa.jpg" /></a></li>
						  <li><a data-target="#pic-4" data-toggle="tab"><img src="https://mahirfloralevents.com/wp-content/uploads/2018/10/DSC4331.jpg" /></a></li>
						  <li><a data-target="#pic-5" data-toggle="tab"><img src="https://mahirfloralevents.com/wp-content/uploads/2018/10/pp.jpg" /></a></li>
						</ul>
						
					</div>
					<div class="details col-md-7 offset-md-1">
						<h3 class="product-title">${book.title }</h3>
						<h5>by ${book.author}</h5>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<p class="product-description">
						${fn:substring(book.description, 0, 100) }...
						</p>
						<h4 class="price">current price: <span>$</span>${book.price }</h4>
						<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<h5 class="sizes">sizes:
							<span class="size" data-toggle="tooltip" title="small">s</span>
							<span class="size" data-toggle="tooltip" title="medium">m</span>
							<span class="size" data-toggle="tooltip" title="large">l</span>
							<span class="size" data-toggle="tooltip" title="xtra large">xl</span>
						</h5>
						<h5 class="colors">colors:
							<span class="color orange not-available" data-toggle="tooltip" title="Not In store"></span>
							<span class="color green"></span>
							<span class="color blue"></span>
						</h5>
						<div class="action">
							<button class="add-to-cart btn btn-default" type="button">add to cart</button>
							<button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<h3 class="py-3">Book Description</h3>
				<p>${book.description }</p>
			</div>
			<hr/>
			<div class="col-md-12">
				<h3 class="py-3">Reviews</h3>
				<p>....</p>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">              
      <div class="modal-body">
      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <img src="" class="imagepreview" style="width: 100%;" >
      </div>
    </div>
  </div>
</div>
	<script>
	$(function() {
		$('.pop').on('click', function() {
			$('.imagepreview').attr('src', $(this).attr('src'));
			$('#imagemodal').modal('show');   
		});		
	});
	</script>
  </body>
 
</html>