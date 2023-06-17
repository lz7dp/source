package introToJava;

// LITERALI

public class Variables1 {
	
	public static void main(String[] args) {
	
		// ESCaping posledovatelnosti
		// An ordinary symbol
		char symbol4 = 'a';
		System.out.print(symbol4);
	
		// Unicode symbol code in a hexadecimal format
		char symbol1 = '\u003A'; 
		System.out.print(symbol1);
	
		// Assigning the single quote symbol
		char symbol2 = '\''; 
		System.out.print(symbol2);
	
		// Assigning the backslash symbol
		char symbol3 = '\\';
		System.out.print(symbol3);
		
		//  zadachi - 1
		
		double varParva1 = 34.567839023d;
		float varParva2 = 12.345f;
		double varParva3 = 8923.1234857d;
		float varParva4 = 3456.091f;
		System.out.println(varParva1 + " " + varParva2 + " " + varParva3 + " " + varParva4);
		
		// circle 
		
		int r = (150-20) / 2 + 5;

		// Expression for calculation of the surface of the circle
		double surface = Math.PI * r * r;

		// Expression for calculation of the perimeter of the circle
		double perimeter = 2 * Math.PI * r;

		System.out.println(r);
		System.out.println(surface);
		System.out.println(perimeter);
		
		// defect
		int a = 5;
		int b = ++a;

		/// == < > ...
		
		System.out.println(a); // 6
		System.out.println(b); // 6

		int weight = 700;
		System.out.println(weight >= 500);

		char sex = 'm';
		System.out.println(sex <= 'f');

		double colorWaveLength = 1.630;
		System.out.println(colorWaveLength > 1.621);

		/// f point defect
		float value = 1.0f;
		System.out.println(value);
		float sum = 0.1f + 0.1f + 0.1f + 0.1f + 0.1f +
		0.1f + 0.1f + 0.1f + 0.1f + 0.1f;
		System.out.println(sum);
		System.out.println(sum == value);
		
		/// f point defect compare
		float value1 = 1.0f;
		float sum1 = 0.1f + 0.1f + 0.1f + 0.1f + 0.1f +	0.1f + 0.1f + 0.1f + 0.1f + 0.1f;
		System.out.println("Exact compare: " + (sum1==value1));
		System.out.println("Rounded compare: " + (Math.abs(sum1-value1) < 0.000001));

		/// comp objects
		String str = "bira";
		String anotherStr = str;
		String bi = "bi";
		String ra = "ra";
		String thirdStr = bi  + ra;

		System.out.println("str = " + str);
		System.out.println("anotherStr = " + anotherStr);
		System.out.println("thirdStr = " + thirdStr);
		System.out.println(str == anotherStr);
		System.out.println(str == thirdStr);

		/// boolean
		boolean b1 = true && false;
		System.out.println("b1 = " + b1);
		
		/// boolean operand
		byte b11 = 6 & 5; // 00000110 & 00000101 = 00000100
		byte b2 = 7 | 9; // 00000111 | 00001001 = 00001111
		byte b3 = 5 ^ 4; // 00000101 ^ 00000100 = 00000001
		System.out.println(b11 + " " + b2 + " " + b3);

	}

}
