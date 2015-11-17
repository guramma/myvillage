<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="userTemplate" tagdir="/WEB-INF/tags"%>
<userTemplate:customerDefaultDecorator>
<jsp:body>
<title>User Dashboard</title>
<div class="container-fluid">

<br/>
<c:if test="${not empty successmessage}">
<div class="alert alert-success fade in alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
${successmessage}
</div>
</c:if>



<h1 class="page-heading"></h1>
	<div class="row">
		<div class="col-sm-3">
			<div class="the-box no-border bg-success tiles-information">
				<i class="fa fa-users icon-bg"></i>
				<div class="tiles-inner text-center">
					<p>TODAY VISITORS</p>
					<h1 class="bolded">12,254K</h1> 
					<div class="progress no-rounded progress-xs">
					  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
			  </div>
			</div>
			<p><small>Better than yesterday ( 7,5% )</small></p>
		</div>
	</div>
</div>
<div class="col-sm-3">
	<div class="the-box no-border bg-primary tiles-information">
		<i class="fa fa-shopping-cart icon-bg"></i>
		<div class="tiles-inner text-center">
			<p>TODAY SALES</p>
			<h1 class="bolded">521</h1> 
			<div class="progress no-rounded progress-xs">
			  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
			  </div>
			</div>
			<p><small>Better than yesterday ( 10,5% )</small></p>
		</div>
	</div>
</div>
<div class="col-sm-3">
	<div class="the-box no-border bg-danger tiles-information">
		<i class="fa fa-comments icon-bg"></i>
		<div class="tiles-inner text-center">
			<p>TODAY FEEDBACK</p>
			<h1 class="bolded">124</h1> 
			<div class="progress no-rounded progress-xs">
			  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
			  </div>
			</div>
			<p><small>Less than yesterday ( <span class="text-danger">-7,5%</span> )</small></p>
		</div>
	</div>
</div>
<div class="col-sm-3">
	<div class="the-box no-border bg-warning tiles-information">
		<i class="fa fa-money icon-bg"></i>
		<div class="tiles-inner text-center">
			<p>TODAY EARNINGS</p>
			<h1 class="bolded">10,241</h1> 
			<div class="progress no-rounded progress-xs">
			  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
			  </div>
			</div>
			<p><small>Better than yesterday ( 2,5% )</small></p>
		</div>
	</div>
</div>
</div>
<div class="row">
	<div class="col-lg-4">
		<div class="panel panel-danger panel-square panel-no-border text-center">
		  <div class="panel-heading">
			<h3 class="panel-title">TODAY VISITOR</h3>
		  </div>
		  <div class="panel-body">
			<h1 class="bolded tiles-number text-danger">25,057</h1>
			<p class="text-muted"><small>UNIQUE VISITOR <strong>957</strong></small></p>
			<p class="text-muted"><small>TOTAL REACH <strong>25%</strong></small></p>
		  </div>
</div>
</div>
<div class="col-lg-4">
	<div class="panel panel-warning panel-square panel-no-border text-center">
	  <div class="panel-heading">
		<h3 class="panel-title">TODAY SALES</h3>
	  </div>
	  <div class="panel-body">
		<h1 class="bolded tiles-number text-warning">245</h1>
		<p class="text-muted"><small>LAST SALE <strong>2 HOURS AGO</strong></small></p>
		<p class="text-muted"><small>SALE AVERAGE <strong>221</strong></small></p>
	  </div>
</div>
</div>


<div class="col-lg-4">
<div class="panel panel-info panel-square panel-no-border">
  <div class="panel-body bg-info">
  <div id="test"></div>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-lg-5 col-md-12 col-md-12">
<div class="row">
<div class="col-sm-6 col-md-12 col-lg-12">
<div class="the-box bg-warning no-border full">
<div id="tiles-slide-2" class="owl-carousel tiles-carousel">
  <c:forEach items="${sarpanches}" var="sarpanch">
 <div class="item full">
