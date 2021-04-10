package introToJava;

import java.util.Scanner;

public class biggerNumber {
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.println("Enter two numbers.");
		System.out.printf("Enter 1st number:");
		int firstNumber = input.nextInt();
		System.out.printf("Enter 2nd number:");
		int secondNumber = input.nextInt();
		int biggerNumber = firstNumber;
		if (secondNumber > firstNumber) {
			biggerNumber = secondNumber;
		}
		System.out.printf("The bigger number is: %d%n", biggerNumber);
		
		/// new 1
		int x = 3;
		if (x > 3) {
			System.out.println("x е  по-голямо от 3");
		} else {
			System.out.println("x не е по-голямо от 3");		
		}
		
		/// new 2
//		Scanner input = new Scanner(System.in);
		System.out.println(
		  "Please enter two numbers (on separate lines).");
		int first = input.nextInt();
		int second = input.nextInt();
		if (first == second) {
			System.out.println("These two numbers are equal.");
		} else {
			if (first > second) {
				System.out.println("The first number is greater.");
			} else {
				System.out.println("The second number is greater.");
			}
		}

	
	}


}
