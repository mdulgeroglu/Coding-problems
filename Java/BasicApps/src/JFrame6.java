// use Layout to show 2 greetings
import javax.swing.*;
import java.awt.*;

public class JFrame6 {
    public static void main(String[] args) {
        final int WD = 300;
        final int HT = 250;

        JFrame aFrame = new JFrame("Sixth Frame");
        aFrame.setSize(WD,HT);
        aFrame.setVisible(true);
        aFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel greeting = new JLabel("Good Day!");
        JLabel greeting2 = new JLabel("Who are you?");
        aFrame.add(greeting);
        aFrame.add(greeting2);

        aFrame.setLayout(new FlowLayout());
    }
}
