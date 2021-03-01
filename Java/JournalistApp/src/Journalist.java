abstract class Journalist {

    String journalistName;
    double annualSalary;

    Journalist(String name){
        name = journalistName;
    }

    public String getJournalistName(){
        return journalistName;
    }

    public double getAnnualSalary(){
        return annualSalary;
    }

    abstract void setSalary();
}
