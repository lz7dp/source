package com.dpp;

import java.util.Scanner;

public class dpp39_outfit {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Double degree = Double.parseDouble(scanner.nextLine());
        String dayTime = scanner.nextLine();
        String outfit = "";
        String shoes = "";

        switch (dayTime) {
            case "Morning":
                if ((10 <= degree) && (degree <= 18)){
                    outfit = "Sweatshirt";
                    shoes = "Sneakers";
                }
                if ((18 < degree) && (degree <= 24)){
                    outfit = "Shirt";
                    shoes = "Moccasins";
                }
                if (degree >= 25){
                    outfit = "T-Shirt";
                    shoes = "Sandals";
                }
                break;
            case "Afternoon":
                if ((10 <= degree) && (degree <= 18)){
                    outfit = "Shirt";
                    shoes = "Moccasins";
                }
                if ((18 < degree) && (degree <= 24)){
                    outfit = "T-Shirt";
                    shoes = "Sandals";
                }
                if (degree >= 25){
                    outfit = "Swim Suit";
                    shoes = "Barefoot";
                }
                break;
            case "Evening":
                if ((10 <= degree) && (degree <= 18)){
                    outfit = "Shirt";
                    shoes = "Moccasins";
                }
                if ((18 < degree) && (degree <= 24)){
                    outfit = "Shirt";
                    shoes = "Moccasins";
                }
                if (degree >= 25){
                    outfit = "Shirt";
                    shoes = "Moccasins";
                }
                break;
            default:
                break;
        }
        System.out.printf("It's %.0f degrees, get your %s and %s.", degree, outfit, shoes);
    }
}
