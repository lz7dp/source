package com.dpp;

import java.util.Scanner;

public class dpp14_sec {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Double sec1 = Double.parseDouble(scanner.nextLine());
        Double sec2 = Double.parseDouble(scanner.nextLine());
        Double sec3 = Double.parseDouble(scanner.nextLine());
        Double secAll = (sec1 + sec2 + sec3);
        Double min1 = Math.floor(secAll / 60);
        Double sec4 = (min1 * 60);
        Double secOk = (secAll - sec4);

        if (secAll < 60){
            if (secAll < 10){
                System.out.printf("0:0%.0f", secAll);
            } else {
                System.out.printf("0:%.0f", secAll);
            }
        } else if ((secAll >= 60) && (secAll <= 119)){
            if (secOk < 10){
                System.out.printf("1:0%.0f", secOk);
            } else {
                System.out.printf("1:%.0f", secOk);
            }
        } else if (secAll > 120){
            if (secOk < 10){
                System.out.printf("2:0%.0f", secOk);
            } else {
                System.out.printf("2:%.0f", secOk);
            }
        }
    }
}
