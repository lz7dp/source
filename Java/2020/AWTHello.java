package com.company;

import java.awt.*;

public class AWTHello extends Frame {
    public static void main(String argv[]) {
        new AWTHello().show();
    }

    AWTHello() {
        add("Center", new InvokeDialog(this));
        pack();
    }
}

class InvokeDialog extends Button {
    Frame frame;

    InvokeDialog(Frame fr) {
        super("Show dialog");
        frame = fr;
    }

    public boolean action(Event evt, Object what) {
        Dialog d = new Dialog(frame, false);
        d.add("Center", new Label("Hello"));
        d.pack();
        d.show();
        return true;
    }
}