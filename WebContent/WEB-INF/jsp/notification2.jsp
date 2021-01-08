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
          		<li class="breadcrumb-item active">Mes notifications</li>
        	</ul>
      	</div>
    </div>
	<section>
	<jsp:include page="/WEB-INF/jsp/view/modalDeleteUser.jsp" />
	<jsp:include page="/WEB-INF/jsp/view/modalAddUser.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
		     		<div class="row">
		      			<div class="col-lg-12">
							<div class="card">
						        <div class="card-header">
						        	<div class="row justify-content-between align-items-center ">
						        		<div class="col-auto">
						        			<h4  style="color:#E14557;">Tombé malade recemment</h4>
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
								                   	<th>Lieu en commun</th>
								                   	<th>Date </th>
								                   	<th>Horaire</th>
							                 	</tr>
						               		</thead>
						               		<tbody style="font-weight:bold;">
			               						
			               						<c:forEach items="${friends}" var="item">
				               						<tr>
								               			<td>
								               				<img src=${item.profilPicture} alt="person" width="50" height="50" class="img rounded-circle">
								               			</td>
									               	 	<td>
												            ${item.pseudo} 												            
					          						  	</td>
					          						  	<td>
										        		Tennis Footbal Basketball Badminton
			          						  		</td>
			          						  		<td>
										        		11/01/2020	
			          						  		</td>
			          						  		<td>
										        		09:02 	
			          						  		</td>	
												  
												</c:forEach>
							                 	
							                 	
							               	</tbody>
						             	</table>
						         	</div>
				       			</div>
			    			</div>
			    		</div>
		    	  	</div>
	       		</div>
       			<div class="col-lg-6">
		     		<div class="row">
		      			<div class="col-lg-12">
							<div class="card">
						        <div class="card-header">
						        	<div class="row justify-content-between align-items-center ">
						        		<div class="col-auto">
						        			<h4  style="color:#E14557;">Demande des amis</h4>
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
								                   	<th>Amis en commun</th>
								                   	<th></th>
								                   	<th></th>
							                 	</tr>
						               		</thead>
						               			<tbody style="font-weight:bold;">
						               			<c:forEach items="${notifs}" var="item">
						                			<c:choose>
						               			 <c:when test="${item.friendRequest}">				               		
			               						<tr>
			               					
			               					
							               			<td>
							               				<img src="${pageContext.request.contextPath}/images/photoProfil.png" alt="person" width="50" height="50" class="img rounded-circle">
							               			</td>
							               	 		<td>
										        		${item.pseudoAsking}
			          						  		</td>
			          						  		<td>
										        		10  	
			          						  		</td>
			          						  		<td >
										        		<button class="btn btn-primary rounded-lg" style="font-weight: bold;" type="submit" name="buttonAddFriend" onclick="window.location.href='acceptFriend?id=${item.idAsking}&idNotif=${item.id}'">Accepter</button>
			          						  		</td>
			          						  		<td>
										        		<button class="btn btn-danger rounded-lg" style="font-weight: bold;" type="submit" name="buttonRefuseFriend" onclick="window.location.href='refuseFriend?id=${item.idAsking}&idNotif=${item.id}'">Refuser</button>
			          						  		</td>
			          						  		 
			          						  
							                 	</tr>
							                 			</c:when>	
					                 			<c:otherwise>
            
										         </c:otherwise>
										      </c:choose>		                 	
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
		    </div>
		    <div class="row">
			    <div class="col-lg-6">
		  			<div class="card align-items-center"> 
		        		<img class="img" width="84%" src="${pageContext.request.contextPath}/images/group.png" >
		        	</div>
			    </div>
			    <div class="col-lg-6">
					<div class="card">
				        <div class="card-header">
				        	<div class="row justify-content-between align-items-center ">
				        		<div class="col-auto">
				        			<h4  style="color:#E14557;">Notifications des amis</h4>
				        		</div>
				        	</div>
				        </div>
				        <div class="card-body" style="color:#0099cc;margin-top:-1.25rem">
				          	<div class="table-responsive" style="height:30vh;overflow-y:scroll;">
				          		<table class="table table-striped table-hover text-center" style="font-size: 1rem;">
				               		<thead style="display:none;" >
				               		</thead>
				               		
				               		
				               		<tbody style="font-weight:bold;">
				               			<c:forEach items="${notifs}" var="item">
				                			<c:choose>
				               			 <c:when test="${not  item.friendRequest}">	
	               						<tr>
					               			<td>
					               				<img src="${pageContext.request.contextPath}/images/photoProfil.png" alt="person" width="50" height="50" class="img rounded-circle">
					               			</td>
					               	 		<td>
										        ${item.pseudoAsking}
			          						  </td>
	          						  		<td>
								        		${item.message} 	
	          						  		</td>
	          						  		<td>
								        		${item.date}
	          						  		</td>
	          						  		<td>
								        		${item.time}
	          						  		</td>
	          						  		<td>
	          						  			<button class="btn btn-secondary rounded-lg" style="font-weight: bold;border-color:#0099cc;background-color:#0099cc;" type="submit"  name="buttonDeleteNotif" onclick="window.location.href='deleteNotif?id=${item.id}'">Effacer</button>
	          						  		</td>
					                 	</tr>
					                 			</c:when>	
					                 			<c:otherwise>
            
										         </c:otherwise>
										      </c:choose>		                 	
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
	  		var notActive = navChange.getElementsByClassName("notifications");
	  		console.log(notActive);
	  		Array.prototype.forEach.call(notActive, function forElement(element) {
	  		    element.classList.add("active");
	  		   });
	  	}
  	</script>
  </body>
</html>