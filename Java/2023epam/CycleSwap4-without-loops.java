import java.util.Arrays;

public class CycleSwap {
    public static void main(String[] args) {
        int[] array = {1, 3, 2, 7, 4};
        int shift = 3;

        System.out.println(Arrays.toString(array));

        CycleSwap.cycleSwap(array);
        System.out.println(Arrays.toString(array));
        
        CycleSwap.cycleSwap(array, shift);
        System.out.println(Arrays.toString(array));
    }

    public static void cycleSwap(int[] array) {
        if (array.length <= 1) {
            return; // Nothing to swap for an array with 0 or 1 element
        }

        int temp = array[array.length - 1];
        System.arraycopy(array, 0, array, 1, array.length - 1);
        array[0] = temp;
    }

    public static void cycleSwap(int[] array, int shift) {
        if (array.length <= 1) {
            return; // Nothing to swap for an array with 0 or 1 element
        }

        shift %= array.length; // Make sure shift is within the array length

        int[] tempArray = Arrays.copyOfRange(array, array.length - shift, array.length);
        System.arraycopy(array, 0, array, shift, array.length - shift);
        System.arraycopy(tempArray, 0, array, 0, shift);
    }
}
