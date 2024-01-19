class ArrayMain {
    public static void main(String[] args) {
        int[] array;
        int[] arrayInt = new int[100];
        int[] amountDays = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        System.out.println("April has " + amountDays[3] + " days");
        for (int i = 0; i < amountDays.length; i++) {
            if (amountDays[i] < 31) {
                amountDays[i] = 0;
            }
            arrayInt[i] = amountDays[i];
        }
        array = amountDays;
    }
}