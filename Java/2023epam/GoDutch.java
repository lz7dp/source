package com.epam.rd.autotasks.godutch;

import java.util.Scanner;

public class GoDutch {

    public static void main(String[] args) {
        int billTotal;
        Scanner scanner = new Scanner(System.in);
        billTotal = scanner.nextInt();
        int friends = scanner.nextInt();
        if (billTotal < 0) {
            System.out.println("Bill total amount cannot be negative");
        } else if (friends <= 0) {
            System.out.println("Number of friends cannot be negative or zero");
        } else {
            billTotal = billTotal + (int) (billTotal * 0.10);
            int splitBill = billTotal / friends;
            System.out.println(splitBill);
        }
    }
}
