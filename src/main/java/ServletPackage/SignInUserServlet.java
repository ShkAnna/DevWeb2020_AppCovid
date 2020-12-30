package ServletPackage;

import SQLPackage.SQLConnector;
import BeanPackage.Utilisateur;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@WebServlet(name = "SignInUserServlet", value = "/inscription")
@MultipartConfig
public class SignInUserServlet extends HttpServlet {
    private Map<String, String> erreurs;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.getServletContext().getRequestDispatcher( "/WEB-INF/signInUser.jsp" ).forward( request, response );
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        erreurs = new HashMap<String, String>();
        /* Récupération des champs du formulaire. */
        String email = request.getParameter("mail");
        String motDePasse = request.getParameter("password");
        String confirmation = request.getParameter("password_CHECK");
        String nom = request.getParameter("name");
        String prenom = request.getParameter("surname");
        String pseudo = request.getParameter("login");
        Part pictureData = request.getPart("picture");
        String picture;
        SQLConnector con = new SQLConnector();

        if(pictureData.getSize() > 0) {
            picture = "./WebContent/images" + pseudo + "." + pictureData.getSubmittedFileName().split(Pattern.quote("."))[1];
        }else{
            picture = "./WebContent/images/photoProfil.png";
        }
        String birthdate = request.getParameter("birthdate");
        birthdate = birthdate.replace('-','/');

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

        //S'il n'y a aucune erreur, on ajoute à la BDD
        if(erreurs.isEmpty()){
            Utilisateur utilisateur = new Utilisateur();
            utilisateur.setPrenom(prenom);
            utilisateur.setNom(nom);
            utilisateur.setMotDePasse(motDePasse);
            utilisateur.setPseudo(pseudo);
            utilisateur.setEmail(email);
            utilisateur.setDateDeNaissance(birthdate);
            utilisateur.setProfilPicture(picture);
           

            con.createUser(utilisateur);
            this.getServletContext().getRequestDispatcher("/profil.jsp").forward(request, response);
        }else {
            request.setAttribute("erreurs", erreurs);
            // Redirection vers le formulaire
            this.getServletContext().getRequestDispatcher("/WEB-INF/signInUser.jsp").forward(request, response);
        }
    }

    private void validationNom(String nom) throws Exception{
        if (nom.trim().length() > 2) {
            if (!nom.matches("[a-zA-Z]*")) {
                throw new Exception("Merci de saisir un nom sans caractères spéciaux.");
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
