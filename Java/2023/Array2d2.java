class Array2d2 {
    public static void main(String[] args) {
	int[][] array2D = { { 1, 2, 3, 4, 5 },
						{ 5, 4, 3, 2, 1 },
						{ 0, 2, 0, 4, 0 } };
	int sum = 0;
	for (int[]row : array2D) {
		for (int element : row) {
			sum = sum + element;
		}
	}
	for (int[] row : array2D) {
		for (int element : row) {
			System.out.print(element + " ");
		}
		System.out.println();
	}
	System.out.println("sum = " + sum);
    }
}