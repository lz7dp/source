package com.epam.rd.autotasks.arrays;

import java.util.Arrays;

public class LocalMaximaRemove {

    public static void main(String[] args) {
        int[] array = new int[]{18, 1, 3, 6, 7, -5};

        System.out.println(Arrays.toString(removeLocalMaxima(array)));
    }

    public static int[] removeLocalMaxima(int[] array){
        int[] arrayOut = new int[array.length];
        arrayOut = Arrays.copyOf(array, array.length);
        int lenEnd = array.length;
        for (int i = 0; i < lenEnd; i++) {
            if (i == 0){
                if (arrayOut[i] > arrayOut[i+1]) {
                    lenEnd = lenEnd - 1;
                    for (int j = i; j < lenEnd; j++){
                        arrayOut[j] = arrayOut[j+1];
                    }

                }
            }
            else if (i == array.length-1) {
                if (arrayOut[i - 1] < arrayOut[i]) {
                    lenEnd = lenEnd - 1;
                    for (int j = i; j < lenEnd; j++){
                        arrayOut[j] = arrayOut[j+1];
                    }
                }
            }
            else {
                if (arrayOut[i - 1] < arrayOut[i] && arrayOut[i] > arrayOut[i + 1]) {
                    lenEnd = lenEnd - 1;
                    for (int j = i; j < lenEnd; j++){
                        arrayOut[j] = arrayOut[j+1];
                    }
                }
            }
        }
        int[] arrayOut2 = Arrays.copyOf(arrayOut, lenEnd);

        return arrayOut2;
    }
}
