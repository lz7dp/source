package com.dpp;

import java.util.Scanner;

public class dpp21_swimming {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Double bestTime1 = Double.parseDouble(scanner.nextLine());
        Double distance1 = Double.parseDouble(scanner.nextLine());
        Double time1 = Double.parseDouble(scanner.nextLine());
        Double maxTime = (distance1 * time1);
        Double every15m = ((Math.floor(distance1 / 15)) * 12.5);
        Double allTime = (maxTime + every15m);

        if (allTime < bestTime1){
            System.out.printf("Yes, he succeeded! The new world record is %.2f seconds.", allTime);
        } else {
            System.out.printf("No, he failed! He was %.2f seconds slower.", (allTime - bestTime1));
        }
    }
}
