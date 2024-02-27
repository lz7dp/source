// demonstrated how to correctly access static elements of the class StaticDemo
public class StaticDemo {
    static int a = 42;
    static int b = 99; 
    static void callme() {
        System.out.println("a = " + a);
    }
}
public class Demo1 {
    public static void main(String[] s) {
        StaticDemo.callme();
        System.out.print("b = " + StaticDemo.b);
    }
}