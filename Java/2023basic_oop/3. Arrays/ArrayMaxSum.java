public class Main {
    public static void main(String[] args) {
        int[][] array = {
                {1, 2, 3},
                {4, 5, 6},
                {7, 8, 9}
        };

        int maxRowIndex = findMaxRowSumIndex(array);
        System.out.println(" maxRowIndex: " + maxRowIndex);
    }

    public static int findMaxRowSumIndex(int[][] array) {
        int maxSum = Integer.MIN_VALUE;
        int maxIndex = -1;

        for (int i = 0; i < array.length; i++) {
            int rowSum = 0;
            for (int j = 0; j < array[i].length; j++) {
                rowSum += array[i][j];
            }
            if (rowSum > maxSum) {
                maxSum = rowSum;
                maxIndex = i;
            }
        }

        return maxIndex;
    }
}
