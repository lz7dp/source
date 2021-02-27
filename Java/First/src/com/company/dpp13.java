package com.company;

import java.util.Scanner;

public class dpp13 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String fig1 = scanner.nextLine();

        if (fig1.equals("square")){
            Double a1 = Double.parseDouble(scanner.nextLine());
            System.out.printf("%.3f", (a1*a1));
        } else if (fig1.equals("rectangle")) {
            Double a2 = Double.parseDouble(scanner.nextLine());
            Double b2 = Double.parseDouble(scanner.nextLine());
            System.out.printf("%.3f", (a2*b2));
        } else if (fig1.equals("circle")) {
            Double r1 = Double.parseDouble(scanner.nextLine());
            System.out.printf("%.3f", ((r1*r1)*Math.PI));
        } else if (fig1.equals("triangle")) {
            Double a3 = Double.parseDouble(scanner.nextLine());
            Double h3 = Double.parseDouble(scanner.nextLine());
            System.out.printf("%.3f", ((a3*h3)/2));
        }
    }
}
