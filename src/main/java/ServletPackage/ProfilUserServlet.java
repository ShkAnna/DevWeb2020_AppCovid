package ServletPackage;

import java.io.IOException;
import SQLPackage.SQLConnector;
import BeanPackage.Activity;
import BeanPackage.Utilisateur;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
/**
 * Servlet implementation class ProfilUserServlet
 */
@WebServlet(name = "profilUserServlet", value = "/profil-user")
public class ProfilUserServlet extends HttpServlet {
    private List<Activity> listActivities;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector con = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp//profilUser.jsp" ).forward( request, response );
    }
}
