import edu.princeton.cs.algs4.MinPQ;

import java.io.Serializable;
import java.util.Map;

public class BinaryTrie implements Serializable {
    private static final int R = 256;
    private Node root;

    public static class Node implements Comparable<Node> {
        private final char ch;
        private final int freq;
        private final Node left, right;

        Node(char ch, int freq, Node left, Node right) {
            this.ch = ch;
            this.freq = freq;
            this.left = left;
            this.right = right;
        }

        // is the node a leaf node?
        private boolean isLeaf() {
            assert ((left == null) && (right == null)) || ((left != null) && (right != null));
            return (left == null) && (right == null);
        }

        // compare, based on frequency
        public int compareTo(Node that) {
            return this.freq - that.freq;
        }
    }

    public BinaryTrie(Map<Character, Integer> frequencyTable) {
        MinPQ<Node> pq = new MinPQ<>();
        for (Map.Entry<Character, Integer> entry: frequencyTable.entrySet()) {
            char key = entry.getKey();
            int value = entry.getValue();
            pq.insert(new Node(key, value, null, null));
        }
        while (pq.size() > 1) {
            Node left = pq.delMin();
            Node right = pq.delMin();
            Node parent = new Node('\0', left.freq + right.freq, left, right);
            pq.insert(parent);
        }
        root = pq.delMin();
    }

    public Match longestPrefixMatch(BitSequence querySequence) {
        return null;
    }

    public Map<Character, BitSequence> buildLookupTable() {
        return null;
    }
}