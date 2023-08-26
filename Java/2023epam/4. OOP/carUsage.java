// Car get set
class Car {
    private String model;
    private int year;
    private int speed;
    
    void setSpeed(int speed) {
        this.speed = speed;
    }
    int getSpeed() {
        return speed;
    }
}

class carUsage {
    public static void main(String[] args) {
        Car mycar = new Car();
        int mySpeed = 140;
        mycar.setSpeed(mySpeed);
        System.out.println(mycar.getSpeed());
    }
}
