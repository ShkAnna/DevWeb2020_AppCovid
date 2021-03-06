package ServletPackage;

import SQLPackage.SQLConnector;


import BeanPackage.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "deleteActivityUserServlet", value = "/deleteActivityUser")
public class DeleteActivityUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Utilisateur adminUser = (Utilisateur) session.getAttribute("current_user");
        SQLConnector sqlConnector = new SQLConnector();
        String idToRemove = request.getParameter("id");
        sqlConnector.deleteActivity(idToRemove);
        response.sendRedirect("/DevWeb2020_AppCovid/activities-user");
              
      
       
    }
}
