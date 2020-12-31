<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>AppCovid</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
     <link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
     <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  
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
    
</head>
<body>

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
                                <a href="inscription"  aria-selected="false">Sign up</a>
                            </li>
                            <li class="nav-item">
                                <a href="#"  aria-selected="true">Sign in</a>
                            </li>
                        </ul>
                        
                        <div class="tab-content" id="myTabContent">
                         <form method="post" action="login-servlet">
                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h3  class="register-heading">Glad to see you!</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        
                                        
                                 
                                        <div class="form-group">
                                          <input placeholder="Login " type="text" id="login" name="login" required>
                                            
                                        </div>                                       

                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                           <input placeholder="Password" type="password" id="password" name="password" required>
                              
                                        </div>
                                       
                                        <div class="form-group">
                                        
                                        
                                        <input type="submit" class="btnRegister"  value="Sign in"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                         </form>
                    </div>
                
                </div>
            </div>	
            </div>
		
</body>
</html>
