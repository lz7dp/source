class VarArg {
    public int calcSum(int... values) {
        int res = 0; 
        for (int x : values) {
            res += x;
        }
        return res;
    }
}
class VariableArity {
    public static void main(String[] arg) {
        VarArg tstvarg = new VarArg();
        System.out.println(tstvarg.calcSum());
        System.out.println(tstvarg.calcSum(3));
        System.out.println(tstvarg.calcSum(55, 66));
        System.out.println(tstvarg.calcSum(77, 55, 33, 11, 99));
    }
}