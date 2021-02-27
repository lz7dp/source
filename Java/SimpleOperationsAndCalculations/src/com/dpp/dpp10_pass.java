package com.dpp;

import java.util.Scanner;

public class dpp10_pass {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        String pass1 = scanner.nextLine();
        String pass2 = "s3cr3t!P@ssw0rd";

        if (pass1.equals(pass2)){
            System.out.println("Welcome");
        } else {
            System.out.println("Wrong password!");
        }
    }
}

