import org.junit.Test;

public class RadixSortTester {
    @Test
    public void test() {
        String[] arr = {"apple", "banana", "cherry", "date", "elephant", "fig"};
        String[] tmp = RadixSort.sort(arr);

        for (String s : tmp) {
            System.out.println(s);
        }
    }
}
