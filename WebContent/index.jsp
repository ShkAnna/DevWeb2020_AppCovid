<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>AppCovid</title>
	<!-- <link rel="stylesheet" href="../css/style.css"> -->
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
	<div class="container" style="margin-right: auto; margin-left: auto;">

    <h1>Bonjour, selectionnez l'une des options</h1>
    	<div class="row justify-content-md-center">
	<form action="SignInUser" method="post" class="form-horizontal">
		<div class="form-group">
            <div class="col col-lg-2">
				<input type="submit" class="btn btn-primary btn-lg" value="SignInUser">
			</div>
		</div>
	</form>
	<form action="SignInAdmin" method="post" class="form-horizontal">
		<div class="form-group">
            <div class="col col-lg-2">
				<input type="submit" class="btn btn-primary btn-lg" value="SignInAdmin">
			</div>
		</div>
	</form>
	</div>
	</div>
</body>
</html>