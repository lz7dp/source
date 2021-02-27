package com.company;

public class Vehicle {
    int maxSpeed;
    int wheels;
    private String color;
    double fuelCapacity;

    void horn() {
        System.out.println("Beep!");
    }

    public String getColor() {
        return color;
    }

    public void setColor(String c) {
        this.color = c;
    }
}
