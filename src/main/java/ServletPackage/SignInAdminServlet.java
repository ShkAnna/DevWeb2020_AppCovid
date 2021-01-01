package ServletPackage;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
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
public class SignInAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/signInAdmin.jsp" ).forward( request, response );
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String login = request.getParameter("login");
        String pass = request.getParameter("password");

        SQLConnector connector = new SQLConnector();
        HttpSession session = request.getSession();

        try {
            Utilisateur user = connector.getUser(login,pass);
           
            if(user == null || user.getPseudo() == null){
               
                this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/signInAdmin.jsp" ).forward( request, response );
            }
            else{
            	
    			session.setAttribute("current_user",user);
    			request.setAttribute("current_user",user);
    			response.sendRedirect("/AppCovid/dashboard-admin-servlet");


            }
                      
        } catch (SQLException | ParseException throwables) {
            throwables.printStackTrace();
        }

    }

}
