/*
Muhammed Dulgeroglu
Demo of JavaFX with Scene Builder
Expected out: JavaFX app with button function

 */
package javafxapplication2;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import java.util.Random;


public class FXMLDocumentController implements Initializable {
    
    @FXML
    private Button btnClick;    
    @FXML
    private Label lbl1;    
    @FXML
    private Label lbl2;    
    @FXML
    private Label lbl3;    
    @FXML
    private Label lblResult;
    
    @FXML
    private void handleButtonAction(ActionEvent event) {
        try {
            Random rand = new Random();
            int num1 = rand.nextInt(10);
            int num2 = rand.nextInt(10);
            int num3 = rand.nextInt(10);
            String str1 = Integer.toString(num1);
            String str2 = Integer.toString(num2);
            String str3 = Integer.toString(num3);
            lbl1.setText(str1);
            lbl2.setText(str2);
            lbl3.setText(str3);

            if (num1 == 7)
                lblResult.setText("You Won!!");
            else
                lblResult.setText("Try Again");
        }
        catch (Exception e) {
            System.out.println("Error!");
        }
		
		
		
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
}


