package ServletPackage;

import java.io.IOException;



import java.sql.SQLException;
import BeanPackage.Utilisateur;
import BeanPackage.Activity;
import SQLPackage.SQLConnector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "adminActivityServlet", value = "/admin-activity")
public class AdminActivityServlet extends HttpServlet {
    private List<Activity> activity;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector connector = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur adminUser = (Utilisateur) session.getAttribute("current_user");

            try {
            	activity = connector.getActivity();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            request.setAttribute("activity", activity);
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/adminActivity.jsp").forward(request, response);
        
    }
}
