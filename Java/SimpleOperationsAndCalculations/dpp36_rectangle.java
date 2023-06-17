package com.dpp;

import java.util.Scanner;

public class dpp36_rectangle {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double x1 = Double.parseDouble(scanner.nextLine());
        Double y1 = Double.parseDouble(scanner.nextLine());
        Double x2 = Double.parseDouble(scanner.nextLine());
        Double y2 = Double.parseDouble(scanner.nextLine());
        Double x = Double.parseDouble(scanner.nextLine());
        Double y = Double.parseDouble(scanner.nextLine());
        String ss = "Inside / Outside";

        if (((x.equals(x1)) || (x.equals(x2))) && ((y1<=y) && (y<=y2))) {
            ss = "Border";
        }

        if (((y.equals(y1)) || (y.equals(y2))) && ((x1<=x) && (x<=x2))){
            ss = "Border";
        }
        System.out.println(ss);
    }
}