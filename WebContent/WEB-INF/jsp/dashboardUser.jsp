<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
							<div class="card" style="height:90%;">
						        <div class="card-header">
						        	<h4  style="color:#E14557;">Important</h4>
						        </div>
						        <div class="card-body" style="color:#0099cc;">
						          	<div class="row ">
						     			<div class="col-7">
						      				<div class="row-fluid" style="margin-bottom: 1rem !important;">
						           				<a class ="btn-block a-menu" href="https://media.interieur.gouv.fr/attestation-couvre-feu-covid-19/">
						           					<i class="fa fa-file"></i> Attestation de déplacement
						           				</a>
						           			</div>
							           		<div class="row-fluid">
								           		<a class ="btn-block a-menu" href="https://sante.fr/recherche/trouver/DepistageCovid">
								           			<span class="fa fa-map-marker"></span> Où me faire dépister ?
								           		</a>
							           		</div>
							     		</div>
						     			<div class="col-5">
											<img class="img-fluid" src="${pageContext.request.contextPath}/images/info.png" >
						     			</div>
						     		</div>
				       			</div>
			    			</div>
			    		</div>
				        <div class="col-lg-6">
				        	<div class="card"  style="height:90%;"> 
					           	<div class="card-header">
					            	<h4  style="color:#E14557;">Me déclarer </h4>
					           	</div>
					         
							<c:choose>
								<c:when test="${positif}">
								<div class="card-body" style="color:#E14557;">
						            <div class="row ">
							            <div class="col-7">
							            	<div class="row-fluid" style="margin-bottom: 1rem !important;">
							            		<strong><span>Vous avez été guéri du COVID-19?</span></strong>
											</div>
							             	<div class="row-fluid">
							             		<button class="btn btn-info rounded-lg" style="font-weight: bold;" type="submit"
							             		onclick="window.location.href='negatif'">Oui</button>
							             	</div>
							             </div>
							             <div class="col-5">
							             	<img class="img-fluid" src="${pageContext.request.contextPath}/images/notify.png" >
							             </div>
						            </div>
					           	</div>
					           	</c:when>
								<c:otherwise>
									<div class="card-body" style="color:#E14557;">
							            <div class="row ">
								            <div class="col-7">
								            	<div class="row-fluid" style="margin-bottom: 1rem !important;">
								            		<strong><span>Vous avez été diagnostiqué comme un cas de COVID-19?</span></strong>
												</div>
								             	<div class="row-fluid">
								             		<button class="btn btn-info rounded-lg" style="font-weight: bold;" type="submit" onclick="window.location.href='positif'">Oui</button>
								             	</div>
								             </div>
								             <div class="col-5">
								             	<img class="img-fluid" src="${pageContext.request.contextPath}/images/notify.png" >
								             </div>
							            </div>
						           	</div>
					           	 </c:otherwise>
							</c:choose>
				        	</div>
				        </div>
		    		</div>
		    		<div class="row-fluid card" >
		    			<div class="col-12">
							<div id="corona_container_tab"></div>
						</div>
					</div>
					<div class="row-fluid" >
						<div class="col-12">
							<div id="corona_container"></div>
						</div>
					</div>
		    	</div>
		    	<div class="col-lg-4 card h-100">
		     		<div class="row justify-content-center">
		     			<h3 id="appStateTxt" class="text-center appOff">Votre application n'est pas activé</h3>	            	
		   			</div>
		   			<div class="row justify-content-center">
		     			<img id="appStateImg" class="img-fluid" src="${pageContext.request.contextPath}/images/appOff.png" >
		   			</div>
		   		 	<div class="row justify-content-center">
		   		 	    <button id="appStateBtn" class="btn btn-primary rounded-lg" style="font-weight: bold; margin-bottom: 2rem !important;" onclick="changeAppState()" type="submit">Activer</button>
		   		 	</div>
		   			<div class="row justify-content-center">
		   		 		<h3 id="appStateTxt" class="text-center" style="color:#0099cc;">La dernière utilisation</h3>	            	
			   		 	<div class="table-responsive">
			            	<table class="table table-striped table-hover text-center">
			               		<thead>
			                 		<tr>
					                   	<th>Date</th>
					                   	<th>Durée</th>
					                   	<th>Covid detectée</th>
				                 	</tr>
			               		</thead>
			               		<tbody>
				               		<tr>
				                   		<td>21/12/2020</td>
				                   		<td>2:50:00</td>
				                   		<td><i class="fa fa-check" style="color:#70af1c;"></i></td>
				                 	</tr>
				                 	<tr>
					                   	<td>18/12/2020</td>
					                   	<td>0:30:00</td>
					                   	<td><i class="fa fa-times" style="color:#E14557;"></i></td>
				                 	</tr>
				                 	<tr>
					                   	<td>15/12/2020</td>
					                   	<td>12:00:00</td>
					                   	<td><i class="fa fa-times" style="color:#E14557;"></i></td>
				                 	</tr>
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