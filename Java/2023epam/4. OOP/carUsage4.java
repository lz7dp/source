class Car {
    private String model;
    private String brand;
    public Car() {}
    public Car(String model) {
        this.model = model;
    }
    public Car(String model, String brand) {
        this.model = model;
        this.brand = brand;
    }
    public String getModelCar() {
        return model;
    }
    public String getBrandCar() {
        return brand;
    }
}    
class carUsage4 {
    public static void main(String[] arg) {
        Car car1 = new Car();
        Car car2 = new Car("Camry");
        Car car3 = new Car("Camry", "Toyota");
        System.out.println(car1.getModelCar());
        System.out.println(car1.getBrandCar());
        System.out.println(car2.getModelCar());
        System.out.println(car2.getBrandCar());
        System.out.println(car3.getModelCar());
        System.out.println(car3.getBrandCar());        
    }
}