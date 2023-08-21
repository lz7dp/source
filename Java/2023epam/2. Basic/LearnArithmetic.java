public class LearnArithmetic {
    public static void main(String args[]) {
        int a = 10;
        int b = 20;
        int c = 25;
        int d = 25;
        System.out.println("a + b  = " + (a + b));
        System.out.println("a - b  = " + (a - b));
        System.out.println("a * b  = " + (a * b));
        System.out.println("b / a  = " + (b / a));
      	System.out.println("b % a  = " + (b % a));
      	System.out.println("c % a  = " + (c % a));
      	System.out.println("a++    = " +  (a++));
      	System.out.println("a--    = " +  (a--));
      	System.out.println("d++    = " +  (d++));
      	System.out.println("++d    = " +  (++d));
        System.out.println("a += b = " + (a += b));
        System.out.println("a      = " + (a));
        System.out.println("a -= b = " + (a -= b));
        System.out.println("a      = " + (a));
		
	int a = 60; 
	int b = 13; 
		 
	System.out.println("a & b   = " + (a & b)); // 12  = ... 0000 1100
	System.out.println("a | b   = " + (a | b)); // 61  = ... 0011 1101
	System.out.println("a ^ b   = " + (a ^ b)); // 49  = ... 0011 0001
	System.out.println("~a      = " + ~a); // -61 = 1111 1111 1111 1111 1111 1111 1100 0011
	System.out.println("a << 2  = " + (a << 2)); // 240 = ... 1111 0000
	System.out.println("a >> 2  = " + (a >> 2)); // 15  = ... 0000 1111
	System.out.println("a >>> 2 = " + (a >>> 2)); // 15  = ... 0000 1111
		
	System.out.println(12345 + 5432l);
	System.out.println("2 + 2 = " + 2 + 2);
	System.out.println(010 | 4);
    }
}