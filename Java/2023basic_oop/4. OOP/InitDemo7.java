// example shows correct initialization of final fields
 
public class InitDemo7 {
    private final int XX = 50;
    private final int ZZ;
    private final int YY;
    {
        ZZ = 20;
        System.out.println("Dynamic section");
    }
    public InitDemo7() {
        YY = 30;
        System.out.println("Constructor");
    }
    public static void main(String[] arg) {
        System.out.println("Main");
        InitDemo7 obj = new InitDemo7();
    }
}