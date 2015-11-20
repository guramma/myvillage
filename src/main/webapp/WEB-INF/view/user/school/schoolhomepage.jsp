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
	<li><a href="${contextPath}/user/add-student-classes" class="navbar-brand"><i class="fa fa-file-image-o"></i> Add Class Subjects</a></li>
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
<div class="table-responsive">
<table class="table table-striped table-hover" id="datatable-example">
	<thead class="the-box dark full">
		<tr>
			<th>Student Name</th>
			<th>Study</th>
			<th>Medium</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${students}" var="student">
		<tr class="odd gradeX">
			<td>${student.firstName} ${student.lastName}</td>
			<td>${student.studentClass}</td>
			<td>${student.medium}</td>
			<td class="center"><a href="${contextPath}/user/view-student-details?studentId=${student.studentId}" class="btn btn-success btn-rounded-lg" style="margin-top:2px"><i class="fa fa-eye"></i>View</a> <a href="${contextPath}/user/edit-student-details?studentId=${student.studentId}" class="btn btn-primary btn-rounded-lg" style="margin-top:2px"><i class="fa  fa-cut"></i>Edit</a> <button class="btn btn-danger btn-rounded-lg" style="margin-top:2px"><i class="fa fa-bitbucket"></i>Delete</button></td>
		</tr>
	</c:forEach>	
	</tbody>
</table>
</div><!-- /.table-responsive -->
</div><!-- /.the-box .default -->

<div class="the-box no-border">
<div class="magnific-popup-wrap">
	<div class="row">
		<div class="col-xs-6 col-md-3">
			<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-1.jpg" >
			<img src="${contextPath}/resources/user/assets/img/photo/small/img-1.jpg" alt="Image" class="mfp-fade item-gallery img-responsive">
			</a>
		</div><!-- /.col-xs-6 .col-md-3 -->
<div class="col-xs-6 col-md-3">
	<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-2.jpg" >
	<img src="${contextPath}/resources/user/assets/img/photo/small/img-2.jpg" alt="Image" class="mfp-fade item-gallery img-responsive">
	</a>
</div><!-- /.col-xs-6 .col-md-3 -->
<div class="col-xs-6 col-md-3">
	<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-3.jpg" >
	<img src="${contextPath}/resources/user/assets/img/photo/small/img-3.jpg" alt="Image" class="mfp-fade item-gallery img-responsive">
	</a>
</div><!-- /.col-xs-6 .col-md-3 -->
<div class="col-xs-6 col-md-3">
	<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-4.jpg" >
	<img src="${contextPath}/resources/user/assets/img/photo/small/img-4.jpg" alt="Image" class="mfp-fade item-gallery img-responsive">
	</a>
</div><!-- /.col-xs-6 .col-md-3 -->
<div class="col-xs-6 col-md-3">
	<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-5.jpg" >
	<img src="${contextPath}/resources/user/assets/img/photo/small/img-5.jpg" alt="Image" class="mfp-fade item-gallery img-responsive">
	</a>
</div><!-- /.col-xs-6 .col-md-3 -->
<div class="col-xs-6 col-md-3">
	<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-6.jpg" >
	<img src="${contextPath}/resources/user/assets/img/photo/small/img-6.jpg" alt="Image" class="mfp-fade item-gallery img-responsive">
	</a>
</div><!-- /.col-xs-6 .col-md-3 -->
<div class="col-xs-6 col-md-3">
	<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-7.jpg" >
	<img src="${contextPath}/resources/user/assets/img/photo/small/img-7.jpg" alt="Image" class="mfp-fade item-gallery img-responsive">
	</a>
</div><!-- /.col-xs-6 .col-md-3 -->
<div class="col-xs-6 col-md-3">
	<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-8.jpg" >
	<img src="${contextPath}/resources/user/assets/img/photo/small/img-8.jpg" alt="Image" class="mfp-fade item-gallery img-responsive">
	</a>
</div>
</div>
</div>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>