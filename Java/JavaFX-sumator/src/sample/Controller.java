package sample;

import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;

import java.awt.event.ActionEvent;

public class Controller {
    public TextField num1;
    public TextField num2;
    public TextField result;

    public void calculate(MouseEvent mouseEvent) {
        double number1 = Double.parseDouble(num1.getText());
        double number2 = Double.parseDouble(num2.getText());
        double result1 = number1 + number2;
        result.setText(String.valueOf(result1));
    }
}
