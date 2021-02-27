package com.dpp;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
    	Scanner scanner = new Scanner(System.in);
    	Double dal = Double.parseDouble(scanner.nextLine());
        Double shir = Double.parseDouble(scanner.nextLine());
        Double vis = Double.parseDouble(scanner.nextLine());
        Double procZaeto = Double.parseDouble(scanner.nextLine());

        Double obem = ((dal * shir * vis)/10);
        Double obemOk = (obem - ((obem/100)*procZaeto));

    	System.out.printf("%.3f",(obemOk/100));
    }
}
