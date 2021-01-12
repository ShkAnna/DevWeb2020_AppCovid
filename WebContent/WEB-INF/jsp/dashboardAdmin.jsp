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
   	
   	<jsp:include page="/WEB-INF/jsp/view/cssCollection.jsp" />
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/view/sideNavbarAdmin.jsp" />
    <div class="page">
   	<jsp:include page="/WEB-INF/jsp/view/headerAdmin.jsp" /> 	
    <!-- Breadcrumb-->
    <div class="breadcrumb-holder">
    	<div class="container-fluid">
        	<ul class="breadcrumb">
          		<li class="breadcrumb-item active"><a href="dashboard-admin">Home</a></li>
          		<!-- <li class="breadcrumb-item active">Tables</li> -->
        	</ul>
      	</div>
    </div>
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
		     		<div class="row">
		      			<div class="col-lg-12">
							<div class="card">
						        <div class="card-header">
						        	<div class="row justify-content-between align-items-center ">
						        		<div class="col-auto">
						        			<h4  style="color:#E14557;">Lieux les plus visités</h4>
						        		</div>
						        	</div>
						        </div>
						        <div class="card-body" style="color:#0099cc;margin-top:-1rem">
						          	<div class="table-responsive" style="height:30vh;overflow-y:scroll;">
						            	<table class="table table-striped table-hover text-center" style="font-size: 1rem;">
						               		<thead>
						                 		<tr>
						                 			<th>Lieux</th>
								                   	<th>Nombre des visites</th>
							                 	</tr>
						               		</thead>
						               		<tbody style="font-weight:bold;">
								              	<c:forEach items="${friends}" var="item">
				               						<tr>
								               			<td>
								               				<!-- Lieux -->
								               			</td>
									               	 	<td>
												            <!-- Nbr -->									            
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
		    	</div>
		    	<div class="col-lg-4">
		     		<div class="card"> 
			           	<div class="card-header">
			            	<h4  style="color:#E14557;">Situation avec les utilisateurs </h4>
			           	</div>
			           	<div class="card-body" style="color:#E14557;">
		                  <div class="chart-container">
		                    <canvas id="pieChart"></canvas>
		                  </div>
			           	</div>
		        	</div>
		        </div>
		    </div>
		  	<div class="row">
		  		<div class="col-lg-6">
		  			<div class="card align-items-center"> 
		        		<img class="img" width="60%" src="${pageContext.request.contextPath}/images/stat1.png" >
		        	</div>
		        </div>
		        <div class="col-lg-6">
		  			<div class="card align-items-center"> 
		        		<img class="img" width="60%" src="${pageContext.request.contextPath}/images/stat2.png" >
		        	</div>
		        </div>
			</div>
		</div>
	</section>
    <jsp:include page="/WEB-INF/jsp/view/footer.jsp" />
    </div>
  	<jsp:include page="/WEB-INF/jsp/view/script.jsp" />
  	<script type="text/javascript">
	  	//pie
	    var ctxP = document.getElementById("pieChart").getContext('2d');
	    var myPieChart = new Chart(ctxP, {
	      type: 'pie',
	      data: {
	        labels: ["Malades", "Pas malades"],
	        datasets: [{
	          data: [${friendsPositive}, ${friendsNegative}],
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
</body>
</html>

