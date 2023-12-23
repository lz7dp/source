import java.util.Scanner;
import java.util.InputMismatchException;

public class Main

{
	public static void main(String[] args) {
	    Scanner scanner = new Scanner(System.in);
	    try {
	        int num1 = scanner.nextInt();
	        int num2 = scanner.nextInt();
                System.out.println(num1/num2);
	    } catch(ArithmeticException e1) {
	        System.out.println("Error: division by zero");
	    } catch(InputMismatchException e2){
	        System.out.println("Error: wrong value type");
	    }
	}
}