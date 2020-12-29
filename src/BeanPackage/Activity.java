package BeanPackage;

public class Activity {

    private String startDate;
    private String endDate;

    public Activity(){
        startDate=null;
        endDate=null;
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
}
