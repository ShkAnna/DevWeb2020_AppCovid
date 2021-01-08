package ServletPackage;

import java.io.IOException;


import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import BeanPackage.Utilisateur;
import SQLPackage.SQLConnector;

/**
 * Servlet implementation class SignUpUserServlet
 */
@WebServlet(name = "SignUpUserServlet", value = "/sign-up-user")
@MultipartConfig
public class SignUpUserServlet extends HttpServlet {
	 private Map<String, String> erreurs;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/signUpUser.jsp" ).forward( request, response );
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        erreurs = new HashMap<String, String>();
        String email = request.getParameter("mail");
        String motDePasse = request.getParameter("password");
        String confirmation = request.getParameter("password_CHECK");
        String nom = request.getParameter("name");
        String prenom = request.getParameter("surname");
        String pseudo = request.getParameter("login");
        Part pictureData = request.getPart("picture");  
        String picture;
        SQLConnector con = new SQLConnector();
       
               
        String birthdate = request.getParameter("birthdate");
        if(birthdate != null) {
        	birthdate = birthdate.replace('-','/');
        } else {
        	 setErreur("password", "Please choose correct birthdate");
        }
        

        try {
            con.isRegistered(email);
        } catch (Exception e) {
            setErreur("mail", e.getMessage());
        }

        try {
            validationMotsDePasse(motDePasse, confirmation);
        } catch (Exception e) {
            setErreur("password", e.getMessage());
        }

        try {
            validationNom(nom);
        } catch (Exception e) {
            setErreur("name", e.getMessage());
        }

        try {
            validationNom(prenom);
        } catch (Exception e) {
            setErreur("surname", e.getMessage());
        }

        try{
            con.isMember(pseudo);
        }catch (Exception e) {
            setErreur("login", e.getMessage());
        }

     
        if(erreurs.isEmpty()){
            Utilisateur utilisateur = new Utilisateur();
            utilisateur.setPrenom(prenom);
            utilisateur.setNom(nom);
            utilisateur.setMotDePasse(motDePasse);
            utilisateur.setPseudo(pseudo);
            utilisateur.setEmail(email);
            utilisateur.setDateDeNaissance(birthdate);
            if (pictureData.getSize() > 0) {
                picture = "images/" + pseudo + "." + pictureData.getSubmittedFileName().split(Pattern.quote("."))[1];
                ProfilUtils.saveProfilPicture(pictureData, picture, request);
                utilisateur.setProfilPicture(picture);
            }
            else{
            	 picture = "images/photoProfil.png";
                utilisateur.setProfilPicture(picture);
            }
           

            con.createUser(utilisateur);
            HttpSession session = request.getSession();
            session.setAttribute("current_user",utilisateur);
			request.setAttribute("current_user",utilisateur);
        	response.sendRedirect("/DevWeb2020_AppCovid/dashboard-user-servlet");
            //this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/profil.jsp").forward(request, response);
        }else {
            request.setAttribute("erreurs", erreurs);
          
            // Redirection vers le formulaire
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/signUpUser.jsp").forward(request, response);
        }
    }

    private void validationNom(String nom) throws Exception{
        if (nom.trim().length() > 2) {
            if (!nom.matches("[a-zA-Z]*")) {
                throw new Exception("Merci de saisir un nom sans caractéres spéciaux.");
            }
        }else{
            throw new Exception("Merci de saisir un nom de longueur correcte.");
        }
    }

    private void validationMotsDePasse( String motDePasse, String confirmation ) throws Exception{
        if(!motDePasse.equals(confirmation)){
            throw new Exception("Les mots de passe ne concordent pas");
        }else if(motDePasse.trim().length() < 6){
            throw new Exception("Le mot de passe est trop court");
        }
    }

   
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

}
