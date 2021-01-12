package ServletPackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import BeanPackage.Notification;
import BeanPackage.Utilisateur;
import BeanPackage.Activity;
import BeanPackage.Place;
import SQLPackage.SQLConnector;
import java.sql.SQLException;
import java.util.List;


/**
 * Servlet implementation class activitesServlet
 */
<<<<<<< HEAD
@WebServlet("/activitesServlet")
=======
@WebServlet("/activities-user")
>>>>>>> lastversion_Anna
public class ActivitesServlet  extends HttpServlet {
    List<Place> listPlaces;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector con = new SQLConnector();
<<<<<<< HEAD
=======
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
       
        
        try {
   	   	 request.setAttribute("positif", con.getState(utilisateur));
   	   } catch (SQLException e) {
   	       e.printStackTrace();
   	   }
   	    
   	  
       try {
           request.setAttribute("nbNotifs", con.getNotifs(utilisateur.getId()).size());
       } catch (SQLException e) {
           e.printStackTrace();
       }
       
      
       
       
>>>>>>> lastversion_Anna
        try {
            listPlaces = con.getPlaces();
        } catch (SQLException e) {
            e.printStackTrace();
        }
<<<<<<< HEAD
        request.setAttribute("places", listPlaces);
=======
        request.setAttribute("places", listPlaces);        
        try {        	
			request.setAttribute("activity", con.getActivitiesUser(utilisateur.getId()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
>>>>>>> lastversion_Anna
        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/activitiesUser.jsp" ).forward( request, response );
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        SQLConnector con = new SQLConnector();
        /* Récupération des champs du formulaire. */
        String dateDebut = request.getParameter("startDate") + " " + request.getParameter("startTime");
        String dateFin = request.getParameter("endDate") + " " + request.getParameter("endTime");
        String idLieu = request.getParameter("place");
<<<<<<< HEAD


        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
=======
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
       
>>>>>>> lastversion_Anna

        Activity activity = new Activity();
        activity.setStartDate(dateDebut);
        activity.setEndDate(dateFin);
<<<<<<< HEAD

=======
        
        
        
>>>>>>> lastversion_Anna
        con.createActivity(activity, utilisateur.getId(), idLieu);
        response.sendRedirect("/DevWeb2020_AppCovid/dashboard-user-servlet");
    }
}

