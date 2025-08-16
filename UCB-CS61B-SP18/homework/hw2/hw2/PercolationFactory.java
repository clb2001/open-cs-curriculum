package hw2;

/**
 * @author chenglibin
 */
public class PercolationFactory {
    public Percolation make(int N) {
        return new Percolation(N);
    }
}
