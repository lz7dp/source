package com.dpp;

import java.util.Scanner;

public class dpp4 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int brDni = Integer.parseInt(scanner.nextLine());
        int brSladkari = Integer.parseInt(scanner.nextLine());
        int brTorti = Integer.parseInt(scanner.nextLine());
        int brGofreti = Integer.parseInt(scanner.nextLine());
        int brPalachinki = Integer.parseInt(scanner.nextLine());

        Double priceTorta = (brTorti * 45.00);
        Double priceGofreta = (brGofreti * 5.80);
        Double pricePalachinka = (brPalachinki * 3.20);
        Double priceEnd = (brDni * brSladkari * (priceTorta + priceGofreta + pricePalachinka));
        Double priceRazhodi = (priceEnd / 8);
        Double priceKamp = (priceEnd - priceRazhodi);

        System.out.printf("%.2f\n", priceKamp);
    }

}
