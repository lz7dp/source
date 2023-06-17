package com.dpp;

import java.util.Scanner;

public class dpp31_trade {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String town = scanner.nextLine().toLowerCase();
        Double s = Double.parseDouble(scanner.nextLine());
        Double percent = 0.00;

        if (s <= 0){
            System.out.println("error");
        } else {
            if (town.equals("sofia")){
                if ((0 <= s) && (s <= 500)) {
                    percent = 5.00;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((500 <= s) && (s <= 1000)) {
                    percent = 7.00;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((1000 <= s) && (s <= 10000)) {
                    percent = 8.00;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((s > 10000)) {
                    percent = 12.00;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else {
                    System.out.println("error");
                }

            } else if (town.equals("varna")){
                if ((0 <= s) && (s <= 500)) {
                    percent = 4.50;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((500 <= s) && (s <= 1000)) {
                    percent = 7.50;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((1000 <= s) && (s <= 10000)) {
                    percent = 10.00;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((s > 10000)) {
                    percent = 13.00;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else {
                    System.out.println("error");
                }

            } else if (town.equals("plovdiv")){
                if ((0 <= s) && (s <= 500)) {
                    percent = 5.50;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((500 <= s) && (s <= 1000)) {
                    percent = 8.00;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((1000 <= s) && (s <= 10000)) {
                    percent = 12.00;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else if ((s > 10000)) {
                    percent = 14.50;
                    System.out.printf("%.2f", (s / 100 * percent));
                } else {
                    System.out.println("error");
                }

            } else {
                System.out.println("error");
            }
        }
    }
}
