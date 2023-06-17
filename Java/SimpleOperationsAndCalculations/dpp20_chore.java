package com.dpp;

import java.util.Scanner;

public class dpp20_chore {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Double step1 = Double.parseDouble(scanner.nextLine());
        Double dancers1 = Double.parseDouble(scanner.nextLine());
        Double days1 = Double.parseDouble(scanner.nextLine());
        Double stepDay = Math.ceil((step1/days1)/step1*100);
        Double stepPerDancer = (stepDay/dancers1);

        if ((Math.abs(stepDay)) < stepDay) {
            stepDay = Math.abs(stepDay) + 1;
        }

        if ( stepDay <= 13) {
            System.out.printf("Yes, they will succeed in that goal! %.2f%%.", stepPerDancer);
        } else {
            System.out.printf("No, They will not succeed in that goal! Required %.2f%% steps to be learned per day.", stepPerDancer);
        }
    }
}
