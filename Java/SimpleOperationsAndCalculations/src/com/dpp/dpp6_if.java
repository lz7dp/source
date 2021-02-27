package com.dpp;

import java.util.Scanner;

public class dpp6_if {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Double evaluation1 = Double.parseDouble(scanner.nextLine());
        if (evaluation1 >= 5.50){
            System.out.println("Excellent!");
        }
    }
}
