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
<title>Add Festival Images, Videos  & Musics</title>
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
	<form id="addFestivalImages" method="post" action="${contextPath}/user/save-festival-images" class="form-horizontal" enctype= multipart/form-data>
<fieldset>
	<legend>Add Festival Images, Videos  & Musics </legend>

	<div class="form-group">
		<label class="col-lg-3 control-label">Festival Name <span style="color:red;">*</span> : </label>
		<div class="col-lg-5">
			<select class="form-control" name="festivalName" required="required">
				<option value=""> -- Select a Festival --  </option>
				<c:forEach items="${festivalLists}" var="festivalList">
				  <option value="${festivalList.festivalName}">${festivalList.festivalName}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-3 control-label">Festival Date <span style="color:red;">*</span> : </label>
		<div class="col-lg-5">
			<input type="text" class="form-control" name="dateofFestival" id="datepickers" required="required"/>
		</div>
	</div>
	
	<div class="form-group">
	<label class="col-lg-3 control-label">Festival Images <span style="color:red;">*</span> : </label>
	<div class="col-lg-5">
		<div class="input-group">
			<input type="text" class="form-control" readonly>
			<span class="input-group-btn">
				<span class="btn btn-primary btn-file">
					<i class="fa fa-plus"></i><input type="file" multiple  name="festivalImages" required="required">
				</span>
			</span>
		</div>
		<label class="inputError" for="festivalImages"></label>
	 </div>	
	</div>
	<div class="form-group">
	<label class="col-lg-3 control-label">Festival Videos : </label>
	<div class="col-lg-5">
		<div class="input-group">
			<input type="text" class="form-control" readonly>
			<span class="input-group-btn">
				<span class="btn btn-primary btn-file">
					<i class="fa fa-plus"></i><input type="file" multiple  name="festivalVideos">
				</span>
			</span>
		</div>
	 </div>	
	</div>
	<div class="form-group">
	<label class="col-lg-3 control-label">Festival Musics : </label>
	<div class="col-lg-5">
		<div class="input-group">
			<input type="text" class="form-control" readonly>
			<span class="input-group-btn">
				<span class="btn btn-primary btn-file">
					<i class="fa fa-plus"></i><input type="file" multiple  name="festivalMusics">
				</span>
			</span>
		</div>
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