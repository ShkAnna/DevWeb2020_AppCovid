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


@WebServlet(name = "RefuseFriendServlet", value = "/refuseFriend")
public class RefuseFriendServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        SQLConnector sqlConnector = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
        int friendId = Integer.parseInt(request.getParameter("id"));
        String idNotif = request.getParameter("idNotif");
        Utilisateur friend = null;
        try {
            friend = sqlConnector.getUser(friendId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        sqlConnector.deleteNotif(idNotif);
        sqlConnector.createNotification(utilisateur, friend, utilisateur.getNom() + " " + utilisateur.getPrenom()+" a refusé votre invitation", "0");
        response.sendRedirect("/Appcovid-1.0-SNAPSHOT/notifications");
    }
}
