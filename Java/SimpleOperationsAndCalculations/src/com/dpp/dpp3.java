package com.dpp;

import java.util.Scanner;

public class dpp3 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        int br = Integer.parseInt(scanner.nextLine());
        Double a = Double.parseDouble(scanner.nextLine());
        Double b = Double.parseDouble(scanner.nextLine());

        Double a1 = (a + (2*0.30));
        Double b1 = (b + (2*0.30));
        Double c = (a / 2);
        Double lice = (a1 * b1);
        Double liceKar = (c*c);
        Double usd = 1.85;
        Double priceSqPok = 7.00;
        Double priceSqKar = 9.00;
        Double priceUsd = ((lice * br * priceSqPok) + (liceKar * br * priceSqKar));
        Double priceBgn = (priceUsd * usd);

        System.out.printf("%.2f USD\n", priceUsd);
        System.out.printf("%.2f BGN\n", priceBgn);

    }

}
