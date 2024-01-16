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

import java.util.HashMap;
import java.util.Scanner;

public class Main {
    public static void main(String[ ] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        HashMap<String, Integer> ages = new HashMap<String, Integer>();
        ages.put("David", 22);
        ages.put("Tom", 23);
        ages.put("Robert", 32);
        ages.put("Alice", 21);
        ages.put("Sophie", 19);
        ages.put("Maria", 24);
        ages.put("John", 28);
        
        
        String[] nameArr = new String[ages.size()];
        nameArr = ages.keySet().toArray(nameArr);
        
        int ageLimit = scanner.nextInt();
        
        for (String emp : nameArr){
            //your code goes here
            if (ages.get(emp) < ageLimit) {
                ages.remove(emp);
            }
        }
        
        System.out.println(ages);
    }
}