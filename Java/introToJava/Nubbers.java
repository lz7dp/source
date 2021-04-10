package introToJava;

import java.util.Scanner;

public class Nubbers {
	public static void main(String[] args) {
		
	Scanner input = new Scanner(System.in);
	
	System.out.printf("Input number = ");
	int number = input.nextInt();
	
	switch (number) {
	    case 0: System.out.println("Нула"); break;
		case 1: System.out.println("Едно"); break;
		case 2: System.out.println("Две"); break;
		case 3: System.out.println("Три"); break;
		case 4: System.out.println("Четири"); break;
		case 5: System.out.println("Пет"); break;
		case 6: System.out.println("Шест"); break;
		case 7: System.out.println("Седем"); break;
		case 8: System.out.println("Осем"); break;
		case 9: System.out.println("Девет"); break;
		default: System.out.println("Не знам какво е това число!");
		}
	
	//
	// Initialize the counter
	int counter = 0;
	// Check the loop condition
	while (counter < 10) {
		// Execute statements in loop if the result is true
		System.out.printf("Number : %d%n", counter);
		// Change the counter
		counter++; 
	}

	///
///	Scanner input = new Scanner(System.in);
	System.out.print("n = ");
	int n = input.nextInt();
	int num = 1;
	int sum = 1;
	System.out.print("The sum 1");
	while (num < n) {
		num++;
		sum += num;
		System.out.printf("+%d", num);
	}
	System.out.printf(" = %d%n", sum);

	
	///
//	Scanner input = new Scanner(System.in);
	System.out.print("Enter a positive Number: ");
	num = input.nextInt();
	int divider = 2;	
	int maxDivider = (int) Math.sqrt(num);
	boolean prime = true;
	while (prime && (divider <= maxDivider)) {
		if (num % divider == 0) {
			prime = false;
		}
		divider++;
	}
	System.out.println("Prime? " + prime);

	/// factorial
	
//	Scanner input = new Scanner(System.in);
	n = input.nextInt();
	// "long" is the biggest integer type
	long factorial = 1;
	// Perform an “infinite loop" 
	while (n >= 1 ) {
		factorial *= n;
		n--;
	}
	System.out.println("n! = " + factorial);

	
	}

}