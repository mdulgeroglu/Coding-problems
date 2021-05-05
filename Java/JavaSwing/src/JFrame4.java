// using Font
import javax.swing.*;
import java.awt.*;

public class JFrame4 {
    public static void main(String[] args) {
        //JFrame.setDefaultLookAndFeelDecorated(true);
        JFrame aFrame = new JFrame("Fourt Frame");
        aFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        final int WD = 300;
        final int HT = 250;
        aFrame.setSize(WD,HT);
        aFrame.setVisible(true);

        Font bigFont = new Font("Arial", Font.BOLD, 36);

        JLabel greeting = new JLabel("Good Day!");
        aFrame.add(greeting);
        greeting.setFont(bigFont);
    }
}
