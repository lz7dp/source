package com.company;

import java.util.Scanner;

public class dpp14 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double a1 = Double.parseDouble(scanner.nextLine());
        Double a2 = Double.parseDouble(scanner.nextLine());
        Double a3 = Double.parseDouble(scanner.nextLine());

        if ((a1.equals(a2)) && (a1.equals(a3))) {
            System.out.println("yes");
        } else {
            System.out.println("no");
        }
    }
}
