import java.util.HashMap;

public class MyClass {
    public static void main(String[ ] args) {
        HashMap<String, Integer> points = new HashMap<String, Integer>();
        points.put("Amy", 154);
        points.put("Dave", 42);
        points.put("Rob", 733);
        System.out.println(points.get("Dave")); 
    }
}

import java.util.HashMap;
class A {	
   public static void main(String[ ] args) {
   HashMap<String, String> m = new HashMap<String, String>();
   m.put("A", "First");
   m.put("B", "Second");
   m.put("C", "Third");
   System.out.println(m.get("B"));
   }
}

