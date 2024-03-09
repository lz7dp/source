// The version of the called static method is always determined at the compilation stage — early binding. 

public class Insurance {
    public static final int LOW = 100;
    public int getPremium() {
        return LOW;
    }
    public static String getCategory() {
        return "Insurance";
    }
}
public class CarInsurance extends Insurance {
    public static final int HIGH = 200;
    @Override
    public int getPremium() {
        return HIGH;
    }
    public static String getCategory() {
        return "CarInsurance";
    }
}
public class Main {
    public static void main(String[] args) {
        Insurance current = new CarInsurance();
        System.out.println("category: " + current.getCategory() );
        System.out.println("category: " + CarInsurance.getCategory() );
    }
}
// Output:
// category: Insurance
// category: CarInsurance
// calling an option of the static method depends on the type of reference to the object, not the object type. In the given case, the way the method getCategory() is called depends on the reference type of the object current
