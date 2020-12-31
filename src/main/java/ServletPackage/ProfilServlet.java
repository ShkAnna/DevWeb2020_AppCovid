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

@WebServlet(name = "profilServlet", value = "/profil-servlet")
public class ProfilServlet extends HttpServlet {
    private List<Activity> listActivities;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector con = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
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
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/profil.jsp" ).forward( request, response );
    }
}
