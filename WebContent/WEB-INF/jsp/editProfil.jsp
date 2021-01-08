<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>
  <title>Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container bootstrap snippet">
 <form method="post" enctype="multipart/form-data" action="modifyProfil?id=<%out.print((String)request.getAttribute("id"));%>" >
            
    <div class="row">
  		<div class="col-sm-10"><h1>Bienvenue <%out.print(current_user.getPseudo());%> </h1></div>
    	<div class="col-sm-2"><a href="dashboard-user-servlet" class="pull-right">Menu Princpal<img class="im1" src="images/retour.png" width="50" height="50"></a></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <label for="picture" class="col-sm-6 col-form-label">Image de profil</label>
                <input type="file" id="picture" name="picture" accept="image/png, image/jpeg" class="form-control-file">
        </div><br>
      


               
          <div class="panel panel-default">
            <div class="panel-heading">Etat <i class="fa fa-link fa-1x"></i></div>
            <div class="panel-body" >
       
        <%
            if(current_user.isPositif()){
                out.print("Positif");
            }
            else{
                out.print("Négatif");
            }
        %>
    </div>
          </div>
          
          
          <ul class="list-group">
            <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
            <li class="list-group-item text-right" onclick="location.href='index.jsp';"  style="cursor:pointer;" ><span class="pull-left"><strong>Friends list</strong></span> 125</li>
            <li class="list-group-item text-right" onclick="location.href='index.jsp';"  style="cursor:pointer;"  ><span class="pull-left"><strong>Visited places</strong></span> 13</li>
            
          </ul> 
               
          <div class="panel panel-default">
            <div class="panel-heading">Social Media</div>
            <div class="panel-body">
            	<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i> <i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i> <i class="fa fa-google-plus fa-2x"></i>
            </div>
          </div>
          
        </div>
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Mes infomrmations</a></li>
              </ul>
              
          <div class="tab-content">
           <div class="tab-pane active" id="home">
        			    <div class="form-group">                          
                          <div class="col-xs-6">
                              <label for="first_name"><h3>Pseudo</h3></label>
                              <input type="text" id="login" name="login" class="form-control" value="<c:out value="${user.pseudo}"/>" required>
               				  <div class="loginError" style="display:none;"></div>
                          </div>
                      </div>                     
                    		            
                       <div class="form-group">                     
                          
                          <div class="col-xs-6">
                             <label for="first_name"><h3>Nom</h3></label>
                             <input type="text" id="surname" name="surname" class="form-control" value="<c:out value="${user.prenom}"/>" required>
              				 <div class="surnameError" style="display:none;"></div>
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                             <label for="first_name"><h3>Prenom</h3></label>
                             <input type="text" id="name" name="name" class="form-control" value="<c:out value="${user.nom}"/>" required>
               				 <div class="nameError" style="display:none;"></div>
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                                 <label for="first_name"><h3>Email</h3></label>
                            	 <input type="email" id="mail" name="mail" class="form-control" value="<c:out value="${user.email}"/>" required>
             					 <div class="mailError" style="display:none;"></div>
                          </div>
                      </div>
          
         				 <div class="form-group">                      
                          <div class="col-xs-6">
		                <label for="password" ><h3>Mot de passe *</h3> <span class="requis"></span></label>
		                <input type="password" id="password" name="password" class="form-control">
		                <div class="passwordError" style="display:none;"></div>
		           	 </div>
		           	 </div>
		            <div class="form-group">
		                  <div class="col-xs-6">
		                <label for="password_CHECK"> <h3>Confirmation *</h3> <span class="requis"></span></label>
		                <input type="password" id="password_CHECK" name="password_CHECK" class="form-control">
		                <div class="password_CHECKError" style="display:none;"></div>
		            </div>
		            </div>
		            
                      <div class="form-group">
                          <div class="col-xs-6">
                            <label for="birthdate"><h3>Date de naissance</h3></label>
                          <input type="date" id="birthdate" name="birthdate" value="<c:out value="${user.dateDeNaissance}"/>" min="1900-01-01" class="form-control" class="input-group date">
            		    <div class="birthdateError" style="display:none;"></div></div>
                      </div>
                      <div class="form-group">
                           <div class="col-xs-12">                               
                                
                              	<button class="btn btn-lg btn-success pull-right"  type="submit" ><i class="glyphicon glyphicon-ok-sign"></i> Valider</button>
                               	<!--<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>-->
                            </div>
                      </div>
                          
                                        
    </div><!--/row-->    
     </div>
     </div>
     </div>
      </form>
     </div>
                            
                                                      
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
<script type="text/javascript">
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