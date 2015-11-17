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
<title>User Profile</title>
<div class="container-fluid">

<br/>
<c:if test="${not empty successmessage}">
<div class="alert alert-success fade in alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
${successmessage}
</div>
</c:if>
					
<div class="row">
<div class="col-md-12">
<div class="the-box transparent full no-margin profile-heading">
<c:choose>
<c:when test="${not empty user.userProfileBackgroundModifiedName}">
<img src="${contextPath}/userProfiles/${user.userProfileBackgroundModifiedName}" class="bg-cover" alt="Image" style="height:350px;">
</c:when>
<c:otherwise>
<img src="${contextPath}/reources/user/assets/img/photo/wide/img-2.jpg" class="bg-cover" alt="Image" style="height:350px;">
</c:otherwise>
</c:choose>
<c:choose>
<c:when test="${not empty user.userProfileModifiedName}">
<img src="${contextPath}/userProfiles/${user.userProfileModifiedName}" class="avatar" alt="Avatar">
</c:when>
<c:otherwise>
<img src="${contextPath}/reources/user/assets/img/avatar/avatar-1.jpg" class="avatar" alt="Avatar">
</c:otherwise>
</c:choose>
<div class="profile-info">
	<p class="user-name">${user.firstName} ${user.lastName}</p>
	
	<p class="right-button">
	<a href="${contextPath}/user/edit-user-profile"><button class="btn btn-primary btn-sm">Edit profile</button></a>
	</p>
</div><!-- /.profile-info -->
</div><!-- /.the-box .transparent .profile-heading -->
<div class="panel with-nav-tabs panel-primary panel-square panel-no-border">
  <div class="panel-heading">
  </div>
	<div id="panel-collapse-1" class="collapse in">
		<div class="panel-body">
		<div class="tab-content">
			<form class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-sm-2 control-label">Email : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.email}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">password : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.password}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Phone Number : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.phoneNumber}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Date of Birth : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.dateofBirth}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Country : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.country}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">State : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.state}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">City : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.city}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Zipcode : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.zipcode}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Gender : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.gender}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Address 1 : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.address1}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Address 2 : </label>
				<div class="col-sm-10">
				  <p class="form-control-static">${user.address2}</p>
				</div>
			</div><!-- /.form-group -->
			<div class="form-group">
				<label class="col-sm-2 control-label">User Profile  :</label>
				<div class="col-sm-10">
				  <p class="form-control-static">
					${user.userProfile}
				  </p>
				</div>
			</div><!-- /.form-group -->
			</form>
		</div><!-- /#panel-about -->
	</div><!-- /.tab-content -->
</div><!-- /.panel-body -->
</div><!-- /.collapse in -->
</div><!-- /.panel .panel-success -->
</div><!-- /.col-md-8 -->
</div><!-- /.row -->
</jsp:body>
</userTemplate:customerDefaultDecorator>