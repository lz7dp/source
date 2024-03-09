// 1 from superclass to subclass
public class Cat {
    Cat() {
        System.out.println("Cat constructor");
    }
}
public class BritishCat extends Cat {
    BritishCat() {
        System.out.println("British constructor");
    }
}
public class Main {
    public static void main(String[] arg) {
        BritishCat Cat = new BritishCat();
    }
}
// output:
// Cat constructor
// British constructor

// 2 explicit invocation (super) to a superclass constructor 
public class Cat {
    Cat(String name) {
        System.out.println("Cat constructor – name " + name);
    }
}
public class BritishCat extends Cat {
    BritishCat(String name) {
        super(name);
        System.out.println("British constructor");
    }
}
public class Main {
    public static void main(String[] arg) {
        BritishCat Cat = new BritishCat("Mulberry");
    }
}
// output:
// Cat constructor – name Mulberry
// British constructor


// 3  default superclass constructor should be invoked automatically.
public class Cat {
    Cat() {
        System.out.println("Cat default constructor");
    }
    Cat(String name) {
        System.out.println("Cat constructor " + name);
    }
}
public class BritishCat extends Cat {
    BritishCat(String name) {
        System.out.println("British constructor");
    }
}
public class Main {
    public static void main(String[] arg) {
        BritishCat Cat = new BritishCat("Mulberry");
    }
}
// output:
// Cat default constructor
// British constructor


// 4 superclass has no default constructor and the subclass constructor does not invoke another superclass constructor explicitly
public class Cat {
    Cat(String name) {
        System.out.println("Cat constructor " + name);
    }
}
public class BritishCat extends Cat {
    BritishCat(String name) {
        System.out.println("British constructor");	// error - no default constructor
    }
}
public class Main {
    public static void main(String[] arg) {
        BritishCat Cat = new BritishCat("Mulberry");
    }
}
// error
