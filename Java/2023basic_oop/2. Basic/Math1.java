public class MyClass {
    public static void main(String[ ] args) {
        int x = 5;
        addOneTo(x);
        System.out.println(x);       
    }

    static void addOneTo(int num) {
        num = num + 1;
    }
}