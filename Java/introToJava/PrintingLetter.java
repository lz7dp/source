package introToJava;

import java.util.Scanner;

public class PrintingLetter {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		System.out.printf("Enter person name: ");
		String person = input.nextLine();

		System.out.printf("Enter book name: ");
		String book = input.nextLine();
		
		String from = "Authors Team";

		System.out.printf("  Dear %s,%n", person);
		System.out.printf("We are pleased to inform " + 
			"you that \"%2$s\" is the best Bulgarian book. \n" +
			"The authors of the book wish you good luck %s!%n",
			person, book);

		System.out.println("  Yours,");
		System.out.printf("  %s", from);
	}
}
