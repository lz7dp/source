package com.dpp;

import java.util.Scanner;

public class dpp2 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        Double l = Double.parseDouble(scanner.nextLine());
        Double w = Double.parseDouble(scanner.nextLine());
        Double a = Double.parseDouble(scanner.nextLine());

        Double s1 = ((l*100)*(w*100));
        Double s3 = ((a*100)*(a*100));
        Double s2 = (s1 / 10);
        Double freeSp = (s1 - s3 - s2);
        Double dancers = (freeSp / (40 + 7000));

        System.out.printf("%.0f\n", Math.floor(dancers));
    }

}
