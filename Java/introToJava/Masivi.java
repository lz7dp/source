package introToJava;

import java.util.Scanner;
import java.util.Arrays;

public class Masivi {
		
		public static void main(String[] args) {
			int i1 = 0;
			int[] myArray = { 1, 2, 3, 4, 5, 6 };
			System.out.println(myArray[5]);
			
			
			/// reverse array
			int[] array = new int[] { 1, 2, 3, 4, 5 };

			// Get array size
			int length = array.length;

			// Declare and create the reversed array
			int[] reversed = new int[length];

			// Initialize the reversed array
			for (int index = 0; index < length; index++) {
				reversed[length - index - 1] = array[index];
			}
			
			// Print the reversed array
			System.out.println(Arrays.toString(reversed));
			
			
			/// new
			Scanner input = new Scanner(System.in);			
			int n1 = input.nextInt();
			int[] array1 = new int[n1];

			for (i1 = 0; i1 < n1; i1++) {
				  array1[i1] = input.nextInt();
				}
			// Print the reversed array
			System.out.println(Arrays.toString(array1));
			
			/// rev dpp
			int tmp1 = 0;
			for (i1 = 0; i1 < (n1/2); i1++) {
				tmp1 = array1[i1];
				array1[i1] = array1[((n1-1) - i1)];
				array1[(n1 - i1 - 1)] = tmp1;
				// Print the reversed array
				System.out.println(Arrays.toString(array1));
				}


		}
		
		
}


