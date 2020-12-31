<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>AppCovid</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
   	<meta name="robots" content="noindex">
   	
  		<!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
    
       	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontastic.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/grasp_mobile_progress_circle-1.0.0.min.css">
    <!-- Custom Scrollbar-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.green.css" id="theme-stylesheet">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
 
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	    window.alert = function(){};
	    var defaultCSS = document.getElementById('bootstrap-css');
	    function changeCSS(css){
	        if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
	        else $('head > link').filter(':first').replaceWith(defaultCSS); 
	    }
	    $( document ).ready(function() {
	      var iframe_height = parseInt($('html').height()); 
	      window.parent.postMessage( iframe_height, '/');
	    });
	</script>
</head>
<body>
	<div class="container h-100 register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img class="im1" src="images/covid.png" >              
				<h3>Bienvenue</h3>
				<p>
					La free app web Covid pour protéger 
					non seulement votre santé mais 
					aussi ceux qui t'entourent.
				</p>
				<img src="images/covid2.png" width="300" height="300">		                      
			</div>
			<div class="col-9 register-right">
				<div class="row justify-content-end" style="margin-right:-1%;">
				<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item">
						<a href="sign-up-user" aria-selected="false">Sign up</a>
					</li>
					<li class="nav-item">
						<a href="sign-in-user" aria-selected="true">Sign in</a>
					</li>
				</ul>                  
				</div>
				<form method="post" action="sign-in-user">
					<h2  class="register-heading">Glad to see you!</h2>
					<div class="row justify-content-center" style="margin-top:20px;">
						<div class="col-4 text-center">
							<input placeholder="Login " type="text" id="login" name="login" required>                                
						</div>
						<div class="col-4 text-center">
							<input placeholder="Password" type="password" id="password" name="password" required>
						</div>
					</div>
					<div class= "row justify-content-center" style="margin-top:20px;">
						<div class="col-12 text-center">
							<input type="submit" class="btn btn-primary btn-md rounded-lg" style="padding:0.5rem 1rem;" value="Sign in"/>
						</div>
					</div>
				</form>
				
			</div>
		</div>	
	</div>
	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</body>
</html>
