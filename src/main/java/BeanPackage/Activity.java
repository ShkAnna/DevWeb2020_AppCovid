package BeanPackage;

import java.sql.SQLException;
import SQLPackage.SQLConnector;

public class Activity {
		private String startDate;
	    private String endDate;
	    private String id;
	    private String idUser;
	    private String idPlace;
	    private String pseudo;
	    private String nomPlace;
	    private String occurence;

	    public Activity(){
	        startDate=null;
	        endDate=null;
	        id = null;
	        pseudo = null;
	        nomPlace = null;
	        idPlace = null;
	    }

	    public String getStartDate() {
	        return startDate;
	    }

	    public void setStartDate(String startDate) {
	        this.startDate = startDate;
	    }

	    public String getEndDate() {
	        return endDate;
	    }

	    public void setEndDate(String endDate) {
	        this.endDate = endDate;
	    }

	    public String getId() {
	        return id;
	    }

	    public String getOccurence() {
	        return occurence;
	    }

	    public void setOccurence(String occurence) {
	        this.occurence = occurence;
	    }
	    
	    public void setId(String id) {
	        this.id = id;
	    }

	    public String getIdUser() {
	        return idUser;
	    }

	    public void setIdUser(String idUser) throws SQLException {
	        this.idUser = idUser;
	        SQLConnector con = new SQLConnector();
	        pseudo = con.getUser(Integer.parseInt(idUser)).getPseudo();
	    }

	    public String getIdPlace() {
	        return idPlace;
	    }

	    public void setIdPlace(String idPlace) throws SQLException {
	        this.idPlace = idPlace;
	        SQLConnector con = new SQLConnector();
	        nomPlace = con.getPlace(Integer.parseInt(idPlace)).getName();
	    }

	    public String getNomPlace() {
	        return nomPlace;
	    }

	    public String getPseudo() {
	        return pseudo;
	    }
	}
