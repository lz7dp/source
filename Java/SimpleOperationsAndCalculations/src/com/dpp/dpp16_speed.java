package com.dpp;

import java.util.Scanner;

public class dpp16_speed {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Double speed1 = Double.parseDouble(scanner.nextLine());
        String speed2 = "";

        if (speed1 <= 10){
            speed2 = "slow";
        } else if ((speed1 > 10) && (speed1 <= 50)){
            speed2 = "average";
        } else if ((speed1 > 50) && (speed1 <= 150)){
            speed2 = "fast";
        } else if ((speed1 > 150) && (speed1 <= 1000)){
            speed2 = "ultra fast";
        } else if (speed1 > 1000){
            speed2 = "extremely fast";
        }

        System.out.println(speed2);
    }
}
