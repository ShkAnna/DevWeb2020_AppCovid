<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
          		<li class="breadcrumb-item"><a href="dashboard-user">Home</a></li>
          		<li class="breadcrumb-item active">Mes amis</li>
        	</ul>
      	</div>
    </div>
	<section>
	<jsp:include page="/WEB-INF/jsp/view/modalDeleteUser.jsp" />
	<jsp:include page="/WEB-INF/jsp/view/modalAddUser.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
		     		<div class="row">
		      			<div class="col-lg-12">
							<div class="card">
						        <div class="card-header">
						        	<div class="row justify-content-between align-items-center ">
						        		<div class="col-auto">
						        			<h4  style="color:#E14557;">Mes amis</h4>
						        		</div>
						        		<div class="col-auto">
						        			 <button class="btn btn-primary rounded-lg" style="font-weight: bold;" type="button" data-toggle="modal" data-target="#modalAddUser" > Ajouter</button>
						        		</div>
						        	</div>
						        </div>
						        <div class="card-body" style="color:#0099cc;margin-top:-1rem">
						          	<div class="table-responsive" style="height:30vh;overflow-y:scroll;">
						            	<table class="table table-striped table-hover text-center" style="font-size: 1rem;">
						               		<thead>
						                 		<tr>
						                 			<th></th>
								                   	<th>Pseudo</th>
								                   	<th>Covid detectée</th>
								                   	<th>Supprimer des amis</th>
							                 	</tr>
						               		</thead>
						               		<tbody style="font-weight:bold;">
								              	<c:forEach items="${friends}" var="item">
				               						<tr>
								               			<td>
								               				<img src="${pageContext.request.contextPath}/images/photoProfil.png" alt="person" width="50" height="50" class="img rounded-circle">
								               			</td>
									               	 	<td>
												            ${item.pseudo} 												            
					          						  	</td>
	          						 			   		<td><i class="fa fa-check" style="color:#70af1c;"></i></td>
								                   		<td>
															<button type="button" class="btn btn-del" data-toggle="modal" data-target="#modalDeleteUser" data-username="USER-NAME">
																<i class="fa fa-trash" style="color:#E14557;"></i>
															</button>
								                   		</td>
								                 	</tr>
												</c:forEach>
							               	</tbody>
						             	</table>
						         	</div>
				       			</div>
			    			</div>
			    		</div>
		    		</div>
		    		
					<div class="row">
						
					</div>
		    	</div>
		    	<div class="col-lg-4 card">
		     		<div class="card-header">
			        	<div class="row align-items-center text-center">
			        		<div class="col-12">
			        			<h4  style="color:#E14557;">Mes amis qui sont malades</h4>
			        		</div>
			        	</div>
			        </div>
			        <div class="card-body" style="color:#0099cc;margin-top:-1rem; padding:1rem">
			          	<div class="table-responsive" style="height:30vh;overflow-y:scroll;">
			            	<table class="table table-striped table-hover text-center" style="font-size: 1rem;">
			               		<thead style="display:none;">
			                 		<tr>
			                 			<th class="w-25"></th>
					                   	<th class="w-75"></th>
				                 	</tr>
			               		</thead>
			               		<tbody style="font-weight:bold;">
				                 	<c:forEach items="${friends}" var="item">
			               				<tr>
							            	<td>
				               					<img src="${pageContext.request.contextPath}/images/photoProfil.png" alt="person" width="50" height="50" class="img rounded-circle">
				               				</td>
							            	<td>
									            ${item.pseudo} -
									            ${item.nom} -
									            ${item.prenom}
			          						 </td>
							             </tr>
									</c:forEach>
				               	</tbody>
			             	</table>
			         	</div>
	       			</div>
		    	</div>
		  	</div>
		  	<div class="row">
		  		<div class="col-lg-8">
		  			<div class="card align-items-center"> 
		        		<img class="img" width="60%" src="${pageContext.request.contextPath}/images/friends.png" >
		        	</div>
		        </div>
		        <div class="col-lg-4">
		        	<div class="card"> 
			           	<div class="card-header">
			            	<h4  style="color:#E14557;">Situation avec vos amis</h4>
			           	</div>
			           	<div class="card-body" style="color:#E14557;">
		                  <div class="chart-container">
		                    <canvas id="pieChart"></canvas>
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
	  		var notActive = navChange.getElementsByClassName("friends");
	  		console.log(notActive);
	  		Array.prototype.forEach.call(notActive, function forElement(element) {
	  		    element.classList.add("active");
	  		   });
	  	}

	  	//pie
	    var ctxP = document.getElementById("pieChart").getContext('2d');
	    var myPieChart = new Chart(ctxP, {
	      type: 'pie',
	      data: {
	        labels: ["Malades", "Pas malades"],
	        datasets: [{
	          data: [300, 50],
	          backgroundColor: ["#F7464A", "#A1C83F"],
	          hoverBackgroundColor: ["#FF5A5E", "#c6e086"]
	        }]
	      },
	      options: {
	          responsive: true,
	          legend: {
	            position: 'right',
	            labels: {
	              padding: 20,
	              boxWidth: 10
	            }
	          }
	        }
	      });
  	</script>
  </body>
</html>