package ServletPackage;

import SQLPackage.SQLConnector;

import BeanPackage.Utilisateur;

import BeanPackage.Activity;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "positifServlet", value = "/positif")
public class PositifServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector con = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
        con.setPositif(utilisateur);

        List<Activity> listActivities = null;
        try {
            listActivities = con.getActivitiesUser(utilisateur.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("activities", listActivities);
        try {
            request.setAttribute("nbNotifs", con.getNotifs(utilisateur.getId()).size());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        List<Utilisateur> listFriend = null;
        try {
            listFriend = con.getFriends(utilisateur);
        } catch (
                SQLException e) {
            e.printStackTrace();
        }

        List<Utilisateur> listUsers = null;
        try {
            listUsers = con.getUsersApplication(utilisateur);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(listUsers != null && listFriend != null) {
            listUsers.removeAll(listFriend);
        }

        // Send notif to friendlist 
        for(Utilisateur friend : listFriend){
            con.createNotification(utilisateur, friend, utilisateur.getNom() + "  " + utilisateur.getPrenom()+" a été déclaré positif.", "0");
        }
        
        //Send notif due to visited places 
        try {
            con.createNotificationContactCase(utilisateur,"Une personne positive a fréquenté le même lieu que vous");
        } catch (SQLException throwables) { throwables.printStackTrace(); }
                
        request.setAttribute("positf", utilisateur.isPositif());
        session.setAttribute("current_user",utilisateur);
		request.setAttribute("current_user",utilisateur);
    	response.sendRedirect("/DevWeb2020_AppCovid/dashboard-user-servlet");
    }
}
