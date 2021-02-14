// Write a method that returns the largest integer in the list.
// You can assume that the list has at least one element. 

public class FindMaxInt {

   public static void main(String args[]) {
      int[] list = {-32, -2 , 4, 100, 0, 23, 242};
      System.out.println(max(list));
   }

   static int max(int[] list) {
      int max = list[0];      // init max at first val of list
      for (int i=0; i<list.length; i++) {
         if (list[i] > max) {
            max = list[i];
         }
      }   
      return max;
   }
}
