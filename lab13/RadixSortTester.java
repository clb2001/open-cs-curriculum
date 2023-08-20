import org.junit.Test;

public class RadixSortTester {
    @Test
    public void test() {
//        String[] arr = {"az", "apple", "fig", "date", "cherry", "elephant" ,"banana"};
//        String[] arr = new String[] {"  ", "      ", "    ", " "};

        int[] orig1 = {156, 189, 198, 205, 173};// ½ÆÍ­
        int[] orig2 = {156, 78, 229, 84};// NåT
        StringBuilder sb1 = new StringBuilder();
        for (int asciiCode : orig1) {
            char character = (char) asciiCode;
            sb1.append(character);
        }
        String str1 = sb1.toString();
        StringBuilder sb2 = new StringBuilder();
        for (int asciiCode : orig2) {
            char character = (char) asciiCode;
            sb2.append(character);
        }
        String str2 = sb2.toString();

        String[] arr = {str1, str2};
        String[] tmp = RadixSort.sort(arr);

        for (String s : tmp) {
            System.out.println(s);
        }
    }
}
