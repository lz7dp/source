public class Demo8 {
    public static void main(String[] arg) {
        Point point1 = new Point(5, -5);
        Point point2 = point1;
        Point point3 = new Point(5, -5);
        Point point4 = new Point(5, 5);
        System.out.println(point1.hashCode());
        System.out.println(point2.hashCode());
        System.out.println(point3.hashCode());
        System.out.println(point4.hashCode())
    }
}