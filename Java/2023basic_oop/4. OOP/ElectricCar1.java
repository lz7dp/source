//  describing inheritance for the classes Car and ElectricCar, leaving the body of the subclass ElectricCar without implementation

public class Car {
    private String name;
    public void setName(String name) {
        this.name = name;
    }
    public void show() {
        System.out.println("Name: " + name);
    }
}
public class ElectricCar extends Car {  }
public class Program {
    public static void main(String[] args) {
        Car car = new Car();
        car.setName("Wheels");
        car.show();
        ElectricCar electricCar = new ElectricCar();
        electricCar.setName("Lightning");
        electricCar.show();
    }
}