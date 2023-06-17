package com.company;

import java.util.Scanner;
public class AreaRectangle {
        public static void main(String[] args)
        {
            Scanner scanner = new Scanner(System.in);
            System.out.println("enter values for a, b:");
            double a = Double.parseDouble(scanner.nextLine());
            double b = Double.parseDouble(scanner.nextLine());
            double area = (a*b);
            // TODO: calculate the area and print it
            System.out.println(area);
        }

}

