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
<title>Add New Student Information </title>
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/loader.css"/> 
<style type="text/css">
.inputError{
color: red;
}
#OwlprogressBar{
display:none;
}
th,td{
text-align:center;
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

<nav class="navbar navbar-primary" role="navigation">
 <div class="container-fluid">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-rounded">
	<span class="sr-only">Toggle navigation</span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
  </button>
  <a class="navbar-brand" href="#fakelink"><i class="fa fa-users"></i>  Students List</a>
</div>

<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-rounded">
 <ul class="nav navbar-nav">
	<li><a href="#fakelink" class="navbar-brand"><i class="fa fa-users"></i>  Teachers List</a></li>
  </ul>
  <ul class="nav navbar-nav">
	<li><a href="#fakelink" class="navbar-brand"><i class="fa fa-file-image-o"></i>  School Media</a></li>
  </ul>
    <ul class="nav navbar-nav">
	<li><a href="${contextPath}/user/student-attendence" class="navbar-brand"><i class="fa fa-file-image-o"></i> Student Attendence Report</a></li>
  </ul>
  <ul class="nav navbar-nav navbar-right">
  <li><a href="${contextPath}/user/add-new-student" class="navbar-brand"><i class="fa fa-user"></i>  Add New Student</a></li>
  </ul>
</div><!-- /.navbar-collapse -->
 </div><!-- /.container-fluid -->
</nav>


<div class="the-box">
 <form role="form" action="${contextPath}/user/student-registration-process" method="post" id="signupvalidation" novalidate="novalidate" enctype="multipart/form-data">
<div class="row">
	<div class="col-sm-3">
		<div class="form-group has-feedback left-feedback no-label">
		  <input type="text" class="form-control" placeholder="First Name" name="firstName">
		  <span class="fa fa-user form-control-feedback"></span>
		</div>
	</div>
	<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="Middle Name" name="middleName">
	  <span class="fa fa-user form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="Last Name" name="lastName">
	  <span class="fa fa-user form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <select name="gender" class="form-control">
          <option value=""> &nbsp; &nbsp;&nbsp; Gender</option>
          <option value="Male"> &nbsp; &nbsp;&nbsp;Male</option>
          <option value="Female"> &nbsp; &nbsp;&nbsp;Female</option>
      </select> 
	  <span class="fa fa-users form-control-feedback"></span>
	</div>
</div>

<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="Mother Name" name="motherName">
	  <span class="fa fa-user form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="Father Name" name="fatherName">
	  <span class="fa fa-user form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="email" class="form-control" placeholder="Email" name="email">
	  <span class="fa fa-envelope form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="Phone Number" maxlength="10" name="phoneNumber">
	  <span class="fa fa-phone-square form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-12">
	<div class="form-group has-feedback left-feedback no-label">
	  <textarea rows="" cols="" class="form-control" placeholder="Address" name="address"></textarea>
	  <span class="fa fa-user form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="City" name="city">
	  <span class="fa fa-language form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="State" name="state">
	  <span class="fa fa-institution form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="Country" name="country">
	  <span class="fa fa-flag-checkered form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="text" class="form-control" placeholder="Zipcode" name="zipcode">
	  <span class="fa fa-sort-numeric-asc form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <input type="file" class="form-control" placeholder="User Photo" name="file">
	  <span class="fa  fa-picture-o form-control-feedback"></span>
	</div>
</div>

<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	 <input type="text" class="form-control" placeholder="School Name" name="schoolName">
	  <span class="fa fa-users form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <select name="medium" class="form-control">
          <option value=""> &nbsp; &nbsp;&nbsp; Medium</option>
          <option value="Telugu"> &nbsp; &nbsp;&nbsp;Telugu</option>
          <option value="English"> &nbsp; &nbsp;&nbsp;English</option>
      </select> 
	  <span class="fa fa-users form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	<input type="text" class="form-control" name="dateofBirth" id="datepickers" required="required" placeholder="Date of Birth"/>
	  <span class="fa fa-users form-control-feedback"></span>
	</div>
</div>
<div class="col-sm-3">
	<div class="form-group has-feedback left-feedback no-label">
	  <select name="studentClass" class="form-control">
            <option value=""> &nbsp; &nbsp;&nbsp; Study</option>
            <option value="1stclass">1<sup>st</sup> Class</option>
			<option value="2ndclass">2<sup>nd</sup> Class</option>
			<option value="3rdclass">3<sup>rd</sup> Class</option>
			<option value="4thclass">4<sup>th</sup> Class</option>
			<option value="5thclass">5<sup>th</sup> Class</option>
			<option value="6thclass">6<sup>th</sup> Class</option>
			<option value="7thclass">7<sup>th</sup> Class</option>
			<option value="8thclass">8<sup>th</sup> Class</option>
			<option value="9thclass">9<sup>th</sup> Class</option>
			<option value="10thclass">10<sup>th</sup> Class</option>
      </select> 
	  <span class="fa fa-users form-control-feedback"></span>
	</div>
</div>

</div>
<button type="submit" class="btn btn-success btn-block btn-lg"><i class="fa fa-sign-in"></i> Add New Student</button>
</form>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
$(function(){
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
		firstName:{required:true},
		motherName:{required:true},
		fatherName:{required:true},
		address:{required:true},
		schoolName:{required:true},
		medium:{required:true},
		studentClass:{required:true},
		city:{required:true},
		state:{required:true},
		country:{required:true},
		phoneNumber:{required:true,number:true},
		zipcode:{required:true,number:true},
		file:{required:true},
		gender:{required:true},
		dateofBirth:{required:true},
		},
		
	messages: {			
		email: {
			required: "Please enter email address.",
			email : "Please enter a valid email address."
		},
		motherName:{
			required:"Please enter Mother Name.",
		},
		fatherName : {
			required:"Please enter Father Name.",
		},
		firstName: {
			required: "Please enter User First Name."
		},
		schoolName: {
			required: "Please enter School Name.",
		},
		address: {
			required: "Please Enter Address."
		},
		studentClass:{
			required: "Please Choose Student Class."
		},
		medium:{
			required:"Please Choose Student Medium."
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
		file:{
			required:"Please upload Student Photo"
		},
		gender:{
			required:"Please choose Gender."
		},
		dateofBirth:{
			required:"Please choose Student Date of Birth."
		}

	},
	submitHandler: function(form) {	
		     $(".loader-block, .loader-block-inside").show();
		     form.submit();
		}
	});

});

</script>