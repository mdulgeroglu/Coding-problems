//Write a method that returns the index of the first occurrence of given integer in a list.
//Assume that the index of the first element in the list is zero.
//If the number does not exist return -1. 

public class LinearSearch {

   public static void main(String args[]) {
      int lookup = 33;
      int[] lookuplist = {11, 22, 12, 23, 2};
      System.out.println(linSearch(lookup, lookuplist));
   }
   
   static int linSearch(int n, int[] list) {
      int result = -1;
      for (int i=0; i< list.length; i++) {
         if (n == list[i]) {
            result = i;
            break;      //with  no break result can be assinged a duplicate item in the array not "first occurrence"
         } 
      }
      return result;
   }

}
