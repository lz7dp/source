package com.epam.rd.autotasks;

import java.util.Arrays;

class CycleSwap {
    public static void main(String[] args) {
    int[] array = new int[]{1, 3, 2, 7, 4};
    CycleSwap.cycleSwap(array);
    System.out.println(Arrays.toString(array));
    }

    static void cycleSwap(int[] array) {
        if (array.length <= 1) {
            return; // Nothing to swap for an array with 0 or 1 element
        }

        int temp = array[array.length - 1];
        for (int i = array.length - 1; i > 0; i--) {
            array[i] = array[i - 1];
        }
        array[0] = temp;
    }

    static void cycleSwap(int[] array, int shift) {
        if (array.length <= 1) {
            return; // Nothing to swap for an array with 0 or 1 element
        }

        shift %= array.length; // Make sure shift is within the array length

        // Create a temporary array to store the elements that need to be shifted
        int[] tempArray = new int[shift];
        for (int i = array.length - shift, j = 0; i < array.length; i++, j++) {
            tempArray[j] = array[i];
        }

        // Shift the elements in the main array to the right
        for (int i = array.length - 1; i >= shift; i--) {
            array[i] = array[i - shift];
        }

        // Copy back the shifted elements from the temporary array
        for (int i = 0; i < shift; i++) {
            array[i] = tempArray[i];
        }
    }
}
