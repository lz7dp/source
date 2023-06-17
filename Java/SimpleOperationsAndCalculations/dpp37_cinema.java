package com.dpp;

import java.util.Scanner;

public class dpp37_cinema {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String typeMovie = scanner.nextLine();
        Double r = Double.parseDouble(scanner.nextLine());
        Double c = Double.parseDouble(scanner.nextLine());
        Double price = 0.00;

        switch (typeMovie) {
            case "Premiere":
                price = 12.00;
                break;
            case "Normal":
                price = 7.50;
                break;
            case "Discount":
                price = 5.00;
                break;
            default:
                price = 7.50;
                break;
        }
        price = price * r * c;
        System.out.printf("%.2f leva", price);
    }
}
