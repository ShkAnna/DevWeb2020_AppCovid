package BeanPackage;

public class Notification {
    private String id;
    private String idAsking;
    private String idOther;
    private String message;
    private boolean friendRequest;

    public Notification(){
        id = null;
        idAsking = null;
        idOther = null;
        message = null;
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
