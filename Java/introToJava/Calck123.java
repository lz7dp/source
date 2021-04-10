package introToJava;

public class Calck123 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// Declare some variables
		
		//1
		byte centuries = 20;
		short years = 2000;
		int days = 730480;
		long hours = 17531520;
		
		//2
		float floatPI = 3.141592653589793238f;
		double doublePI = 3.141592653589793238;
		double doubleDeseta = 0.1d;

		//3
		float sum = 0.1f + 0.1f + 0.1f + 0.1f + 0.1f + 0.1f + 0.1f + 0.1f + 0.1f + 0.1f;
		float num = 1.0f;
		// Is sum equal to num
		boolean equal = (num == sum);

		//4
		int a = 1;
		int b = 2;
		// Which one is greater?
		boolean greaterAB = (a > b);
		// Is it equal to 1?
		boolean equalA1 = (a == 1);

		
		// Print the result on the console
		//1
		System.out.println(centuries + " centuries is " + years + " years, or " + days + " days, or " + hours + " hours.");
		//2
		System.out.println("Float PI is: " + floatPI);
		System.out.println("Double PI is: " + doublePI);
		System.out.println("Double Deseta is: " + doubleDeseta);
		//3
		System.out.println("num = " + num + " sum = " + sum + " equal = " + equal);
		//4
		if (greaterAB) {
			System.out.println("A > B");
		} else {
			System.out.println("A <= B");
		}
		System.out.println("greaterAB = " + greaterAB);
		System.out.println("equalA1 = " + equalA1);
		
		// 5 drug
		char symbol = 'a';
		// Print the result ot the console
		System.out.println("The code of '" + symbol + "' is: " + (int) symbol);
		symbol = 'b';
		System.out.println("The code of '" + symbol + "' is: " + (int) symbol);
		symbol = 'A';
		System.out.println("The code of '" + symbol + "' is: " + (int) symbol);

		// 6 drug
		// Declare some variables
		String firstName = "Ivan";
		String lastName = "Ivanov";
		String fullName = firstName + " " + lastName;
		// Print the result ot the console		
		System.out.println("Hello, " + firstName + "!");		
		System.out.println("Your full name is " + fullName + ".");
				
		// 7 drug Declare variables
		Object container = 5;
		Object container2 = "Five";
		// Print the result ot the console		
		System.out.println("The value of container is: " + container);
		System.out.println("The value of container2 is: " + container2);

		// 8 drug
		// An ordinary symbol
		char symbol2 = 'a';
		System.out.print(symbol2);

		// Unicode symbol code in a hexadecimal format
		symbol2 = '\u003A'; 
		System.out.print(symbol2);

		// Assigning the single quote symbol
		symbol2 = '\''; 
		System.out.print(symbol2);

		// Assigning the backslash symbol
		symbol2 = '\\';
		System.out.print(symbol2);
		System.out.println(' ');
		
		// 9 drug
		String quotation = "\"Hello, Jude\", he said.";
		System.out.println(quotation);
		String path = "C:\\Windows\\Notepad.exe";
		System.out.println(path);

	}

}
