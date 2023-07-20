
public class Spiral {
    public static void main(String[] args) {
        int rows = 3;
        int columns = 4;
        int[][] spiralArray = spiral(rows, columns);

        // Print the spiral array
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                System.out.printf("%3d ", spiralArray[i][j]);
            }
            System.out.println();
        }
    }

    public static int[][] spiral(int rows, int columns) {
        int[][] result = new int[rows][columns];

        int num = 1;
        int topRow = 0;
        int bottomRow = rows - 1;
        int leftColumn = 0;
        int rightColumn = columns - 1;

        while (num <= rows * columns) {
            // Traverse from left to right along the top row
            for (int i = leftColumn; i <= rightColumn; i++) {
                result[topRow][i] = num++;
            }
            topRow++;

            // Traverse from top to bottom along the rightmost column
            for (int i = topRow; i <= bottomRow; i++) {
                result[i][rightColumn] = num++;
            }
            rightColumn--;

            // Traverse from right to left along the bottom row
            for (int i = rightColumn; i >= leftColumn; i--) {
                result[bottomRow][i] = num++;
            }
            bottomRow--;

            // Traverse from bottom to top along the leftmost column
            for (int i = bottomRow; i >= topRow; i--) {
                result[i][leftColumn] = num++;
            }
            leftColumn++;
        }

        return result;
    }
}