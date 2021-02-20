import java.util.*;
public class LabCourse extends CollegeCourse {

    // attributes
    private final int LABFEE = 50;

    // constructor
    public LabCourse(String dept, int id, int credits) {
        super(dept, id, credits);
        price += LABFEE;
    }
   
    // override display()
    @Override
        public void display() {
            System.out.println(dept + id + "\nLab course\n" + credits + " credits\n" + "Lab fee is $" + LABFEE + "\nTotal fee is $" + price);
        }
      
}
