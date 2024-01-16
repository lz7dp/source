
// checked
public class MyClass {
  public static void main(String[ ] args) {
    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {
      //some code
    }
  }
}

//unchecked
public class MyClass {
    public static void main(String[ ] args) {
        int value = 7;
        value = value / 0;
    }
}