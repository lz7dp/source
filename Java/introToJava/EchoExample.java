package introToJava;

public class EchoExample {

	public static void main(String[] args)
			throws java.io.IOException {
	      
		int ch;
		System.out.print ("Enter some text: ");
		while ((ch = System.in.read()) != '\n') {
			System.out.print((char) ch);
		}
	}
}
