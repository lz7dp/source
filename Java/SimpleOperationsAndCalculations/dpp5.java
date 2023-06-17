package com.dpp;

import java.util.Scanner;

public class dpp5 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Double priceWhiskey = Double.parseDouble(scanner.nextLine());
        Double bira = Double.parseDouble(scanner.nextLine());
        Double vino = Double.parseDouble(scanner.nextLine());
        Double rakia = Double.parseDouble(scanner.nextLine());
        Double whiskey = Double.parseDouble(scanner.nextLine());

        Double priceAll = ((bira * (((priceWhiskey / 2) / 100) * 20)) + (vino * (((priceWhiskey / 2) / 100) * 60)) + (rakia * (priceWhiskey / 2)) + (whiskey * priceWhiskey));

        System.out.printf("%.2f\n", priceAll);
    }

}
