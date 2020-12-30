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
import java.text.ParseException;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet  extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.getServletContext().getRequestDispatcher( "/WEB-INF/index.jsp" ).forward( request, response );
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String login = request.getParameter("login");
        String pass = request.getParameter("password");

        SQLConnector connector = new SQLConnector();
        HttpSession session = request.getSession();

        try {
            Utilisateur user = connector.getUser(login,pass);
           
            if(user == null || user.getPseudo() == null){
               
                this.getServletContext().getRequestDispatcher( "/index.jsp" ).forward( request, response );
            }
            else{
            	
    			session.setAttribute("current_user",user);
    			request.setAttribute("current_user",user);
    			response.sendRedirect("/AppCovid/profil-servlet");


            }
                      
        } catch (SQLException | ParseException throwables) {
            throwables.printStackTrace();
        }

    }
}
