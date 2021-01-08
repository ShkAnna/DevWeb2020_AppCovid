<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>

<head>
    <title>AppCovid</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<br>
<h1  style="text-align:center">Gestion lieux</h1>
<div><label>Rerchercher un lieu : </label>
    <input id="myInput" type="text" placeholder="Rechercher...">
</div>
<br>
<br>


<table>
    <thead>
    <tr>
        <th>Nom</th>
        <th>Adresse</th>
        <th>Supprimer</th>
        <th>Editer</th>
    </tr>
    </thead>
    <tbody id="myTable">
    <c:forEach items="${places}" var="item">
    <tr>
        <td>${item.name}</td>
        <td>${item.address}</td>
        
          <td>  <button type="button" class="btn btn-danger" onclick="window.location.href='deletePlace?id=${item.id}'" width="50" height="50" >Supprimer
		<i class="fa fa-trash" style="color:#E14557;"></i>
		</button>
				
		<td> 
		<button class="btn btn-secondary rounded-lg" style="font-weight: bold;border-color:#0099cc;background-color:#0099cc;" type="submit"  name="buttonDeleteNotif" onclick="window.location.href='modifyPlace?id=${item.id}'" width="50" height="50">Editer</button>
	          						  	
		</td>										
       
    </tr>
    </c:forEach>
</table>
<br>
<br>
<div><button type="submit" class="btn btn-primary mb-2" style="font-weight: bold;border-color:#a1c83f;background-color:#a1c83f;" onclick="window.location.href='dashboard-admin-servlet'">retourner à la page d'administration</button></div>
</body>

</html>













