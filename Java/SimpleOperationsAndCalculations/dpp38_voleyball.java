package com.dpp;

import java.util.Scanner;

public class dpp38_voleyball {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String year = scanner.nextLine();
        Double p = Double.parseDouble(scanner.nextLine());
        Double h = Double.parseDouble(scanner.nextLine());
        Double weekend = 48.00;
        Double weekSofia = (weekend - h);
        Double games = (((weekSofia * 3)/4) + h + ((p * 2)/3));

        switch (year) {
            case "leap":
                games = Math.floor(games + (games * 0.15));
                break;
            case "normal":
                games = Math.floor(games);
                break;
            default:
                games = Math.floor(games);
                break;
        }
        System.out.printf("%.0f", games);
    }
}
