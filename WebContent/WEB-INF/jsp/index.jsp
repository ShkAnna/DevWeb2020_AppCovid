<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%;">
<head>
	<meta charset="UTF-8">
	<title>AppCovid</title>
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
		    <!-- Custom stylesheet - for your changes-->
		    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
		    <!-- Favicon-->
		    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
</head>
<body style="height:100%;">
	<div class="container h-100">   
		<div class="row align-items-center h-100">
			<div class="col-12 text-center">
				<div class="row" style="margin-bottom: 1.5rem !important;">
					<div class="col-12 text-center">
						<h1>Bonjour, selectionnez l'une des options</h1>
					</div>
				</div>
				<div class="row justify-content-center">
					<a  href="sign-in-user" class="col-3 text-center a-modif">Sign In as User</a>
					<a href="sign-in-admin" class="col-3 text-center a-modif" style="margin-left:5%;">Sign In as Admin</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
