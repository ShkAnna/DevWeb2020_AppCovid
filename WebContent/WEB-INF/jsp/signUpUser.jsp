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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/checksScripts.js"></script>
	<script>
	    $(document).ready(function(){
	        $("form").submit(function(e){
	            if(!checkEmail($("#mail").val())){
	                displayError(".errorMail","Cette adresse email n'est pas valide");
	                e.preventDefault(e);
	            }
	            if(!checkLogin($("#login").val())){
	                displayError(".errorLogin","Votre pseudo doit avoir entre 4 et 50 charactères ");
	                e.preventDefault(e);
	            }
	            if(!checkName($("#name").val())){
	                displayError(".errorName","Vous devez entrez un nom valide");
	                e.preventDefault(e);
	            }
	            if(!checkName($("#surname").val())){
	                displayError(".errorSurname","Vous devez entrez un prénom valide");
	                e.preventDefault(e);
	            }
	            if(!checkDate(new Date($("#birthdate").val()))){
	                displayError(".errorBirthdate","Vous devez entrez un date d'anniversaire valide");
	                e.preventDefault(e);
	            }
	            return true;
	        });
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
					aussi ceux qui vous'entourent.
				</p>
				<img src="images/covid2.png" width="280" height="280">		                      
			</div>
			<div class="col-md-9 register-right">
				<div class="row justify-content-end" style="margin-top: 1rem !important;margin-bottom: 1rem !important;margin-right: 0rem !important;">
						<a class="col-3 col-lg-2 left-sign text-center"  aria-selected="true" href="sign-up-user">Sign up</a>
						<a class="col-3 col-lg-2 right-sign text-center"  aria-selected="false" href="sign-in-user">Sign in</a>		
				</div>
				<div class ="row h-50 align-items-center">
					<div class="col-12 tab-content" id="myTabContent">
						<form method="post" enctype="multipart/form-data" action="sign-up-user">
							<div class="form-row justify-content-center" style="margin-bottom: 1rem !important;">
								<h3>Create your account</h3>
							</div>
							<div class="form-row justify-content-center"  style="margin-bottom: 1rem !important;">
								<div class="col-3">
									<input  placeholder="Login *" class="form-control rounded-lg" type="text" id="login" name="login" value="${param.login}" required>
           							<span class="erreur">${erreurs['login']}</span>
								</div>
								<div class="col-3">
									<input placeholder="Password *" class="form-control rounded-lg" type="password" id="password" name="password" required>
          							
								</div>
							</div>
							<div class="form-row justify-content-center" style="margin-bottom: 1rem !important;">
								<button class="btn btn-primary rounded-lg" style="font-weight: bold;" type="submit">Sign in</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</body>
</html>
