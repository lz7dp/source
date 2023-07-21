public class Spiral {
    public static void main(String[] args) {
        int[][] spiral = Spiral.spiral(4, 3);

        for (int i = 0; i < spiral.length; i++) {
            for (int j = 0; j < spiral[i].length; j++) {
                System.out.print(String.format("%4s", spiral[i][j]));
            }
            System.out.println();
        }
    }

    public static int[][] spiral(int rows, int columns) {
        int[][] spiral = new int[rows][columns];

        int top = 0, bottom = rows - 1, left = 0, right = columns - 1;
        int num = 1;
        int totalElements = rows * columns;

        while (num <= totalElements) {
            // Fill top row from left to right
            for (int i = left; i <= right && num <= totalElements; i++) {
                spiral[top][i] = num++;
            }
            top++;

            // Fill right column from top to bottom
            for (int i = top; i <= bottom && num <= totalElements; i++) {
                spiral[i][right] = num++;
            }
            right--;

            // Fill bottom row from right to left
            for (int i = right; i >= left && num <= totalElements; i--) {
                spiral[bottom][i] = num++;
            }
            bottom--;

            // Fill left column from bottom to top
            for (int i = bottom; i >= top && num <= totalElements; i--) {
                spiral[i][left] = num++;
            }
            left++;
        }

        return spiral;
    }
}