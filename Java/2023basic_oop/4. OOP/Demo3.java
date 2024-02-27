//numOfCars is declared as static. Thus, the method used to get its value—getNumOfCars()—is also static. 

public class Car {
    private static int numOfCars; 
    //other fields  
    public Car() { 
        numOfCars++; 
    }
    //other methods
    public static int getNumOfCars() {
        return numOfCars;
    }
}
public class Demo3 {
    public static void main(String[] arg) {
        Car сar1 = new Car();
        Car сar2 = new Car();
        Car сar3 = new Car();
        System.out.println(Car.getNumOfCars());
    }
}