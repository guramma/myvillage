<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="frontTemplate" tagdir="/WEB-INF/tags"%>
<frontTemplate:frontDefaultDecorator>
<jsp:body>
<title>Home Page - My Village</title>
<div class="full-slide-image" id="full-img-slide">
	<div class="slide-inner more-padding">
		<div class="slide-text-content">
			<div class="container-fluid">
				<h1>GUNTA KRINDA PALLI VILLAGE</h1>
				<div class="clear"></div>
				<h3>
				Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet<br />
				doming id quod mazim placerat facer possim assum.
				</h3>
				<div class="clear"></div>
				<a href="${contextPath}/login" class="btn btn-lg btn-success btn-learn-more">Login</a>
				<a href="${contextPath}/sign-up" class="btn btn-lg btn-success btn-learn-more">Sign Up</a>
			</div>
	</div>
</div>
</div>

<div class="section">
<div class="container">
<div class="section-heading">
	<div class="inner-border"></div>
	<h3>My Village Map</h3>
</div>

<div class="row">
<div class="col-sm-12">
<div class="testimonial-item">
<div class="body dashed">
 <div id="googleMap" style="width: 10008px; height: 308px;" class="img-responsive contact-map-img"></div>
</div>
</div>
</div>
</div>

<div class="section-heading">
	<div class="inner-border"></div>
	<h3>SARPANCHES</h3>
</div>

<%-- <a href="${contextPath}/test">Test DATA LOKESH</a> --%>



<div class="row">
<div class="col-sm-6">
	<div class="testimonial-item">
		<div class="heading">
			<img src="${contextPath}/resources/frontend/assets/img/avatar/small/avatar-23.jpg" alt="Avatar" class="avatar img-circle">
			<div class="client-content">
				<p class="name">Sandra Myers</p>
				<p class="client-home">Online business women - Tokyo, Japan</p>
			</div><!-- /.client-content -->
<div class="rates">
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star"></i>
</div><!-- /.rates -->
</div><!-- /.heading -->
<div class="body dashed">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
	euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
	minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip 
	ex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
	</p>
</div><!-- /.body -->
</div><!-- /.testimonial-item -->
</div><!-- /.col-sm-6 -->
<div class="col-sm-6">
<div class="testimonial-item">
	<div class="heading">
		<img src="${contextPath}/resources/frontend/assets/img/avatar/small/avatar-21.jpg" alt="Avatar" class="avatar img-circle">
<div class="client-content">
	<p class="name">Maria Simpson</p>
	<p class="client-home">Executive staff - Melbourne, Australia</p>
</div><!-- /.client-content -->
<div class="rates">
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star"></i>
</div><!-- /.rates -->
</div><!-- /.heading -->
<div class="body dashed">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
	euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
	minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip 
	ex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
	</p>
</div><!-- /.body -->
</div><!-- /.testimonial-item -->
</div><!-- /.col-sm-6 -->
<div class="col-sm-6">
	<div class="testimonial-item">
		<div class="heading">
			<img src="${contextPath}/resources/frontend/assets/img/avatar/small/avatar-23.jpg" alt="Avatar" class="avatar img-circle">
			<div class="client-content">
				<p class="name">Sandra Myers</p>
				<p class="client-home">Online business women - Tokyo, Japan</p>
			</div><!-- /.client-content -->
<div class="rates">
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star"></i>
</div><!-- /.rates -->
</div><!-- /.heading -->
<div class="body dashed">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
	euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
	minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip 
	ex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
	</p>
</div><!-- /.body -->
</div><!-- /.testimonial-item -->
</div><!-- /.col-sm-6 -->
<div class="col-sm-6">
	<div class="testimonial-item">
		<div class="heading">
			<img src="${contextPath}/resources/frontend/assets/img/avatar/small/avatar-21.jpg" alt="Avatar" class="avatar img-circle">
			<div class="client-content">
				<p class="name">Maria Simpson</p>
				<p class="client-home">Executive staff - Melbourne, Australia</p>
			</div><!-- /.client-content -->
<div class="rates">
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star"></i>
</div><!-- /.rates -->
</div><!-- /.heading -->
<div class="body dashed">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
	euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
	minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip 
	ex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
	</p>
</div><!-- /.body -->
</div><!-- /.testimonial-item -->
</div><!-- /.col-sm-6 -->
</div><!-- /.row -->





<div class="section-heading">
	<div class="inner-border"></div>
	<h3>HISTORY OF GODS</h3>
