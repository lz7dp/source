//The private field numOfCars is defined in it to calculate the number of objects of this class. 

public class Car {
    private int numOfCars;
    //other fields
    public Car() {
        numOfCars++;
    }
    //other methods
    public int getNumOfCars() {
        return numOfCars;
    }
}
public class Demo2 {
    public static void main(String[] arg) {
        Car сar1 = new Car();
        Car сar2 = new Car();
        Car сar3 = new Car();
        System.out.println(сar3.getNumOfCars());
    }
}