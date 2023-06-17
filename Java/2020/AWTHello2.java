package com.company;

import java.awt.*;
import java.awt.event.*;

public class AWTHello2 {
    public static void main(String argv[]) {
        Frame f = new Frame( "Hello world!" );
        f.addWindowListener( new WindowAdapter(){ public void windowClosing( WindowEvent e ){ System.exit( 0 ); } } );
        f.setSize( 300, 100 );
        f.show();
    }
}


