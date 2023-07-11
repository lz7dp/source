
class Array1 {
    public static void main(String[] args) {
        int[] numberArray = new int[10];
        int i = 0;
        while (i < 10) {
            numberArray[i] = i;
            i++;
        }
        i = 0;
        while (i < 10) {
            System.out.println((i+1) + "th array element = " + numberArray[i]);
            i++;
        }
    }
}