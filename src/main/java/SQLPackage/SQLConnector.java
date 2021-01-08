package SQLPackage;

import SQLPackage.SQLConnector;

import BeanPackage.Utilisateur;
import BeanPackage.Place;
import BeanPackage.Notification;
import BeanPackage.Activity;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.math.BigInteger;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class SQLConnector {
    PasswordHasher passwordHasher = PasswordHasher.getInstance();

    public SQLConnector() {
    }

    ResultSet results = null;
    PreparedStatement statement = null;
    Connection con = null;


    public Connection connection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Pilotes jdbc ne démarre pas");
            System.exit(-1);
        }
        try {
            String DBurl = "jdbc:mysql://localhost:3306/";
            con = DriverManager.getConnection(DBurl, "root", "");
            System.out.println("Connexion réussie");
        } catch (SQLException e) {
            System.out.println("Connection à la BDD impossible");
            System.exit(-1);
        }
        return con;
    }

    public ResultSet doRequest(String query) {
        try {
            con = connection();
            statement = con.prepareStatement(query);
            results = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;

    }

    private Object handleNullValues(String colonum,ResultSet results) throws SQLException {
        Object o = results.getObject(colonum);
        if(results.wasNull()){
            return null;
        }
        else{
            return o;
        }
    }

        public void doUpdate(String query) {
        try {
            con = connection();
            statement = con.prepareStatement(query);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void closeCon() {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (results != null) {
            try {
                results.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

    }

    
    private void doAdd(String query) {
        try {
            con = connection();
            statement = con.prepareStatement(query);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
       
        finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }


    
    public void createUser(Utilisateur utilisateur) {
        String query =
                "INSERT INTO appcovid.users(picture,login,user_password,name,first_name,email,birthdate) " +
                        "VALUES('"
                        + utilisateur.getProfilPicture() + "','"
                        + utilisateur.getPseudo() + "','"
                        + passwordHasher.hash(utilisateur.getMotDePasse()) + "','"
                        + utilisateur.getNom() + "','"
                        + utilisateur.getPrenom() + "','"
                        + utilisateur.getEmail() + "','"
                        + utilisateur.getDateDeNaissance() + 
                        "');";
        doAdd(query);
    }

    
    public Utilisateur getUser(String login, String pass) throws SQLException, ParseException {
        Utilisateur utilisateur = null;
        String query = "Select * FROM appcovid.users WHERE login='" + login + "' ;";
        ResultSet result = doRequest(query);
        result.next();
        if (!result.getString("login").isEmpty() && passwordHasher.login(result.getString("user_password"), pass)) {        
            utilisateur = new Utilisateur();
            utilisateur.setId(result.getString("id_user"));
            utilisateur.setPseudo(result.getString("login"));
            utilisateur.setPrenom(result.getString("first_name"));
            utilisateur.setNom(result.getString("name"));
            utilisateur.setEmail(result.getString("email"));
            utilisateur.setDateDeNaissance(handleNullValues("birthdate",result).toString());
            utilisateur.setProfilPicture(handleNullValues("picture",result).toString());
            utilisateur.setPositif(!result.getString("positif").equals("0"));
            utilisateur.setAdmin(!result.getString("is_admin").equals("0"));
        }
        this.closeCon();
        return utilisateur;
    }

   
    public Utilisateur getUser(String login) throws SQLException {
        Utilisateur utilisateur = null;
        String query = "SELECT * FROM appcovid.users WHERE login='" + login + "' ;";
        ResultSet result = doRequest(query);
        result.next();
        if (!result.getString("login").isEmpty()) {
            utilisateur = new Utilisateur();
            utilisateur.setId(result.getString("id_user"));
            utilisateur.setPseudo(result.getString("login"));
            utilisateur.setPrenom(result.getString("first_name"));
            utilisateur.setNom(result.getString("name"));
            utilisateur.setEmail(result.getString("email"));
            utilisateur.setDateDeNaissance(handleNullValues("birthdate",result).toString());
            utilisateur.setProfilPicture(handleNullValues("picture",result).toString());
            utilisateur.setPositif(!result.getString("positif").equals("0"));
            utilisateur.setAdmin(!result.getString("is_admin").equals("0"));
        }
        this.closeCon();
        return utilisateur;
    }

    public Utilisateur getAdmin(String login) throws SQLException {
        Utilisateur utilisateur = null;
        String query = "SELECT * FROM appcovid.users WHERE login='" + login + "' ;";
        ResultSet result = doRequest(query);
        result.next();
        if (!result.getString("login").isEmpty()) {
            utilisateur = new Utilisateur();
            utilisateur.setId(result.getString("id_user"));
            utilisateur.setPseudo(result.getString("login"));
            utilisateur.setPrenom(result.getString("first_name"));
            utilisateur.setNom(result.getString("name"));
            utilisateur.setEmail(result.getString("email"));
            utilisateur.setDateDeNaissance(result.getString("birthdate"));
            utilisateur.setProfilPicture(result.getString("picture"));
            utilisateur.setPositif(!result.getString("positif").equals("0"));
            utilisateur.setAdmin(!result.getString("is_admin").equals("1"));
        }
        this.closeCon();
        return utilisateur;
    }
    
    public Utilisateur getAdmin(String login, String pass) throws SQLException, ParseException {
        Utilisateur utilisateur = null;
        String query = "Select * FROM appcovid.users WHERE login='" + login + "' ;";
        ResultSet result = doRequest(query);
        result.next();
        if (!result.getString("login").isEmpty() && passwordHasher.login(result.getString("user_password"), pass)) {        
            utilisateur = new Utilisateur();
            utilisateur.setId(result.getString("id_user"));
            utilisateur.setPseudo(result.getString("login"));
            utilisateur.setPrenom(result.getString("first_name"));
            utilisateur.setNom(result.getString("name"));
            utilisateur.setEmail(result.getString("email"));
            utilisateur.setDateDeNaissance(result.getString("birthdate"));
            utilisateur.setProfilPicture(result.getString("picture"));
            utilisateur.setPositif(!result.getString("positif").equals("0"));
            utilisateur.setAdmin(!result.getString("is_admin").equals("1"));
        }
        this.closeCon();
        return utilisateur;
    }
    
    
    public void deleteUser(String id){
        String query = "DELETE FROM appcovid.users WHERE id_user = "+id+";";
        doUpdate(query);
        this.closeCon();
    }


    public void deletePlace(String id) {
        String query = "DELETE FROM appcovid.place WHERE id_place = "+id+";";
        doUpdate(query);
        this.closeCon();
    }

    
    public Utilisateur getUser(int id) throws SQLException {
        Utilisateur utilisateur = null;
        String query = "Select * FROM appcovid.users WHERE id_user='" + id + "' ;";
        ResultSet result = doRequest(query);
        result.next();
        if (!result.getString("login").isEmpty()) {
            utilisateur = new Utilisateur();
            utilisateur.setId(result.getString("id_user"));
            utilisateur.setPseudo(result.getString("login"));
            utilisateur.setPrenom(result.getString("first_name"));
            utilisateur.setNom(result.getString("name"));
            utilisateur.setEmail(result.getString("email"));
            utilisateur.setDateDeNaissance(result.getString("birthdate"));
            utilisateur.setProfilPicture(result.getString("picture"));
            utilisateur.setPositif(!result.getString("positif").equals("0"));
            utilisateur.setAdmin(!result.getString("is_admin").equals("0"));
        }
        this.closeCon();
        return utilisateur;
    }

    public Notification getNotification(String id) throws SQLException {
       Notification notification = null;
        String query = "Select * FROM appcovid.notification WHERE id_notification='" + id + "' ;";
        ResultSet result = doRequest(query);
        result.next();
        if (!result.getString("id_notification").isEmpty()) {
        	String name = "Select * FROM appcovid.users WHERE id_user='" + result.getString("id_user_asking") + "' ;";
            ResultSet resultname = doRequest(name);
            resultname.next();
            notification = new Notification();
            notification.setId(result.getString("id_notification"));
            notification.setIdAsking(result.getString("id_user_asking"));
            notification.setIdOther(result.getString("id_user_other"));
            notification.setMessage(result.getString("message"));
            notification.setFriendRequest(!result.getString("friendRequest").equals("0"));
            notification.setDate(result.getString("send_date"));
            notification.setTime(result.getString("time"));
            if (!resultname.getString("login").isEmpty()) {          
            notification.setPseudoAsking(resultname.getString("login"));
            }
           
        }
        this.closeCon();
        return notification;
    }

    public void createActivity(Activity activity, String idUser, String idPlace) {
        String query =
                "INSERT INTO appcovid.activity(start_date,end_date,id_user,id_place) " +
                        "VALUES('"
                        + activity.getStartDate() + "','"
                        + activity.getEndDate() + "','"
                        + idUser + "','"
                        + idPlace
                        + "');";
        doAdd(query);
    }

    public void createPlace(Place place) {
        String query =
                "INSERT INTO appcovid.place(latitude,longitude,address,name) " +
                        "VALUES('"
                        + place.getLatitude() + "','"
                        + place.getLongitude() + "','"
                        + place.getAddress() + "','"
                        + place.getName()
                        + "');";
        doAdd(query);
    }


   
    public void createNotification(Utilisateur utilisateur, Utilisateur friend, String message, String friendRequest) {
    	  
    	String query =
                "INSERT INTO appcovid.notification(id_user_asking, id_user_other,send_date, message, friendRequest,time) " +
                        "VALUES('"
                        + utilisateur.getId() + "','"
                        + friend.getId() + "',"
                        +  "CURDATE()"+ ",'"
                        + message + "','"
                        + friendRequest + "',"
                        +"CURTIME()" 
                        +");";
    	
        doAdd(query);
    }

    public void createNotificationContactCase(Utilisateur utilisateurPositif, String message) throws SQLException {
        List<String> usersIdToNotify = getPlaceContactCase(utilisateurPositif.getId());
        con = connection();
        for(String id : usersIdToNotify) {
            String query =
                    "INSERT INTO appcovid.notification(id_user_asking, id_user_other,send_date, message, friendRequest,time) " +
                            "VALUES('"
                            + utilisateurPositif.getId() + "','"
                            +  id + "',"
                            + "CURDATE()" + ",'"
                            + message + "',"
                            + "0" + ","
                            +"CURTIME()" 
                            + ");";
            statement = con.prepareStatement(query);
            statement.executeUpdate();
        }
        statement.close();
        connection().close();

    }

    
    public List<String> getPlaceContactCase(String positifUserId) throws SQLException {
        List<String> ids = new ArrayList<>();
        String query =
                "SELECT DISTINCT toNotify.id_user " +
                "FROM (activity positif INNER JOIN place positifplace) INNER JOIN (activity toNotify INNER JOIN place toNotifyPlace) " +
                "ON positif.id_user != toNotify.id_user AND positifplace.id_place = positif.id_place AND toNotify.id_place = toNotifyPlace.id_place " +
                "WHERE NOT (toNotify.start_date > positif.end_date) " +
                "AND NOT (toNotify.end_date < positif.start_date) " +
                "AND positif.id_user = "+ positifUserId + " " +
                "AND positif.start_date > DATE_SUB(CURRENT_DATE,INTERVAL 10 DAY) " +
                "AND positifplace.name = toNotifyPlace.name;";
        ResultSet res = doRequest(query);
        while(res.next()) {
            ids.add(res.getString("id_user"));
        }

        closeCon();
        return ids;
    }

    public void createFriendship(Utilisateur currentUser,Utilisateur friend){
        String query =
                "INSERT INTO appcovid.friend " +
                        "VALUES("
                        + currentUser.getId() +","
                        + friend.getId() + ");";
        doAdd(query);
    }
    public Place getPlace(String name) throws SQLException {
        Place place = null;
        String query = "SELECT * FROM appcovid.place WHERE name='" + name + "' ;";
        ResultSet result = doRequest(query);
        result.next();
        if (!result.getString("name").isEmpty()) {
            place = new Place();
            place.setName(result.getString("name"));
            place.setAddress(result.getString("address"));
            place.setLongitude(result.getString("longitude"));
            place.setLatitude(result.getString("latitude"));
            place.setId(result.getString("id_place"));
        }
        this.closeCon();
        return place;
    }

    public Place getPlace(int id) throws SQLException {
        Place place = null;
        String query = "SELECT * FROM appcovid.place WHERE id_place='" + id + "' ;";
        ResultSet result = doRequest(query);
        result.next();
        if (!result.getString("name").isEmpty()) {
            place = new Place();
            place.setName(result.getString("name"));
            place.setAddress(result.getString("address"));
            place.setLongitude(result.getString("longitude"));
            place.setLatitude(result.getString("latitude"));
            place.setId(result.getString("id_place"));
        }
        this.closeCon();
        return place;
    }

    public List<Utilisateur> getFriends(Utilisateur u) throws SQLException {
        String query =
                        "SELECT id_friend " +
                        "FROM appcovid.friend " +
                        "WHERE id_user = "+u.getId()+";";
        ResultSet result = doRequest(query);

        List<Utilisateur> lu = new ArrayList<>();
        Utilisateur utilisateur;

        while (result.next()) {
            utilisateur = getUser(Integer.parseInt(result.getString("id_friend")));
            lu.add(utilisateur);
        }

        query =
                "SELECT id_user " +
                        "FROM appcovid.friend " +
                        "WHERE id_friend = "+u.getId()+";";
        result = doRequest(query);

        while (result.next()) {
            utilisateur = getUser(Integer.parseInt(result.getString("id_user")));
            lu.add(utilisateur);
        }
        this.closeCon();
        return lu;
    }
    
    
    
    
    public List<Utilisateur> getFriendsPositive(Utilisateur u) throws SQLException {
        String query =
                        "SELECT id_friend " +
                        "FROM appcovid.friend " +
                        "WHERE id_user = "+u.getId()+";";
        ResultSet result = doRequest(query);

        List<Utilisateur> lu = new ArrayList<>();
        Utilisateur utilisateur;

        while (result.next()) {
            utilisateur = getUser(Integer.parseInt(result.getString("id_friend")));
           
            if(utilisateur.isPositif()) {
                lu.add(utilisateur);
            }
        }

        query =
                "SELECT id_user " +
                        "FROM appcovid.friend " +
                        "WHERE id_friend = "+u.getId()+";";
        result = doRequest(query);

        while (result.next()) {
            utilisateur = getUser(Integer.parseInt(result.getString("id_user")));
            
            if(utilisateur.isPositif()) {
                lu.add(utilisateur);
            }
        }
        this.closeCon();
        return lu;
    }
    
    public List<Utilisateur> getFriendsNegative(Utilisateur u) throws SQLException {
        String query =
                        "SELECT id_friend " +
                        "FROM appcovid.friend " +
                        "WHERE id_user = "+u.getId()+";";
        ResultSet result = doRequest(query);

        List<Utilisateur> lu = new ArrayList<>();
        Utilisateur utilisateur;

        while (result.next()) {
            utilisateur = getUser(Integer.parseInt(result.getString("id_friend")));
            if(!utilisateur.isPositif()) {
                lu.add(utilisateur);
            }
        }

        query =
                "SELECT id_user " +
                        "FROM appcovid.friend " +
                        "WHERE id_friend = "+u.getId()+";";
        result = doRequest(query);

        while (result.next()) {
            utilisateur = getUser(Integer.parseInt(result.getString("id_user")));
            if(!utilisateur.isPositif()) {
                lu.add(utilisateur);
            }
        }
        this.closeCon();
        return lu;
        
        
       
    }
    
    
    
    

    public ResultSet getActivitesOfPlace(Place p) {
        return doRequest(
                "SELECT * FROM appcovid.activity WHERE id_place=" + p.getId() + ";"
        );
    }

    public String isMember(String username) throws Exception {
        String query = "Select * FROM appcovid.users WHERE login='" + username + "'";
        ResultSet result = doRequest(query);
        if (result.next()) {
            throw new Exception("Ce pseudo est déja utilisé");
        }
        this.closeCon();
        return null;
    }

    public String isMember(String username, Utilisateur utilisateur) throws Exception {
        String query = "Select * FROM appcovid.users WHERE login='" + username  + "' AND id_user != '"+utilisateur.getId()+"';";
        ResultSet result = doRequest(query);
        if (result.next()) {
            throw new Exception("Ce pseudo est déja  utilisé");
        }
        this.closeCon();
        return null;
    }

    public String isRegistered(String email) throws Exception {
        String query = "Select * FROM appcovid.users WHERE email='" + email + "'";
        ResultSet result = doRequest(query);
        if (result.next()) {
            throw new Exception("Ce email est déja  utilisé");
        }
        this.closeCon();
        return null;
    }

    public String isRegistered(String email, Utilisateur utilisateur) throws Exception {
        String query = "Select * FROM appcovid.users WHERE email='" + email + "' AND id_user != '"+utilisateur.getId()+"';";
        ResultSet result = doRequest(query);
        if (result.next()) {
            throw new Exception("Cet email est déja  utilisé");
        }
        this.closeCon();
        return null;
    }

    public void placeAlreadyExist(String name) throws Exception {
        String query = "Select * FROM appcovid.place WHERE name='" + name + "'";
        ResultSet result = doRequest(query);
        if (result.next()) {
            throw new Exception(name + " est un lieu déja existant");
        }
        this.closeCon();
    }

    public void placeAlreadyExist(String name, String id) throws Exception {
        String query = "Select * FROM appcovid.place WHERE name='" + name + "' AND id_place != '"+id+"';";
        ResultSet result = doRequest(query);
        if (result.next()) {
            throw new Exception(name + " est un lieu déja  existant");
        }
        this.closeCon();
    }

    public void adressAlreadyExist(String address) throws Exception {
        String query = "Select * FROM appcovid.place WHERE address='" + address + "'";
        ResultSet result = doRequest(query);
        if (result.next()) {
            throw new Exception(address + " est est déja utilisé pour un lieu existant");
        }
        this.closeCon();
    }

    public void adressAlreadyExist(String address, String id) throws Exception {
        String query = "Select * FROM appcovid.place WHERE address='" + address + "' AND id_place != '"+id+"';";
        ResultSet result = doRequest(query);
        if (result.next()) {
            throw new Exception(address + " est déja  utilisé pour un lieu existant");
        }
        this.closeCon();
    }

    /**
     * @return La liste des lieux existants
     */
    public List<Place> getPlaces() throws SQLException {
        List<Place> res = new ArrayList<>();
        String query = "SELECT * FROM appcovid.place;";
        ResultSet result = doRequest(query);
        while (result.next()) {
            Place place = new Place();
            place.setName(result.getString("name"));
            place.setAddress(result.getString("address"));
            place.setLongitude(result.getString("longitude"));
            place.setLatitude(result.getString("latitude"));
            place.setId(result.getString("id_place"));
            res.add(place);
        }
        this.closeCon();
        return res;
    }

    
    public List<Activity> getActivitiesUser(String idUser) throws SQLException {
        List<Activity> res = new ArrayList<>();
        String query = "SELECT * FROM appcovid.activity WHERE id_user='" + idUser + "';";
        ResultSet result = doRequest(query);
        while (result.next()) {
            Activity activity = new Activity();
            String sd =result.getString("start_date");
            String ed = result.getString("end_date");

            
            sd = sd.substring(0,sd.length()-3);
            ed = ed.substring(0,ed.length()-3);
            activity.setStartDate(sd);
            activity.setEndDate(ed);
            res.add(activity);
        }
        this.closeCon();
        return res;
    }

   
    public List<Place> getPlacesUser(String idUser) throws SQLException {
        List<Place> res = new ArrayList<>();
        String query = "SELECT * FROM appcovid.activity WHERE id_user='" + idUser + "';";
        ResultSet result = doRequest(query);
        while (result.next()) {
            Place place = getPlace(Integer.parseInt(result.getString("id_place")));
            res.add(place);
        }
        this.closeCon();
        return res;
    }

   
    public List<Utilisateur> getUsersApplication(Utilisateur utilisateur) throws SQLException {
        List<Utilisateur> res = new ArrayList<>();
        String query = "SELECT * FROM appcovid.users WHERE id_user!='" + utilisateur.getId() + "';";
        ResultSet result = doRequest(query);
        while (result.next()) {     	
            if (!result.getBoolean("is_admin") && (result.getString("id_user")!=utilisateur.getId()) ) { 
            utilisateur = new Utilisateur();
            utilisateur.setId(result.getString("id_user"));
            utilisateur.setPseudo(result.getString("login"));
            utilisateur.setMotDePasse(result.getString("user_password"));
            utilisateur.setPrenom(result.getString("first_name"));
            utilisateur.setNom(result.getString("name"));
            utilisateur.setEmail(result.getString("email"));
            utilisateur.setDateDeNaissance(result.getString("birthdate"));
            utilisateur.setProfilPicture(result.getString("picture"));
            String positif = "SELECT * FROM appcovid.users WHERE id_user='" + utilisateur.getId() + "';";
            ResultSet resultP = doRequest(positif);
            resultP.next();
            if (!resultP.getString("login").isEmpty()) { 
            	utilisateur.setPositif(resultP.getBoolean("positif"));
             }            
            res.add(utilisateur);
        
        	}
        }
        this.closeCon();
        return res;
    }

    public List<Utilisateur> getUsersApplicationAdmin(Utilisateur utilisateur) throws SQLException {
        List<Utilisateur> res = new ArrayList<>();
        String query = "SELECT * FROM appcovid.users WHERE id_user!='" + utilisateur.getId() + "';";
        ResultSet result = doRequest(query);
        while (result.next()) {     	
            if ((result.getString("id_user")!=utilisateur.getId()) ) { 
            utilisateur = new Utilisateur();
            utilisateur.setId(result.getString("id_user"));
            utilisateur.setPseudo(result.getString("login"));
            utilisateur.setMotDePasse(result.getString("user_password"));
            utilisateur.setPrenom(result.getString("first_name"));
            utilisateur.setNom(result.getString("name"));
            utilisateur.setEmail(result.getString("email"));
            utilisateur.setDateDeNaissance(result.getString("birthdate"));
            utilisateur.setProfilPicture(result.getString("picture"));
            String positif = "SELECT * FROM appcovid.users WHERE id_user='" + utilisateur.getId() + "';";
            ResultSet resultP = doRequest(positif);
            resultP.next();
            if (!resultP.getString("login").isEmpty()) { 
            	utilisateur.setPositif(resultP.getBoolean("positif"));
             }            
            res.add(utilisateur);
        
        	}
        }
        this.closeCon();
        return res;
    }
    
    public List<Notification> getNotifs(String id) throws SQLException {
        List<Notification> res = new ArrayList<>();
        String query = "SELECT * FROM appcovid.notification WHERE id_user_other ='" + id + "';";
        ResultSet result = doRequest(query);
        while (result.next()) {
            String id_notification = result.getString("id_notification");
            Notification notification = getNotification(id_notification);
            res.add(notification);
        }
        this.closeCon();
        return res;
    }

    public boolean getState(Utilisateur user) throws SQLException {
    	boolean positif=false;
    	 Utilisateur utilisateur = null;
         String query = "Select * FROM appcovid.users WHERE login='" + user.getPseudo() + "' ;";
         ResultSet result = doRequest(query);
         result.next();
         if (!result.getString("login").isEmpty()) {        
        	 	positif=result.getBoolean("positif");
        	 	
         }
         this.closeCon();
         return positif;
    	
    	

    }

    
    public void deleteNotif(String id) {
        String query = "DELETE FROM appcovid.notification WHERE id_notification = "+id+";";
        doUpdate(query);
        this.closeCon();
    }

    
    public void setPositif(Utilisateur utilisateur) {
        String query = "UPDATE appcovid.users SET positif = 1 WHERE id_user = "+utilisateur.getId()+";";
        doUpdate(query);
        this.closeCon();
        utilisateur.setPositif(true);
    }

    public void setNegatif(Utilisateur utilisateur) {
        String query = "UPDATE appcovid.users SET positif = 0 WHERE id_user = "+utilisateur.getId()+";";
        doUpdate(query);
        this.closeCon();
        utilisateur.setPositif(true);
    }
    
    public void deleteFriend(String id, String idOther) {
        String query = "DELETE FROM appcovid.friend WHERE id_user = "+id+" AND id_friend ="+idOther+";";
        doUpdate(query);
        query = "DELETE FROM appcovid.friend WHERE id_user = "+idOther+" AND id_friend ="+id+";";
        doUpdate(query);
        this.closeCon();
    }

    
    public List<Utilisateur> getUsersAsked(Utilisateur utilisateur) throws SQLException {
        List<Utilisateur> res = new ArrayList<>();
        String query = "SELECT * FROM appcovid.notification WHERE id_user_asking='" + utilisateur.getId() + "' AND friendRequest = \"1\";";
        ResultSet result = doRequest(query);
        while (result.next()) {
            Utilisateur user = this.getUser(Integer.parseInt(result.getString("id_user_other")));
            res.add(user);
        }
        query = "SELECT * FROM appcovid.notification WHERE id_user_other='" + utilisateur.getId() + "' AND friendRequest = \"1\";";
        result = doRequest(query);
        while (result.next()) {
            Utilisateur user = this.getUser(Integer.parseInt(result.getString("id_user_asking")));
            res.add(user);
        }
        this.closeCon();
        return res;
    }

  
    public void updateUser(Utilisateur utilisateur) {
        String query = "UPDATE appcovid.users SET login = '"+utilisateur.getPseudo()+"', " +
                "user_password = '"+passwordHasher.hash(utilisateur.getMotDePasse())+"', "+
                "picture = '"+utilisateur.getProfilPicture()+"', "+
                "name = '"+utilisateur.getNom()+"',"+
                "first_name ='"+utilisateur.getPrenom()+"', "+
                "email = '"+utilisateur.getEmail()+"', "+
                "birthdate ='"+utilisateur.getDateDeNaissance()+"' WHERE id_user = "+utilisateur.getId()+";";
        doUpdate(query);
        this.closeCon();
    }


    
    public void updatePlace(Place place) {
        String query = "UPDATE appcovid.place SET address = '"+place.getAddress()+"', " +
                "name = '"+place.getName()+"',"+
                "latitude ='"+place.getLatitude()+"', "+
                "longitude = '"+place.getLongitude()+"' WHERE id_place = "+place.getId()+";";
        doUpdate(query);
        this.closeCon();
    }

    public String hashPassword(String password) {

        final byte[] saltByte = "anticonstitutionellement".getBytes();
        final int iter = 1000;
        final int keyLenght = 512;
        final String algo = "PBKDF2WithHmacSHA512";

        try {
            SecretKeyFactory skf = SecretKeyFactory.getInstance(algo);
            return toHex(skf.generateSecret(new PBEKeySpec(password.toCharArray(), saltByte, iter, keyLenght)).getEncoded());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private String toHex(byte[] array) {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0) {
            return String.format("%0" + paddingLength + "d", 0) + hex;
        } else {
            return hex;
        }
    }

}

