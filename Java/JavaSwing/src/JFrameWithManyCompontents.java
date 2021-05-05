// extending JFrame with many components
// expected out: none/extends class

import javax.swing.*;
import java.awt.*;
public class JFrameWithManyCompontents extends JFrame {
    final int WD = 350;
    final int HT = 350;

    public JFrameWithManyCompontents() {
        super("Demonstrate many components");
        setSize(WD, HT);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel lblHdg = new JLabel("This frame has lots of components");

        JTextField txtName = new JTextField(12);
        JButton btnCont = new JButton("Click to Continue");

        setLayout(new FlowLayout());
        add(lblHdg);
        add(txtName);
        add(btnCont);
    }
}
