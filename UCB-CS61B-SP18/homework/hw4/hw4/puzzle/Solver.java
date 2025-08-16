package hw4.puzzle;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Stack;
import java.util.Comparator;

import edu.princeton.cs.algs4.MinPQ;

public class Solver {
    // how to define a hashmap?
    private Map<WorldState, Integer> cache = new HashMap<>();
    private List<WorldState> solution = new ArrayList<>();

    private class Node {
        private WorldState state;
        private int moves;
        private Node prev;
        public Node(WorldState w, int moves, Node prev) {
            this.state = w;
            this.moves = moves;
            this.prev = prev;
        }
    }

    private class NodeComparator implements Comparator<Node> {
        @Override
        public int compare(Node node1, Node node2) {
            int a = node1.moves + add(node1);
            int b = node2.moves + add(node2);
            return a - b;
        }

        private int add(Node node) {
            if (!cache.containsKey(node.state)) {
                cache.put(node.state, node.state.estimatedDistanceToGoal());
            }
            return cache.get(node.state);
        }
    }

    public Solver(WorldState initial) {
        // should design a sort method
        // how to define the sort method?
        MinPQ<Node> queue = new MinPQ<>(new NodeComparator());

        Node curr = new Node(initial, 0, null);
        queue.insert(curr);
        while (!queue.isEmpty()) {
            curr = queue.delMin();
            if (curr.state.isGoal()) {
                break;
            }
            for (WorldState neighb: curr.state.neighbors()) {
                Node next = new Node(neighb, curr.moves + 1, curr);
                // exclude itself
                if (curr.prev != null && neighb.equals(curr.prev.state)) {
                    continue;
                }
                queue.insert(next);
            }
        }
        Stack<WorldState> stack = new Stack<>();
        for (Node w = curr; w != null; w = w.prev) {
            stack.push(w.state);
        }
        while (!stack.isEmpty()) {
            solution.add(stack.peek());
            stack.pop();
        }
    }

    public int moves() {
        return solution.size() - 1;
    }

    public Iterable<WorldState> solution() {
        return solution;
    }
}
