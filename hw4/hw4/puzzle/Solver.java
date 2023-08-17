package hw4.puzzle;

import java.util.Set;
import java.util.HashSet;
import edu.princeton.cs.algs4.MinPQ;

public class Solver {
    WorldState state;
    MinPQ<String> queue;
    Set<WorldState> solution;
    int minMoves;

    private class Node {
        int
    }

    public Solver(WorldState initial) {
        state = initial;
        queue = new MinPQ<>();
        solution = new HashSet<>();
        minMoves = 0;

        while (initial.)
    }

    public int moves() {
        return minMoves;
    }

    public Iterable<WorldState> solution() {
        return solution;
    }
}
