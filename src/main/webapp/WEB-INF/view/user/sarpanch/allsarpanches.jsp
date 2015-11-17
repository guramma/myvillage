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
<title>All Sarpanches</title>
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
<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">All Sarpanches</a></li>
	</ol>
</div>
	
					
<div class="row">
<c:forEach items="${sarpanches}" var="sarpanch">
<div class="col-sm-3">
<div class="the-box no-border full store-item text-center">
	<img src="${contextPath}/sarpanches/${sarpanch.sarpanchProfileModifiedName}" class="item-image" alt="Image" height="273px">
	<div class="the-box no-margin no-border item-des">
		<p class="text-warning"><strong>${sarpanch.sarpanchName}</strong></p>
		<h4 class="bolded">${sarpanch.sarpanchStartDate} - ${sarpanch.sarpanchEndDate}</h4>
		<p>
			<input class="rating" data-stars="5" data-step="0.1" value="${sarpanch.totalRating}"  disabled />
		</p>
		<div class="btn-group">
			<a href="${contextPath}/user/view-sarpanch-info?sarpanchId=${sarpanch.sarpanchId}" style="text-decoration: none;"><button class="btn btn-success btn-block"><i class="glyphicon glyphicon-eye-open"></i> View Full Details</button></a>
		</div>
	</div>
</div>
</div>
</c:forEach>
</div>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
