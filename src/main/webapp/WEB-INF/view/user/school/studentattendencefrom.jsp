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
<title>Gkp School Home Page</title>
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

<div class="the-box">
<form role="form" action="${contextPath}/user/student-attendence-form" method="post" id="addFestivalImages">
<div class="row" >
	<div class="col-sm-4">
		<div class="form-group has-feedback left-feedback no-label">
		<select name="studentClasss" class="form-control" required="required" id="studentClasss">
			<option value="">Choose Class</option>
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
		  <span class="fa fa-book form-control-feedback"></span>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="form-group has-feedback left-feedback no-label">
		<select name="year" class="form-control" required="required" id="year">
			<option value="">Choose Year</option>
			<c:forEach begin="2015" end="2030" var="year">
			  <option value="${year}">${year}</option>
			</c:forEach>
			
		</select>
		  <span class="fa fa-calendar form-control-feedback"></span>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="form-group has-feedback left-feedback no-label">
		<select name="month" class="form-control" required="required" id="month">
			<option value="">Choose Month</option>
			<option value="January">January</option>
			<option value="Febuary">Febuary</option>
			<option value="March">March</option>
			<option value="April">April</option>
			<option value="May">May</option>
			<option value="June">June</option>
			<option value="July">July</option>
			<option value="August">August</option>
			<option value="September">September</option>
			<option value="October">October</option>
			<option value="November">November</option>
			<option value="December">December</option>
		</select>
		  <span class="fa fa-calendar form-control-feedback"></span>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="form-group has-feedback left-feedback no-label">
		<button type="submit" class="btn btn-success"><i class="fa fa-sign-in"></i> Submit</button>
		</div>
	</div>
</div>
</form>
</div>

<div class="the-box no-border">
<h4 class="small-title">Student Attendence Form</h4>
<div class="table-responsive">
	<table class="table table-th-block table-primary" rules="all">
		<thead>
			<tr>
			<th style="width: 80px;">Full name</th>
			<c:forEach begin="1" end="31" var="count">
			<th style="width: 25px;">${count}</th>
			</c:forEach>
			</tr>
		</thead>
		<tbody>
		<c:forEach begin="1" end="31" var="count">
			<tr><td><img src="${contextPath}/resources/user/assets/img/avatar/avatar-1.jpg" class="avatar img-circle" alt="avatar">Paris Hawker</td>
			<c:forEach begin="1" end="31" var="count">
			<c:choose>
			<c:when test="${count eq '16'}">
			     <td style="width: 25px;"><input type="checkbox"></td>
			</c:when>
			<c:otherwise>
			      <td style="width: 25px;"><input type="checkbox" disabled="disabled" checked="checked"></td>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div><!-- /.table-responsive -->
</div><!-- /.the-box -->
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
$(function(){
$("#studentClasss").val("${studentAttendenceDto.studentClasss}");
$("#year").val("${studentAttendenceDto.year}");	
$("#month").val("${studentAttendenceDto.month}");	
	
	
	
	
$("#addFestivalImages").validate({
   	errorClass:'inputError',
   	validClass:'InputSuccess',
   	rules: {
   		studentClasss:{required:true},
   		year:{required:true},
   		month:{required:true}
   		},
   		
   	messages: {			
   		studentClasss: {
   			required: "Please Choose Class."
   		},
   		year:{
   			required:"Please Choose Year."
   		},
   		month:{
   			required:"Please Choose Month."
   		},
   	},
   	submitHandler: function(form) {	
   		form.submit();
   		}
   	});
});
</script>