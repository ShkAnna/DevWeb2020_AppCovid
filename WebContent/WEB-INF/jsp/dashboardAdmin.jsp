<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
	
	
    
	
</head>
<body>
	<div class="container h-100 register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img class="im1" src="images/covid.png" >              
				<h3>Bienvenue </h3>
				
				<img src="images/covid2.png" width="280" height="280">		                      
			</div>
			
				<div class ="row align-items-center" style="height:80%;">
				 <div><button type="submit" class="btn btn-primary mb-2" onclick="window.location.href='adminstrate-users'"><h4>Administrer les utilisateurs</h4></button></div>
				    <br>
				    <div><button type="submit" class="btn btn-primary mb-2" onclick="window.location.href='admin-activities'"> <h4>Administrer les activités</h4> </button></div>
				    <br>
				    <div><button type="submit" class="btn btn-primary mb-2" onclick="window.location.href='admin-places'"> <h4>Administrer les lieux</h4> </button></div>
				    <br>
				
		                <a href="logout" class="nav-link logout">
			                <span class="d-none d-sm-inline-block" style="font-size:20px;">Logout</span>
			                <i class="fa fa-sign-out" style="font-size:20px;"></i>
	                	</a>
					
	                	
			                
	                
		</div>
		
	</div>
	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</body>
</html>

