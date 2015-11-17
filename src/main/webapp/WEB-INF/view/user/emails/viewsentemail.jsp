<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="userTemplate" tagdir="/WEB-INF/tags"%>
<userTemplate:customerDefaultDecorator>
<jsp:body>
<title>View Email</title>
<div class="container-fluid">
<br/>
<div class="the-box no-border full media-menu">
	<div class="row">
		<div class="col-sm-8 col-md-9">
			<ul class="menus">
				<li class="menu-item active">
				<a href="${contextPath}/user/emailinbox"><i class="fa fa-folder-open icon-menu"></i>Inbox</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/all-sent-emails"><i class="fa fa-file-picture-o icon-menu"></i>Send Mails</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/composeemail"><i class="fa fa-file-picture-o icon-menu"></i>Compose</a>
				</li>
				<li class="menu-item">
				<a href="javascript:void(0)" onclick="deleterecieveremail('${email.emailId}')"><i class="fa fa-file-video-o icon-menu"></i>Delete</a>
				</li>
			</ul>
		</div>
</div>
</div>				
<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">View Email </a></li>
	</ol>
</div>


<div class="row">
<div class="col-sm-12">



<div class="the-box no-margin">
<div class="row">
<div class="col-sm-12 col-md-12">
	<div class="panel panel-transparent panel-square">
	<h4>SUBJECT : ${email.subject}</h4>
	  <div class="panel-heading">
		<h3 class="panel-title">
			<a class="block-collapse" data-toggle="collapse">
			<strong>From : </strong> ${email.senderEmail}
			<span class="right-content">
				<span class="time"><fmt:formatDate value="${email.createdDate}" pattern="MMM dd"/>, <fmt:formatDate value="${email.createdDate}" pattern="yyyy"/></span>
			</span>
			</a>
		</h3>
	  </div>
		<div id="read-mail-example-1" class="collapse in">
		  <div class="panel-body">
				<p>
				${email.message}
				</p>
		  </div>
<p><strong>Attachments :</strong></p>
<div class="panel-footer">
<div class="magnific-popup-wrap">
<div class="row">
<c:forEach items="${email.emailsAttacheds}" var="emailsAttacheds">
<c:if test="${fn:endsWith(emailsAttacheds.emailImageModifiedName, '.png')==true or fn:endsWith(emailsAttacheds.emailImageModifiedName, '.jpg')==true or fn:endsWith(emailsAttacheds.emailImageModifiedName, '.jpeg')==true or fn:endsWith(emailsAttacheds.emailImageModifiedName, '.gif')==true or fn:endsWith(emailsAttacheds.emailImageModifiedName, '.JPG')==true}">
<div class="col-xs-12 col-md-2">
	<img src="${contextPath}/emailattchments/${emailsAttacheds.emailImageModifiedName}" alt="${emailsAttacheds.emailImageModifiedName}" class="mfp-fade item-gallery img-responsive">
	<div class="caption ">
	<p  style="color:#37BC9B;"><span style="margin-left: 15px;"><a class="zooming" href="${contextPath}/emailattchments/${emailsAttacheds.emailImageModifiedName}" title="${emailsAttacheds.emailImageModifiedName}">View</a></span>
	<span style="margin-left: 35px;"><a href="${contextPath}/user/download-email-attachement?attachedName=${emailsAttacheds.emailImageModifiedName}">Download</a></span></p>
</div>
<hr/>
</div>
</c:if>
</c:forEach>
</div>
</div>

<div class="row">
<div class="col-xs-12 col-md-2">
<ul class="attachment-list caption">
<c:forEach items="${email.emailsAttacheds}" var="emailsAttacheds">
<c:if test="${fn:endsWith(emailsAttacheds.emailImageModifiedName, '.png')==false and fn:endsWith(emailsAttacheds.emailImageModifiedName, '.jpg')==false and fn:endsWith(emailsAttacheds.emailImageModifiedName, '.jpeg')==false and fn:endsWith(emailsAttacheds.emailImageModifiedName, '.gif')==false and fn:endsWith(emailsAttacheds.emailImageModifiedName, '.JPG')==false}">
	<li><a href="${contextPath}/user/download-email-attachement?attachedName=${emailsAttacheds.emailImageModifiedName}">${emailsAttacheds.emailImageName}</a></li>
</c:if>
</c:forEach>	
</ul>
<div class="caption ">
<a href="${contextPath}/user/download-all-email-attachements?emailId=${email.emailId}"><button class="btn btn-info"><i class="fa fa-cloud-download"></i> Download attachments</button></a>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
function deleterecieveremail(emailId){
	BootstrapDialog.confirm('Are you sure! You want Delete this Email Information?', function(result){
        if(result) {
        	$.get("${contextPath}/user/sender-email-delete-by-id?emailId="+emailId).done(function(data){
        		if(data.status=="success"){
        			 BootstrapDialog.alert(data.message, function(alertresult){
        				 if(alertresult){
        				  $(location).attr('href',"${contextPath}/user/all-sent-emails");
        				 }
        			 });
        		}
        	});
        }else {
        }
    });
	
}
</script>