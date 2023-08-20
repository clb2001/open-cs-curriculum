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
        int maxLength = 0;
        for (String s : asciis) {
            maxLength = Math.max(maxLength, s.length());
        }
        List<List<String>> buckets = new ArrayList<>();
        for (int i = 0; i < 256; i++) {
            buckets.add(new ArrayList<>());
        }
        for (int i = maxLength - 1; i >= 0; i--)  {
            for (String string: asciis) {
                if (string.length() > i) {
                    char ch = string.charAt(i);
                    buckets.get((int) ch).add(string);
                } else {
                    buckets.get(0).add(string);
                }
            }
            int k = 0;
            for (List<String> bucket: buckets) {
                for (String string: bucket) {
                    arr[k] = string;
                    k++;
                }
                bucket.clear();
            }

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
        return;
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
