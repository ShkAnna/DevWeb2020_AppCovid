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


@WebServlet(name = " DeleteNotificationServlet", value = "/deleteNotif")
public class DeleteNotificationServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        SQLConnector sqlConnector = new SQLConnector();
        String id = (request.getParameter("id"));
        sqlConnector.deleteNotif(id);
        response.sendRedirect("/DevWeb2020_AppCovid/notifications");
    }
}
