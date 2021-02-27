package com.dpp;

import java.util.Scanner;

public class dpp15_bonus {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        String points2 = scanner.nextLine();
        Double bonus1 = 0.0;
        Double points1 = Double.parseDouble(points2);
        String points3 = "5";
        boolean check1 = (points2.endsWith(points3));

        if (points1 <= 100){
            bonus1 = 5.0;
            if ((points1 % 2) == 0){
                bonus1 = bonus1 + 1.0;
            }
            if (check1){
                bonus1 = bonus1 + 2.0;
            }
        } else if ((points1 > 100) && (points1 <= 1000)){
            bonus1 = ((points1 / 100) * 20);
            if ((points1 % 2) == 0){
                bonus1 = bonus1 + 1.0;
            }
            if (check1){
                bonus1 = bonus1 + 2.0;
            }
        } else if (points1 > 1000){
            bonus1 = ((points1 / 100) * 10);
            if ((points1 % 2) == 0){
                bonus1 = bonus1 + 1.0;
            }
            if (check1){
                bonus1 = bonus1 + 2.0;
            }
        }
        if (Math.floor(bonus1) == bonus1) {
            System.out.printf("%.0f\n", bonus1);
        } else {
            System.out.printf("%.1f\n", bonus1);
        }

        if (Math.floor(points1 + bonus1) == (points1 + bonus1)) {
            System.out.printf("%.0f\n", (points1 + bonus1));
        } else {
            System.out.printf("%.1f\n", (points1 + bonus1));
        }
    }
}
