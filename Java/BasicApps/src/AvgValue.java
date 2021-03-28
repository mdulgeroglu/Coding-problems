// Write a method that returns the average of a list of integers.

import java.util.*;

public class AvgValue {

    public static void main(String args[]) {
        ArrayList<Integer> arrayList = new ArrayList<>(Arrays.asList(-4, 30, 34, 101));
        System.out.println(avg(arrayList));
    }

    static Double avg(List <Integer> list) {

        // init vars
        double sum     = 0;
        double average = 0;

        // calc avg
        for (int i : list) sum += i;    // sums values in ArrayList
        average = sum / list.size();    // assigns the avg to var

        // return
        return average;
    }

}



