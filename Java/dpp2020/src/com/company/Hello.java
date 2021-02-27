package com.company;

import java.awt.Frame;
import java.awt.Label;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Hello {

    public static void main(String[] args) {
        Frame f=new Frame("Hello World example of awt application");
        Label label1=new Label("Hello World", Label.CENTER);
        f.add(label1);

        f.setSize(300,100);
        f.setVisible(true);
        f.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent event) {
                System.exit(0);
            }
        });
    }

}
