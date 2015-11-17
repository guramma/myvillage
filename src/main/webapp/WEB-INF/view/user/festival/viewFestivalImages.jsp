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
<title>${festivalName} Photos</title>
<div class="container-fluid">
<br/>					
<div class="the-box no-border full media-menu">
	<div class="row">
		<div class="col-sm-8 col-md-9">
			<ul class="menus">
				<li class="menu-item active">
				<a href="#fakelink"><i class="fa fa-folder-open icon-menu"></i>All media</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/view-festival-images?festivalname=${festivalName}"><i class="fa fa-file-picture-o icon-menu"></i>Pictures</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/view-festival-videos?festivalname=${festivalName}"><i class="fa fa-file-video-o icon-menu"></i>Videos</a>
				</li>
				<li class="menu-item">
				<a href="#fakelink"><i class="fa fa-file-audio-o icon-menu"></i>Music</a>
				</li>
			</ul>
		</div>
</div>
</div>					
<div class="the-box">
<h4 class="small-title">${festivalName} Photos</h4><hr/>
<div class="magnific-popup-wrap">
<div class="row">
<c:forEach items="${festivalImages}" var="festivalImage">
<div class="col-xs-12 col-md-3">
	<img src="${contextPath}/festivalImages/${festivalImage.festivalModifiedName}" alt="${festivalImage.festivalImageName}" class="mfp-fade item-gallery img-responsive">
	<div class="caption ">
	<p  style="color:#37BC9B;"><span style="margin-left: 15px;"><a class="zooming" href="${contextPath}/festivalImages/${festivalImage.festivalModifiedName}" title="${festivalImage.festivalImageName}">View</a></span>
	<span style="margin-left: 100px;"><a href="${contextPath}/user/download-festival-image?festivalname=${festivalImage.festivalModifiedName}">Download</a></span></p>
</div>
<hr/>
</div>
</c:forEach>
</div>
</div>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>