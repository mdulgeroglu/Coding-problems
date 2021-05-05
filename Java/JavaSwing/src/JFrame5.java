// attempt 2 greetings
import javax.swing.*;
import java.awt.*;

public class JFrame5 {
    public static void main(String[] args) {
        final int WD = 300;
        final int HT = 250;

        JFrame aFrame = new JFrame("Fifth Frame");
        aFrame.setSize(WD,HT);
        aFrame.setVisible(true);
        aFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JLabel greeting = new JLabel("Good Day!");
        JLabel greeting2 = new JLabel("Who are you?");
        aFrame.add(greeting);
        aFrame.add(greeting2);

        //Font bigFont = new Font("Arial", Font.BOLD, 36);
        //greeting.setFont(bigFont);
    }
}
