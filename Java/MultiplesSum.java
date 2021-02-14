//Given a number n, write a method that sums all multiples of three and five up to n (inclusive). 

public class MultiplesSum {

   public static void main(String args[]) {
      int number = 55;
      System.out.println(multSumCalc(number));
   }
   
   static int multSumCalc(int n) {
      int sum = 0;
      for (int i=0; i<=n; i++) {
        	if (i % 3 == 0 || i % 5 == 0) {
            sum += i;
          }
      }
      return sum;
   }

}
