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
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/loader.css"/> 
<style type="text/css">
.inputError{
color: red;
}
.loader-block{position: fixed; left: 0; right: 0; top: 0; bottom: 0; z-index: 1000; width:100%; height: 100%; z-index: 2000; background: #000; opacity:0.8;}
.loader-block-inside{position: absolute; top: 50%; left: 50%; width:200px; height: 200px; margin: -100px 0 0 -100px; background-image: url("${contextPath}/resources/css/lightbox-ico-loading.gif"); background-repeat: no-repeat; background-position: center;}

</style>
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
<h4 class="small-title" style="font-size: 21px;color: #0632C9;">Edit User Profile Information</h4><hr/>
<form role="form" action="${contextPath}/user/update-user-profile" method="post" id="signupvalidation" novalidate="novalidate" enctype="multipart/form-data">
	<div class="row">
	<div class="col-sm-4">
		<label>
			First Name <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control" placeholder="First Name" name="firstName" id="firstName" value="${user.firstName}">
			  <span class="fa fa-user form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			Last Name : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control" placeholder="Last Name" name="lastName" id="lastName" value="${user.lastName}">
			  <span class="fa fa-user form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			Email <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control" placeholder="Email" name="email" id="email" value="${user.email}">
			  <span class="fa fa-envelope form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			Password <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="password" class="form-control" placeholder="Create a password" name="password" id="password" value="${user.password}">
			  <span class="fa fa-lock form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			Confirm Password <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="password" class="form-control" placeholder="Retype your password" name="confirmPassword" id="confirmPassword" value="${user.password}">
			  <span class="fa fa-lock form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			Phone Number <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control" placeholder="Phone Number" name="phoneNumber" id="phoneNumber" value="${user.phoneNumber}">
			  <span class="fa fa-phone-square form-control-feedback"></span>
			</div>
	</div>
	
	<div class="col-sm-4">
		<label>
			Date of Birth <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control"name="dateofBirth" id="datepickers" placeholder="Date of Birth" value="${user.dateofBirth}">
			  <span class="fa fa-calendar form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			Country <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control" name="country" id="country" placeholder="Country" value="${user.country}">
			  <span class="fa fa-flag-checkered form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			State <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control" placeholder="State" name="state" id="state" value="${user.state}">
			  <span class="fa fa-institution form-control-feedback"></span>
			</div>
	</div>
	
	<div class="col-sm-4">
		<label>
			City <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control"name="city" id="city" placeholder="City" value="${user.city}">
			  <span class="fa fa-language form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			Zipcode <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="text" class="form-control" name="zipcode" id="zipcode" placeholder="Zipcode" maxlength="7" value="${user.zipcode}">
			  <span class="fa fa-sort-numeric-asc form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-4">
		<label>
			Gender <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <select name="gender" class="form-control" id="gender">
                  <option value=""> &nbsp; &nbsp;&nbsp; Gender</option>
                  <option value="Male"> &nbsp; &nbsp;&nbsp;Male</option>
                  <option value="Female"> &nbsp; &nbsp;&nbsp;Female</option>
              </select> 
			  <span class="fa fa-users form-control-feedback"></span>
			</div>
	</div>
	
	<div class="col-sm-6">
		<label>
			Address 1 <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <textarea class="form-control" placeholder="Address 1" name="address1" style="height: 114px;">${user.address1}</textarea>
			  <span class="fa fa-home form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-6">
		<label>
			Address 2 : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <textarea class="form-control" placeholder="Address 2" name="address2" style="height: 114px;">${user.address2}</textarea>
			  <span class="fa fa-home form-control-feedback"></span>
			</div>
	</div>
	
	<div class="col-sm-6">
		<label>
			User Profile Photo : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="file" class="form-control" name="file" id="file" placeholder="User Profile Photo">
			  <span class="fa-picture-o form-control-feedback"></span>
			</div>
	</div>
	<div class="col-sm-6">
		<label>
			User Profile Background Image : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <input type="file" class="form-control" name="file1" id="file1" placeholder="User Profile Background Image">
			  <span class="fa-picture-o form-control-feedback"></span>
			</div>
	</div>
	
	<div class="col-sm-12">
		<label>
			User Profile <span style="color:red;">*</span> : 
			 </label>
			<div class="form-group has-feedback left-feedback no-label">
			  <textarea class="form-control" placeholder="User Profile" name="userProfile" style="height: 114px;">${user.userProfile}</textarea>
			  <span class="fa fa-comments-o form-control-feedback"></span>
			</div>
	</div>
	<input type="hidden" name="userId" value="${user.userId}">
	<div class="col-sm-2" style="float:right;">
	<button type="submit" class="btn btn-success btn-block"><i class="fa fa-user"></i> Update Profile</button>
	</div>
	</div><!-- /.row -->
	
</form>
</div><!-- /.the-box -->
</div>
</div>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
$(function(){
	$("#gender").val("${user.gender}");
	$("#datepickers").datepicker({ 
		dateFormat: 'mm/dd/yy',
		changeMonth: true,
		yearRange: "-100:+0",
	    changeYear: true
	    });
	
	
	  $("#signupvalidation").validate({
	    	errorClass:'inputError',
	    	validClass:'InputSuccess',
	    	rules: {
	    		email:{required:true,email:true},
	    		password:{required:true,minlength:6},
	    		firstName:{required:true},
	    		confirmPassword:{required:true,equalTo:'#password'},
	    		address1:{required:true},
				city:{required:true},
				state:{required:true},
				country:{required:true},
				phoneNumber:{required:true,number:true},
				zipcode:{required:true,number:true},
				gender:{required:true},
				dateofBirth:{required:true},
				userProfile:{required:true}
	    		},
	    		
	    	messages: {			
	    		email: {
	    			required: "Please enter email address.",
	    			email : "Please enter a valid email address."
	    		},
	    		password:{
	    			required:"Please enter password.",
	    			minlength:"Password Must be 6 Digits Long."
	    		},
	    		firstName: {
	    			required: "Please enter User First Name."
	    		},
	    		confirmPassword: {
	    			required: "Please enter Confirm Password.",
	    			equalTo:'Please Enter Password & Conform Password Must be Same.'
	    		},
	    		address1: {
					required: "Please Enter Address"
				},
				city: {
					required: "Please Enter City"
				},
				state: {
					required: "Please Enter State"
				},
				country: {
					required: "Please Enter Country"
				},
				phoneNumber:{required:"Please Enter Phone Number",
					number:"Please Enter Valid Phone Number"
				},
				zipcode:{required:"Please Enter Zipcode",
					number:"Please Enter Valid Zipcode "
				},
				gender:{
					required:"Please choose Gender."
				},
				dateofBirth:{
					required:"Please choose User Date of Birth."
				},
				userProfile:{
					required:"Please enter Some Thing about your Self."
				},

	    	},
	    	submitHandler: function(form) {	
				     $(".loader-block, .loader-block-inside").show();
				     form.submit();
	    		}
	    	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
</script>