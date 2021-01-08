package ServletPackage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import SQLPackage.SQLConnector;
import java.util.HashMap;
import java.util.Map;
import BeanPackage.Place;


/**
 * Servlet implementation class ActivitiesUserServlet
 */
@WebServlet("/nouveauLieuServlet")
public class NouveauLieuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Map<String, String> erreurs;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NouveauLieuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/lieu.jsp" ).forward( request, response );     
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("UTF-8");
	        erreurs = new HashMap<String, String>();
	        
	        String name = request.getParameter("name");
	        String address = request.getParameter("address");
	      

	        SQLConnector con = new SQLConnector();

	        try{
	            con.placeAlreadyExist(name);
	        }catch (Exception e) {
	            erreurs.put("name", e.getMessage());
	        }

	        try{
	            con.adressAlreadyExist(address);
	        }catch (Exception e) {
	            erreurs.put("address", e.getMessage());
	        }

	        if(erreurs.isEmpty()) {
	            Place place = new Place();
	            place.setName(name);
	            place.setAddress(address);
	          
	            con.createPlace(place);
	            response.sendRedirect("/DevWeb2020_AppCovid/dashboard-user-servlet");
	        }else{
	            request.setAttribute("erreurs", erreurs);
	            
	            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/lieu.jsp").forward(request, response);
	        }
	    }
	}


















