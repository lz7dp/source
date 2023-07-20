package introToJava;

import java.util.Scanner;

public class loops {
	
	public static void main(String[] args){
	
	System.out.print("Input int number: ");
	Scanner input = new Scanner(System.in);
	int n = input.nextInt();
	
	for (int row = 1; row <= n; row++) {
		for (int col = 1; col <= row; col++) {
			System.out.print(col + " ");
		}
		System.out.println();
	}
	
	////
	///Scanner input = new Scanner(System.in);
	int num2 = 0;
	System.out.print("n=");
	n = input.nextInt();
	System.out.print("m=");
	int m = input.nextInt();
	for (int num = n; num <= m; num++) {
		boolean prime = true;
		int divider = 2;
		int maxDivider = (int) Math.sqrt(num);
		while (divider <= maxDivider) {
			if (num % divider == 0) {
				prime = false;
				break;
			}
			divider++;
			if (prime & (num!=num2)) {
				System.out.println(num);
				num2 = num;
			}
		}
		//if (prime) {
		//	System.out.printf("%d ", num);
		//}
		
		
		/// new luky numbers
		for (int a = 0; a <= 9; a++) {
			for (int b = 0; b <= 9; b++) {
				for (int c = 0; c <= 9; c++) {
					for (int d = 0; d <= 9; d++) {
						if ((a + b) == (c + d)) {
							System.out.printf("%d%d%d%d%n", a, b, c, d);
						}
					}
				}
			}
		}
		
		
		/// toto 49
		for (int i1 = 1; i1 <= 44; i1++)
			for (int i2 = i1 + 1; i2 <= 45; i2++)
				for (int i3 = i2 + 1; i3 <= 46; i3++)
					for (int i4 = i3 + 1; i4 <= 47; i4++)
						for (int i5 = i4 + 1; i5 <= 48; i5++)
							for (int i6 = i5 + 1; i6 <= 49; i6++)
								System.out.printf(
									"%d %d %d %d %d %d%n",
									i1, i2, i3, i4, i5, i6);

		

}
}
}
