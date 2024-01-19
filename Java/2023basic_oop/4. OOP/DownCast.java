//Animal a = new Cat();

//Animal a = new Cat();
//((Cat)a).makeSound();

class A {
   public void print() {
      System.out.println("A");
   }
}

class B extends A {
   public void print() {
      System.out.println("B");
   }

   public static void main(String[ ] args) {
    A object = new B();
    B b = (B) object;
    b.print();
   }
}