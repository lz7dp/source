public class StatementBasics {
    public static int addPositive(int value) {
        if (value > 0) {
            return value + 1;
        } else {
            return value;
        }
    }

    public static int addPositiveSubtractNegative(int value) {
        if (value > 0) {
            return value + 1;
        } else {
            return value - 2;
        }
    }

    public static int addPositiveSubtractNegativeReplaceZero(int value) {
        if (value > 0) {
            return value + 1;
        } else if (value < 0) {
            return value - 2;
        } else {
            return 3;
        }
    }
}