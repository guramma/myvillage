<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Sentir, Responsive admin and dashboard UI kits template">
<meta name="keywords" content="admin,bootstrap,template,responsive admin,dashboard template,web apps template">
<meta name="author" content="Ari Rusmanto, Isoh Design Studio, Warung Themes">

<link href="${contextPath}/resources/user/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/weather-icon/css/weather-icons.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/prettify/prettify.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/magnific-popup/magnific-popup.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/owl-carousel/owl.theme.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/owl-carousel/owl.transitions.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/chosen/chosen.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/icheck/skins/all.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/datepicker/datepicker.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/summernote/summernote.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/markdown/bootstrap-markdown.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/datatable/css/bootstrap.datatable.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/morris-chart/morris.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/c3-chart/c3.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/slider/slider.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/salvattore/salvattore.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/plugins/toastr/toastr.css" rel="stylesheet">
<link href="${contextPath}/resources/bootstrap/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet">
<link href="${contextPath}/resources/wheather/example.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="${contextPath}/resources/user/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/css/style.css" rel="stylesheet">
<link href="${contextPath}/resources/user/assets/css/style-responsive.css" rel="stylesheet">
 <link rel="stylesheet" href="${contextPath}/resources/rating/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>	
<%--  <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/comet.chat.css"/> --%>
<style type="text/css">
.inputError, #errorpassword{
color: red;
}
.loader-block{position: fixed; left: 0; right: 0; top: 0; bottom: 0; z-index: 1000; width:100%; height: 100%; z-index: 2000; background: #000; opacity:0.8;}
.loader-block-inside{position: absolute; top: 50%; left: 50%; width:200px; height: 200px; margin: -100px 0 0 -100px; background-image: url("${contextPath}/resources/css/lightbox-ico-loading.gif"); background-repeat: no-repeat; background-position: center;}
</style>
</head>
 
	<body class="tooltips top-navigation">
		
		<div class="wrapper">
			<!-- BEGIN TOP NAV -->
			<div class="top-navbar dark-color">
				<div class="top-navbar-inner">
					<div class="logo-brand">
						<a href="index.html"><img src="${contextPath}/resources/loginandregister/assets/img/logos/MV-Logo-White.png" alt="My Village logo" style="width: 130px;margin-top: 2px;"></a>
					</div>
					
					<div class="top-nav-content main-top-nav-layout">
						<div class="btn-collapse-main-navigation" data-toggle="collapse" data-target="#top-main-navigation">
							<i class="fa fa-bars"></i> 
						</div>
						<div class="btn-collapse-sidebar-right">
							 <span class="visible-sm visible-md"><i class="fa fa-bullhorn"></i></span>
							  <span class="hidden-sm hidden-md">Chat</span>
						</div>
						
						<ul class="nav-user navbar-right">
							<li class="dropdown">
							  <a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">
								<img src="${contextPath}/userProfiles/${userdisplay.userProfileModifiedName}" class="avatar img-circle" alt="${userdisplay.firstName}">
								<sec:authentication var="userprincipal" property="principal" />
								<strong>${userdisplay.firstName} ${userdisplay.lastName}</strong>
							  </a>
							  <ul class="dropdown-menu square primary margin-list-rounded with-triangle">
								<li><a href="${contextPath}/user/change-password">Change password</a></li>
								<li><a href="${contextPath}/user/my-profile">My profile</a></li>
								<li class="divider"></li>
								<li><a href="${contextPath}/user/j_spring_security_logout">Log out</a></li>
							  </ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="top-main-navigation">
				<nav class="navbar square navbar-default no-border" role="navigation">
				  <div class="container-fluid">

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="top-main-navigation">
					  <ul class="nav navbar-nav">
						<li class="${dashboardactive?'active':''}">
						  <a href="${contextPath}/user/dashboard">
							  <span class="visible-sm visible-md"><i class="fa fa-dashboard"></i></span>
							  <span class="hidden-sm hidden-md">Dashboard</span>
						  </a>
						</li>
						
						<li class="${festivalsactive?'active':''}">
						  <a href="${contextPath}/user/all-festivals">
							  <span class="visible-sm visible-md"><i class="fa fa-flask"></i></span>
							  <span class="hidden-sm hidden-md">Festivals</span>
						  </a>
						</li>
						
						<li class="${festivalsImagesactive?'active':''}">
						  <a href="${contextPath}/user/add-festival-images">
							  <span class="visible-sm visible-md"><i class="fa fa-flask"></i></span>
							  <span class="hidden-sm hidden-md">Add Festival Images</span>
						  </a>
						</li>
						
						<li class="${emailsactive?'active':''}">
						  <a href="${contextPath}/user/emailinbox">
							  <span class="visible-sm visible-md"><i class="fa fa-flask"></i></span>
							  <span class="hidden-sm hidden-md">Emails</span>
						  </a>
						</li>
						
						<li class="${sarpanchactive?'active':''}">
						  <a href="${contextPath}/user/all-sarpanches">
							  <span class="visible-sm visible-md"><i class="fa fa-flask"></i></span>
							  <span class="hidden-sm hidden-md">Sarpanches</span>
						  </a>
						</li>
						
						<li class="${gkpbookactive?'active':''}">
						  <a href="${contextPath}/user/get-gkp-book">
							  <span class="visible-sm visible-md"><i class="fa fa-flask"></i></span>
							  <span class="hidden-sm hidden-md">GKP Book</span>
						  </a>
						</li>
						<li class="${schoolactive?'active':''}">
						  <a href="${contextPath}/user/get-gkp-school-info">
							  <span class="visible-sm visible-md"><i class="fa fa-flask"></i></span>
							  <span class="hidden-sm hidden-md">GKP School</span>
						  </a>
						</li>
						
						<li class="${schoolactive?'active':''}">
						  <a href="javascript:void(0)" id="share_button">
							  <span class="visible-sm visible-md"><i class="fa fa-flask"></i></span>
							  <span class="hidden-sm hidden-md">Share Link</span>
						  </a>
						</li>
						
						
						
					  </ul>
					</div>
				  </div>
				</nav>
			</div>
			
			
			
			<div class="sidebar-right-heading">
				<ul class="nav nav-tabs square nav-justified">
				  <li class="active"><a href="#online-user-sidebar" data-toggle="tab"><i class="fa fa-comments"></i></a></li>
				</ul>
			</div><!-- /.sidebar-right-heading -->
			<!-- BEGIN SIDEBAR RIGHT -->
			<div class="sidebar-right sidebar-nicescroller">
				<div class="tab-content">
				  <div class="tab-pane fade in active" id="online-user-sidebar">
					<ul class="sidebar-menu online-user">
					  <!--  <div id="members"></div> -->
						
					</ul>
				  </div>
				</div><!-- /.tab-content -->
			</div><!-- /.sidebar-right -->

			<div class="page-content no-left-sidebar">
				<jsp:doBody/>
				<footer>
					&copy; 2014 <a href="#fakelink">Your company</a><br />
					Design by <a href="http://isohdesign.com/" target="_blank">ids</a>. Purchase this item at <a href="http://goo.gl/wSCjxD" target="_blank">Themeforest</a>
				</footer>
			</div>
		</div>
		<input type="hidden" value="${userdisplay.firstName} ${userdisplay.lastName}" id="userName">
		<div id="back-top">
			<a href="#top"><i class="fa fa-chevron-up"></i></a>
		</div>

 <div class="allChatDivs">	
</div>


		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		<script src="${contextPath}/resources/user/assets/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/retina/retina.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/nicescroll/jquery.nicescroll.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/backstretch/jquery.backstretch.min.js"></script>
		<script src="${contextPath}/resources/bootstrap/bootstrap-dialog/js/bootstrap-dialog.min.js"></script> 
		<script src="${contextPath}/resources/rating/js/star-rating.js" type="text/javascript"></script>
		<script src="${contextPath}/resources/user/assets/plugins/skycons/skycons.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/prettify/prettify.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/owl-carousel/owl.carousel.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/chosen/chosen.jquery.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/icheck/icheck.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/timepicker/bootstrap-timepicker.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/mask/jquery.mask.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/datatable/js/bootstrap.datatable.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/summernote/summernote.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/markdown/markdown.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/markdown/to-markdown.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/markdown/bootstrap-markdown.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/slider/bootstrap-slider.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/newsticker/jquery.newsTicker.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/toastr/toastr.js"></script>
		<script src="${contextPath}/resources/wheather/jquery.zweatherfeed.min.js" type="text/javascript"></script>
		<script src="${contextPath}/resources/user/assets/plugins/jquery-knob/jquery.knob.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/jquery-knob/knob.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/morris-chart/raphael.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/morris-chart/morris.min.js"></script>
		<script src="${contextPath}/resources/user/assets/plugins/c3-chart/d3.v3.min.js" charset="utf-8"></script>
		<script src="${contextPath}/resources/user/assets/plugins/c3-chart/c3.min.js"></script>
		<script src="${contextPath}/resources/user/assets/js/apps.js"></script>
		<script src="${contextPath}/resources/user/assets/js/demo-panel.js"></script>
		<script src="${contextPath}/resources/user/assets/js/shrink-main-navigation.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/loginandregister/assets/js/jquery.validate.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script type="text/javascript" src="https://connect.facebook.net/en_US/all.js"></script>
       <%--  <script type="text/javascript" src="${contextPath}/resources/org/cometd.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/org/cometd/AckExtension.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/org/cometd/ReloadExtension.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/jquery/jquery-1.8.2.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/jquery/jquery.cookie.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/jquery/jquery.cometd.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/jquery/jquery.cometd-reload.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/jquery/chat.window.js"></script>
		<script type="text/javascript" src="${contextPath}/resources/jquery/comet.chat.js"></script> --%>
 
 
 <div id="fb-root"></div>
<script>
window.fbAsyncInit = function() {
FB.init({appId: '742100769251911', status: true, cookie: true,
xfbml: true});
};
(function() {
var e = document.createElement('script'); e.async = true;
e.src = document.location.protocol +
'//connect.facebook.net/en_US/all.js';
document.getElementById('fb-root').appendChild(e);
}());
</script>
 
 
         
<script type="text/javascript">
$(document).ready(function(){
$('#share_button').click(function(e){
e.preventDefault();
FB.ui(
{
method: 'feed',
name: 'This is the content of the "name" field.',
link: ' https://www.skadco.com/view-listings?userId=203',
picture: 'https://www.skadco.com/resources/design/images/skadco.png',
caption: 'This is the content of the "caption" field.',
description: 'This is the content of the "description" field, below the caption.',
message: ''
});
});
});
</script>
         
 <script language="javascript" type="text/javascript">
		var sessionTimeout = "<%=session.getMaxInactiveInterval()%>";
		var sessionTimeoutWarning = parseInt(sessionTimeout)-10;
		var mintues = sessionTimeout/60;
		var milliseconds = mintues*60000;
		setTimeout('Redirect()',milliseconds);
		//setTimeout('Redirect()',3000);
       function SessionWarning() {
           var minutesForExpiry = (parseInt(sessionTimeout) - parseInt(sessionTimeoutWarning));
           var message = "Your session will expire in another " + minutesForExpiry + " Seconds! Please refresh the page before the session expires";
           alert(message);
           setTimeout('Redirect()', (minutesForExpiry));
       }

       function Redirect() {
    	   var dialog = new BootstrapDialog({
               message: function(dialogRef){
                   var $message = $(
                		   "<form role='form'>"+
               				"<div class='form-group text-center'><img src='${contextPath}/userProfiles/${userdisplay.userProfileModifiedName}' class='avatar-lock img-circle' alt='Avatar' style='height: 133px;width: 120px;'></div>"+
               				"<div class='form-group'><h4 class='text-center'><strong>Paris Hawker</strong></h4></div>"+
               				"<div class='form-group has-feedback lg left-feedback no-label'>"+
               				"<input type='password' class='form-control no-border input-lg rounded' placeholder='Enter password' autofocus id='dialogPassword' title='Please Enter Password'>"+
               				"<span class='fa fa-unlock form-control-feedback'></span></div>"+
               				"<span id='errorpassword'></span>"+
               			   "</form>");
                   var $button = $('<button type="button" class="btn btn-primary btn-lg btn-block">Login</button>');
                   $button.on('click', function(event){
                	   var password = $("#dialogPassword").val();
                	   if(password==""){
                		   $("#errorpassword").html("Please Enter Password");
                	   }
                	   else{
                		   var oldPassword = "${userdisplay.password}";
                		   if(password!=oldPassword){
                			   $("#errorpassword").html("Please Enter Correct Password"); 
                		   }else{
                			   alert("Lokesh");
                		   }
                	   }
                       //event.data.dialogRef.close();
                   });
                   $message.append($button);
           
                   return $message;
               },
               closable: false
           });
           dialog.realize();
           dialog.getModalHeader().hide();
           dialog.getModalFooter().hide();
           /* dialog.getModalDialog().css('width','500px'); */
           dialog.getModalBody().css('background-color', '#0088cc');
           dialog.getModalBody().css('color', '#fff');
           dialog.open(); 
       }
       
</script>        
 <!-- <script type="text/javascript">
    
    var chatWindowArray = [];
    
    var config = {
        contextPath: '${pageContext.request.contextPath}'
    };
	
	function getChatWindowByUserPair(loginUserName, peerUserName) {
		
		var chatWindow;
		
		for(var i = 0; i < chatWindowArray.length; i++) {
			var windowInfo = chatWindowArray[i];
			if (windowInfo.loginUserName == loginUserName && windowInfo.peerUserName == peerUserName) {
				chatWindow =  windowInfo.windowObj;
			}
		}
		
		return chatWindow;
	}
	
	function createWindow(loginUserName, peerUserName) {
		
		var chatWindow = getChatWindowByUserPair(loginUserName, peerUserName);
		
		if (chatWindow == null) { //Not chat window created before for this user pair.
			chatWindow = new ChatWindow(); //Create new chat window.
			chatWindow.initWindow({
				loginUserName:loginUserName, 
				peerUserName:peerUserName,
				windowArray:chatWindowArray});
			
			//collect all chat windows opended so far.
			var chatWindowInfo = { peerUserName:peerUserName, 
					               loginUserName:loginUserName,
					               windowObj:chatWindow 
					             };
			
			chatWindowArray.push(chatWindowInfo);
    	}
		
		chatWindow.show();
		
		return chatWindow;
	}

	function join(userName){
		$.cometChat.join(userName);
	}
</script>
<script type="text/javascript">
	var userName = '${userdisplay.email}';
	$(function(){ 
		$.cometChat.onLoad({memberListContainerID:'members'});
		join(userName);
	});
</script>        -->   
	</body>
</html>