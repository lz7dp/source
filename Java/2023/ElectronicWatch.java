package com.epam.rd.autotasks.meetautocode;

import java.util.Scanner;

public class ElectronicWatch {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int seconds = -1;
        while (seconds < 0) {
            seconds = scanner.nextInt();
        }
        int minuteInHour = 60;
        int secInMinute = 60;
        int minute;
        int hour;

        minute = seconds / secInMinute;
        seconds -= minute * secInMinute;
        hour = minute / minuteInHour;
        minute -= hour * minuteInHour;
        if (hour == 24) {
            hour = 0;
        }
        System.out.format("%d:%02d:%02d", hour, minute, seconds);
    }
}
