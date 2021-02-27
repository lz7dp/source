package com.dpp;

import java.util.Scanner;

public class dpp29_numbers {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int number1 = Integer.parseInt(scanner.nextLine());

        if (number1 == 0 || ((number1 >= 100) && (number1 <=200))) {
        } else {
            System.out.println("invalid");
        }
    }
}
