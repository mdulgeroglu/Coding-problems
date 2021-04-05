import java.util.*;

public class DivisionTry {

    public static void main(String args[]) {
        System.out.println("DivisionTry");
        Scanner input = new Scanner(System.in);
        float numerator, denominator, result;

        System.out.print("Enter numerator >> ");
        numerator = input.nextFloat();
        System.out.print("Enter denominator >> ");
        denominator = input.nextFloat();

        try {
            result = numerator / denominator;
            System.out.println("Result: " + result);
        }
        catch(ArithmeticException m) {
            System.out.println("Arithmetic err");
            System.out.println(" ");
            System.out.println(m);
        }
    }
}

