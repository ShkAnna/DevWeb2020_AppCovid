<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 
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
<div class="modal fade" id="modalAddUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	<div class="row justify-content-between" style="width:100%">
	      	<div class="col-6 align-self-center">
	      		<h5 class="modal-title" id="exampleModalCenterTitle">Ajouter le nouveau ami</h5>
	      	</div>
	      	<div class="col-5">
	      		<div class="input-group" >
				    <input type="text" class="form-control" placeholder="Search">
				    <div class="input-group-append">
				      <button class="btn btn-secondary" type="button">
				        <i class="fa fa-search"></i>
				      </button>
				    </div>
				  </div>
	      	</div>
	      	<div class="col-1">
	      		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
	      	</div>
      	</div>
      </div>
      <div class="modal-body">
		<div class="table-responsive" style="overflow-y : scroll;">
       		<table class="table table-striped table-hover text-center">
          		<thead>
            		<tr>
                	<th>Pseudo</th>
                	<th>Covid detectée</th>
                	<th>Ajouter</th>
             	</tr>
          		</thead>
          		
          		<tbody  id="myTable">
          		<c:forEach items="${users}" var="item">
          		  <tr>
           		             <td>${item.pseudo}</td>
            			   	<c:choose>
							 <c:when test="${item.positif}">	
	          				 <td><i class="fa fa-check" style="color:#70af1c;"></i></td>
							  </c:when>	
							  <c:otherwise>
							   <td><i class="fa fa-times" style="color:#E14557;"></i></td>	                   																      
								</c:otherwise>
								</c:choose>	
               		<td><input class="btn btn-primary rounded-lg" style="font-weight: bold;" type="submit" value="Ajouter" onclick="window.location.href='addFriend?login=${item.pseudo}'" /></td>
             	
             	</tr>
             	</c:forEach>
           	</tbody>
           	
        	</table>
    	</div>
	  </div>
	  <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>