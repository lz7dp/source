// most widely used polymorphism in OOP is the use of a reference to a superclass when manipulating a subclass object. 
// Step 1
public class Shape  {
    public void draw() {
        System.out.println("Shape");
    }
}

// define the class Square to extend the class Shape and override its method draw() so that it will draw a square.
// Step 2
public class Square extends Shape {
    @Override
    public void draw() {
        System.out.println("Square");
    }
}

// describe the program launch as follows
// Step 3
public class Main {
    public static void main(String[] arg) {
        Shape myShape = new Square();
        myShape.draw();
    }
}

// create classes that inherit the Shape class, Circle (circle) and Triangle (triangle)
// Step 4
public class Circle extends Shape {
    @Override
    public void draw() {
        System.out.println("Circle");
    }
}
public class Triangle extends Shape {
    @Override
    public void draw() {
        System.out.println("Triangle");
    }
}

// change the code for launching the program as follows
// Step 5
public class Main {
    public static void main(String[] arg) {
        Shape[] shapes = { new Square(), new Circle(), new Triangle() };
        for (Shape  shape : shapes) {
            shape.draw();
        }
    }
}
// Square
// Circle
// Triangle
// thanks to the principle of inheritance, subclasses are a variety of their superclass (relation "is-a"), and they all have in common the method draw().
