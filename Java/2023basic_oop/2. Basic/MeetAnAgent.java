package com.epam.rd.autotasks.meetanagent;

import java.util.Scanner;

public class MeetAnAgent {
    final static int PASSWORD = 133976;

    public static void main(String[] args) {
        int inputPassword;
        Scanner scanner = new Scanner(System.in);
        inputPassword = scanner.nextInt();
        if (inputPassword != PASSWORD) {
            System.out.println("Access denied");
        } else {
            System.out.println("Hello, Agent");
        }
    }
}