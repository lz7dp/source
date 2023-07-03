package com.epam.rd.autotasks.snail;

import java.util.Scanner;
public class Snail
{
    public static void main(String[] args)
    {
        int a;
        int b;
        int h;
        int days;
        days = 0;
        Scanner scanner = new Scanner(System.in);
        a = scanner.nextInt();
        b = scanner.nextInt();
        h = scanner.nextInt();
        if (((a - b) < 1) && (a < h)){
            System.out.println("Impossible");
        } else {
            while (h > 0) {
                if ((h - a) < 1) {
                    days = days + 1;
                    break;
                }
                h = h - a + b;
                days = days + 1;
            }
            System.out.println(days);
        }
    }
}