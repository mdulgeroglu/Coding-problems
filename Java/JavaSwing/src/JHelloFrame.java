// extending JFrame with ActionListener component
// expected out: none/extends class

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.concurrent.Flow;

public class JHelloFrame extends JFrame implements ActionListener {
    // creating objects for the JFrame (a label, text field, and button)
    JLabel lblQ         = new JLabel("What is your name?");
    JTextField txtA     = new JTextField(10);
    JButton btnPress = new JButton("OK");
    JLabel lblGreet = new JLabel("");

    final int WD = 275;
    final int HT = 275;

    public JHelloFrame() {
        super("Hello Frame");
        setSize(WD, HT);
        setLayout(new FlowLayout());
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        add(lblQ);
        add(txtA);
        add(btnPress);
        add(lblGreet);

        btnPress.addActionListener(this);
    } // end constructor @19
    @Override
    public void actionPerformed(ActionEvent e) {
        String name = txtA.getText();
        String greet = "Hello " + name;
        lblGreet.setText(greet);
    }

}
