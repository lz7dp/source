package com.dpp;

import java.util.Scanner;

public class dpp7_even {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int digit1 = Integer.parseInt(scanner.nextLine());
        if ((digit1 % 2) == 0){
            System.out.println("even");
        } else {
            System.out.println("odd");
        }
    }
}
