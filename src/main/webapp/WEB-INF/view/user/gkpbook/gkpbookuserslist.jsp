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
<title>GKP BOOK - My Village</title>
<style>
#backimag{
 background-image: url("${contextPath}/resources/img-12.jpg");
 margin-top:-25px;
background-size: 100% 100%;
background-repeat: no-repeat;
}
</style>
<style>
	#project-label {
		display: block;
		font-weight: bold;
		margin-bottom: 1em;
	}
	#project-icon {
		float: left;
		height: 32px;
		width: 32px;
	}
	#project-description {
		margin: 0;
		padding: 0;
	}
	</style>
<div class="container-fluid">
<br/>
<div class="the-box transparent full search-page" id="backimag">
	<div class="the-box no-margin no-border bg-success" id="search-heading">
		<div class="text-center">
			<img src="${contextPath}/resources/user/assets/img/logo-login.png" class="logo" alt="Logo">
		</div>
		<form action="${contextPath}/user/search-user-posts" method="get">
		<div class="form-group has-feedback lg no-label">
			<input id="project" name="email" class="form-control no-border input-lg" placeholder="Search something..." required="required"/>
			<span class="fa fa-search form-control-feedback"></span>
		</div>
		<div class="text-center">
			<button class="btn btn-warning"><i class="fa fa-globe"></i> Search User Posts</button>
			<button class="btn btn-success"><i class="fa fa-suitcase"></i> My own page</button>
		</div>
	</form>
</div>
<div class="panel with-nav-tabs panel-success panel-square panel-no-border">
 <div class="panel-heading">
<div class="right-content">
	<div class="btn-group">
		<button class="btn btn-success btn-sm btn-rounded-lg dropdown-toggle" data-toggle="dropdown">
		<i class="fa fa-cog"></i>
		</button>
		<ul class="dropdown-menu success pull-right square margin-list" role="menu">
			<li><a href="#fakelink">Action</a></li>
			<li><a href="#fakelink">Another action</a></li>
			<li class="active"><a href="#fakelink">Active</a></li>
			<li class="divider"></li>
			<li><a href="#fakelink">Separated link</a></li>
		</ul>
	</div>
</div><!-- /.right-content -->
<ul class="nav nav-tabs">
	<li><a href="${contextPath}/user/get-gkp-book"><i class="fa fa-edit"></i> HOME</a></li>
	<li><a href="${contextPath}/user/post-your-ad"><i class="fa fa-picture-o"></i> Post Your Ads</a></li>
	<li class="active"><a href="${contextPath}/user/get-all-bookusers"><i class="fa fa-users"></i> GKP Book Users List </a></li>
</ul>
 </div>
<div id="panel-collapse-1" class="collapse in">
	<div class="panel-body">
		<div class="tab-content">
				<ul class="media-list media-sm media-dotted">
				<c:forEach items="${users}" var="user">
				<c:choose>
				<c:when test="${user.status}">
				<li class="media">
					<a class="pull-left" href="#fakelink">
					  <img class="media-object img-circle" src="${contextPath}/userProfiles/${user.userProfileModifiedName}" alt="Avatar" style="width: 78px;height: 72px;">
					</a>
					<div class="media-body">
						<div class="row">
							<div class="col-sm-4">
							  <h4 class="media-heading"><a href="#fakelink">${user.firstName} ${user.lastName}</a></h4>
								<p><i class="fa fa-map-marker"></i> ${user.address1}
								<br /><small class="text-danger"><fmt:formatDate value="${user.requestedDate}" pattern="MMM-dd-yyyy"></fmt:formatDate></small></p>
							</div>
							<div class="col-sm-4">
								<button class="btn btn-primary btn-sm" disabled="disabled"><i class="fa fa-user"></i> Request Sent</button>
							</div>
						</div><!-- /.row -->
					</div>
				  </li>
				</c:when>
				<c:otherwise>
				<li class="media">
					<a class="pull-left" href="#fakelink">
					  <img class="media-object img-circle" src="${contextPath}/userProfiles/${user.userProfileModifiedName}" alt="Avatar" style="width: 78px;height: 72px;">
					</a>
					<div class="media-body">
						<div class="row">
							<div class="col-sm-4">
							  <h4 class="media-heading"><a href="#fakelink">${user.firstName} ${user.lastName}</a></h4>
								<p><i class="fa fa-map-marker"></i> ${user.address1}
								<br /><small class="text-danger">${user.email}</small></p>
							</div>
							<div class="col-sm-4">
							 <a href="${contextPath}/user/send-gkpbook-friend-request?friendEmail=${user.email}"><button class="btn btn-success btn-sm"><i class="fa fa-user"></i> Add friend</button></a>
							</div>
						</div>
					</div>
				  </li>
				</c:otherwise>
				</c:choose>
				  </c:forEach>
				</ul>
				<hr />
		</div><!-- /.tab-content -->
	</div><!-- /.panel-body -->
</div><!-- /.collapse in -->
</div><!-- /.panel .panel-success -->
</div><!-- /.the-box full -->
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
	$(function() {
		var projects = ${data};
		$( "#project" ).autocomplete({
			minLength: 0,
			source: projects,
			focus: function( event, ui ) {
				$( "#project" ).val( ui.item.label );
				return false;
			},
			select: function( event, ui ) {
				$( "#project" ).val( ui.item.label );
				$( "#project-id" ).val( ui.item.value );
				$( "#project-description" ).html( ui.item.desc );
				$( "#project-icon" ).attr( "src", ui.item.icon ).show();
				return false;
			}
		})
		.data( "ui-autocomplete" )._renderItem = function( ul, item ) {
			return $( "<li></li>" )
				.data( "item.autocomplete", item )
				.append( "<a> <img src='${contextPath}/userProfiles/"+item.icon + "' alt='no photo' style='width: 40px;height: 40px;position: relative;margin-top: -7px;margin-bottom: -28px;margin-right: 10px;border-radius: 50%;vertical-align: middle;'/>" + item.label + "<br><span style='margin-left:50px'>" + item.desc + "</span></a>" )
				.appendTo( ul );
		};
	});
	</script>