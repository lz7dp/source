package com.dpp;

import java.util.Scanner;

public class dpp23_school {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double dohod = Double.parseDouble(scanner.nextLine());
        Double uspeh = Double.parseDouble(scanner.nextLine());
        Double minZaplata = Double.parseDouble(scanner.nextLine());
        Double uspStip = 0.0;
        Double socStip = 0.0;

        if (uspeh >= 5.50){
            uspStip = (uspeh * 25);
        }

        if ((dohod < minZaplata) && (uspeh >= 4.50)) {
            socStip = (minZaplata / 100 * 35);
        }

        if ((uspStip == 0) && (socStip == 0)){
            System.out.println("You cannot get a scholarship!");
        } else if (uspStip < socStip){
            System.out.printf("You get a Social scholarship %.0f BGN", (Math.floor(socStip)));
        } else if (uspStip >= socStip){
            System.out.printf("You get a scholarship for excellent results %.0f BGN", (Math.floor(uspStip)));
        }
    }

}