<img src="${contextPath}/sarpanches/${sarpanch.sarpanchProfileModifiedName}" class="avatar img-circle has-white-shadow" alt="avatar">
<div class="des">
	<h4 class="bolded"><a href="${contextPath}/user/view-sarpanch-info?sarpanchId=${sarpanch.sarpanchId}">${sarpanch.sarpanchName}</a></h4>
	<p class="small">${sarpanch.sarpanchStartDate} - ${sarpanch.sarpanchEndDate}</p>
	<p class="small"><a href="${contextPath}/user/view-sarpanch-info?sarpanchId=${sarpanch.sarpanchId}"><button class="btn btn-success btn-block"><i class="glyphicon glyphicon-eye-open"></i> View Sarpanch Full Details</button></a> </p>
	<p class="small"><a href="${contextPath}/user/all-sarpanches"><button class="btn btn-success btn-block"><i class="glyphicon glyphicon-eye-open"></i> View All Sarpanches Info</button></a></p>
</div>
<img src="${contextPath}/resources/user/assets/img/photo/medium/img-14.jpg" alt="Image">
 </div>
</c:forEach>
</div>
</div>
</div>
</div>
</div>
<div class="col-lg-7 col-md-12 col-sm-12">
<div class="the-box no-border full">
	 <button class="btn btn-block btn-primary btn-square" id="w-newsticker-next"><span style="float:left;">GKP BOOK USER REQUESTS</span><i class="fa fa-chevron-up" style="margin-left: -179px;"></i> </button>
	<ul class="widget-newsticker media-list">
	<c:forEach items="${users}" var="user">
		<li class="media">
			<div class="media-left">
			  <img class="media-object" src="${contextPath}/userProfiles/${user.userProfileModifiedName}" alt="Image" >
			</div>
			<div class="media-body">
			  <h4 class="media-heading"><a href="#fakelink">${user.firstName} ${user.lastName}</a></h4>
			  <p class="text-muted"><small>Requested on <fmt:formatDate value="${user.requestedDate}" pattern="MMM dd"/>, <fmt:formatDate value="${user.requestedDate}" pattern="yyyy"/></small></p>
			  <p>
			<a href="${contextPath}/user/accept-request?userFromemail=${user.email}&userToemail=${userdisplay.email}"><button type="submit" class="btn btn-success"><i class="fa fa-hand-o-up"></i> Accept</button></a> <a href="${contextPath}/user/reject-request?userFromemail=${user.email}&userToemail=${userdisplay.email}"><button type="submit" class="btn btn-danger"><i class="fa fa-hand-o-down"></i> Reject</button></a>
			  </p>
			</div>
		</li>
	</c:forEach>	
	</ul>
	<button class="btn btn-block btn-primary btn-square" id="w-newsticker-prev"><i class="fa fa-chevron-down"></i></button>
</div>
</div>










</div>

<div class="the-box no-border">
<h4 class="small-heading more-margin-bottom text-center">Village Festivals</h4>
<div id="store-item-carousel-3" class="owl-carousel shop-carousel">
<c:forEach items="${festivalImages}" var="festivalImage">
	<div class="item">
		<div class="media">
			<a class="pull-left" href="#fakelink">
			  <img class="media-object sm" src="${contextPath}/festivalImages/${festivalImage.festivalModifiedName}" alt="Image" style="width: 125px;">
			</a>
			<div class="media-body">
			  <h4 class="media-heading"><a href="#fakelink">${festivalImage.festivalName}</a></h4>
			  <p class="brand"><fmt:formatDate value="${festivalImage.festivalDate}" pattern="MMM dd"/>, <fmt:formatDate value="${festivalImage.festivalDate}" pattern="yyyy"/></p>
			  <p class="price"><a href="${contextPath}/user/view-festival-images?festivalname=${festivalImage.festivalName}"><button type="button" class="btn btn-success"><i class="fa fa-sign-in"></i> View</button></a></p>
			</div>
		</div>
	</div>
</c:forEach>	
</div>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
$(function(){
	$('#test').weatherfeed(['INXX0031']);	
	/* $.get("${contextPath}/user/alerts-information").done(function(data){
		BootstrapDialog.alert(data);
	}); */
});
</script>



