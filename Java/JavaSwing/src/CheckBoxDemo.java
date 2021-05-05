// extending JFrame with checkboxes
// expected out: A JFrame with checkbox options

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.awt.event.ItemListener;

public class CheckBoxDemo extends JFrame implements ItemListener {
    FlowLayout flow = new FlowLayout();

    JLabel label = new JLabel("What do you want to drink?");

    JCheckBox coffee = new JCheckBox("Coffee", false);
    JCheckBox cola = new JCheckBox("cola", false);
    JCheckBox milk = new JCheckBox("milk", false);
    JCheckBox water = new JCheckBox("water", false);

    public CheckBoxDemo() {
        super("CheckBox Demo");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new FlowLayout());

        label.setFont(new Font("Arial", Font.ITALIC, 22));
        coffee.addItemListener(this);
        cola.addItemListener(this);
        milk.addItemListener(this);
        water.addItemListener(this);

        add(label);
        add(coffee);
        add(cola);
        add(milk);
        add(water);
    }
    @Override
    public void itemStateChanged(ItemEvent check) {

    }

    public static void main(String[] args) {
        final int FRAME_WIDTH = 350;
        final int FRAME_HEIGHT = 120;
        CheckBoxDemo frame = new CheckBoxDemo();
        frame.setSize(FRAME_WIDTH, FRAME_HEIGHT);
        frame.setVisible(true);
    }
}
