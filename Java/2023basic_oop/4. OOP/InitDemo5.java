// static initializers
import java.util.Arrays;
public class InitDemo5 {
    private static char[] alph;
    static {
        alph = new char[26];
        int i = 0;
        for (char c = 'a'; i < alph.length; c++, i++) {
            alph[i] = c;
        }
    }
    public static void main(String[] arg) {
        System.out.print(Arrays.toString(alph));
    }
}