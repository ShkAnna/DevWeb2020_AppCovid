package ServletPackage;

import java.io.IOException;



import java.sql.SQLException;
import BeanPackage.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import SQLPackage.SQLConnector;


import java.util.List;

@WebServlet("/adminstrate-users")
public class AdminUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Utilisateur> users;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector connector = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur adminUser = (Utilisateur) session.getAttribute("current_user");
        	try {
                users = connector.getUsersApplicationAdmin(adminUser);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
                request.setAttribute("users", users);
         	       this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/adminUsers.jsp").forward(request, response);
        
       
    }
}