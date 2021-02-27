package com.dpp;

import java.util.Scanner;

public class dpp9_numtotxt {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int digit1 = Integer.parseInt(scanner.nextLine());

        if (digit1 == 1){System.out.println("one");}
        if (digit1 == 2){System.out.println("two");}
        if (digit1 == 3){System.out.println("three");}
        if (digit1 == 4){System.out.println("four");}
        if (digit1 == 5){System.out.println("five");}
        if (digit1 == 6){System.out.println("six");}
        if (digit1 == 7){System.out.println("seven");}
        if (digit1 == 8){System.out.println("eight");}
        if (digit1 == 9){System.out.println("nine");}
        if (digit1 > 9){System.out.println("number too big");}
    }
}

