import java.util.*;
public class CollegeCourse
{
   // attributes
   protected String dept;
   protected int id;
   protected double credits;
   protected double price;

   // constructor
   public CollegeCourse(String dep, int cid, double cr) {
      final int FEEPERCR = 120;
      dept     = dep;
      id       = cid;
      credits  = cr;
      price    = cr * FEEPERCR;
   }
   
   // display()
   public void display() {
      System.out.println(dept + id + "\nNon-lab course\n" + credits + " credits\n" + "Total fee is $" + price);
   }
}
