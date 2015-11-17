<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="count" value="${begin}"/>
<c:forEach items="${postYourAds}" var="postYourAd" varStatus="varstatus">
						<c:set value="${count+1}" var="count"/>
						<li class="item-timeline">
							<div class="buletan"></div>
							<div class="inner-content">
								<!-- BEGIN HEADINg TIMELINE -->
								<div class="heading-timeline">
									<img src="${contextPath}/userProfiles/${postYourAd.userProfileModifiedName}" class="avatar" alt="Avatar">
									<div class="user-timeline-info">
										<p>
										${postYourAd.userName}
										<small><fmt:formatDate value="${postYourAd.postYourAdDate}" pattern="MMM dd,yyyy"/> at <fmt:formatDate value="${postYourAd.postYourAdDate}" pattern="HH:mm:ss aa"/></small></p>
									</div><!-- /.user-timeline-info -->
								</div><!-- /.heading-timeline -->
								<!-- END ITEm TIMELINE -->
                                <h4>${postYourAd.title}</h4>
								<!-- BEGIN IMAGE WRAP -->
								<div class="img-wrap-col magnific-popup-wrap">
								<c:forEach items="${postYourAd.postYourAdAttachments}" var="postYourAdAttachment" varStatus="status">
								<c:if test="${status.count eq 1}">
								    <div class="img-col-12">
										<div class="img-wrap">
											<a class="zooming" href="${contextPath}/postAds/${postYourAdAttachment.adFileModifiedName}">
											<img src="${contextPath}/postAds/${postYourAdAttachment.adFileModifiedName}" alt="Image" class="mfp-fade" style="width: 523px;">
											</a>
										</div><!-- /.img-wrap -->
									</div><!-- /.img-col-3 -->
								</c:if>
								</c:forEach>
								
								<c:forEach items="${postYourAd.postYourAdAttachments}" var="postYourAdAttachment" varStatus="status">
								<c:if test="${status.count ge 2 and status.count le 7}">
								    <div class="img-col-3">
										<div class="img-wrap">
											<a class="zooming" href="${contextPath}/postAds/${postYourAdAttachment.adFileModifiedName}">
											<img src="${contextPath}/postAds/${postYourAdAttachment.adFileModifiedName}" alt="Image" class="mfp-fade" style="width: 523px;">
											</a>
										</div><!-- /.img-wrap -->
									</div><!-- /.img-col-3 -->
								</c:if>
								</c:forEach>
								<c:if test="${postYourAd.postYourAdAttachments.size() gt 7}">
								<div class="img-col-3">
										<div class="img-wrap">
											<a href="${contextPath}/user/more-ad-images?postAdId=${postYourAd.postYourAdId}">
											More Images
											</a>
										</div><!-- /.img-wrap -->
									</div><!-- /.img-col-3 -->
								</c:if>
								</div><!-- /.img-wrap-col -->
								<!-- END IMAGE WRAP -->
								
								<!-- BEGIN FOOTER TIMELINE -->
								<div class="footer-timeline">
									<ul class="timeline-option">
										<li class="option-row">
											<div class="row">
												<div class="col-xs-6">
													<ol>
														<li><a href="#fakelink">Like</a></li>
														<li><a href="#fakelink">Comment</a></li>
													</ol>
												</div>
												<div class="col-xs-6 text-right">
													<ol>
														<li><a href="#fakelink"><i class="fa fa-thumbs-o-up"></i> 124</a></li>
														<li><a href="#fakelink"><i class="fa fa-comments"></i> 26</a></li>
													</ol>
												</div><!-- /.col-xs-6 -->
											</div><!-- /.row -->
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
											<strong><a href="#fakelink"><i class="fa fa-comments"></i> View ${postYourAd.postYourAdComments.size()-1} more comment(s)</a></strong>
										</li>
										</c:if>
										
									</ul>
								</div>
							</div>
						</li>
						</c:forEach>