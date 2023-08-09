package hw2;

import edu.princeton.cs.algs4.WeightedQuickUnionUF;

/**
 * @author chenglibin
 */
public class Percolation {
    // create N-by-N grid, with all sites initially blocked
    int[][] grid;
    int size;

    public Percolation(int N) {
        try {
            if (N <= 0) {
                throw new IllegalArgumentException();
            }
            grid = new int[N][N];
            for (int i = 0; i < N; i++) {
                for (int j = 0; j < N; j++) {
                    grid[i][j] = 0;
                }
            }
            size = N;
        } catch (IllegalArgumentException e){
            System.out.println("Exception!");
        }
    }

    // open the site (row, col) if it is not open already
    public void open(int row, int col) {
        grid[row][col] = 1;
    }

    // is the site (row, col) open?
    public boolean isOpen(int row, int col) {
        return grid[row][col] == 1;
    }

    // is the site (row, col) full?
    public boolean isFull(int row, int col) {
        return grid[row][col] == 0;
    }

    // number of open sites
    public int numberOfOpenSites() {
        return 1;
    }

    // does the system percolate?
    public boolean percolates() {
        for (int i = 0; i < size; i++) {
            if (grid[0][i] == 1) {
                return true;
            }
        }
        return false;
    }

    // use for unit testing (not required)
    public static void main(String[] args) {

    }
}
