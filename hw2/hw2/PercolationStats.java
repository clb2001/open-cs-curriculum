package hw2;

import edu.princeton.cs.introcs.StdStats;
import java.util.Random;

/**
 * @author chenglibin
 */
public class PercolationStats {
    Percolation p;
    int size;
    int experiments;
    double[] results;
    double mean;
    double stddev;

    // perform T independent experiments on an N-by-N grid
    // Monte Carlo simulation
    public PercolationStats(int N, int T, PercolationFactory pf) {
        size = N;
        experiments = T;
        results = new double[experiments];
        for (int i = 0; i < T; i++) {
            results[i] = 0;
        }

        for (int i = 0; i < T; i++) {
            for (int j = 0; j < N * N; j++) {
                // randomly process
                p = pf.make(N);
                int count = 0;
                Random random = new Random();
                while (count < j) {
                    int row = random.nextInt(N);
                    int col = random.nextInt(N);
                    if (!p.isOpen(row, col)) {
                        p.open(row, col);
                        count++;
                    }
                }
                if (p.percolates()) {
                    double prob = (double) j / (N * N);
                    results[i] = prob;
                    break;
                }
            }
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
        return (mean - (1.96 * Math.sqrt(stddev)) / Math.sqrt(experiments));
    }

    // high endpoint of 95% c
    public double confidenceHigh() {
        return (mean + (1.96 * Math.sqrt(stddev)) / Math.sqrt(experiments));
    }
}
