<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!-- navbar-->
	<header class="header">
        <nav class="navbar">
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
				<div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a>
					<a href="dashboard-user" class="navbar-brand">
						<div class="brand-text d-none d-md-inline-block">
							<strong><span style="font-size:15px;">AppCovid</span></strong>
							<img class="im1" src="images/covid.png" width="40" height="40" style="margin-left: 0.5rem !important;">  
							<!-- <strong class="text-primary">Dashboard</strong> -->
						</div>
					</a>
				</div>
				<ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
					
	                <!-- Log out-->
	                <li class="nav-item">
		                <a href="logout" class="nav-link logout">
			                <span class="d-none d-sm-inline-block" style="font-size:20px;">Logout</span>
			                <i class="fa fa-sign-out" style="font-size:20px;"></i>
	                	</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>