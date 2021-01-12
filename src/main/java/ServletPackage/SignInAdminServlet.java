package ServletPackage;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BeanPackage.Utilisateur;
import SQLPackage.SQLConnector;

/**
 * Servlet implementation class SignInAdminServlet
 */
@WebServlet("/sign-in-admin")
@MultipartConfig
public class SignInAdminServlet extends HttpServlet {
	 public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/signInAdmin.jsp" ).forward( request, response );
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("UTF-8");

        SQLConnector connector = new SQLConnector();
        HttpSession session = request.getSession();
        String erreur = "Login ou mot de passe incorecte";
        if(!request.getParameter("login").isEmpty() && !request.getParameter("password").isEmpty() ) {
            String login = request.getParameter("login");
            String pass = request.getParameter("password");
            
        try {
            Utilisateur user = connector.getAdmin(login,pass);
           
            if(user == null || user.getPseudo() == null){
            	 session.setAttribute("erreur",erreur);
                this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/signInAdmin.jsp" ).forward( request, response );
            }
            else{
           	 erreur = " ";
           	 session.setAttribute("erreur",erreur);
    			session.setAttribute("current_user",user);
    			request.setAttribute("current_user",user);
    			response.sendRedirect("/DevWeb2020_AppCovid/dashboard-admin");


            }
                      
        } catch (SQLException | ParseException throwables) {
            throwables.printStackTrace();
        }
        }
        else {
   		 session.setAttribute("erreur",erreur);
   		 this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/signInUser.jsp" ).forward( request, response );
        }
        
    }
}
