package com.epam.rd.autotasks.arrays;

import java.util.Arrays;

public class SumOfPrevious {

    public static void main(String[] args) {
        int[] array = new int[]{1, -1, 0, 4, 6, 10, 15, 25};

        System.out.println(Arrays.toString(getSumCheckArray(array)));
    }

    public static boolean[] getSumCheckArray(int[] array){
        boolean[] arrBool = new boolean[array.length];
        for (int i = (array.length-1); i > 1; i--) {
            if ((array[i - 2] + array[i - 1]) == array[i]) {
                arrBool[i] = true;
            }
        }
        return arrBool;
    }
}
