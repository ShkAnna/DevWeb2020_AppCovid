package ServletPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IndexChoiceServlet
 */
@WebServlet("/IndexChoiceServlet")
public class IndexChoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexChoiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 String bt = request.getParameter("choice");
		 System.out.println("button value = " + bt);
		 if(bt.equals("Sign In as User")) {
			 this.getServletContext().getRequestDispatcher( "/WEB-INF/signInUser.jsp" ).forward( request, response );
		 } else if(bt.equals("Sign In as Admin")) {
			 this.getServletContext().getRequestDispatcher( "/WEB-INF/signInAdmin.jsp" ).forward( request, response );
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
