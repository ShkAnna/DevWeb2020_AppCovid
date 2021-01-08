package ServletPackage;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public class ProfilUtils {

    public static String validationNom(String nom){
        if (nom.trim().length() > 2) {
            if (!nom.matches("[a-zA-Z]*")) {
                return "Merci de saisir un nom sans caractares spéciaux.";
            }
            return null;
        }else{
            return "Merci de saisir un nom de longueur correcte.";
        }
    }

    public static String validationMotsDePasse( String motDePasse, String confirmation ){
        if(!motDePasse.equals(confirmation)){
            return "Les mots de passe ne sont pas les mêmes";
        }else if(motDePasse.trim().length() < 6){
            return "Le mot de passe est trop court";
        }
        return null;
    }

    
    public static void saveProfilPicture(Part pictureData, String picturePath, HttpServletRequest request) {
        File file = new File(request.getSession().getServletContext().getRealPath("/images") + picturePath.substring(3));
        try (InputStream input = pictureData.getInputStream()) {
            file.delete();
            file.mkdir();
            file.createNewFile();
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
