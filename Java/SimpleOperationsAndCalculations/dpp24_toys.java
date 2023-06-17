package com.dpp;

import java.util.Scanner;

public class dpp24_toys {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double travelPrice = Double.parseDouble(scanner.nextLine());
        Double puzzlesQn = Double.parseDouble(scanner.nextLine());
        Double puppetsQn = Double.parseDouble(scanner.nextLine());
        Double teddyQn = Double.parseDouble(scanner.nextLine());
        Double minonsQn = Double.parseDouble(scanner.nextLine());
        Double truckQn = Double.parseDouble(scanner.nextLine());

        Double priceAll = ((puzzlesQn * 2.60) + (puppetsQn * 3.00) + (teddyQn * 4.10) + (minonsQn * 8.20) + (truckQn * 2.00));
        Double quantityAll = (puzzlesQn + puppetsQn + teddyQn + minonsQn + truckQn);

        if (quantityAll >= 50){
            priceAll = (priceAll * 0.75);
        }

        priceAll = (priceAll * 0.90);

        if (priceAll >= travelPrice){
            System.out.printf("Yes! %.2f lv left.", (priceAll - travelPrice));
        } else {
            System.out.printf("Not enough money! %.2f lv needed.", (travelPrice - priceAll));
        }
    }
}
