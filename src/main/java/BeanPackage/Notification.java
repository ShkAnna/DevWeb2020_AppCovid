package BeanPackage;


public class Notification {
    private String id;
    private String idAsking;
    private String idOther;
    private String message;
    private String pseudoAsking;
    private boolean friendRequest;
    private String date;
    private String time;
   
    
    public Notification(){
        id = null;
        idAsking = null;
        idOther = null;
        message = null;
        date=null;
        time=null;
        friendRequest = true;
    }

    public String getId() {
        return id;
    }

    public String getIdAsking() {
        return idAsking;
    }

    public String getIdOther() {
        return idOther;
    }

    public String getMessage() {
        return message;
    }

    public boolean isFriendRequest() {
        return friendRequest;
    }
    
    public String getPseudoAsking() {
        return pseudoAsking;
    }
  
    public String getDate() {
        return date;
    }
    public String getTime() {
        return time;
    }
    
    
    public void setTime(String time) {
        this.time = time;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    
    public void setPseudoAsking(String pseudoAsking) {
        this.pseudoAsking = pseudoAsking;
    }


    public void setId(String id) {
        this.id = id;
    }

    public void setIdAsking(String idAsking) {
        this.idAsking = idAsking;
    }

    public void setIdOther(String idOther) {
        this.idOther = idOther;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setFriendRequest(boolean friendRequest) {
        this.friendRequest = friendRequest;
    }
    
   
}
