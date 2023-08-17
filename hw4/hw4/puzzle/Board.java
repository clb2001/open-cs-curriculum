package hw4.puzzle;

public class Board {
    public Board(int[][] tiles) {

    }

    public int tileAt(int i, int j) {

    }

    public int size() {

    }

    public Iterable<WorldState> neighbors() {

    }

    public int hamming() {

    }

    public int manhattan() {

    }

    public int estimatedDistanceToGoal() {

    }

    public boolean equals(Object y) {

    }

    /** Returns the string representation of the board.
      * Uncomment this method. */
    public String toString() {
        StringBuilder s = new StringBuilder();
        int N = size();
        s.append(N + "\n");
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                s.append(String.format("%2d ", tileAt(i,j)));
            }
            s.append("\n");
        }
        s.append("\n");
        return s.toString();
    }
}
