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
import java.sql.SQLException;

@WebServlet(name = "addFriendServlet", value = "/addFriend")
public class AddFriendServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        SQLConnector sqlConnector = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
        String friendLogin = request.getParameter("login");
        Utilisateur friend = null;
        try {
            friend = sqlConnector.getUser(friendLogin);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        sqlConnector.createNotification(utilisateur,friend," veut etre votre ami.", "1");
        
        response.sendRedirect("/DevWeb2020_AppCovid/friends-user");

 	
    }
}
