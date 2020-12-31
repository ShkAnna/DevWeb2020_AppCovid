<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>AppCovid</title>
	 	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
		<!-- bootstrap 3.0.2 -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${pageContext.request.contextPath}/resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.css" rel="stylesheet" type="text/css" />
	
</head>
<body>
	<div class="container containers">
		<div class="row">
	   		<div class="col">
	   			<h1>Bonjour, selectionnez l'une des options</h1>
	   		</div>
	   	</div>
		<div class="row">
            <div class="col-sm-12 col-md-4">
				<a href="/sign-in-user" class="btn btn-primary btn-lg">Sign In as User</a>
			</div>
            <div class="col-sm-12 col-md-4">
				<a href="/sign-in-admin" class="btn btn-primary btn-lg">Sign In as Admin</a>
			</div>
		</div>
	</div>
</body>
</html>
