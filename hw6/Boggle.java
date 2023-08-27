import java.util.ArrayList;
import java.util.List;
import edu.princeton.cs.introcs.In;

class TrieNode {
    TrieNode[] children;
    boolean isEndOfWord;

    public TrieNode() {
        children = new TrieNode[54];
        isEndOfWord = false;
    }
}

class Trie {
    TrieNode root;

    public Trie() {
        root = new TrieNode();
    }

    public void insert(String word) {
        TrieNode node = root;
        for (char c: word.toCharArray()) {
            int index;
            if (c == '\'') {
                index = 0;
            }
            else if (c == 'é') {
                index = 53;
            } else if (Character.isLowerCase(c)) {
                index = c - 'a' + 27;
            } else {
                index = c - 'A' + 1;
            }
            if (node.children[index] == null) {
                node.children[index] = new TrieNode();
            }
            node = node.children[index];
        }
        node.isEndOfWord = true;
    }
}

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
        List<List<Character>> arr = prepareArr(k, boardFilePath);

        // get the word list
        List<String> words = prepareDict(dictPath);

        // get the result temp
        return getResult(k, arr, words);
    }

    private static List<List<Character>> prepareArr(int k, String boardFilePath) {
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

    private static List<String> prepareDict(String path) {
        List<String> arr = new ArrayList<>();
        In file = new In(path);
        while (!file.isEmpty()) {
            String tmp = file.readLine();
            arr.add(tmp);
        }
        return arr;
    }

    private static List<String> getResult(
            int k, List<List<Character>> arr, List<String> words) {
        List<String> res = new ArrayList<>();
        Trie tire = new Trie();
        for (String word: words) {
            tire.insert(word);
        }

        for (int i = 0; i < arr.size(); i++) {
            for (int j = 0; j < arr.get(0).size(); j++) {
                dfs(arr, i, j, tire.root, new StringBuilder(), res);
            }
        }

        res.sort((a, b) -> b.length() - a.length());
        return res.subList(0, Math.min(k, res.size()));
    }

    private static void dfs(List<List<Character>> arr, int i, int j,
                            TrieNode node, StringBuilder path,
                            List<String> res) {
        if (i < 0 || i >= arr.size() || j < 0 || j >= arr.get(0).size()) {
            return;
        }
        char c = arr.get(i).get(j);
        int index = c - 'a';
        if (node.children[index] == null) {
            return;
        }
        path.append(c);
        TrieNode nextNode = node.children[index];
        arr.get(i).set(j, '#');

        if (nextNode.isEndOfWord) {
            res.add(path.toString());
            nextNode.isEndOfWord = false;
        }

        int[][] direction = {
                {1, 0}, {-1, 0}, {0, 1}, {0, -1},
                {1, 1}, {1, -1}, {-1, 1}, {-1, -1}
        };
        for (int[] dir: direction) {
            int newI = i + dir[0];
            int newJ = j + dir[1];
            dfs(arr, newI, newJ, nextNode, path, res);
        }

        arr.get(i).set(j, c);
        path.setLength(path.length() - 1);
    }

    public static void main(String[] args) {
        String board = "/home/chenglibin/code/study/CS61B/hw6/exampleBoard.txt";
        List<String> res = solve(3, board);
    }
}
