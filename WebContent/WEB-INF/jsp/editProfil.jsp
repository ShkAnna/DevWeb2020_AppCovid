<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	<jsp:include page="/WEB-INF/jsp/view/sideNavbar.jsp" />
    <div class="page">
	   	<jsp:include page="/WEB-INF/jsp/view/header.jsp" /> 	
	    <!-- Breadcrumb-->
	    <div class="breadcrumb-holder">
	    	<div class="container-fluid">
	        	<ul class="breadcrumb">
	          		<li class="breadcrumb-item"><a href="dashboard-user">Home</a></li>
	          		<li class="breadcrumb-item active">Profil</li>
	        	</ul>
	      	</div>
	    </div>
		<section>
			<div class="container-fluid">
				<form method="post" enctype="multipart/form-data" action="modifyProfil?id=<%out.print((String)request.getAttribute("id"));%>" >
				    <div class="row">
				  		<div class="card col-lg-3">
					        <div class="card-header">
					        	<div class="row-fluid">
					        		<div class="col-auto">
										<img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
								        <label for="picture" class="col-sm-6 col-form-label">Image de profil</label>
								        <input type="file" id="picture" name="picture" accept="image/png, image/jpeg" class="form-control-file">
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
					        			    <div class="form-row" style="margin-bottom: 1rem !important;">
						                        <div class="col-3">
						                            <label for="first_name"><h3>Pseudo</h3></label>
						                        </div>
						                        <div class="col-3">
						                         	<input type="text" id="login" name="login" class="form-control" value="<c:out value="${user.pseudo}"/>" required>
		               				  				<div class="loginError" style="display:none;"></div>
						                        </div>
					                      	</div>
						                    <div class="form-row" style="margin-bottom: 1rem !important;">
						                         <div class="col-3">
						                             <label for="first_name"><h3>Nom</h3></label>
						                         </div>
						                         <div class="col-3">
						                         	<input type="text" id="name" name="name" class="form-control" value="<c:out value="${user.nom}"/>" required>
		               				 				<div class="nameError" style="display:none;"></div>
						                         </div>
						                     </div>
						                     <div class="form-row" style="margin-bottom: 1rem !important;">
						                         <div class="col-3">
						                            <label for="first_name"><h3>Prenom</h3></label>
						                         </div>
						                         <div class="col-3">
						                         	<input type="text" id="surname" name="surname" class="form-control" value="<c:out value="${user.prenom}"/>" required>
		              				 			 	<div class="surnameError" style="display:none;"></div>
						                         </div>
						                     </div>
						                     <div class="form-row" style="margin-bottom: 1rem !important;">
						                         <div class="col-3">
						                                <label for="email"><h3>Email</h3></label>
						                         </div>
						                         <div class="col-3">
						                           	<input type="email" id="mail" name="mail" class="form-control" value="<c:out value="${user.email}"/>" required>
		             					 			<div class="mailError" style="display:none;"></div>
						                         </div>
						                     </div>
						                     <div class="form-row" style="margin-bottom: 1rem !important;">
						                         <div class="col-3">
						                                <label for="password" ><h3>Mot de passe *</h3> <span class="requis"></span></label>
						                         </div>
						                         <div class="col-3">
						                           	<input type="password" id="password" name="password" class="form-control" required>
				                					<div class="passwordError" style="display:none;"></div>
						                         </div>
						                     </div>
						                     <div class="form-row" style="margin-bottom: 1rem !important;">
						                         <div class="col-3">
						                                <label for="password_CHECK"> <h3>Confirmation *</h3> <span class="requis"></span></label>
						                         </div>
						                         <div class="col-3">
						                           	<input type="password" id="password_CHECK" name="password_CHECK" class="form-control" required>
				                					<div class="password_CHECKError" style="display:none;"></div>
						                         </div>
						                     </div>
						                     <div class="form-row" style="margin-bottom: 1rem !important;">
						                         <div class="col-3">
						                           <label for="birthdate"><h3>Date de naissance </h3> </label>
						                         </div>
						                         <div class="col-3">
						                         	<input type="date" id="birthdate" name="birthdate" value="<c:out value="${user.dateDeNaissance}"/>" min="1900-01-01" class="form-control" class="input-group date" required>
		            		    					<div class="birthdateError" style="display:none;"></div></div>
						                     </div>
						                     <div class="form-row">
						                          <div class="p-2" style="margin-top: 1rem !important">
														<button class="btn btn-lg btn-success pull-right"  type="submit" ><i class="glyphicon glyphicon-ok-sign"></i> Valider</button>
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
				</form>
			</div>
		</section>
	</div>                            
                                                      
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	  
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