package introToJava;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ReadStringsOldStyle {

	public static void main(String[] args) 
			throws Exception {

		// Open the standard input
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("Please enter your first name: ");
		String firstName = br.readLine();
		
		System.out.print("Please enter your last name: ");
		String lastName = br.readLine();
		
		System.out.printf("Hello, %s %s!\n", firstName, lastName);

		// br.close(); - Do not close stream reading System.in!
	}
}
