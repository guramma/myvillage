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
<title>Add Class Subjects</title>
<style>
th td {
text-align: center;
}
</style>
<div class="container-fluid">
<br/>
<c:if test="${not empty successmessage}">
<div class="alert alert-success fade in alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
${successmessage}
</div>
</c:if>
			
<div class="the-box">
	<form id="addFestivalImages" method="post" class="form-horizontal" enctype= multipart/form-data>
<fieldset>
	<legend>Add Festival Images, Videos  & Musics </legend>

	<div class="form-group">
		<label class="col-lg-3 control-label">Study <span style="color:red;">*</span> : </label>
		<div class="col-lg-5">
			<select name="studentClass" class="form-control" required="required">
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
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-3 control-label">Medium <span style="color:red;">*</span> : </label>
		<div class="col-lg-5">
			<select name="medium" class="form-control" required="required">
	            <option value=""> &nbsp; &nbsp;&nbsp; Medium</option>
	            <option value="Telugu">Telugu</option>
				<option value="English">English</option>
				<option value="Both">Both</option>
            </select> 
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-lg-3 control-label">Subject <span style="color:red;">*</span> : </label>
		<div class="col-lg-5">
			<input type="text" class="form-control" name="subject" required="required"/>
		</div>
	</div>
	
	<div class="form-group">
	<label class="col-lg-3 control-label">Subject Documents <span style="color:red;">*</span> : </label>
	<div class="col-lg-5">
		<div class="input-group">
			<input type="text" class="form-control" readonly>
			<span class="input-group-btn">
				<span class="btn btn-primary btn-file">
					<i class="fa fa-plus"></i><input type="file" multiple  name="documents" required="required">
				</span>
			</span>
		</div>
		<label class="inputError" for="documents"></label>
	 </div>	
	</div>
</fieldset>
<div class="form-group text-center">
	<div class="col-lg-5 col-lg-offset-3">
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</div>
</form>
</div>
<br/>
<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">Festival List</a></li>
	</ol>
</div>
<div class="the-box">
						<div class="table-responsive">
						<table class="table table-striped table-hover" id="datatable-example">
							<thead class="the-box dark full">
								<tr>
									<th style="text-align: center;">S.NO</th>
									<th style="text-align: center;">Festival Name</th>
									<th style="text-align: center;">Festival Date</th>
									<th style="text-align: center;">Action</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${festivals}" var="festival" varStatus="status">
								<tr>
									<td style="text-align: center;">${status.count}</td>
									<td style="text-align: center;">${festival.festivalName}</td>
									<td style="text-align: center;"><fmt:formatDate value="${festival.festivalDate}" pattern="MMM dd"/>, <fmt:formatDate value="${festival.festivalDate}" pattern="yyyy"/></td>
									<td style="text-align: center;"><a href="${contextPath}/user/view-festival-info?festivalId=${festival.festivalId}"><button type="button" class="btn btn-info" style="margin-right:10px;margin-top:2px;"><i class="glyphicon glyphicon-eye-open"></i>View</button></a>
									<button type="button" class="btn btn-danger" style="margin-top:2px;" onclick="deleteFestivalDetails('${festival.festivalId}')"><i class="glyphicon glyphicon-trash"></i>Delete</button></td>
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
	    		studentClass:{required:true},
	    		medium:{required:true},
	    		subject:{required:true},
	    		documents:{required:true}
	    		},
	    		
	    	messages: {			
	    		studentClass: {
	    			required: "Please Choose Study."
	    		},
	    		medium:{
	    			required:"Please Choose Medium."
	    		},
	    		subject:{
	    			required:"Please Choose Subject."
	    		},
	    		documents:{
	    			required:"Please Upload Subject Documents."
	    		},
	    	},
	    	submitHandler: function(form) {	
	    		form.submit();
	    		}
	    	});
});



function deleteFestivalDetails(festivalId){
	 BootstrapDialog.confirm('Are you sure! You want Delete this Record?', function(result){
        if(result) {
        	$.get("${contextPath}/user/delete-festival-info?festivalId="+festivalId).done(function(data){
        		if(data.status=="success"){
        			BootstrapDialog.alert(data.message, function(alertresult){
       				 if(alertresult){
       						 window.location.reload(); 
       				 }
       			 });
        		}
        	});
        }else {
        }
    });
}














</script>