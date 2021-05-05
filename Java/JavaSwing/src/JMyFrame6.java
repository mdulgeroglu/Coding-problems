// extending JFrame

import javax.swing.*;

public class JMyFrame6 extends JFrame{
    final int WD = 300;
    final int HT = 500;

    public JMyFrame6() {
        super("My Frame");
        setSize(WD, HT);
        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}
