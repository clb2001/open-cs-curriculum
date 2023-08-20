import java.util.ArrayList;
import java.util.List;

/**
 * Class for doing Radix sort
 *
 * @author Akhil Batra, Alexander Hwang
 *
 */
public class RadixSort {
    /**
     * Does LSD radix sort on the passed in array with the following restrictions:
     * The array can only have ASCII Strings (sequence of 1 byte characters)
     * The sorting is stable and non-destructive
     * The Strings can be variable length (all Strings are not constrained to 1 length)
     *
     * @param asciis String[] that needs to be sorted
     *
     * @return String[] the sorted array
     */
    public static String[] sort(String[] asciis) {
        String[] arr = new String[asciis.length];
        System.arraycopy(asciis, 0, arr, 0, asciis.length);
        int maxLength = 0;
        for (String s : asciis) {
            maxLength = Math.max(maxLength, s.length());
        }
        for (int i = maxLength - 1; i >= 0; i--) {
            sortHelperLSD(arr, i);
        }
        return arr;
    }

    /**
     * LSD helper method that performs a destructive counting sort the array of
     * Strings based off characters at a specific index.
     * @param asciis Input array of Strings
     * @param index The position to sort the Strings on.
     */
    private static void sortHelperLSD(String[] asciis, int index) {
        // Optional LSD helper method for required LSD radix sort
        final int ASCII_SIZE = 256;
        int n = asciis.length;
        String[] output = new String[n];
        int[] count = new int[ASCII_SIZE];

        // 统计每个字符出现的次数
        for (String str : asciis) {
            int charIndex = index < str.length() ? str.charAt(index) : 0;// 0 is important!
            count[charIndex]++;
        }

        // 将计数数组转换为累加数组
        for (int i = 1; i < ASCII_SIZE; i++) {
            count[i] += count[i - 1];
        }

        // 根据字符出现次数将字符串放入正确的位置
        for (int i = n - 1; i >= 0; i--) {
            String str = asciis[i];
            int charIndex = index < str.length() ? str.charAt(index) : 0;
            output[count[charIndex] - 1] = str;
            count[charIndex]--;
        }

        // 将排序后的结果复制回原数组
        System.arraycopy(output, 0, asciis, 0, n);
    }

    /**
     * MSD radix sort helper function that recursively calls itself to achieve the sorted array.
     * Destructive method that changes the passed in array, asciis.
     *
     * @param asciis String[] to be sorted
     * @param start int for where to start sorting in this method (includes String at start)
     * @param end int for where to end sorting in this method (does not include String at end)
     * @param index the index of the character the method is currently sorting on
     *
     **/
    private static void sortHelperMSD(String[] asciis, int start, int end, int index) {
        // Optional MSD helper method for optional MSD radix sort
        return;
    }
}
