<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Login Page | Village</title>
  <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
  <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
  <meta name="author" content="AbsoluteAdmin">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/loginandregister/assets/skin/default_skin/css/theme.css">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/loginandregister/assets/admin-tools/admin-forms/css/admin-forms.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/loader.css"/> 
  <link rel="shortcut icon" href="${contextPath}/resources/loginandregister/assets/img/favicon.ico">
<style type="text/css">
.inputError{
color: red;
}
.loader-block{position: fixed; left: 0; right: 0; top: 0; bottom: 0; z-index: 1000; width:100%; height: 100%; z-index: 2000; background: #000; opacity:0.8;}
.loader-block-inside{position: absolute; top: 50%; left: 50%; width:200px; height: 200px; margin: -100px 0 0 -100px; background-image: url("${contextPath}/resources/css/lightbox-ico-loading.gif"); background-repeat: no-repeat; background-position: center;}
</style>

  <script type="text/javascript">
  (function() {
    var po = document.createElement('script');
    po.type = 'text/javascript'; po.async = true;
    po.src = 'https://plus.google.com/js/client:plusone.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
  })();
  </script>
</head>

<body class="external-page sb-l-c sb-r-c">
  <div id="main" class="animated fadeIn">
    <section id="content_wrapper">
      <div id="canvas-wrapper">
        <canvas id="demo-canvas"></canvas>
      </div>
      <section id="content">
        <div class="admin-form theme-info" id="login1">
          <div class="row mb15 table-layout">
            <div class="col-xs-6 va-m pln">
              <a href="dashboard.html" title="Return to Dashboard">
                <img src="${contextPath}/resources/loginandregister/assets/img/logos/logo_white.png" title="AdminDesigns Logo" class="img-responsive w250">
              </a>
            </div>

            <div class="col-xs-6 text-right va-b pr5">
              <div class="login-links">
                <a href="${contextPath}/sign-up" class="active" title="Sign Up">Sign Up</a>
              </div>
            </div>
          </div>

          <div class="panel panel-info mt10 br-n">
            <div class="panel-heading heading-border bg-white">
              <span class="panel-title hidden">
                <i class="fa fa-sign-in"></i>Register</span>
              <div class="section row mn">
                 <div class="col-sm-4">
                  <a href="javascript:void(0);" class="button btn-social facebook span-left mr5 btn-block" onclick="facebookLogin()">
                    <span>
                      <i class="fa fa-facebook"></i>
                    </span>Facebook</a>
                </div>
                <div class="col-sm-4">
                  <a href="javascript:void(0);" class="button btn-social twitter span-left mr5 btn-block" onclick="doTWSignIn()">
                    <span>
                      <i class="fa fa-twitter"></i>
                    </span>Twitter</a>
                </div>
                <div class="col-sm-4">
                 <button class="g-signin button btn-social googleplus span-left btn-block"
									data-scope="https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email"
									data-requestvisibleactions="http://schemas.google.com/AddActivity"
									data-clientId="378578336151-2e84bss75kp699ivffbprtslmv7a8pk2.apps.googleusercontent.com"
									data-accesstype="offline"
									data-callback="mycoddeSignIn"
									data-theme="dark"
									data-cookiepolicy="single_host_origin">
                          <span>
                            <i class="fa fa-google-plus"></i>
                          </span>Google+</button>
                </div>
              </div>
            </div>

            <form method="post" action="${contextPath}/user/j_spring_security_check" id="loginvalidation">
              <div class="panel-body bg-light p30">
                <div class="row">
                  <div class="col-sm-7 pr30">

                    <div class="section row hidden">
                       <div class="col-md-4">
                        <a href="javascript:void(0);" class="button btn-social facebook span-left mr5 btn-block" onclick="facebookLogin()">
                          <span>
                            <i class="fa fa-facebook"></i>
                          </span>Facebook</a>
                      </div>
                      <div class="col-md-4">
                        <a href="#" class="button btn-social twitter span-left mr5 btn-block">
                          <span>
                            <i class="fa fa-twitter"></i>
                          </span>Twitter</a>
                      </div>
                      <div class="col-md-4">
                       <button class="g-signin button btn-social googleplus span-left btn-block"
									data-scope="https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email"
									data-requestvisibleactions="http://schemas.google.com/AddActivity"
									data-clientId="364682540411-9jctr6d2fo5o3egspd4o7gr0hhqdrpfb.apps.googleusercontent.com"
									data-accesstype="offline"
									data-callback="mycoddeSignIn"
									data-theme="dark"
									data-cookiepolicy="single_host_origin">
                          <span>
                            <i class="fa fa-google-plus"></i>
                          </span>Google+</button>
                      </div>
                    </div>

                    <div class="section">
                      <label for="username" class="field-label text-muted fs18 mb10">Email</label>
                      <label for="username" class="field prepend-icon">
                        <input type="email" name="j_username" id="email" class="gui-input" placeholder="Enter Email">
                        <label for="username" class="field-icon">
                          <i class="fa fa-user"></i>
                        </label>
                      </label>
                    </div>
                    <!-- end section -->

                    <div class="section">
                      <label for="username" class="field-label text-muted fs18 mb10">Password</label>
                      <label for="password" class="field prepend-icon">
                        <input type="password" name="j_password" id="password" class="gui-input" placeholder="Enter password">
                        <label for="password" class="field-icon">
                          <i class="fa fa-lock"></i>
                        </label>
                      </label>
                    </div>
                    <!-- end section -->

                  </div>
                  <div class="col-sm-5 br-l br-grey pl30">
                    <h3 class="mb25"> Login Rules:</h3>
                    <p class="mb15">
                      <span class="fa fa-check text-success pr5"></span> Enter Valid User Email</p>
                    <p class="mb15">
                      <span class="fa fa-check text-success pr5"></span> Enter Valid User Password</p>
                    <p class="mb15">
                      <span class="fa fa-check text-success pr5"></span> Password Must be 6 Digits Long</p>
                  </div>
                </div>
              </div>
              <!-- end .form-body section -->
              <div class="panel-footer clearfix p10 ph15">
                <button type="submit" class="button btn-primary mr10 pull-right">Log In</button>
                <label class="switch ib switch-primary pull-left input-align mt10">
                  <input type="checkbox" name="remember" id="remember" checked>
                  <label for="remember" data-on="YES" data-off="NO"></label>
                  <span>Remember me</span>
                </label>
              </div>
            </form>
          </div>
        </div>
      </section>
    </section>
  </div>
    <div class ="loader-block" style="display: none;">
	<div class ="loader-block-inside">
		
	</div>
</div>
  <script src="${contextPath}/resources/loginandregister/jquery/jquery-1.11.1.min.js"></script>
  <script src="${contextPath}/resources/loginandregister/jquery/jquery_ui/jquery-ui.min.js"></script>
  <script src="${contextPath}/resources/loginandregister/canvasbg/canvasbg.js"></script>
  <script src="${contextPath}/resources/loginandregister/assets/js/utility/utility.js"></script>
  <script src="${contextPath}/resources/loginandregister/assets/js/demo/demo.js"></script>
  <script src="${contextPath}/resources/loginandregister/assets/js/main.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/loginandregister/assets/js/jquery.validate.js"></script>
   <script type="text/javascript" src="https://connect.facebook.net/en_US/all.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/facebook/facebook.js"></script>
  
  <!-- Page Javascript -->
  <script type="text/javascript">
  
  function facebookLogin(){
		FB.login(function(response) {
			if (response.authResponse) {
				FB.api('/me?fields=email,first_name,last_name', function(response) {
					$.get("${contextPath}/getUserDetailsByEmail?email="+response.email).done(function(data){
						if(data.fullstatus=="success"){
							$(".loader-block, .loader-block-inside").show();
							 var field = "j_username="+data.email+"&j_password="+data.password; 
							 $.post('${contextPath}/guest/j_spring_security_check?'+field,function(res){
								 window.location.href="${contextPath}"+res;
							 }); 
						}
						else{
							window.location.href="${contextPath}/facebooksignup?firstName="+response.first_name+"&lastName="+response.last_name+"&email="+response.email;
						}
					});
				});
			}
		}, {scope: 'email,public_profile', return_scopes: true});
	};
  
  
  
  
  
  
  
  
  
  
  
  
 $(function() {

    "use strict";
    Core.init();
    Demo.init();
    CanvasBG.init({
      Loc: {
        x: window.innerWidth / 2,
        y: window.innerHeight / 3.3
      },
    });
    
    
    
    $("#loginvalidation").validate({
    	errorClass:'inputError',
    	validClass:'InputSuccess',
    	rules: {
    		j_username:{required:true,email:true},
    		j_password:{required:true,minlength:6}
    		},
    		
    	messages: {			
    		j_username: {
    			required: "Please enter email address.",
    			email : "Please enter a valid email address."
    		},
    		j_password:{
    			required:"Please enter password.",
    			minlength:"Password Must be 6 Digits Long."
    		},
    	},
    	submitHandler: function(form) {	
    		$(".loader-block, .loader-block-inside").show();
    		form.submit();
    		}
    	});
  });
  </script>
  
  <script type="text/javascript">
	var gpclass = (function(){
	var response = undefined;
	return {
		mycoddeSignIn:function(response){
			if (response['access_token']) {
				gapi.client.load('plus','v1',this.getUserInformation);
			} else if (response['error']) {
			}
		},
		
		getUserInformation: function(){
			var request = gapi.client.plus.people.get( {'userId' : 'me'} );
			request.execute( function(profile) {
				var email = profile['emails'].filter(function(v) {
					return v.type === 'account'; // Filter out the primary email
				})[0].value;
				var fName = profile.displayName;
				alert(fName+" "+email);
				$("#inputFullname").val(fName);
				$("#inputEmail").val(email);
			});
		}
	};
	})();
	
	function mycoddeSignIn(gpSignInResponse){
		gpclass.mycoddeSignIn(gpSignInResponse);
	}
	</script>
  
    
  
  
</body>
</html>