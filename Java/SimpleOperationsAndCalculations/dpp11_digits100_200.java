package com.dpp;

import java.util.Scanner;

public class dpp11_digits100_200 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int digit1 = Integer.parseInt(scanner.nextLine());

        if (digit1 < 100){
            System.out.println("Less than 100");
        } else if (digit1 >= 100 && digit1 <= 200){
            System.out.println("Between 100 and 200");
        } else if (digit1 > 200){
            System.out.println("Greater than 200");
        }
    }
}

