/** An Integer tester created by Flik Enterprises. */
public class Flik {
    public static boolean isSameNumber(Integer a, Integer b) {
//        System.out.println(a == b);
        // why a == b is false when a = 128 and b = 128?
//        return a == b;
        // 整数缓存机制
        return a.equals(b);
    }
}
