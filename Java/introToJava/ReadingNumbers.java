package introToJava;

import java.util.Scanner;

public class ReadingNumbers {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		
		System.out.print("a = ");
		int a = input.nextInt();

		System.out.print("b = ");
		int b = input.nextInt();
		// Output:	a = 5
		//					b = 6

		System.out.printf("%d + %d = %d%n", a, b, a + b);
		System.out.printf("%d * %d = %d%n", a, b, a * b);
		// Output:	5 + 6 = 11
		//					5 * 6 = 30
		
		System.out.print("f = ");
		float f = input.nextFloat();
		System.out.printf("%d * %d / %f = %f%n", 
			a, b, f, a * b / f);
	}
}
