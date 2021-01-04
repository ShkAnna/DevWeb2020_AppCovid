<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>AppCovid</title>
    
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
          		<li class="breadcrumb-item active">Mes notifications</li>
        	</ul>
      	</div>
    </div>
	<section>
	<jsp:include page="/WEB-INF/jsp/view/modalDeleteUser.jsp" />
	<jsp:include page="/WEB-INF/jsp/view/modalAddUser.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
		     		<div class="row">
		      			<div class="col-lg-12">
							<div class="card">
						        <div class="card-header">
						        	<div class="row justify-content-between align-items-center ">
						        		<div class="col-auto">
						        			<h4  style="color:#E14557;">Mes notifications</h4>
						        		</div>
						        								        	</div>
						        </div>
						        <div class="card-body" style="color:#0099cc;margin-top:-1rem">
						          	<div class="table-responsive" style="height:30vh;overflow-y:scroll;">
						            	 <c:forEach items="${notifs}" var="item">
								        <span>  ${item.message} </span>
								        <c:choose>
								            <c:when test="${item.friendRequest}">
								                    <button type="submit" name="buttonAddFriend" onclick="window.location.href='acceptFriend?id=${item.idAsking}&idNotif=${item.id}'">Ajouter en ami</button>
								                    <button type="submit" name="buttonRefuseFriend" onclick="window.location.href='refuseFriend?id=${item.idAsking}&idNotif=${item.id}'">Refuser</button>
								            </c:when>
								            <c:otherwise>
								                <button type="submit" name="buttonDeleteNotif" onclick="window.location.href='deleteNotif?id=${item.id}'">Effacer</button>
								            </c:otherwise>
								        </c:choose>
								        <br>
								    </c:forEach>
						         	</div>
				       			</div>
			    			</div>
			    		</div>
		    	  	</div>
		    		
					
	       			</div>
		    	</div>
		  	</div>
		 
	</section>
	
    <jsp:include page="/WEB-INF/jsp/view/footer.jsp" />
    </div>
  	<jsp:include page="/WEB-INF/jsp/view/script.jsp" />
  
  </body>
</html>