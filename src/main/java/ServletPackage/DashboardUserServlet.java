package ServletPackage;

import SQLPackage.SQLConnector;

import BeanPackage.Utilisateur;
import BeanPackage.Activity;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@WebServlet("/dashboard-user-servlet")
@MultipartConfig
public class DashboardUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {request.setCharacterEncoding("UTF-8");
    HttpSession session = request.getSession();
    Utilisateur user =  (Utilisateur) session.getAttribute("current_user");
    this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/dashboardUser.jsp" ).forward( request, response );

}
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Utilisateur user =  (Utilisateur) session.getAttribute("current_user");
        session.setAttribute("current_user",user);
    			request.setAttribute("current_user",user);
    			response.sendRedirect("/DevWeb2020_AppCovid/dashboard-admin-servlet");

    }

}
