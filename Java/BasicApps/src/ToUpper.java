//Write a method that converts all strings in a list to their upper case.

import java.util.*;

public class ToUpper {

    public static void main(String args[]) {
        ArrayList<String> stringList = new ArrayList<>();
        stringList.add("Hello");
        stringList.add("cat");
        stringList.add("eaT applE");

        System.out.println(upperCase(stringList));
    }

    static List<String> upperCase(List<String> list) {
        ArrayList<String> upper = new ArrayList<>();    // init new ArrayList

        for (String i: list) {
            upper.add(i.toUpperCase());     // convert strings to upper and add to new ArrayList
        }

        return upper;   // return new ArrayList
    }
}
