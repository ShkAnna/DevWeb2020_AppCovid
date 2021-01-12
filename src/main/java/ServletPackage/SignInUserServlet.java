package ServletPackage;

import SQLPackage.SQLConnector;

import BeanPackage.Utilisateur;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@WebServlet(name = "SignInUserServlet", value = "/sign-in-user")
@MultipartConfig
public class SignInUserServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/signInUser.jsp" ).forward( request, response );
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
            Utilisateur user = connector.getUser(login,pass);
           
            if(user == null || user.getPseudo() == null  ){
            	 session.setAttribute("erreur",erreur);
                this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/signInUser.jsp" ).forward( request, response );
               
            }
            else{
            	 erreur = " ";
            	 session.setAttribute("erreur",erreur);
    			session.setAttribute("current_user",user);
    			request.setAttribute("current_user",user);
    			response.sendRedirect("/DevWeb2020_AppCovid/dashboard-user-servlet");


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
