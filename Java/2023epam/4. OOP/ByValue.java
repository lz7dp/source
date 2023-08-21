class ByValue {
  public static void start(int number) {
    System.out.println("Old value of \"number\" into \"start\" method is:" + number);
    number = 3;
    System.out.println("New value of \"number\" into \"start\" method is:" + number);
  }
  public static void main(String[] args) {
    int number = 5;
    System.out.println("Old value of \"number\" into \"main\" method is:" + number);
    start(number);
    System.out.println("New value of \"number\" into \"main\" method is:" + number);
  }
}