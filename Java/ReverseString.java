// Write a method that reverses a string.
// For example, 'java interview' becomes 'weivretni avaj'. 

public class ReverseString {

   public static void main(String args[]) {
      String x = "Hello";                   // input
      System.out.println(reverser(x));
   }
   
   static String reverser(String s) {
      String reversedString = "";
      for(int i=s.length()-1; i>=0; i--) {  // Start at index of strings length-1 and increment to 0
         reversedString += Character.toString(s.charAt(i));
      }
      return reversedString;
   }

}
