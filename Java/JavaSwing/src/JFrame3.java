// Intro to Jlabel add() setText()
import javax.swing.*;

public class JFrame3 {
    public static void main(String[] args) {
        JFrame.setDefaultLookAndFeelDecorated(true);
        JFrame aFrame = new JFrame("Third Frame");
        aFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        final int WD = 300;
        final int HT = 250;
        aFrame.setSize(WD,HT);
        aFrame.setVisible(true);
        JLabel greeting = new JLabel("Good Day!");
        aFrame.add(greeting);
        greeting.setText("Howdy!");
    }
}
