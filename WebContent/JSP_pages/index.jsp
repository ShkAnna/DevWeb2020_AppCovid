<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="BeanPackage.UserBean" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>Covid</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
     <link href="../css/index.css" rel="stylesheet">
  
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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                    <img class="im1" src="../images/covid.png" >
                        
                        <h3>Bienvenue</h3>
					     <p>
						
						La free app web Covid pour protéger 
						non seulement votre santé mais 
						aussi ceux qui t'entourent.
						
						</p>
							<img src="../images/covid2.png" width="300" height="300">
											                      
                    </div>
                
                    <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Sign up</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Sign in</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Create your account</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">                               
                                            <input type="text" class="form-control" id="name" name="user_name" placeholder="First Name *" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control"id="surname"  name="user_surname" placeholder="Last Name *" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="password" name="user_password"  placeholder="Password *" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control"  id="password_check" name="user_password_check"  placeholder="Confirm Password *" required>
                                        </div>
                                       
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control" id="mail" name="user_mail"  placeholder="Your Email *" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" minlength="10" maxlength="10" name="txtEmpPhone" class="form-control" placeholder="Your Phone " >
                                        </div>
                                         <div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="male" checked>
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="female">
                                                    <span>Female </span> 
                                                </label>
                                            </div>
                                        </div>
                                      
                                      
                                        <input type="submit" class="buttonSign"  value="Register"/>
                                    </div>
                                 
                                </div>
                            </div>
                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h3  class="register-heading">Glad to see you!</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Email *" required>
                                        </div>
                                       

                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *" required>
                                        </div>
                                       
                                        <div class="form-group">
                                        
                                        
                                        <input type="submit" class="btnRegister"  value="Sign in"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>	<script type="text/javascript">
	</script>
		
</body>
</html>