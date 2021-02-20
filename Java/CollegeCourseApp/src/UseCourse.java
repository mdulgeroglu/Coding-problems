import javax.swing.*;
import java.util.*;
public class UseCourse
{
   public static void main(String[] args)
   {
      Scanner input = new Scanner(System.in);
      String dept, inStr;
      String[] labCourses = {"BIO", "CHM", "CIS", "PHY"};
      int id, credits;
      int found = 0;
      int x;
      
      // your code here
      dept = JOptionPane.showInputDialog(null, "Enter dept: ");
      inStr = JOptionPane.showInputDialog(null, "Enter course num: ");
      id = Integer.parseInt(inStr);
      inStr = JOptionPane.showInputDialog(null, "Enter credits: ");
      credits = Integer.parseInt(inStr);

      boolean inList = Arrays.asList(labCourses).contains(dept);

      if (inList) {
         LabCourse labCourse = new LabCourse(dept, id, credits);
         labCourse.display();
      } else if (!inList) {
         CollegeCourse regCourse = new CollegeCourse(dept, id, credits);
         regCourse.display();
      } else {
         System.out.println("err");
      }
   }
}
