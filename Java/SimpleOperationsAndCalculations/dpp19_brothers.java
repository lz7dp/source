package com.dpp;

import java.util.Scanner;

public class dpp19_brothers {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Double a1 = Double.parseDouble(scanner.nextLine());
        Double b1 = Double.parseDouble(scanner.nextLine());
        Double c1 = Double.parseDouble(scanner.nextLine());
        Double d1 = Double.parseDouble(scanner.nextLine());

        Double hours1 = (1/((1/a1)+(1/b1)+(1/c1)));
        hours1 = hours1 + ((hours1 / 100) * 15);
        System.out.printf("Cleaning time: %.2f\n", hours1);
        Double hours2 = Math.floor(d1 - hours1);

        if (hours1 < d1) {
            System.out.printf("Yes, there is a surprise - time left -> %.0f hours.", hours2);
        } else {
            System.out.printf("No, there isn't a surprise - shortage of time -> %.0f hours.", (-1 * hours2));
        }
    }
}
