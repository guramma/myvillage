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
<title>GKP BOOK - My Village</title>
<style>
#backimag{
 background-image: url("${contextPath}/resources/img-12.jpg");
 margin-top:-25px;
background-size: 100% 100%;
background-repeat: no-repeat;
}
</style>
<style>
	#project-label {
		display: block;
		font-weight: bold;
		margin-bottom: 1em;
	}
	#project-icon {
		float: left;
		height: 32px;
		width: 32px;
	}
	#project-description {
		margin: 0;
		padding: 0;
	}
	</style>


<div class="container-fluid">
<br/>
<div class="the-box transparent full search-page" id="backimag">
	<div class="the-box no-margin no-border bg-success" id="search-heading">
		<div class="text-center">
			<img src="${contextPath}/resources/user/assets/img/logo-login.png" class="logo" alt="Logo">
		</div>
		<form action="${contextPath}/user/search-user-posts" method="get">
		<div class="form-group has-feedback lg no-label">
			<input id="project" name="email" class="form-control no-border input-lg" placeholder="Search something..." required="required"/>
			<span class="fa fa-search form-control-feedback"></span>
		</div>
		<div class="text-center">
			<button class="btn btn-warning"><i class="fa fa-globe"></i> Search User Posts</button>
			<button class="btn btn-success"><i class="fa fa-suitcase"></i> My own page</button>
		</div>
	</form>
</div>
<div class="panel with-nav-tabs panel-success panel-square panel-no-border">
 <div class="panel-heading">
<div class="right-content">
	<div class="btn-group">
	</div>
</div>
<ul class="nav nav-tabs">
	<li class="active"><a href="${contextPath}/user/get-gkp-book"><i class="fa fa-edit"></i> Home</a></li>
	<li><a href="${contextPath}/user/post-your-ad"><i class="fa fa-picture-o"></i> Post Your Ads</a></li>
	<li><a href="${contextPath}/user/get-all-bookusers"><i class="fa fa-users"></i> GKP Book Users List </a></li>
</ul>
 </div>
</div>
</div>
</div>
 <div class="container-fluid">
<br/>	
<c:choose>
<c:when test="${postYourAds.size() gt 0 }">
<ul class="timeline">
<li class="centering-line"></li>
<c:forEach items="${postYourAds}" var="postYourAd" varStatus="varstatus">
<li class="item-timeline">
	<div class="buletan"></div>
	<div class="inner-content">
<div class="heading-timeline">
	<img src="${contextPath}/userProfiles/${postYourAd.userProfileModifiedName}" class="avatar" alt="Avatar">
<div class="user-timeline-info">
	<p>
	${postYourAd.userName}
<small><fmt:formatDate value="${postYourAd.postYourAdDate}" pattern="MMM dd,yyyy"/> at <fmt:formatDate value="${postYourAd.postYourAdDate}" pattern="HH:mm:ss aa"/></small></p>
</div>
</div>
<h4>${postYourAd.title}</h4>
<div class="img-wrap-col magnific-popup-wrap">
<c:forEach items="${postYourAd.postYourAdAttachments}" var="postYourAdAttachment" varStatus="status">
<c:if test="${status.count eq 1}">
  <div class="img-col-12">
<div class="img-wrap">
	<a class="zooming" href="${contextPath}/postAds/${postYourAdAttachment.adFileModifiedName}">
	<img src="${contextPath}/postAds/${postYourAdAttachment.adFileModifiedName}" alt="Image" class="mfp-fade" style="width: 523px;">
	</a>
</div>
</div>
</c:if>
</c:forEach>
<c:forEach items="${postYourAd.postYourAdAttachments}" var="postYourAdAttachment" varStatus="status">
<c:if test="${status.count ge 2 and status.count le 7}">
  <div class="img-col-3">
<div class="img-wrap">
	<a class="zooming" href="${contextPath}/postAds/${postYourAdAttachment.adFileModifiedName}">
	<img src="${contextPath}/postAds/${postYourAdAttachment.adFileModifiedName}" alt="Image" class="mfp-fade" style="width: 523px;">
	</a>
</div>
</div>
</c:if>
</c:forEach>
</div>
<c:if test="${postYourAd.postYourAdAttachments.size() gt 7}">
<div class="img-col-12">
		<div class="img-wrap">
			<a href="${contextPath}/user/more-ad-images?postAdId=${postYourAd.postYourAdId}" style="font-weight: bold;text-decoration:none;">
	More Images
	</a>
</div>
</div>
</c:if>
<c:set value="0" var="countdata"/>
<c:forEach items="${postYourAd.postAdUserLikes}" var="postAdUserLikes">
<c:if test="${userdisplay.email eq postAdUserLikes.email}">
<c:set value="${countdata+1}" var="countdata"/>
</c:if>
</c:forEach>
<div class="footer-timeline">
	<ul class="timeline-option">
		<li class="option-row">
			<div class="row">
				<div class="col-xs-6">
					<ol>
					<c:if test="${countdata eq 0}">
					<li><a href="javascript:void(0)" onclick="viewLikes('${varstatus.count}','${postYourAd.postYourAdId}')">Like</a></li>
					</c:if>
					</ol>
				</div>
				<div class="col-xs-6 text-right">
					<ol>
						<li><a href="#fakelink"><i class="fa fa-thumbs-o-up"></i> ${postYourAd.postAdUserLikes.size()}</a></li>
						<li><a href="#fakelink"><i class="fa fa-comments"></i> ${postYourAd.postYourAdComments.size()}</a></li>
			</ol>
		</div>
	</div>
