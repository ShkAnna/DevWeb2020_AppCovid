package ServletPackage;

import java.io.IOException;

import java.sql.SQLException;
import BeanPackage.Utilisateur;
import BeanPackage.Place;
import SQLPackage.SQLConnector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "adminPlacesServlet", value = "/admin-places")
public class AdminPlacesServlet extends HttpServlet {
    private List<Place> places;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector connector = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur adminUser = (Utilisateur) session.getAttribute("current_user");

            try {
                places = connector.getPlaces();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            request.setAttribute("places", places);
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/adminPlaces.jsp").forward(request, response);
        
    }
}
