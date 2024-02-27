public class Base {
    private int a, b;
    Base(int a, int b) {
        this.a = a;
        this.b = b;
    }
}
public class Derived extends Base {
    private int c;
    Derived(int a, int b, int c) {
        super(a, b);
        this.c = c;
    }
}
public class Demo {
    public static void main(String[] args) {
        Derived obj = new Derived(1, 2, 3);
    }
}