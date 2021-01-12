<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    

    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>AppCovid</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
   	
   	<jsp:include page="/WEB-INF/jsp/view/cssCollection.jsp" />
   	
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/view/sideNavbar.jsp" />
    <div class="page">
   	<jsp:include page="/WEB-INF/jsp/view/header.jsp" /> 	
    <!-- Breadcrumb-->
    <div class="breadcrumb-holder">
    	<div class="container-fluid">
        	<ul class="breadcrumb">
          		<li class="breadcrumb-item active"><a href="dashboard-user">Home</a></li>
          		<li class="breadcrumb-item active">Mes activités</li>
          		<!-- <li class="breadcrumb-item active">Tables</li> -->
        	</ul>
      	</div>
    </div>
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
		     		<div class="row">
		      			<div class="col-lg-6">
							
							 <h1>Nouvelle activité</h1>
        <form method="post" action="nouvelle-activite" >
            <div><label for="startDate" >Début de l'activité</label></div>
            <div class="form-row">
                <div class="col"><input class="form-control" type="time" id="startTime" name="startTime"><br></div>
                <div class="col"><input class="form-control" type="date" id="startDate"  name="startDate"  min="2019-09-01"><br><br></div>
            </div>
            <div><label for="endDate" >Fin de l'activité</label></div>
            <div class="form-row">
                <div class="col"> <input  class="form-control" type="time" id="endTime" name="endTime"><br></div>
                <div class="col"><input class="form-control" type="date" id="endDate" name="endDate"  min="2019-09-01"><br><br></div>
                <div class="errorDate" style="display:none;"></div>
                <div class="errorHour" style="display:none;"></div>
            </div>
            <div>
                <label for="place" >Choisissez un lieu :</label>
                <select class="form-control" name="place" id="place" required>
                    <c:forEach items="${places}" var="item">
                        <option value="${item.id}">  ${item.name}<br></option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <br>
                <br>
                <button class="btn btn-primary mb-2" type="submit" id="submitButton">Ajouter l'activité</button>
            </div>
            
        </form>
        <div><button type="submit" class="btn btn-primary mb-2" onclick="window.location.href='nouveauLieuServlet'">Ajouter un nouveau lieu</button></div>
        
			    		</div>
				        
		    		</div>		    							
		    	</div>
		    	<div class="col-lg-4 card h-100">
		     		<div class="row justify-content-center">
		     			<h3 id="appStateTxt" class="text-center appOff">Vos activités</h3>	            	
		   			</div>
		   			<div class="row justify-content-center">		   		  	
			   		 	<div class="table-responsive">
			            	<table class="table table-striped table-hover text-center">
			               		<thead>
			                 		<tr>
					                   	<th>Date debut</th>
					                   	<th>Date fin</th>
					                    <th>Lieu</th>
					                    <th>Supprimer</th>
				                 	</tr>
			               		</thead>
			               		<tbody style="font-weight:bold;">
			               		
			               		<c:forEach items="${activity}" var="pos">
				                 				                 		
			               			
				               		<tr>
				                   		<td>${pos.startDate} </td>
				                   		<td>${pos.endDate}</td>
				                   		<td>${pos.nomPlace}</td>
				                   		<td>  <button type="button" class="btn btn-danger" onclick="window.location.href='deleteActivityUser?id=${pos.id}'" width="50" height="50" >Supprimer
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
	</section>
    <jsp:include page="/WEB-INF/jsp/view/footer.jsp" />
    </div>
  	<jsp:include page="/WEB-INF/jsp/view/script.jsp" />
  </body>
</html>