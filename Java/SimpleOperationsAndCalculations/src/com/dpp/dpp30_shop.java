package com.dpp;

import java.util.Scanner;

public class dpp30_shop {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String product = scanner.nextLine();
        String weekDay = scanner.nextLine();
        Double quantity = Double.parseDouble(scanner.nextLine());
        Double price = 0.00;

        if (weekDay.equals("Monday") || weekDay.equals("Tuesday") || weekDay.equals("Wednesday") || weekDay.equals("Thursday") || weekDay.equals("Friday")){
            if (product.equals("banana")) {
                price =  quantity * 2.5;
                System.out.printf("%.2f", price);
            } else if (product.equals("apple")) {
                price =  quantity * 1.20;
                System.out.printf("%.2f", price);
            } else if (product.equals("orange")) {
                price =  quantity * 0.85;
                System.out.printf("%.2f", price);
            } else if (product.equals("grapefruit")) {
                price =  quantity * 1.45;
                System.out.printf("%.2f", price);
            } else if (product.equals("kiwi")) {
                price =  quantity * 2.70;
                System.out.printf("%.2f", price);
            } else if (product.equals("pineapple")) {
                price =  quantity * 5.50;
                System.out.printf("%.2f", price);
            } else if (product.equals("grapes")) {
                price =  quantity * 3.85;
                System.out.printf("%.2f", price);
            }

        } else if (weekDay.equals("Saturday") || weekDay.equals("Sunday")){
            if (product.equals("banana")) {
                price =  quantity * 2.70;
                System.out.printf("%.2f", price);
            } else if (product.equals("apple")) {
                price =  quantity * 1.25;
                System.out.printf("%.2f", price);
            } else if (product.equals("orange")) {
                price =  quantity * 0.90;
                System.out.printf("%.2f", price);
            } else if (product.equals("grapefruit")) {
                price =  quantity * 1.60;
                System.out.printf("%.2f", price);
            } else if (product.equals("kiwi")) {
                price =  quantity * 3.00;
                System.out.printf("%.2f", price);
            } else if (product.equals("pineapple")) {
                price =  quantity * 5.60;
                System.out.printf("%.2f", price);
            } else if (product.equals("grapes")) {
                price =  quantity * 4.20;
                System.out.printf("%.2f", price);
            }

        } else {
            System.out.println("error");
        }

        if (price == 0.00){
            System.out.println("error");
        }
    }
}
