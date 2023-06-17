package com.dpp;

import java.util.Scanner;

public class dpp1 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        Double x1 = Double.parseDouble(scanner.nextLine());
        Double y1 = Double.parseDouble(scanner.nextLine());
        Double x2 = Double.parseDouble(scanner.nextLine());
        Double y2 = Double.parseDouble(scanner.nextLine());

        Double a = (Math.max(x1,x2) - Math.min(x1, x2));
        Double b = (Math.max(y1,y2) - Math.min(y1, y2));

        Double lice = (a * b);
        Double perimeter = 2*(a + b);

        Double check1 = (lice % 1);
        if (check1 > 0) {
            System.out.printf("%.4f\n", lice);
        } else {
            System.out.printf("%.0f\n", lice);
        }

        Double check2 = (perimeter % 1);
        if (check2 > 0) {
            System.out.printf("%.4f\n", perimeter);
        } else {
            System.out.printf("%.0f\n", perimeter);
        }
    }

}
