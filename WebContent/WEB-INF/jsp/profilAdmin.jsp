<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <title>AppCovid</title>
  <meta charset="utf-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
	          		<li class="breadcrumb-item"><a href="dashboard-admin">Home</a></li>
	          		<li class="breadcrumb-item active">Profil</li>
	        	</ul>
	      	</div>
	    </div>
		<section>
		<div class="container-fluid">
		    <div class="row">
		  		<div class="card col-lg-3">
			        <div class="card-header">
			        	<div class="row-fluid">
			        		<div class="col-auto">
			        			<img src="<%out.print(current_user.getProfilPicture());%>" class="img-thumbnail rounded mx-auto d-block" alt="avatar">
			        		</div>
			        	</div>
			        </div>
			        <div class="card-body">
				        <div class="row-fluid"  style="margin-bottom: 1rem !important;margin-left: 1.5rem;">Etat <i class="fa fa-link fa-1x"></i></div>
						<div class="row-fluid"  style="margin-bottom: 1rem !important;margin-left: 1.5rem;">
							<c:choose>
								 <c:when test="${positif}">
				                  <div id="stateNotif" class="stateSick">Atteint du COVID  </div>
				                 </c:when>
								 <c:otherwise>
				                 <div id="stateNotif" class="stateNotSick">Pas malade </div>
				               	 </c:otherwise>
						     </c:choose>
						</div>
						<div class="row-fluid">
							<ul class="list-group">
							    <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
							    <li class="list-group-item " onclick="location.href='friends-user';"  style="cursor:pointer;" ><strong>Friends list</strong> ${nbFriends}</li>
								<li class="list-group-item " onclick="location.href='#';"  style="cursor:pointer;"><strong>Visited places</strong> 13</li>
							</ul> 
					   </div>
					   <div class="row-fluid"  style="margin-top: 1rem !important;margin-left: 1rem;">
							<div class="panel panel-default">
							  <div class="panel-heading">Social Media</div>
							  <div class="panel-body">
							  	<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i> <i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i> <i class="fa fa-google-plus fa-2x"></i>
							  </div>
							</div>
						</div>
	  				</div>
			  	</div>
		    	<div class="card col-lg-6">
			        <div class="card-header">
			        	<div class="row">
			        		<div class="col-auto">
			        			<h4  style="color:#E14557;">Mes informations</h4>
			        		</div>
			        	</div>
			        </div>
			        <div class="card-body">
			          	<div class="tab-content">
			            	<div class="tab-pane active" id="home">
			        			    <div class="form-row">
				                        <div class="col-3">
				                            <label for="first_name"><h3>Pseudo</h3></label>
				                        </div>
				                        <div class="col-3">
				                         	<h4><%out.print(current_user.getPseudo());%></h4>
				                        </div>
			                      	</div>
				                    <div class="form-row">
				                         <div class="col-3">
				                             <label for="first_name"><h3>Nom</h3></label>
				                         </div>
				                         <div class="col-3">
				                             <h4><%out.print(current_user.getNom());%></h4>
				                         </div>
				                     </div>
				                     <div class="form-row">
				                         <div class="col-3">
				                            <label for="first_name"><h3>Prenom</h3></label>
				                         </div>
				                         <div class="col-3">
				                             <h4><%out.print(current_user.getPrenom());%></h4>
				                         </div>
				                     </div>
				                     <div class="form-row">
				                         <div class="col-3">
				                                <label for="first_name"><h3>Email</h3></label>
				                         </div>
				                         <div class="col-3">
				                           	 <h4><%out.print(current_user.getEmail());%></h4>
				                         </div>
				                     </div>
				                     <div class="form-row">
				                         <div class="col-3">
				                           <label for="birthdate"><h3>Date de naissance </h3> </label>
				                         </div>
				                         <div class="col-3">
				                         	<h4><%out.print(current_user.getDateDeNaissance());%></h4>
				                         </div>
				                     </div>
				                     <div class="form-row">
				                          <div class="p-2" style="margin-top: 1rem !important">
				                             	<button class="btn btn-lg btn-success pull-right" type="submit" onclick="window.location.href='modifyProfil'" type="submit" ><i class="glyphicon glyphicon-ok-sign"></i> Edit</button>
				                              	<!--<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>-->
				                           </div>
				                     </div>
								</div>
							</div>
				        </div>
				    </div>  
				    <div class="card col-lg-3">
		        		<img class="img" src="${pageContext.request.contextPath}/images/profil.png" >
				    </div>     
		    	</div>
		    </div>
		</section>
	</div>                                         
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

	<script type="text/javascript">
		window.onload = function() {
		  changeActiveLi();
		};
		function changeActiveLi() {
			var navChange = document.getElementById("side-main-menu");
			var navChangeA = document.getElementById("side-admin-menu");
			var active = navChange.getElementsByClassName("active");
			Array.prototype.forEach.call(active, function forElement(element) {
			    element.classList.remove("active");
			   });
			var notActive = navChangeA.getElementsByClassName("profil");
			
			Array.prototype.forEach.call(notActive, function forElement(element) {
			    element.classList.add("active");
			   });
		}
		$(document).ready(function() {
		    
		    var readURL = function(input) {
		        if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function (e) {
		                $('.avatar').attr('src', e.target.result);
		            }
		    
		            reader.readAsDataURL(input.files[0]);
		        }
		    }
		    
		    $(".file-upload").on('change', function(){
		        readURL(this);
		    });
		});
	</script>
</body>
</html>