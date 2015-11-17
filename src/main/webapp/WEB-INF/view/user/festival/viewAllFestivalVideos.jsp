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
<title> ${festivalName} Videos</title>
<div class="container-fluid">
<br/>					
<div class="the-box no-border full media-menu">
	<div class="row">
		<div class="col-sm-8 col-md-9">
			<ul class="menus">
				<li class="menu-item active">
				<a href="${contextPath}/user/all-festivals"><i class="fa fa-folder-open icon-menu"></i>All</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/all-festival-images"><i class="fa fa-file-picture-o icon-menu"></i>Pictures</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/all-festival-videos"><i class="fa fa-file-video-o icon-menu"></i>Videos</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/all-festival-musics"><i class="fa fa-file-audio-o icon-menu"></i>Music</a>
				</li>
			</ul>
		</div>
</div>
</div>

<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">${festivalName} Videos</a></li>
	</ol>
</div>

<div class="row">
<c:forEach items="${festivalVideos}" var="festivalVideo">
<div class="col-sm-4 col-md-3">
<div class="thumbnail media-lib-item">
<img src="${contextPath}/resources/user/assets/img/img-file/video-file.jpg" alt="..." width="auto">
<div class="caption ">
	<p  style="color:#37BC9B;"><span>${festivalVideo.festivalVideoName}</span></p>
</div>
<hr style="margin: 0px 0px;"/>
<div class="caption text-center">
	<p class="small">
    <a href="${contextPath}/user/view-festival-videos-name?festivalname=${festivalName}&festivalvideoname=${festivalVideo.festivalModifiedName}"><button type="button" class="btn btn-success"><i class="fa fa-sign-in"></i> View</button></a>
	<span><a href="${contextPath}/user/download-festival-video?festivalname=${festivalVideo.festivalModifiedName}"><button type="button" class="btn btn-success"><i class="fa fa-sign-in"></i> Download</button></a></span>
</div>
</div>
</div>
</c:forEach>
</div>

</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>