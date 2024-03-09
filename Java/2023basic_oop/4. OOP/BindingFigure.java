// late binding

public class Figure {
    protected double dim1;
    protected double dim2;
    Figure(double dim1, double dim2) {
        this.dim1 = dim1;
        this.dim2 = dim2;
    }
    public double area() {
        System.out.print("Area of the figure not determined ");
        return 0.0;
    }
}
public class Rectangle extends Figure {
    Rectangle(double dim1, double dim2) {
        super(dim1, dim2);
    }
    public double area() {
        System.out.print("Area of the rectangle ");
        return dim1 * dim2;
    }
}
public class Triangle extends Figure {
    Triangle(double dim1, double dim2) {
        super(dim1, dim2);
    }
    public double area() {
        System.out.print("Area of the triangle ");
        return dim1 * dim2 / 2;
    }
}
public class FindAreas {
    public static void main(String[] args) {
        Figure f = new Figure(10.0, 5.0);
        Rectangle r = new Rectangle(9.0, 5.0);
        Triangle t = new Triangle(10.0, 8.0);
        Figure figref;
        figref = r;
        System.out.println( figref.area() );
        figref = t;
        System.out.println( figref.area() );
        figref = f;
        System.out.println( figref.area() );
    }
}
// Output:
// Area of the rectangle 45.0
// Area of the triangle 40.0
// Area of the figure not determined 0.0
// the method to be invoked is chosen during program execution and depends on the object type, not the type of reference to the object. 

/*
    The example describes three classes: Figure (as a superclass), Rectangle, and Triangle (as subclasses).
    The class Figure has two fields declared to store the dimensions of figures (dim1 and dim2) as well as an implemented method to calculate the area of a figure area().
    The shape of the figure is not known for the class Figure; therefore, the method returns 0.
    The subclasses Rectangle and Triangle override the method area() to calculate their area. The constructors of these classes pass their dimensions for storage to the fields dim1 and dim2: Rectangle—width and height—and Triangle—base length and height.
    The class FindAreas creates three objects—one each for the classes Figure, Rectangle, and Triangle. It also creates a reference of the type Figure—figref. This reference accesses created objects one by one, and the method area() is called at it. 
*/	