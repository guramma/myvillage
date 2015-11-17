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
<title>View Sarpanch Info</title>
<style>
.glyphicon {
    display: none;
    font-family: "Glyphicons Halflings";
    font-style: normal;
    font-weight: 400;
    line-height: 1;
    top: 1px;
    position: relative;
    }
    .label {
    display: none;
    padding: 0.2em 0.6em 0.3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #FFF;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.25em;
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
<div class="row">
<div class="col-md-12">
							
<div class="panel panel-warning panel-square panel-no-border">
  <div class="panel-heading">
	Sarpanch Details
  </div>
<div class="the-box no-border full card-info">
	<div class="the-box no-border text-center no-margin">
		<img src="${contextPath}/sarpanches/${sarpanch.sarpanchProfileModifiedName}" class="social-avatar has-margin has-light-shadow img-circle" alt="Avatar">
<p class="text-info">${sarpanch.sarpanchName}</p>
<p class="text-muted">${sarpanch.sarpanchStartDate} - ${sarpanch.sarpanchEndDate}</p>
	<p class="bordered">
		<input class="rating" data-stars="5" data-step="0.1" value="${sarpanch.totalRating}"  disabled />
	</p>
	<p class="social-icon">
		<a href="#fakelink"><i class="fa fa-facebook icon-xs icon-circle icon-facebook"></i></a>
		<a href="#fakelink"><i class="fa fa-twitter icon-xs icon-circle icon-twitter"></i></a>
		<a href="#fakelink"><i class="fa fa-dribbble icon-xs icon-circle icon-dribbble"></i></a>
		<a href="#fakelink"><i class="fa fa-google-plus icon-xs icon-circle icon-google-plus"></i></a>
	</p>
</div>
<div class="the-box no-border no-margin">

 <h3><p class="bordered text-info">${sarpanch.sarpanchName} Profile </p></h3>
  <p>
${sarpanch.sarpanchProfile}
  </p>
</div>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12">
<div class="panel panel-warning panel-square panel-no-border">
  <div class="panel-heading">
	Give User Rating About ${sarpanch.sarpanchName}
  </div>
<div class="the-box no-border full card-info">
<div class="the-box no-border no-margin">
<div class="form-group">
<input class="rating" data-stars="5" data-step="0.1" value=""  id="userrating"/>
<button type="submit" class="btn btn-success" onclick="showrating()">User Rating</button>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="the-box no-border">
<h4 class="small-heading more-margin-bottom">${sarpanchComments.size()} COMMENT(S)</h4>
<ul class="media-list media-sm media-dotted">
<c:forEach items="${sarpanchComments}" var="sarpanchComment">
 <li class="media">
<a class="pull-left" href="#fakelink">
  <img class="media-object img-circle" src="${contextPath}/userProfiles/${sarpanchComment.userProfileModifiedName}" alt="Avatar">
</a>
<div class="media-body">
  <h4 class="media-heading"><a href="#fakelink">${sarpanchComment.userName}</a></h4>
  <p class="date"><small><fmt:formatDate value="${sarpanchComment.commentDate}" pattern="MMM-dd-yyyy HH:mm:ss"/></small></p>
  ${sarpanchComment.userComment}
</div>
 </li>
 </c:forEach>
</ul>
</div>

<div class="row">
<div class="col-md-12">
<div class="panel panel-warning panel-square panel-no-border">
  <div class="panel-heading">
	Give User Comment About ${sarpanch.sarpanchName}
  </div>
<div class="the-box no-border full card-info">
<div class="the-box no-border no-margin">
<form action="${contextPath}/user/user-comment" method="post">
<div class="form-group">
<textarea class="form-control input-lg rounded bold-border no-resize" name="userComment" id="editor1" maxlength="800"></textarea>
</div>
<input type="hidden" name="sarpanchId" value="${sarpanch.sarpanchId}">
<div class="form-group">
<button type="submit" class="btn btn-lg btn-success" onclick="showrating()">User Comment</button>
</div>
</form>	
</div>
</div>
</div>
</div>
</div>

</div>
<ckeditor:replace replace="editor1" basePath="${contextPath}/resources/ckeditor/" />
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
function showrating(){
	 BootstrapDialog.confirm('Are you sure! You Give '+$("#userrating").val()+' Rating for ${sarpanch.sarpanchName}?', function(result){
	if(result) {
	$.get("${contextPath}/user/user-rating-sapranch?sarpanchId=${sarpanch.sarpanchId}&userrating="+$("#userrating").val()).done(function(data){
		if(data.status=="success"){
			 BootstrapDialog.alert(data.message, function(alertresult){
				 if(alertresult){
					 $(location).attr('href',"${contextPath}/user/view-sarpanch-info?sarpanchId=${sarpanch.sarpanchId}");
				 }
			 });
		}
		
	});
	}else{
		
	}
});
}
</script>