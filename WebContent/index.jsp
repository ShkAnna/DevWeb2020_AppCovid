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
	<div class="containers">
	<div class="row justify-content-md-center">
	    <h1>Bonjour, selectionnez l'une des options</h1><br>
				<form action="IndexChoiceServlet" method="post" class="form-horizontal">
					<div class="form-group">
			            <div class="col col-lg-2">
							<input type="submit" class="btn btn-primary btn-lg" name="choice" value="Sign In as User">
							 <div class="divider"></div>
							<input type="submit" class="btn btn-primary btn-lg" name="choice" value="Sign In as Admin">
						</div>
					</div>
			</form>
			</div>
		</div>
</body>
</html>
