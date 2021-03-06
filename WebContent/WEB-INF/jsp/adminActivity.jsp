<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>AppCovid</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
   	<meta name="robots" content="noindex">
   	
   	<jsp:include page="/WEB-INF/jsp/view/cssCollection.jsp" />
</head>
<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>
<body>
    <jsp:include page="/WEB-INF/jsp/view/sideNavbarAdmin.jsp" />
    <div class="page">
   	<jsp:include page="/WEB-INF/jsp/view/headerAdmin.jsp" /> 	
    <!-- Breadcrumb-->
    <div class="breadcrumb-holder">
    	<div class="container-fluid">
        	<ul class="breadcrumb">
          		<li class="breadcrumb-item"><a href="dashboard-admin">Home</a></li>
          		<li class="breadcrumb-item active">Administrer les activités</li>
        	</ul>
      	</div>
    </div>
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
				        <div class="card-header">
				        	<div class="row justify-content-between align-items-center ">
				        		<div class="col-auto">
				        			<h4  style="color:#E14557;">Liste des activités</h4>
				        		</div>
				        		<div class="col-auto">
					        		<div class="input-group" >
									    <input id="myInput" type="text" class="form-control" placeholder="Rechercher utilisateur">
									    <div class="input-group-append">
										    <button class="btn btn-secondary" type="button">
										        <i class="fa fa-search"></i>
										    </button>
									    </div>
								  	</div>
				        		</div>
				        	</div>
				        </div>
				        <div class="card-body" style="color:#0099cc;margin-top:-1rem">
				          	<div class="table-responsive" style="height:30vh;overflow-y:scroll;">
				            	<table class="table table-striped table-hover text-center" style="font-size: 1rem;">
				               		<thead>
				                 		<tr>
				                 				<th>Nom</th>
										        <th>Adresse</th>
										         <th>Date debut</th>
										          <th>Date fin</th>
										        <th>Supprimer</th>
										        
					                 	</tr>
				               		</thead>
				               		<tbody id="myTable" style="font-weight:bold;">
									<c:forEach items="${activity}" var="item">
								    <tr>
								        <td>${item.nomPlace}</td>
								        <td>${item.pseudo}</td>
								         <td>${item.startDate}</td>
								        <td>${item.endDate}</td>
								        
								          <td>  <button type="button" class="btn btn-danger" onclick="window.location.href='deleteActivity?id=${item.id}'" width="50" height="50" >Supprimer
										<i class="fa fa-trash" style="color:#E14557;"></i>
										</button></td>
												
																			
								       
								    </tr>
								    </c:forEach>
					               	</tbody>
				             	</table>
				         	</div>
		       			</div>
	    			</div>
		    	</div>
		    </div>
		</div>
	</section>
    <jsp:include page="/WEB-INF/jsp/view/footer.jsp" />
    </div>
  	<jsp:include page="/WEB-INF/jsp/view/script.jsp" />
	<script>
	  	window.onload = function() {
	  	  changeActiveLi();
	  	};
	  	function changeActiveLi() {
	  		var navChange = document.getElementById("side-main-menu");
	  		var active = navChange.getElementsByClassName("active");
	  		Array.prototype.forEach.call(active, function forElement(element) {
	  		    element.classList.remove("active");
	  		   });
	  		var notActive = navChange.getElementsByClassName("users");
	  		
	  		Array.prototype.forEach.call(notActive, function forElement(element) {
	  		    element.classList.add("active");
	  		   });
	  	}
	    $(document).ready(function(){
	        $("#myInput").on("keyup", function() {
	            var value = $(this).val().toLowerCase();
	            $("#myTable tr").filter(function() {
	                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	            });
	        });
	    });
	</script>
</body>

</html>












