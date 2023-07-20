package introToJava;

import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class MoreExamplesWithFormatting {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long n = 120582;
		System.out.format("%d%n", n);				//  -->  "120582"
		System.out.format("%08d%n", n); 			//  -->  "00120582"
		System.out.format("%+8d%n", n); 			//  -->  " +120582"
		System.out.format("%,8d%n", n); 			//  -->  " 120,582"
		System.out.format("%+,8d%n%n", n); 		//  -->  "+120,582"
	    
		double pi = Math.PI;
		System.out.format("%f%n", pi); 			//  -->  "3.141593"
		System.out.format("%.3f%n", pi); 			//  -->  "3.142"
		System.out.format("%10.3f%n", pi); 		//  -->  "     3.142"
		System.out.format("%-10.3f%n", pi); 	//  -->  "3.142"
		System.out.format(Locale.ITALIAN,"%-10.4f%n%n", pi); 	//  -->  "3,1416"

		Calendar c = Calendar.getInstance();
		System.out.format("%tB %te, %tY%n", c, c, c);
																//  -->  "Àâãóñò 9, 2008"

		System.out.format("%tl:%tM %tp%n", c, c, c);
																//  -->  "5:29 pm"

		
		// drug s locale
		Locale.setDefault(Locale.US);
		System.out.println("Locale: " + Locale.getDefault().toString());
		System.out.printf("%.2f\n", 1234.56);
		System.out.printf("%1$tA %1$tI:%1$tM%1$tp %1$tB-%1$tY.\n\n", new Date());

		Locale.setDefault(new Locale("bg", "BG"));
		System.out.println("Locale: " + Locale.getDefault().toString());
		System.out.printf("%.2f\n", 1234.56);

		System.out.printf("%1$tA %1$tH:%1$tM %1$tB-%1$tY.\n", new Date());

		System.err.println("This is error!");
		
	}

}
