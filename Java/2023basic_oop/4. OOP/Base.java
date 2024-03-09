
// The subclass Derived replaces the body of that method
public class Base {
    public void show() {
        System.out.println("Base");
    }
}
public class  Derived extends Base {
    @Override
    public void show() {
        System.out.println("Derived");
    }
}
public class Demo1 {
    public static void main(String[] args) {
        Base base = new Base();
        Derived obj = new Derived();        
        base.show();
        obj.show();
    }
}
//output:
//Base
//Derived

// supplementing - when overriding the method, you can call the superclass method using the keyword super.
public class Base {
    public void show() {
        System.out.println("Information from Base");
    }
}
public class  Derived extends Base {
    @Override
    public void show() {
        super.show();
        System.out.println("Information from Derived");
    }
}
public class Demo2 {
    public static void main(String[] args) {
        Derived obj = new Derived();
        obj.show();
    }
}
//output:
//Information from Base
//Information from Derived

// replace the access modifier 
package com.model.basic_transport;
public class Vehicle {
    protected int maxSpeed = 230;
    protected void showSpeed() {
        System.out.println(maxSpeed);
    }
}
package com.model.derived_transport;
import com.model.basic_transport.Vehicle;
public class Bicycle extends Vehicle {
    public void showSpeed() {
        System.out.println(maxSpeed);
    }
} 
package com.model.test_transport;
import com.model.basic_transport.Vehicle;
import com.model.derived_transport.Bicycle;
public class Demo {
    public static void main(String[] args) {
        Vehicle vehicle = new Vehicle();
        Bicycle bicycle = new Bicycle();
        System.out.println(vehicle.maxSpeed);		// <-- error
        System.out.println(bicycle.maxSpeed);
        vehicle.showSpeed();
        bicycle.showSpeed();
    }
}