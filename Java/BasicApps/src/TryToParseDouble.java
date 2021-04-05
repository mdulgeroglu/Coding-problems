import java.util.*;
public class TryToParseDouble {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        double num = 0.0;
        try {
            System.out.println("enter a float: ");
            num = Double.parseDouble(input.nextLine());
        }
        catch (NumberFormatException e) {
            System.out.println("value entered cannot be converted to a float");
        }
        System.out.println("number is " + num);
    }
}
