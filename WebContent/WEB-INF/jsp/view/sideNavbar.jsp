<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <!-- Side Navbar -->
<nav class="side-navbar">
  <div class="side-navbar-wrapper">
    <!-- Sidebar Header    -->
    <div class="sidenav-header d-flex align-items-center justify-content-center">
      <!-- User Info-->
      <div class="sidenav-header-inner text-center">
      	 	<img src=<%out.print(current_user.getProfilPicture());%>  alt="person" class="img-fluid rounded-circle">
        <h2 class="h5"><%out.print(current_user.getPrenom());%> <%out.print(current_user.getNom());%></h2>
        
       <c:choose>
								<c:when test="${positif}">
                  <div id="stateNotif" class="stateNotSick">Atteint du COVID  </div>
               </c:when>
										<c:otherwise>
                 <div id="stateNotif" class="stateNotSick">Pas malade </div>
               </c:otherwise>
								     </c:choose>
        <!-- <span>Web Developer</span> -->
      </div>
      <!-- Small Brand information, appears on minimized sidebar-->
    <div class="sidenav-header-logo">
   	<a href="dashboard-user-servlet" class="brand-small text-center">
     	<strong>AC</strong>
     	<!-- <strong class="text-primary">C</strong> -->
    	</a>
    </div>
    </div>
    <!-- Sidebar Navigation Menus-->
    <div class="main-menu">
      <h5 class="sidenav-heading">Main</h5>
      <ul id="side-main-menu" class="side-menu list-unstyled">                  
        <li class="active"><a href="dashboard-user-servlet"> <i class="fa fa-home"></i>Menu principal</a></li>
        <li class="activities"><a href="activities"> <i class="fa fa-history"></i>Mes activités</a></li>
        <li class="friends"><a href="friends-user"> <i class="fa fa-users"></i>Mes amis</a></li>
        <li class="notifications"><a href="notifications"><i class="fa fa-bell"></i>Mes notifications
            <div class="badge badge-warning">${nbNotifs}</div></a>
        </li>
      </ul>
    </div>
    <div class="admin-menu">
      <h5 class="sidenav-heading">Réglages</h5>
      <ul id="side-admin-menu" class="side-menu list-unstyled"> 
        <li> <a href="profil-user"> <i class="fa fa-user"> </i>Profil</a></li>
      </ul>
    </div>
  </div>
</nav>