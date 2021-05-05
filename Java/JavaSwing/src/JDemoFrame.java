// simple jframe that closes on close button
import javax.swing.*;
public class JDemoFrame {
    public static void main(String[] args) {
        JFrame aFrame = new JFrame("This is a frame");
        aFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        final int WD = 300;
        final int HT = 250;
        aFrame.setSize(WD,HT);
        aFrame.setVisible(true);
    }
}
