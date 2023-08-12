package hw2;

import edu.princeton.cs.introcs.StdStats;
import edu.princeton.cs.introcs.StdRandom;

/**
 * @author chenglibin
 */
public class PercolationStats {
    private Percolation p;
    private int size;
    private int experiments;
    private double[] results;
    private double mean;
    private double stddev;

    // perform T independent experiments on an N-by-N grid
    // Monte Carlo simulation
    public PercolationStats(int N, int T, PercolationFactory pf) {
        size = N;
        experiments = T;
        results = new double[experiments];
        for (int i = 0; i < T; i++) {
            results[i] = 0;
        }
        if (N <= 0 || T > N) {
            throw new IllegalArgumentException();
        }

        for (int i = 0; i < T; i++) {
            // randomly process
            p = pf.make(N);
            while (!p.percolates()) {
                int x, y;
                do {
                    x = StdRandom.uniform(N);
                    y = StdRandom.uniform(N);
                } while (p.isOpen(x, y));
                p.open(x, y);
            }
            results[i] = (double) p.numberOfOpenSites() / (N * N);
        }
    }

    // sample mean of percolation threshold
    public double mean() {
        mean = StdStats.mean(results);
        return mean;
    }

    // sample standard deviation of percolation threshold
    public double stddev() {
        stddev =  StdStats.stddev(results);
        return stddev;
    }

    // low endpoint of 95% confidence interval
    public double confidenceLow() {
        return (mean - (1.96 * stddev) / Math.sqrt(experiments));
    }

    // high endpoint of 95% c
    public double confidenceHigh() {
        return (mean + (1.96 * stddev) / Math.sqrt(experiments));
    }
}
