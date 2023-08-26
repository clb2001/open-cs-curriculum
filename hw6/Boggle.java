import java.util.ArrayList;
import java.util.List;
import edu.princeton.cs.introcs.In;

public class Boggle {
    
    // File path of dictionary file
    static String dictPath = "words.txt";

    /**
     * Solves a Boggle puzzle.
     * 
     * @param k The maximum number of words to return.
     * @param boardFilePath The file path to Boggle board file.
     * @return a list of words found in given Boggle board.
     *         The Strings are sorted in descending order of length.
     *         If multiple words have the same length,
     *         have them in ascending alphabetical order.
     */
    public static List<String> solve(int k, String boardFilePath) {
        // prepare the array
        List<List<Character>> arr = prepare(k, boardFilePath);

        // get the result temp
        List<String> res = getResult(k, arr);

        // sft
        return res;
    }

    public static List<List<Character>> prepare(int k, String boardFilePath) {
        In file = new In(boardFilePath);
        In dict = new In(dictPath);
        if (!file.exists() || !dict.exists() || k <= 0) {
            throw new IllegalArgumentException();
        }

        String init = file.readLine();
        int width = init.length();
        List<List<Character>> arr = new ArrayList<>();
        List<Character> initList = new ArrayList<>();
        for (char i: init.toCharArray()) {
            initList.add(i);
        }
        arr.add(initList);
        while (!file.isEmpty()) {
            String tmp = file.readLine();
            if (tmp.length() != width) {
                throw new IllegalArgumentException();
            }
            List<Character> inList = new ArrayList<>();
            for (char i: tmp.toCharArray()) {
                inList.add(i);
            }
            arr.add(inList);
        }
        return arr;
    }

    public static List<String> getResult(int k, List<List<Character>> arr) {
        List<String> res = new ArrayList<>();
        return null;
    }

    public static void main(String[] args) {
        String board = "/home/chenglibin/code/study/CS61B/hw6/exampleBoard.txt";
        List<String> res = solve(3, board);
    }
}
