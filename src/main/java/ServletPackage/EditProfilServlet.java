package ServletPackage;

import java.io.IOException;

import SQLPackage.SQLConnector;
import BeanPackage.Activity;
import BeanPackage.Utilisateur;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.sql.SQLException;
import java.util.List;
import java.util.HashMap;
import java.text.ParseException;
import java.util.Map;
import java.util.regex.Pattern;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;




/**
 * Servlet implementation class ProfilUserServlet
 */
@WebServlet( value = "/modifyProfil")
@MultipartConfig
public class EditProfilServlet extends HttpServlet {
    private Map<String, String> erreurs;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utilisateur currentUser = (Utilisateur) session.getAttribute("current_user");
        String id = request.getParameter("id");
        if(currentUser.getAdmin() && id !=null){
            SQLConnector connector = new SQLConnector();
            try {
                request.setAttribute("user",connector.getUser(Integer.parseInt(id)));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            request.setAttribute("id",id);
        }
        else {
            request.setAttribute("user", currentUser);
            request.setAttribute("id", currentUser.getId());
        }
        this.getServletContext().getRequestDispatcher( "/WEB-INF/jsp/editProfil.jsp" ).forward( request, response );
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Utilisateur user = new Utilisateur();
        Utilisateur currentUser = (Utilisateur) session.getAttribute("current_user");
        String id = request.getParameter("id");
        if (currentUser.getAdmin() && id != null) {
            SQLConnector connector = new SQLConnector();
            try {
                user = connector.getUser(Integer.parseInt(id));
                request.setAttribute("user", user);

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else {
            user = currentUser;
            request.setAttribute("user", currentUser);
        }
        erreurs = new HashMap<String, String>();

        /* Récupération des champs du formulaire. */
        String email = request.getParameter("mail");
        String motDePasse = request.getParameter("password");
        String confirmation = request.getParameter("password_CHECK");
        String nom = request.getParameter("name");
        String prenom = request.getParameter("surname");
        String pseudo = request.getParameter("login");
        Part pictureData = request.getPart("picture");
        System.out.println("ici pic "+pictureData);
        String picture;
        if(motDePasse.equals("") && confirmation.equals("")){
            motDePasse = user.getMotDePasse();
            confirmation = motDePasse;
        }
        SQLConnector con = new SQLConnector();


        String birthdate = request.getParameter("birthdate");
        birthdate = birthdate.replace('-', '/');
        String message;

        if ((message = ProfilUtils.validationMotsDePasse(motDePasse, confirmation)) != null) {
            setErreur("password", message);
        }

      
       try {
				if ((message = con.isRegistered(email, user)) != null) {
				    setErreur("mail", message);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        

        if ((message = ProfilUtils.validationNom(nom)) != null) {
            setErreur("name", message);
        }
        if ((message = ProfilUtils.validationNom(prenom)) != null) {
            setErreur("surname", message);
        }

     
       try {
				if((message = con.isMember(pseudo,user)) != null){
				    setErreur("login",message);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        

        //S'il n'y a pas d'erreur
        if (erreurs.isEmpty()) {
            Utilisateur utilisateur = new Utilisateur();
            utilisateur.setPrenom(prenom);
            utilisateur.setNom(nom);
            utilisateur.setMotDePasse(motDePasse);
            utilisateur.setPseudo(pseudo);
            utilisateur.setEmail(email);
            utilisateur.setDateDeNaissance(birthdate);
            utilisateur.setId(user.getId());
            if (pictureData.getSize() > 0) {
                picture = "image/" + pseudo + "." + pictureData.getSubmittedFileName().split(Pattern.quote("."))[1];
                ProfilUtils.saveProfilPicture(pictureData, picture, request);
                utilisateur.setProfilPicture(picture);
            }
            else{
                utilisateur.setProfilPicture(user.getProfilPicture());
            }
           

            con.updateUser(utilisateur);
            try {
                if (currentUser.getAdmin() && id != null) {
                    response.sendRedirect("/DevWeb2020_AppCovid/adminstrate-users");
                } else {
                    Utilisateur newUser = con.getUser(utilisateur.getPseudo(), utilisateur.getMotDePasse());
                    session.setAttribute("current_user", newUser);
                    response.sendRedirect("/DevWeb2020_AppCovid/profil-user");
                }
            } catch (SQLException | ParseException throwables) {
                throwables.printStackTrace();
            }
        }
        else {
            request.setAttribute("erreurs", erreurs);
            // Redirection profil
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/profilUser.jsp").forward(request, response);
        }
    }

    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }
}