<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Covid</title>
    
    <link href="../css/index.css" rel="stylesheet">

</head>

<body>
<img class="gif"src="../images/giphy.gif" width="150" height="100">
<h1> The app name here</h1>

<div id="index"></div>
<div id="container">
<div id="first">
<br>

	&nbsp;Rejoingez notre free app 
	web Covid pour proteger
	&nbsp;non seulement votre santé
	mais aussi ceux qui &nbsp;t'entourent

<br>
<br>
<br>
<img src="../images/index.png" 
width="450"
height="400">
</div>

<div id= "signin">
<button class="buttonSign"
        type="button">
        Sign in
        </button>
 <button class="buttonSign"
        type="button">
        Sign up
 </button>

<form method="post" action="../welcome.html" onsubmit="return validateEmail(document.getElementById('email').value)">
<br>
        <div>
            <label for="login">&nbsp;Pseudo</label>
            <input type="text" id="login" name="user_login" required>
        </div>
        <br>
        <div>
            <label for="password">&nbsp;Mot de passe</label>
            <input type="password" id="password" name="user_password" required>
        </div>
        <br>
        <div>
            <label for="password_check">&nbsp;Confirmation de mdp</label>
            <input type="password" id="password_check" name="user_password_check" required>
        </div>
        <br>
        <div>
            <label for="name">&nbsp;Nom </label>
            <input type="text" id="name" name="user_name" required>
        </div>
        <br>
        <div>
            <label for="surname">&nbsp;Prénom </label>
            <input type="text" id="surname" name="user_surname" required>
        </div>
         <br>
        <div>
            <label for="adress">&nbsp;Adresse</label>
            <input type="text" id="adress" name="user_adress">
        </div>
        <br>
        <div>
            <label for="mail">&nbsp;E-mail</label>
            <input type="text" id="mail" name="user_mail" required>
        </div>
        <br>
        <div class="button">
        
        <button class="buttonSign"
        type="submit"> &nbsp;Confirmer l'inscription</button>
        </div>
    </form>
</div>   
 
</div>

</body>
</html>