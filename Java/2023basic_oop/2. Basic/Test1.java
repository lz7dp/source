public class LinearCalculation {

    public static void main(String[] args) {
        // Example usage
        double distance1 = findCarsDistance(90, 110, 65, 3);
        System.out.println("Distance 1: " + distance1 + " km");

        double distance2 = findCarsDistance(65.5, 90.4, 20.9, 1.5);
        System.out.println("Distance 2: " + distance2 + " km");

        double distance3 = findCarsDistance(70, 85.6, 32.6, 2);
        System.out.println("Distance 3: " + distance3 + " km");
    }

    public static double findCarsDistance(double car1Speed, double car2Speed, double initialDistance, double time) {
        // Calculate the total speed
        double totalSpeed = car1Speed + car2Speed;

        // Calculate the general way covered by cars
        double generalWay = time * totalSpeed;

        // Calculate the distance between cars
        double distance = initialDistance + generalWay;

        return distance;
    }
}