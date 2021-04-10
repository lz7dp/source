package introToJava;

import java.util.Scanner;

public class CalculatingArea {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		System.out.println("This program calculates " +
			"the area of a rectangle or a triangle");

		System.out.print("Enter a and b (for rectangle) " +
			"or a and h (for triangle): ");
		
		int a = input.nextInt();
		int b = input.nextInt();

		System.out.print("Enter 1 for a rectangle or " +
				"2 for a triangle: ");

		int choice = input.nextInt();
		double area = (double) (a * b) / choice;
		System.out.println("The area of your figure is " + area);
	}
}
