// dynamic initialization
 
public class InitDemo6 {
    private int a = 5;
    private static int b = 100;
    {
        a = -5;
        System.out.println("Dynamic initialization section");
    }
    public InitDemo6() {
        a = 10;
        b = 10;
        System.out.println("Constructor");
    }
    static {
        b = -5;
        System.out.println("Static initialization section");
    }
    public static void main(String[] arg) {
        System.out.println("Main");
        InitDemo6 obj = new InitDemo6();
        System.out.println("a=" + obj.a + " b=" + b);
    }
}