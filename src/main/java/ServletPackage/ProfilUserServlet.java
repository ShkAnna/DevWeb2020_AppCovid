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
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector con = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
        if(utilisateur != null) {
            try {
                request.setAttribute("nbNotifs", con.getNotifs(utilisateur.getId()).size());
            } catch (SQLException e) {
                e.printStackTrace();
            }
            
            try {
                request.setAttribute("nbFriends", con.getFriends(utilisateur).size());
            } catch (SQLException e) {
                e.printStackTrace();
            }


            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/profilUser.jsp").forward(request, response);
        }
        else{
            response.sendRedirect("/DevWeb2020_AppCovid/");
        }
                
    }
}
