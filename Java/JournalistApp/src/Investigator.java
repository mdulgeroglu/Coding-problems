class Investigator extends Journalist{

    Investigator(String name){
        super(name);
        setSalary();
    }

    void setSalary(){
        annualSalary = 70000;
    }
}