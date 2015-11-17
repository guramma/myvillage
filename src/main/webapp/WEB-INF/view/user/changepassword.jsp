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
 <div class="the-box">
<h4 class="small-title" style="font-size: 21px;color: #0632C9;">Create New Password</h4><hr/>
<form role="form" action="${contextPath}/user/update-user-password" method="post" id="signupvalidation" novalidate="novalidate">
<div class="row">
	<div class="col-sm-12">
	<label>
		Old Password <span style="color:red;">*</span> : 
	  </label>
		<div class="form-group has-feedback left-feedback no-label">
		  <input type="password" class="form-control" placeholder="Old Password" name="oldpassword">
		  <span class="fa fa-lock form-control-feedback"></span>
		</div>
	</div>
<div class="col-sm-12">
<label>
	New Password <span style="color:red;">*</span> : 
</label>
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="password" class="form-control" placeholder="New Password" name="newpassword" id="password">
	  <span class="fa fa-lock form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-12">
<label>
	Confirm Password <span style="color:red;">*</span> : 
</label>
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="password" class="form-control" placeholder="Confirm Password" name="confirmpassword">
	  <span class="fa fa-lock form-control-feedback"></span>
	</div>
</div>
<input type="hidden" id="oldpasswordtest" value="${user.password}" name="password">
<div class="col-sm-2" style="float:right;">
	<button type="submit" class="btn btn-success btn-block"><i class="fa fa-sign-in"></i> Change Password</button>
	</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
$(function(){
 $("#signupvalidation").validate({
   	errorClass:'inputError',
   	validClass:'InputSuccess',
   	rules: {
   		oldpassword:{required:true,minlength:6,equalTo:'#oldpasswordtest'},
   		newpassword:{required:true,minlength:6},
   		confirmpassword:{required:true,equalTo:'#password'}
   		},
   		
   	messages: {			
   		oldpassword:{
   			required:"Please enter old password.",
   			minlength:"Password Must be 6 Digits Long.",
   			equalTo:'Please Enter correct old Password.'
   			
   		},
   		newpassword:{
   			required:"Please enter new password.",
   			minlength:"Password Must be 6 Digits Long.",
   			
   		},
   		confirmpassword: {
   			required: "Please enter Confirm Password.",
   			equalTo:'Please Enter New Password & Confirm Password Must be Same.'
   		}
   		

   	},
   	submitHandler: function(form) {	
		     $(".loader-block, .loader-block-inside").show();
		     form.submit();
   		}
   	});
});
</script>



