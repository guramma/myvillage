<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Sentir, Responsive admin and dashboard UI kits template">
<meta name="keywords" content="admin,bootstrap,template,responsive admin,dashboard template,web apps template">
<meta name="author" content="Ari Rusmanto, Isoh Design Studio, Warung Themes">

<link href="${contextPath}/resources/frontend/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/bootstrap/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet">
<link href="${contextPath}/resources/frontend/assets/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="${contextPath}/resources/frontend/assets/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="${contextPath}/resources/frontend/assets/plugins/owl-carousel/owl.theme.css" rel="stylesheet">
<link href="${contextPath}/resources/frontend/assets/plugins/owl-carousel/owl.transitions.css" rel="stylesheet">
<link href="${contextPath}/resources/frontend/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${contextPath}/resources/frontend/assets/css/style.css" rel="stylesheet">
<link href="${contextPath}/resources/frontend/assets/css/style-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/loader.css"/> 
<style>
.loader-block{position: fixed; left: 0; right: 0; top: 0; bottom: 0; z-index: 1000; width:100%; height: 100%; z-index: 2000; background: #000; opacity:0.8;}
.loader-block-inside{position: absolute; top: 50%; left: 50%; width:200px; height: 200px; margin: -100px 0 0 -100px; background-image: url("${contextPath}/resources/css/lightbox-ico-loading.gif"); background-repeat: no-repeat; background-position: center;}
</style>
</head>
<body class="tooltips no-padding">
<div class="top-navbar">
<div class="container">
<div class="logo">
	<a href="index.html"><img src="${contextPath}/resources/loginandregister/assets/img/logos/MV-Logo-White.png" alt="Logo" style="width: 130px;margin-top: 2px;"></a>
</div>
<div class="btn-toggle-nav" id="btn-toggle-nav"><i class="fa fa-bars"></i></div>
<ul class="menus">
	<li class="parent">
		<a href="#fakelink">Home</a>
		<ul class="sub-menus">
			<li class="sub-list"><a href="index.html">Default</a></li>
			
			<li class="sub-list"><a href="index-fancy-color.html">Fancy color navbar <span class="label label-danger">HOT</span></a></li>
			<li class="sub-list"><a href="index-static-nav.html">Static nav position</a></li>
			<li class="sub-list">
				<a href="#fakelink">Dark nav color <span class="badge badge-success">3</span></a>
				<ul class="subsub-menus">
					<li class="subsub-list"><a href="index-dark-nav-static-image.html">Static image header</a></li>
					<li class="subsub-list"><a href="index-dark-nav-image-slide.html">Image slide</a></li>
					<li class="subsub-list"><a href="index-dark-nav-content-slide.html">Content slide</a></li>
				</ul>
			</li>
			<li class="sub-list">
				<a href="#fakelink">Light nav color <span class="badge badge-warning">3</span></a>
				<ul class="subsub-menus">
					<li class="subsub-list"><a href="index-light-nav-static-image.html">Static image header</a></li>
					<li class="subsub-list"><a href="index-light-nav-image-slide.html">Image slide</a></li>
					<li class="subsub-list"><a href="index-light-nav-content-slide.html">Content slide</a></li>
				</ul>
			</li>
			<li class="sub-list">
				<a href="#fakelink">Transparent nav <span class="badge badge-info">3</span></a>
				<ul class="subsub-menus">
					<li class="subsub-list"><a href="index-trans-nav-static-image.html">Static image header</a></li>
					<li class="subsub-list"><a href="index.html">Image slide <span class="label label-primary">DEFAULT</span></a></li>
					<li class="subsub-list"><a href="index-trans-nav-content-slide.html">Content slide</a></li>
				</ul>
			</li>
			
			<li class="sub-list"><a href="index-background-color.html">Background color</a></li>
			<li class="sub-list">
				<a href="#fakelink">Templates <span class="label label-primary">PACKAGE</span></a>
				<ul class="subsub-menus">
					<li class="subsub-list"><a href="../../index.html" target="_blank">Sentir - Admin template</a></li>
					<li class="subsub-list"><a href="index-onepage.html">Sentir - One page</a></li>
					<li class="subsub-list"><a href="../comingsoon/index.html">Sentir - Coming soon</a></li>
				</ul>
			</li>
		</ul>
	</li>
	<li class="parent">
		<a href="#fakelink">Pages</a>
		<ul class="sub-menus">
			<li class="sub-list"><a href="about-us.html">About us</a></li>
			<li class="sub-list"><a href="full-width.html">Full width</a></li>
			<li class="sub-list"><a href="sidebar-left.html">Sidebar left</a></li>
			<li class="sub-list"><a href="sidebar-right.html">Sidebar right</a></li>
			<li class="sub-list"><a href="service.html">Services</a></li>
			<li class="sub-list"><a href="testimonial.html">Testimonial</a></li>
			<li class="sub-list"><a href="pricing-table.html">Pricing table</a></li>
			<li class="sub-list"><a href="blank.html">Blank page</a></li>
		</ul>
	</li>
	<li class="parent">
		<a href="shortcodes.html">Shortcodes</a>
	</li>
	<li class="parent">
		<a href="#fakelink">Portfolio</a>
		<ul class="sub-menus">
			<li class="sub-list"><a href="portfolio-4-column.html">4 columns</a></li>
			<li class="sub-list"><a href="portfolio-3-column.html">3 columns</a></li>
			<li class="sub-list"><a href="portfolio-single.html">Portfolio single</a></li>
		</ul>
	</li>
	<li class="parent">
		<a href="#fakelink">Blog</a>
		<ul class="sub-menus">
			<li class="sub-list"><a href="blog-list.html">Blog list</a></li>
			<li class="sub-list"><a href="blog-detail.html">Blog detail</a></li>
		</ul>
	</li>
	<li class="parent"><a href="contact.html">Contact</a></li>
</ul>
</div>
</div>
<jsp:doBody/>		

		
		
		
		
		<!-- BEGIN FOOTER -->
<footer>
<div class="container">
	<div class="row">
		<div class="col-sm-6 col-md-4">
			<h4>ABOUT SENTIR AGENCY</h4>
			<p>
			Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed 
			diam nonummy nibh euismod tincidunt ut laoreet dolore 
			magna aliquam erat volutpat. Ut wisi enim ad minim veniam, 
			quis nostrud exerci tation ullamcorper suscipit lobortis 
			</p>
			<p>
				<a href="#fakelink"><i data-toggle="tooltip" title="Facebook" class="fa fa-facebook icon-sm icon-rounded icon-social-footer icon-facebook"></i></a>
				<a href="#fakelink"><i data-toggle="tooltip" title="Twitter" class="fa fa-twitter icon-sm icon-rounded icon-social-footer icon-twitter"></i></a>
				<a href="#fakelink"><i data-toggle="tooltip" title="Google plus" class="fa fa-google-plus icon-sm icon-rounded icon-social-footer icon-google-plus"></i></a>
				<a href="#fakelink"><i data-toggle="tooltip" title="Dribbble" class="fa fa-dribbble icon-sm icon-rounded icon-social-footer icon-dribbble"></i></a>
				<a href="#fakelink"><i data-toggle="tooltip" title="Pinterest" class="fa fa-pinterest icon-sm icon-rounded icon-social-footer icon-pinterest"></i></a>
				<a href="#fakelink"><i data-toggle="tooltip" title="Github" class="fa fa-github icon-sm icon-rounded icon-social-footer icon-github"></i></a>
			</p>
		</div><!-- /.col-sm-4 -->
<div class="col-sm-6 col-md-4">
	<h4>CONTACT</h4>
	<div class="media media-contact">
	  <span class="pull-left">
		<i class="fa fa-map-marker media-object"></i>
	  </span>
	  <div class="media-body">
		<address>
		  Twitter, Inc.<br>
		  795 Folsom Ave, Suite 600<br>
		  San Francisco, CA 94107<br>
		  <abbr title="Phone">P:</abbr> (123) 456-7890
		</address>
	  </div><!-- /.media-body -->
</div><!-- /.media -->
<div class="media media-contact">
  <span class="pull-left">
	<i class="fa fa-envelope media-object"></i>
  </span>
  <div class="media-body">
	<address>
	  Full Name<br>
	  <a href="mailto:#">first.last@example.com</a>
	</address>
  </div><!-- /.media-body -->
</div><!-- /.media -->
</div><!-- /.col-sm-3 -->
<div class="clearfix visible-sm"></div>
<div class="col-sm-6 col-md-4">
	<h4>NAVIGATION</h4>
	<ul class="list">
		<li><a href="index.html">Home</a></li>
		<li><a href="index.html">About us</a></li>
		<li><a href="index.html">Our services</a></li>
		<li><a href="index.html">Portfolio</a></li>
		<li><a href="index.html">Pricing</a></li>
		<li><a href="index.html">Blog</a></li>
	</ul>
</div><!-- /.col-sm-2 -->
</div><!-- /.row -->
</div><!-- /.container -->
</footer><!-- /.section -->

<div class="footer">
	<div class="container">
		<div class="row">
			<div class="col-sm-5">
				Copyright &copy; 2014 <a href="#fakelink">Your company</a>
			</div><!-- /.col-sm-5 -->
<div class="col-sm-7 text-right">
	<ul class="list-inline">
	  <li><a href="#fakelink">Terms and condition</a></li>
	  <li><a href="#fakelink">Privacy policy</a></li>
	  <li><a href="#fakelink">FAQ</a></li>
	</ul>
</div><!-- /.col-sm-7 -->
</div><!-- /.row -->
</div><!-- /.container -->
</div><!-- /.footer -->
<!-- END FOOTER -->
		
		
		
<!-- BEGIN BACK TO TOP BUTTON -->
<div id="back-top">
	<i class="fa fa-chevron-up"></i>
</div>

<script src="${contextPath}/resources/frontend/assets/js/jquery.js"></script>
<script src="${contextPath}/resources/frontend/assets/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/bootstrap/bootstrap-dialog/js/bootstrap-dialog.min.js"></script> 
<script src="${contextPath}/resources/frontend/assets/plugins/retina/retina.min.js"></script>
<script src="${contextPath}/resources/frontend/assets/plugins/backstretch/jquery.backstretch.min.js"></script>
<script src="${contextPath}/resources/frontend/assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="${contextPath}/resources/frontend/assets/plugins/owl-carousel/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/frontend/assets/plugins/mixitup/jquery.mixitup.js"></script>
<script src="${contextPath}/resources/map/google-map-api.js"></script>
<script src="http://maps.googleapis.com/maps/api/js"></script>

<script>
$(document).ready(function(){
	$(function(){
	 var shrinkHeader = 250;
	  $(window).scroll(function() {
		var scroll = getCurrentScroll();
		  if ( scroll >= shrinkHeader ) {
			   $('.top-navbar').addClass('shrink-nav');
			   $('.top-navbar').addClass('dark-color');
			}
			else {
			   $('.top-navbar').removeClass('shrink-nav');
			   $('.top-navbar').removeClass('dark-color');
			}
	  });
		function getCurrentScroll() {
			return window.pageYOffset || document.documentElement.scrollTop;
		}
	});
})
</script>
	<script src="${contextPath}/resources/frontend/assets/js/apps.js"></script>
</body>
</html>