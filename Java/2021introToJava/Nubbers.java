package introToJava;

import java.util.Scanner;

public class Nubbers {
	public static void main(String[] args) {
		
	Scanner input = new Scanner(System.in);
	
	System.out.printf("Input number = ");
	int number = input.nextInt();
	
	switch (number) {
	    case 0: System.out.println("����"); break;
		case 1: System.out.println("����"); break;
		case 2: System.out.println("���"); break;
		case 3: System.out.println("���"); break;
		case 4: System.out.println("������"); break;
		case 5: System.out.println("���"); break;
		case 6: System.out.println("����"); break;
		case 7: System.out.println("�����"); break;
		case 8: System.out.println("����"); break;
		case 9: System.out.println("�����"); break;
		default: System.out.println("�� ���� ����� � ���� �����!");
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
	// Perform an �infinite loop" 
	while (n >= 1 ) {
		factorial *= n;
		n--;
	}
	System.out.println("n! = " + factorial);

	
	}

}