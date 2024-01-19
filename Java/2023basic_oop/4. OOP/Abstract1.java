abstract class Animal {
    int legs = 0;
    abstract void makeSound();
}

class Cat extends Animal {
    public void makeSound() {
        System.out.println("Meow");
    }
}

public class Program {
    public static void main(String[] args) {
        Cat c = new Cat();
        c.makeSound();
    }
}