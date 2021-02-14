//Write a method that calculates the factorial of a given number.
//Factorial is the product of all positive integers less than or equal to n. For example, factorial(4) = 4x3x2x1 = 24.

public class Factorial {

public static void main(String args[]) {
    System.out.println(factorialCalc(10));
}

static int factorialCalc(int n) {
    int sum = 1;
    for (int i=1; i<=n; i++) {
        sum *= i;
    }
    return sum;

}

}
