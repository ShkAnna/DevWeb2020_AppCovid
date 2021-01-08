package ServletPackage;


import SQLPackage.SQLConnector;
import BeanPackage.Utilisateur;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet implementation class FriendsUserServlet
 */
@WebServlet("/friends-user")
public class FriendsUserServlet extends HttpServlet {
	private List<Utilisateur> friends;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			SQLConnector con = new SQLConnector();
	        HttpSession session = request.getSession();
	        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
	        List<Utilisateur> listUsers = null;
	       try {
	             listUsers = con.getUsersApplication(utilisateur);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        List<Utilisateur> listFriend = null;
	        try {
	            listFriend = con.getFriends(utilisateur);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        if(listUsers != null && listFriend != null) {
	            listUsers.removeAll(listFriend);
	        }

	        List<Utilisateur> listAsked = null;
	        try {
	            listAsked = con.getUsersAsked(utilisateur);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        if(listAsked != null && listUsers != null) {
	            listUsers.removeAll(listAsked);
	        }

	        try {
	            friends = con.getFriends(utilisateur);
	        } catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	        
	        try {
	        	 request.setAttribute("nbNotifs", con.getNotifs(utilisateur.getId()).size());
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	           try {
	           	 request.setAttribute("notifs", con.getNotifs(utilisateur.getId()));
	           } catch (SQLException e) {
	               e.printStackTrace();
	           }
	        
	        request.setAttribute("friends", friends);
	        
	        request.setAttribute("users", listUsers);
	       
		 this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/friendsUser.jsp" ).forward( request, response );
	}

	

}
