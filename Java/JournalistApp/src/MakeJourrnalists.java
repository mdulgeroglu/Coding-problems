public class MakeJourrnalists {

    public static void main(String[] args) {

        // make objects
        OpinionWriter opinion   = new OpinionWriter("Jonathan Capehart");
        Investigator invst      = new Investigator("Yamiche Alcindor");

        // display
        System.out.println("Opinion Writer: "+opinion.getJournalistName()+ ", their salary is $"+opinion.getAnnualSalary());
        System.out.println("Investigator: "+invst.getJournalistName()+ ", their is $"+invst.getAnnualSalary());
    }

}
