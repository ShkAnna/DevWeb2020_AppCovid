package ServletPackage;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BeanPackage.Activity;
import BeanPackage.Utilisateur;
import SQLPackage.SQLConnector;

/**
 * Servlet implementation class ProfilAdminServlet
 */
@WebServlet("/dashboard-admin")
public class DashboardAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private List<Activity> listActivities;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLConnector con = new SQLConnector();
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("current_user");     
        
        try {
       	 request.setAttribute("positive", con.getPositive().size());
       	
       } catch (SQLException throwables) {
           throwables.printStackTrace();
       }
       
       try {
       	 request.setAttribute("negative", con.getNegative().size());
       	
       } catch (SQLException throwables) {
           throwables.printStackTrace();
       }
       
      
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/dashboardAdmin.jsp" ).forward( request, response );
    }
    }