package ServletPackage;

import SQLPackage.SQLConnector;
import BeanPackage.Utilisateur;
import BeanPackage.Notification;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "NotificationsServlet", value = "/notifications")
public class NotificationsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*List<Notification> list = null;
        SQLConnector con = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");
        try {
            list = con.getNotifs(utilisateur.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("notifs", list);
        */
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/notification2.jsp" ).forward( request, response );
    }
}
