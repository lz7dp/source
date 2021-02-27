package com.company;

import java.awt.Dialog;
import java.awt.Label;
import java.awt.Window;

    public class Jwt1 {
        public static void main(String[] args) {
            Dialog d = new Dialog(((Window)null),"Hello world!");
            d.setBounds(0, 0, 180, 70);
            d.add(new Label("Hello world!"));
            d.setVisible(true);
        }
    }
