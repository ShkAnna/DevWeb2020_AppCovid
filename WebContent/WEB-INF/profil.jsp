<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/notif.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>Profil: <%out.print(current_user.getPseudo());%> </title>

    <div class="infos" style=line-height:10px;>
        <span class="info" style=vertical-align:middle><img width=80 height=80 src="<%out.print(current_user.getProfilPicture());%>"></span>
        <span class="info" style=vertical-align:middle> <%out.print(current_user.getPseudo());%> </span>
        <span class="info" style=vertical-align:middle> <%out.print(current_user.getNom());%> </span>
        <span class="info" style=vertical-align:middle> <%out.print(current_user.getPrenom());%> </span>
    </div>
    <div>
        statut:
        <%
            if(current_user.getPositif()){
                out.print("je suis positif");
            }
            else{
                out.print("je ne suis pas positif");
            }
        %>
    </div>
    <div class="button-covid">
        <button onclick="window.location.href='nouvelle-activite'" type="submit">Déclarer une activité</button>
        <button onclick="window.location.href='nouveau-lieu'"type="submit">Ajouter vos lieux préférés</button>
<%
    if(!current_user.getPositif()){
        out.print("<button onclick=\"window.location.href='positif'\"type=\"submit\">Je suis positif</button>");
    }
%>

        <button onclick="window.location.href='modifyProfil'"type="submit">Modifier Profil</button>
        <button onclick="window.location.href='friendList'"type="submit">Mes amis</button>
        <button onclick="window.location.href='searchFriend'"type="submit">Chercher ami</button>
        <a href="notifications" class="notification">
            <span>Notifs</span>
            <span class="badge">${nbNotifs}</span>
        </a>
    </div>
    <div>
        <span> Mes activités <br></span>
        <c:forEach items="${activities}" var="item">
            <span>  ${item.startDate} - ${item.endDate}<br></span>
        </c:forEach>
    </div>
</head>
<body>

</body>
</html>
