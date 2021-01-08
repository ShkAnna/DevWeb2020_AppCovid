<%@ page import="BeanPackage.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Utilisateur current_user = (Utilisateur) session.getAttribute("current_user"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 
<div class="modal fade" id="modalDeleteUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Confirmation suppresion des amis</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     	<span>Vous êtes sûr que vous voulez supprimer de la liste des amis l'utilisateur
        	<b><span class="modal-username" id="user"></span></b>
        </span>
      </div>
      <div class="modal-footer">      
        	<c:forEach items="${friends}" var="item">
     	<script type = "text/javascript">
        var name = $('#user span').text();
    		</script>
        	<c:if test="{item.pseudo == name}">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Fermer</button>
        <button type="button" class="btn btn-danger" onclick="window.location.href='deleteFriend?id=${item.id}'" >Supprimer</button>
       </c:if>
       	</c:forEach>
             	

        
        
      </div>
    </div>
  </div>
</div>