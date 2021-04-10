/**
 * 
 */
package introToJava;

/**
 * @author Administrator
 *
 */
public class Calc2 {

	/**
	 * @param args
	 */
		
	public static void main(String[] args) {
		
		byte var97 = 97;
		int var52130 = 52130;
		short var_115 = -115;
		int var4825932 = 4825932;
		int var_10000 = -10000;
		double var2 = 34.567839023;
		float var3 = 12.345f;
		float var4 = 3456.091f;
		double var5 = 8923.1234857;
		int var6 = 0x100;
		boolean isMale = true;
		
		String str1 = "Hello";
		String str2 = "World";
		Object obj1 = new String();
					
		System.out.println( "var: " + var97 );
		System.out.println( "var: " + var52130 );
		System.out.println( "var: " + var_115 );
		System.out.println( "var: " + var4825932 );
		System.out.println( "var: " + var_10000 );
		System.out.println( "var: " + var2 );
		System.out.println( "var: " + var3 );
		System.out.println( "var: " + var4 );
		System.out.println( "var: " + var5 );
		System.out.println( "var: " + var6 );
		System.out.println( "var: " + isMale );
		
		obj1 = str1 + " " + str2;
		System.out.println( "obj 1 : " + obj1 );
		String str3 = (String)(obj1);
	
		String str4 = "The \"use\" of quotations causes difficulties.";
		System.out.println( "var: " + str3 );
		System.out.println( "var: " + str4 );
		
		// drug
		int squarePerimeter = 17;
		double squareSide = squarePerimeter / 4.0;
		double squareArea = squareSide * squareSide;
		System.out.println(squareSide); // 4.25
		System.out.println(squareArea); // 18.0625

		// drug
		int a = 5;
		int b = 4;
		System.out.println(a + b);      // 9
		System.out.println(a + b++);    // 9
		System.out.println(a + b);      // 10
		System.out.println(a + (++b));  // 11
		System.out.println(a + b);      // 11
		System.out.println(14 / a);     // 2
		System.out.println(14 % a);     // 4

		// drug
		boolean a1 = true;
		boolean b1 = false;
		System.out.println(a1 && b1);         // false
		System.out.println(a1 || b1);         // true
		System.out.println(!b1);             // true
		System.out.println(b1 || true);      // true
		System.out.println((5>7) ^ (a1==b1)); // false

		// drug
		String first = "Star";
		String second = "Craft";
		System.out.println(first + second); // StarCraft
		String output = first + second + " ";
		int number = 2;
		System.out.println(output + number);
		// StarCraft 2

		// drug
		short a2 = 3;                // 0000 0011 = 3
		short b2 = 5;                // 0000 0101 = 5
		System.out.println( a2 | b2); // 0000 0111 = 7
		System.out.println( a2 & b2); // 0000 0001 = 1
		System.out.println( a2 ^ b2); // 0000 0110 = 6
		System.out.println(~a2 & b2); // 0000 0100 = 4
		System.out.println(a2 << 1); // 0000 0110 = 6
		System.out.println(a2 << 2); // 0000 1100 = 12
		System.out.println(a2 >> 1); // 0000 0001 = 1

		// drug
		int x3 = 10, y3 = 5;
		System.out.println("x > y : " + (x3 > y3)); // true
		System.out.println("x < y : " + (x3 < y3)); // false
		System.out.println("x >= y : " + (x3 >= y3)); // true
		System.out.println("x <= y : " + (x3 <= y3)); // false
		System.out.println("x == y : " + (x3 == y3)); // false
		System.out.println("x != y : " + (x3 != y3)); // true

		// drug
		int x4 = 6;
		int y4 = 4;

		System.out.println(y4 *= 2); // 8
		int z4 = y4 = 3;              // y=3 and z=3  

		System.out.println(z4);      // 3
		System.out.println(x4 |= 1); // 7
		System.out.println(x4 += 3); // 10
		System.out.println(x4 /= 2); // 5

		// drug
		int a4 = 6;
		int b4 = 4;
		System.out.println(a4 > b4 ? "a>b" : "b<=a"); // a>b

		// drug
		String s = "Beer";
		System.out.println(s instanceof String); // true

		// drug ot int -> long -> print kato String
		int myInt = 5;
		System.out.println(myInt); // 5
		long myLong = myInt;
		System.out.println(myLong); // 5
		System.out.println(myLong + myInt); // 10

		// drug convert type
		double myDouble = 5.1d;
		System.out.println(myDouble); // 5.1

		long myLong1 = (long)myDouble; 
		System.out.println(myLong1); // 5
		System.out.println(myDouble);
			
		myDouble = 5e9d; // 5 * 10^9
		System.out.println(myDouble); // 5.0E9
				
		int myInt1 = (int) myDouble;
		System.out.println(myInt1); // 2147483647
		System.out.println(Integer.MAX_VALUE); // 2147483647

		// drug , zagubi na danni
		long myLong11 = Long.MAX_VALUE;
		int myInt11 = (int)myLong11;
		System.out.println(myLong11); // 9223372036854775807
		System.out.println(myInt11); // -1

		// drug nizove
		int a3 = 5;
		int b3 = 7;
		String s3 = "Sum=" + (a3 + b3);
		System.out.println(s3);
		String incorrect = "Sum=" + a3 + b3;
		System.out.println(incorrect);
		System.out.println("Perimeter = " + 2 * (a3 + b3) + ". Area = " + (a3 * b3) + ".");
		
		// drugi math calc
		int r = (150-20) / 2 + 5;

		// Expression for calculation of the surface of the circle
		double surface = Math.PI * r * r;

		// Expression for calculation of the perimeter of the circle
		double perimeter = 2 * Math.PI * r;

		System.out.println(r);  // radius
		System.out.println(surface);  // plost
		System.out.println(perimeter);  // perimetar
		System.out.println(Math.PI);  // Pi

		// calc math effect
		int a6 = 5;
		int b6 = ++a6;

		System.out.println(a6); // 6
		System.out.println(b6); // 6
		
		
	}

}
