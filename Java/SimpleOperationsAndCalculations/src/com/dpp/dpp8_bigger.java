package com.dpp;

import java.util.Scanner;

public class dpp8_bigger {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int digit1 = Integer.parseInt(scanner.nextLine());
        int digit2 = Integer.parseInt(scanner.nextLine());
        if (digit1 > digit2){
            System.out.println(digit1);
        } else {
            System.out.println(digit2);
        }
    }
}
