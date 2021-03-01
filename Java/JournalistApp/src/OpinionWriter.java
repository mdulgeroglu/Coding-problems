class OpinionWriter extends Journalist{

    OpinionWriter(String name){
        super(name);
        setSalary();
    }

    void setSalary(){
        annualSalary = 60000;
    }
}