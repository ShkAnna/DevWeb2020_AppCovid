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


@WebServlet(name = "DeleteFriendServlet", value = "/deleteFriend")
public class DeleteFriendServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        SQLConnector sqlConnector = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
        int friendId = Integer.parseInt(request.getParameter("id"));
        Utilisateur friend = null;
        try {
            friend = sqlConnector.getUser(friendId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        sqlConnector.deleteFriend(utilisateur.getId(), friend.getId());
        sqlConnector.createNotification(utilisateur, friend, "vous a retier de sa liste d amis.", "0");
        response.sendRedirect("/DevWeb2020_AppCovid/friends-user");

    }
}
