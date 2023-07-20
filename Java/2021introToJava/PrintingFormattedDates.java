package introToJava;

import java.util.Date;

public class PrintingFormattedDates {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.printf("The time is: %1$tH:%1$tM:%1$tS.\n", new java.util.Date());
		// The time is: 13:54:36. (ends with new line "\n")
		
		Date date = new Date();
		System.out.printf("The date in Day/Month/Year is: %1$td/%1$tm/%1$tY.\n", date);
		// The date in Day/Month/Year is: 09/08/2008.
		
		System.out.printf("The date and time is: %1$tA%1$tI:%1$tM%1$tp %1$tB/%1$tY. \n", date);
		// The date and time is: Събота 05:08pm Август/2008.

	}

}
