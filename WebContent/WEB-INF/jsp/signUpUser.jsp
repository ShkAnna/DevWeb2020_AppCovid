<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>AppCovid</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
     <link href="css/index.css" rel="stylesheet">
  
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/checksScripts.js"></script>
<script>
    $(document).ready(function(){
        $("form").submit(function(e){
            if(!checkEmail($("#mail").val())){
                displayError(".errorMail","Cette adresse email n'est pas valide");
                e.preventDefault(e);
            }
            if(!checkLogin($("#login").val())){
                displayError(".errorLogin","Votre pseudo doit avoir entre 4 et 50 charactères ");
                e.preventDefault(e);
            }
            if(!checkName($("#name").val())){
                displayError(".errorName","Vous devez entrez un nom valide");
                e.preventDefault(e);
            }
            if(!checkName($("#surname").val())){
                displayError(".errorSurname","Vous devez entrez un prénom valide");
                e.preventDefault(e);
            }
            if(!checkDate(new Date($("#birthdate").val()))){
                displayError(".errorBirthdate","Vous devez entrez un date d'anniversaire valide");
                e.preventDefault(e);
            }
            return true;
        });
    });
</script>
    
</head>
<body>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                    <img class="im1" src="images/covid.png" >
                        
                        <h3>Bienvenue</h3>
					     <p>
						
						La free app web Covid pour protéger 
						non seulement votre santé mais 
						aussi ceux qui t'entourent.
						
						</p>
							<img src="images/covid2.png" width="300" height="300">
											                      
                    </div>
                
                   <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a href="sign-up-user"  aria-selected="false">Sign up</a>
                            </li>
                            <li class="nav-item">
                                <a href="sign-in-user"  aria-selected="true">Sign in</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                          <form method="post" enctype="multipart/form-data" action="inscription" >
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Create your account</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">                               
                                         <input  placeholder="Login *" type="text" id="login" name="login" value="<c:out value="${param.login}"/>" required>
           								 <span class="erreur">${erreurs['login']}</span></div>
                                        <div class="form-group">
                                            <input placeholder="Password *" type="password" id="password" name="password" required>
          									  <span class="erreur">${erreurs['password']}</span></div>
                                        <div class="form-group">
                                           <input placeholder="Confirm Password *" type="password" id="password_CHECK" name="password_CHECK" required>
        								 </div>
                                        <div class="form-group">
                                       <input placeholder="Nom *" type="text" id="name" name="name" value="<c:out value="${param.name}"/>" required>
           							 <span class="erreur">${erreurs['name']}</span> </div>
                                       
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                      <input placeholder="Prenom *"  type="text" id="surname" name="surname" value="<c:out value="${param.surname}"/>" required>
           							 <span class="erreur">${erreurs['surname']}</span>
            							</div>
                                        <div class="form-group">
                                          
								            <input  placeholder="Email *"  type="email" id="mail" name="mail" value="<c:out value="${param.mail}"/>" required>
								            <span class="erreur">${erreurs['mail']}</span>
								            <div class="errorMail" style="display:none;"></div>
							            </div>
                                         <div class="form-group">
                                                <label for="birthdate">Date de naissance </label>
									            <input type="date" id="birthdate" name="birthdate" value="2018-07-22" min="1900-01-01">
									            <div class="errorBirthdate" style="display:none;"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="picture">Photo de profil</label>
            							<input type="file" id="picture" name="picture" accept="image/png, image/jpeg">
                                                
       
                                            </div>
                                             <div class="form-group">
                                        
                                        
                                        <input type="submit" class="btnRegister"  value="Register"/>
                                    </div>
                                           
                                        </div>
                                    </div>
                                 
                                </div>
                            </div>
                              </form>
                            
                    </div>
                
                </div>
            </div>	<script type="text/javascript">
	</script>
		
</body>
</html>