</div>

<div class="row">
<div class="col-sm-6">
	<div class="testimonial-item">
		<div class="heading">
			<img src="${contextPath}/resources/frontend/assets/img/avatar/small/avatar-23.jpg" alt="Avatar" class="avatar img-circle">
			<div class="client-content">
				<p class="name">Sandra Myers</p>
				<p class="client-home">Online business women - Tokyo, Japan</p>
			</div><!-- /.client-content -->
<div class="rates">
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star"></i>
</div><!-- /.rates -->
</div><!-- /.heading -->
<div class="body dashed">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
	euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
	minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip 
	ex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
	</p>
</div><!-- /.body -->
</div><!-- /.testimonial-item -->
</div><!-- /.col-sm-6 -->
<div class="col-sm-6">
<div class="testimonial-item">
	<div class="heading">
		<img src="${contextPath}/resources/frontend/assets/img/avatar/small/avatar-21.jpg" alt="Avatar" class="avatar img-circle">
<div class="client-content">
	<p class="name">Maria Simpson</p>
	<p class="client-home">Executive staff - Melbourne, Australia</p>
</div><!-- /.client-content -->
<div class="rates">
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star"></i>
</div><!-- /.rates -->
</div><!-- /.heading -->
<div class="body dashed">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
	euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
	minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip 
	ex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
	</p>
</div><!-- /.body -->
</div><!-- /.testimonial-item -->
</div><!-- /.col-sm-6 -->
<div class="col-sm-6">
	<div class="testimonial-item">
		<div class="heading">
			<img src="${contextPath}/resources/frontend/assets/img/avatar/small/avatar-23.jpg" alt="Avatar" class="avatar img-circle">
			<div class="client-content">
				<p class="name">Sandra Myers</p>
				<p class="client-home">Online business women - Tokyo, Japan</p>
			</div><!-- /.client-content -->
<div class="rates">
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star"></i>
</div><!-- /.rates -->
</div><!-- /.heading -->
<div class="body dashed">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
	euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
	minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip 
	ex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
	</p>
</div><!-- /.body -->
</div><!-- /.testimonial-item -->
</div><!-- /.col-sm-6 -->
<div class="col-sm-6">
	<div class="testimonial-item">
		<div class="heading">
			<img src="${contextPath}/resources/frontend/assets/img/avatar/small/avatar-21.jpg" alt="Avatar" class="avatar img-circle">
			<div class="client-content">
				<p class="name">Maria Simpson</p>
				<p class="client-home">Executive staff - Melbourne, Australia</p>
			</div><!-- /.client-content -->
<div class="rates">
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star shinny"></i>
	<i class="fa fa-star"></i>
</div><!-- /.rates -->
</div><!-- /.heading -->
<div class="body dashed">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
	euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
	minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip 
	ex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla in
	vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
	</p>
</div><!-- /.body -->
</div><!-- /.testimonial-item -->
</div><!-- /.col-sm-6 -->
</div><!-- /.row -->
</div><!-- /.container -->
</div><!-- /.section -->







</jsp:body>
</frontTemplate:frontDefaultDecorator>
<script>
$(function(){
	$("#full-img-slide").backstretch([
  "${contextPath}/resources/frontend/assets/img/SvCIGLc.jpg",
  /* "${contextPath}/resources/frontend/assets/img/image-1.jpg",
  "${contextPath}/resources/frontend/assets/img/image-2.jpg",
  "${contextPath}/resources/frontend/assets/img/image-3.jpg", */
  "${contextPath}/resources/frontend/assets/img/image-4.jpg",
  "${contextPath}/resources/frontend/assets/img/image-5.jpg",
  /* "${contextPath}/resources/frontend/assets/img/image-1.jpg" */
  ], {
	fade: 750,
	duration: 6000
});
});

</script>
<script type="text/javascript">
		var myCenter = new google.maps.LatLng(13.751257, 79.649860);

		function initialize() {
			var mapProp = {
				center : myCenter,
				zoom : 15,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};

			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);

			var marker = new google.maps.Marker({
				position : myCenter,
			});

			marker.setMap(map);

			var infowindow = new google.maps.InfoWindow(
					{
						content : "<p style='color: black;	font-size: medium;'>Guntakrinda palli(vi),Maddiledu(post),Srikalahasti(Man),Chittoor(dist),AP</p>"
					});

			infowindow.open(map, marker);
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	</script>