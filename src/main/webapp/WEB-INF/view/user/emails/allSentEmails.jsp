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
<title>Sent Emails</title>
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
			</ul>
		</div>
</div>
</div>				
<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">User All Sent Emails </a></li>
	</ol>
</div>
<div class="the-box">
						<div class="table-responsive">
						<table class="table table-striped table-hover" id="datatable-example">
							<thead class="the-box dark full">
								<tr>
									<th>Receiver</th>
									<th>Subject</th>
									<th>Date</th>
									<th>Action</th>
									
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${emails}" var="email">
							    <tr>
									<td><a href="${contextPath}/user/view-sent-email/${email.emailId}"> ${email.recieveremail}</a></td>
									<td>${email.subject}</td>
									<td class="center"><fmt:formatDate value="${email.createdDate}" pattern="MMM dd"/>, <fmt:formatDate value="${email.createdDate}" pattern="yyyy"/>  </td>
									<td class="center"><a href="javascript:void(0)" onclick="deleterecieveremail('${email.emailId}')"><button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>Delete</button></a>  </td>
								</tr>
							</c:forEach>
								
							</tbody>
						</table>
						</div>
					</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
$(function(){
	 $("#addFestivalImages").validate({
	    	errorClass:'inputError',
	    	validClass:'InputSuccess',
	    	rules: {
	    		festivalName:{required:true},
	    		dateofFestival:{required:true},
	    		festivalImages:{required:true}
	    		},
	    		
	    	messages: {			
	    		festivalName: {
	    			required: "Please Choose Festival Name."
	    		},
	    		dateofFestival:{
	    			required:"Please Choose Festival Date."
	    		},
	    		festivalImages:{
	    			required:"Please Upload Festival Images."
	    		},
	    	},
	    	submitHandler: function(form) {	
	    		form.submit();
	    		}
	    	});
		
	$("#datepickers").datepicker({ 
		dateFormat: 'mm/dd/yy',
		changeMonth: true,
		yearRange: "-100:+0",
	    changeYear: true
	    });
});

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