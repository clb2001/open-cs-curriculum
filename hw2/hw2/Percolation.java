package hw2;

import edu.princeton.cs.algs4.WeightedQuickUnionUF;

/**
 * @author chenglibin
 */
public class Percolation {
    // create N-by-N grid, with all sites initially blocked
    int[] grid;
    int length;
    int size;
    int openSites;
    WeightedQuickUnionUF quickUnion;

    public Percolation(int N) {

        try {
            if (N <= 0) {
                throw new IllegalArgumentException();
            }
            size = N;
            length = N * N;
            grid = new int[length];
            openSites = 0;
            quickUnion = new WeightedQuickUnionUF(length);
            for (int i = 0; i < length; i++) {
                // every grid is set to be blocked
                grid[i] = 0;
            }
        } catch (IllegalArgumentException e){
            System.out.println("Exception!");
        }
    }

    // open the site (row, col) if it is not open already
    public void open(int row, int col) {
        int center = xyTo1D(row, col);
        grid[xyTo1D(row, col)] = 1;
        openSites += 1;
        if (row > 0) {
            int left = xyTo1D(row, col - 1);
            quickUnion.union(left, center);
        }
        if (row < size - 1) {
            int right = xyTo1D(row, col + 1);
            quickUnion.union(right, center);
        }
        if (col > 0) {
            int up = xyTo1D(row - 1, col);
            quickUnion.union(up, center);
        }
        if (col < size - 1) {
            int down = xyTo1D(row + 1, col);
            quickUnion.union(down, center);
        }
    }

    // is the site (row, col) open?
    public boolean isOpen(int row, int col) {
        return grid[xyTo1D(row, col)] == 1;
    }

    // is the site (row, col) full?
    public boolean isFull(int row, int col) {
        int root = quickUnion.find(xyTo1D(row, col));
        return grid[root] == 2 && (root < size);
    }

    // number of open sites
    public int numberOfOpenSites() {
        return openSites;
    }

    // does the system percolate?
    public boolean percolates() {
        for (int i = 0; i < size; i++) {
            if (isFull(size - 1, i)) {
                return true;
            }
        }
        return false;
    }

    // use for unit testing (not required)
    public static void main(String[] args) {

    }

    private int xyTo1D(int r, int c) {
        return r * size + c;
    }
}
