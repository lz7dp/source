class Loader extends Thread {
    public void run() {
        System.out.println("Hello");
    }
}

class MyClass {
    public static void main(String[ ] args) {
        Loader obj = new Loader();
        obj.start();
    }
}

class Loader implements Runnable {
    public void run() {
        System.out.println("Hello");
    }
}

class MyClass {
    public static void main(String[ ] args) {
        Thread t = new Thread(new Loader());
        t.start();
    }
}

class Main {
    public static void main(String[ ] args) {
        Name name = new Name();
        //set priority
        name.setPriority(10);
        
        Welcome welcome = new Welcome();
        //set priority
        welcome.setPriority(5);
        
        name.start();
        welcome.start();
    }
}

//extend the Thread class
class Welcome extends Thread {
    public void run() {
        System.out.println("Welcome!");
    }
}

//extend the Thread class
class Name extends Thread {
    public void run() {
        System.out.println("Please enter your name");
    }
}

