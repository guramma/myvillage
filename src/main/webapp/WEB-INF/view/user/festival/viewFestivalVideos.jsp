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
<title>${festivalName} Video</title>
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
				<a href="#fakelink"><i class="fa fa-file-picture-o icon-menu"></i>Pictures</a>
				</li>
				<li class="menu-item">
				<a href="${contextPath}/user/view-festival-videos?festivalname=${festivalName}"><i class="fa fa-file-video-o icon-menu"></i>Videos</a>
				</li>
				<li class="menu-item">
				<a href="#fakelink"><i class="fa fa-file-audio-o icon-menu"></i>Music</a>
				</li>
				<li class="menu-item">
				<a href="#fakelink"><i class="fa fa-file-zip-o icon-menu"></i>Document</a>
				</li>
			</ul>
		</div>
</div>
</div>					
<div class="the-box">
<h4 class="small-title">${festivalName} Video</h4><hr/>
<div class="magnific-popup-wrap">
<div class="row text-center">
<div class="col-xs-12 col-md-8">
<a href="${contextPath}/festivalVideos/${festivalvideoname}" style="float:right;"> Download This Video</a><hr/>
<div class="video-wrapper">
<a class="zooming" href="${contextPath}/resources/user/assets/img/photo/medium/img-1.jpg" title="Image title here">
<iframe src="${contextPath}/festivalVideos/${festivalvideoname}" allowfullscreen ></iframe>
</a>
</div>
</div>
</div>
</div>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>