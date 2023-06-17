package com.dpp;

import java.util.Scanner;

public class dpp22_round_func {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double step1 = Double.parseDouble(scanner.nextLine());

        System.out.println(step1); // tha same input
        System.out.println(Math.abs(step1)); // positive exit
        System.out.println(Math.floor(step1)); // round up ever
        System.out.println(Math.ceil(step1)); // round down ever
        System.out.printf("%.2f", step1); // classic round to 2-nd digit after point
    }
}
