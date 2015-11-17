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
<title>View Festival Images, Videos  & Musics</title>
<div class="container-fluid">
<br/>

<c:if test="${not empty festivalImages and festivalImages.size()>0}">
<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">Festival Images</a></li>
	</ol>
</div>
<div class="the-box">
<div class="table-responsive">
<table class="table table-striped table-hover" id="datatable-example">
	<thead class="the-box dark full">
		<tr>
			<th style="text-align: center;">S.NO</th>
			<th style="text-align: center;">Festival Image Name</th>
			<th style="text-align: center;">Action</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${festivalImages}" var="festivalImage" varStatus="status">
		<tr>
			<td style="text-align: center;">${status.count}</td>
			<td style="text-align: center;"><a href="${contextPath}/user/download-festival-image?festivalname=${festivalImage.festivalModifiedName}">${festivalImage.festivalImageName}</a></td>
			<td style="text-align: center;"><button type="button" class="btn btn-danger" style="margin-top:2px;" onclick="deleteFestivalDetails('${festivalImage.festivalImageId}','festivalImages','${festivalImage.festivalModifiedName}','${festivalId}')"><i class="glyphicon glyphicon-trash"></i>Delete</button></td>
		</tr>
	</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</c:if>


<c:if test="${not empty festivalVideos and festivalVideos.size()>0}">
<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">Festival Videos</a></li>
	</ol>
</div>
<div class="the-box">
<div class="table-responsive">
<table class="table table-striped table-hover" id="datatable-example1">
	<thead class="the-box dark full">
		<tr>
			<th style="text-align: center;">S.NO</th>
			<th style="text-align: center;">Festival Video Name</th>
			<th style="text-align: center;">Action</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${festivalVideos}" var="festivalVideo" varStatus="status">
		<tr>
			<td style="text-align: center;">${status.count}</td>
			<td style="text-align: center;"><a href="${contextPath}/user/download-festival-video?festivalname=${festivalVideo.festivalModifiedName}">${festivalVideo.festivalVideoName}</a></td>
			<td style="text-align: center;"><button type="button" class="btn btn-danger" style="margin-top:2px;" onclick="deleteFestivalDetails('${festivalVideo.festivalVideoId}','festivalVideos','${festivalVideo.festivalModifiedName}','${festivalId}')"><i class="glyphicon glyphicon-trash"></i>Delete</button></td>
		</tr>
	</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</c:if>



<c:if test="${not empty festivalMusics and festivalMusics.size()>0}">
<div class="the-box transparent full">
	<ol class="breadcrumb primary">
	  <li><a href="#fakelink">Festival Musics</a></li>
	</ol>
</div>
<div class="the-box">
<div class="table-responsive">
<table class="table table-striped table-hover" id="datatable-example2">
	<thead class="the-box dark full">
		<tr>
			<th style="text-align: center;">S.NO</th>
			<th style="text-align: center;">Festival Music Name</th>
			<th style="text-align: center;">Action</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${festivalMusics}" var="festivalMusic" varStatus="status">
		<tr>
			<td style="text-align: center;">${status.count}</td>
			<td style="text-align: center;"><a href="${contextPath}/user/download-festival-musics?festivalname=${festivalMusic.festivalModifiedName}">${festivalMusic.festivalMusicName}</a></td>
			<td style="text-align: center;"><button type="button" class="btn btn-danger" style="margin-top:2px;" onclick="deleteFestivalDetails('${festivalMusic.festivalMusicId}','festivalMusics','${festivalMusic.festivalModifiedName}','${festivalId}')"><i class="glyphicon glyphicon-trash"></i>Delete</button></td>
		</tr>
	</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</c:if>
</div>
</jsp:body>
</userTemplate:customerDefaultDecorator>
<script>
function deleteFestivalDetails(id,path,fileName,festivalId){
	 BootstrapDialog.confirm('Are you sure! You want Delete this Record?', function(result){
        if(result) {
        	$.get("${contextPath}/user/delete-details-by-id?id="+id+"&path="+path+"&fileName="+fileName+"&festivalId="+festivalId).done(function(data){
        		if(data.status=="success"){
        			 BootstrapDialog.alert(data.message, function(alertresult){
        				 if(alertresult){
        					 if(data.fullstatus=="success"){
        						 $(location).attr('href',"${contextPath}/user/add-festival-images");
        					 }else{
        						 window.location.reload(); 
        					 }
        					 
        				 }
        			 });
        		}
        	});
        }else {
        }
    });
}














</script>