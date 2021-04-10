package introToJava;

import java.util.Scanner;

public class ReadingStringsNewStyle {

	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("Please enter your first name: ");
		String firstName = input.nextLine();

		System.out.print("Please enter your last name: ");
		String lastName = input.nextLine();

		System.out.printf("Hello, %s %s!\n", firstName, lastName);

		// input.close(); - Don't close Scanner reading System.in!
	}
}

// Output:	Please enter your first name: Boris
//					Please enter your last name: Valkov
//					Hello, Boris Valkov!
