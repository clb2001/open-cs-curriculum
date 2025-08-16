import edu.princeton.cs.algs4.MinPQ;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class BinaryTrie implements Serializable {
    private static final long serialVersionUID = 157816335349L;
    private static final int R = 256;
    private Node root;

    public static class Node implements Comparable<Node>, Serializable {
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
        Node node = root;
        BitSequence sequence = new BitSequence();
        int i = 0;
        char c = '\u0000';
        while (node != null) {
            if (node.left != null && node.right != null) {
                sequence = sequence.appended(querySequence.bitAt(i));
            }
            c = node.ch;
            if (querySequence.bitAt(i) == 0) {
                node = node.left;
            } else {
                node = node.right;
            }
            i += 1;
        }
        return new Match(sequence, c);
    }

    public Map<Character, BitSequence> buildLookupTable() {
        Map<Character, BitSequence> table = new HashMap<>();
        String temp = "";
        preOrder(root, table, temp);
        return table;
    }

    private void preOrder(Node node, Map<Character, BitSequence> table,
                          String temp) {
        if (node.right == null && node.left == null) {
            table.put(node.ch, new BitSequence(temp));
        } else {
            if (node.left != null) {
                temp += '0';
                preOrder(node.left, table, temp);
                temp = temp.substring(0, temp.length() - 1);
            }
            if (node.right != null) {
                temp += '1';
                preOrder(node.right, table, temp);
            }
        }
    }
}
