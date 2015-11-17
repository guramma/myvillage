<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="userTemplate" tagdir="/WEB-INF/tags"%>
<userTemplate:customerDefaultDecorator>
<jsp:body>
<title>Reply Email</title>
<div class="container-fluid">
<br/>
<div class="the-box no-border full media-menu">
	<div class="row">
		<div class="col-sm-8 col-md-9">
			<ul class="menus">
				<li class="menu-item">
				<a href="${contextPath}/user/emailinbox"><i class="fa fa-folder-open icon-menu"></i>Inbox</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/all-sent-emails"><i class="fa fa-file-picture-o icon-menu"></i>Send Mails</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/composeemail"><i class="fa fa-file-picture-o icon-menu"></i>Compose</a>
				</li>
			</ul>
		</div>
</div>
</div>				
<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">Reply Email </a></li>
	</ol>
</div>


<div class="row">
<div class="col-sm-12">
	<div class="the-box">
	<form action="${contextPath}/user/sendemail" method="post" enctype="multipart/form-data" id="composeemail">
	<div class="form-group">
	<label>To Email <span style="color:red;">*</span> : </label>
		<input class="form-control rounded bold-border" type="text" name="emails" required="required" value="${email.senderEmail}" readonly="readonly">
	</div>
	<div class="form-group">
		<label>Subject <span style="color:red;">*</span> : </label>
		<input class="form-control rounded bold-border" type="text" name="subject" required="required">
	</div>
	<div class="form-group">
	<label>Message <span style="color:red;">*</span> : </label>
	<textarea class="form-control" name="message" id="editor1" maxlength="800">
	----- Orginal Message -------<br/>
	<b>From : </b>${email.senderEmail}<br/>
	<b>To : </b>${email.recieveremail}<br/>
	<b>Subject : </b>${email.subject}<br/>
	${email.message}</textarea>
</div>
<div class="form-group">
	<label>Attachments : </label>
		<div class="input-group">
			<input type="text" class="form-control" readonly>
			<span class="input-group-btn">
				<span class="btn btn-primary btn-file">
					Browse Files<input type="file" multiple  name="files">
				</span>
			</span>
		</div>
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary">SUBMIT</button>
		<a href="${contextPath}/user/emailinbox" class="btn btn-danger">CANCEL</a>
</div>
</form>
</div>
</div>
</div>
</div>
<ckeditor:replace replace="editor1" basePath="${contextPath}/resources/ckeditor/" />
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
$(function(){
	 $("#composeemail").validate({
	    	errorClass:'inputError',
	    	validClass:'InputSuccess',
	    	rules: {
	    		emails:{required:true},
	    		subject:{required:true},
	    		message:{
	    			required: function(textarea) {
	    		          CKEDITOR.instances[textarea.id].updateElement(); // update textarea
	    		          var editorcontent = textarea.value.replace(/<[^>]*>/gi, ''); // strip tags
	    		          return editorcontent.length === 0;
	    		        }
	    		}
	    		},
	    		
	    	messages: {			
	    		emails: {
	    			required: "Please Choose User Emails."
	    		},
	    		subject:{
	    			required:"Please Enter Email Subject."
	    		},
	    		message:{
	    			required:"Please Enter Email Message."
	    		},
	    	},
	    	submitHandler: function(form) {	
	    		form.submit();
	    		}
	    	});
});
</script>