</li>
<li class="option-row">
	<img src="${contextPath}/userProfiles/${userdisplay.userProfileModifiedName}" class="avatar" alt="Avatar">
	<div class="reply">
		<form role="form">
		<input type="text" class="form-control input-sm" placeholder="Write your comment..." id="comments${varstatus.count}">
		<label for="password" class="field-icon img-pos">
                  <a href="javascript:void(0);" onclick="viewcomment('${varstatus.count}','${postYourAd.postYourAdId}')"><i class="glyphicon glyphicon-forward"></i></a>
                 </label> 
		</form>
	</div>
</li>

<c:forEach items="${postYourAd.postYourAdComments}" var="postYourAdComment" varStatus="statusdata">
<c:if test="${statusdata.count ge 1 and statusdata.count le 4}">
<li class="option-row">
	<img src="${contextPath}/userProfiles/${postYourAdComment.userProfileModifiedName}" class="avatar" alt="Avatar">
	<div class="reply">
		<p><strong><a href="#fakelink">${postYourAdComment.userName}</a></strong> 
		${postYourAdComment.comments}</p>
		<p class="text-muted reply-time"><fmt:formatDate value="${postYourAdComment.commentDate}" pattern="MMM dd"/>, <fmt:formatDate value="${postYourAdComment.commentDate}" pattern="yyyy"/> at  <fmt:formatDate value="${postYourAdComment.commentDate}" pattern="hh:mm:ss aa"/></p>
	</div><!-- /.reply -->
</li>
</c:if>
</c:forEach>
<c:if test="${postYourAd.postYourAdComments.size() gt 4}">
<li class="option-row">
	<strong><a href="${contextPath}/user/more-ad-images?postAdId=${postYourAd.postYourAdId}"><i class="fa fa-comments"></i> View ${postYourAd.postYourAdComments.size()-4} more comment(s)</a></strong>
</li>
</c:if>
				
			</ul>
		</div>
	</div>
</li>
</c:forEach>
</ul>
</c:when>
<c:otherwise>
<c:if test="${not empty successmessage}">
<div class="alert alert-success fade in alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
${successmessage}
</div>
</c:if>
</c:otherwise>
</c:choose>









	
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
	$(function() {
		var projects = ${data};
		$( "#project" ).autocomplete({
			minLength: 0,
			source: projects,
			focus: function( event, ui ) {
				$( "#project" ).val( ui.item.label );
				return false;
			},
			select: function( event, ui ) {
				$( "#project" ).val( ui.item.label );
				$( "#project-id" ).val( ui.item.value );
				$( "#project-description" ).html( ui.item.desc );
				$( "#project-icon" ).attr( "src", ui.item.icon ).show();
				return false;
			}
		})
		.data( "ui-autocomplete" )._renderItem = function( ul, item ) {
			return $( "<li></li>" )
				.data( "item.autocomplete", item )
				.append( "<a> <img src='${contextPath}/userProfiles/"+item.icon + "' alt='no photo' style='width: 40px;height: 40px;position: relative;margin-top: -7px;margin-bottom: -28px;margin-right: 10px;border-radius: 50%;vertical-align: middle;'/>" + item.label + "<br><span style='margin-left:50px'>" + item.desc + "</span></a>" )
				.appendTo( ul );
		};
	});
	
	
	
	/* $(function($){
		 var i=1;
		 var flag = true;
		 $(window).scroll(function(){
			 var scrollLength = $(window).scrollTop();
			 var viewEnd = $(document).height() - $(window).height() -3500;
			 <c:if test="${not empty postYourAds}">
			 if(flag) {
				 if(scrollLength>viewEnd){
					flag = false;
					  $.get("${contextPath}/user/morePostAdsResults",{i:i},function(data){
						$('#itemLoader').remove();
					 	$("#moreResults").append(data).fadeIn(1200);
					 	flag = true;
				 	  });						  
					  i++; 
					  
				  } 
			 }
			  </c:if>
			  <c:if test="${empty postYourAds}">
			  	$('#itemLoader').html("No items available!");
			  </c:if>
		 });
	});  */
	
	function viewcomment(count,postyourAd){
		var comment = $("#comments"+count).val();
		$.get("${contextPath}/user/save-comments?postId="+postyourAd+"&comment="+comment).done(function(data){
			if(data.status=="success"){
				 window.location.reload(); 
			}
			
		});
	}
	
	function viewLikes(count,postyourAd){
		$.get("${contextPath}/user/save-likes?postId="+postyourAd).done(function(data){
			if(data.status=="success"){
				 window.location.reload(); 
			}
			
		});
	}
	
	</script>