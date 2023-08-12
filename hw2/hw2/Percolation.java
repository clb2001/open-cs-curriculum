package hw2;

import edu.princeton.cs.algs4.WeightedQuickUnionUF;

/**
 * @author chenglibin
 */
public class Percolation {
    // create N-by-N grid, with all sites initially blocked
    private int[] status;
    private int length;
    private int top;
    private int bottom;
    private int size;
    private int openSites;
    private WeightedQuickUnionUF quickUnion1;
    private WeightedQuickUnionUF quickUnion2;

    public Percolation(int N) {
        try {
            if (N <= 0) {
                throw new IllegalArgumentException();
            }
            size = N;
            length = N * N;

            // 要体会设置两个头节点的好处，除了初始化一次，可以之后的查询可以大大降低时间复杂度
            status = new int[length];
            top = length;
            bottom = length + 1;
            openSites = 0;
            quickUnion1 = new WeightedQuickUnionUF(length + 1);
            quickUnion2 = new WeightedQuickUnionUF(length + 2);
            for (int i = 0; i < length; i++) {
                // every grid is set to be blocked
                status[i] = 0;
            }
            for (int i = 0; i < size; i++) {
                quickUnion1.union(xyTo1D(0, i), top);
                quickUnion2.union(xyTo1D(0, i), top);
                quickUnion2.union(xyTo1D(size - 1, i), bottom);
            }
        } catch (IllegalArgumentException e) {
            System.out.println("Exception!");
        }
    }

    // open the site (row, col) if it is not open already
    public void open(int row, int col) {
        validate(row, col);
        if (isOpen(row, col)) {
            return;
        }
        int center = xyTo1D(row, col);
        status[xyTo1D(row, col)] = 1;
        openSites += 1;
        if (col > 0 && isOpen(row, col - 1)) {
            int left = xyTo1D(row, col - 1);
            quickUnion1.union(left, center);
            quickUnion2.union(left, center);
        }
        if (col < size - 1 && isOpen(row, col + 1)) {
            int right = xyTo1D(row, col + 1);
            quickUnion1.union(right, center);
            quickUnion2.union(right, center);
        }
        if (row > 0 && isOpen(row - 1, col)) {
            int up = xyTo1D(row - 1, col);
            quickUnion1.union(up, center);
            quickUnion2.union(up, center);
        }
        if (row < size - 1 && isOpen(row + 1, col)) {
            int down = xyTo1D(row + 1, col);
            quickUnion1.union(down, center);
            quickUnion2.union(down, center);
        }
    }

    // is the site (row, col) open?
    public boolean isOpen(int row, int col) {
        validate(row, col);
        return status[xyTo1D(row, col)] == 1;
    }

    // is the site (row, col) full?
    public boolean isFull(int row, int col) {
        validate(row, col);
        if (!isOpen(row, col)) {
            return false;
        }
        return quickUnion1.connected(xyTo1D(row, col), top);
    }

    // number of open sites
    public int numberOfOpenSites() {
        return openSites;
    }

    // does the system percolate?
    public boolean percolates() {
        if (size == 1) {
            return true;
        }
        return quickUnion2.connected(top, bottom);
    }

    // use for unit testing (not required)
    public static void main(String[] args) {

    }

    private void validate(int row, int col) {
        if (row < 0 || row >= size || col < 0 || col >= size) {
            throw new IndexOutOfBoundsException("out of boundary!");
        }
    }

    private int xyTo1D(int row, int column) {
        return row * size + column;
    }
}
