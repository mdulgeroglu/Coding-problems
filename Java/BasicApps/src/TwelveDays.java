// Implement the TwelveDays application that displays the words to the song starting with any day the user enters.
import java.util.*;

public class TwelveDays {

    public static void main (String args[]) {
        // init vars
        int choice = getChoice();
        String songString = "";
        String th;

        switch (choice) {
            case 12:  songString += "Twelve drummers drumming \n";
            case 11:  songString += "Eleven pipers piping \n";
            case 10:  songString += "Ten lords a-leaping \n";
            case 9:  songString += "Nine ladies dancing \n";
            case 8:  songString += "Eight maids a-milking \n";
            case 7:  songString += "Seven swans a-swimming \n";
            case 6:  songString += "Six geese a-laying \n";
            case 5:  songString += "Five golden rings \n";
            case 4:  songString += "Four calling birds \n";
            case 3: songString += "Three French hens \n";
            case 2: songString += "Two turtle doves and \n";
            case 1: songString += "A partridge in a pear tree \n";
                break;
            default: songString = "Invalid month";
                break;
        }

        // fix 1th 2th 3th
        switch (choice) {
            case 1:  th = "st";
                break;
            case 2:  th = "nd";
                break;
            case 3:  th = "rd";
                break;
            default: th = "th";
                break;
        }

        // display
        if (choice > 12 || choice < 1) {    // control
            System.out.println("Error: number entered is not between 1 and 12");
        } else {
            System.out.println("On the " + choice + th + " day of Christmas");
            System.out.println("My true love gave to me");
            System.out.println(songString);
        }


    }

    public static int getChoice() {
        // init vars
        int limit = 12;
        int userChoice;
        Scanner input = new Scanner(System.in);

        // get users choice
        System.out.print("Enter a number between 1 and 12: ");
        userChoice = input.nextInt();

        return userChoice;
    }




}


