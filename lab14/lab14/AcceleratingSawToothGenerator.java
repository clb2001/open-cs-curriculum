package lab14;

import lab14lib.Generator;

public class AcceleratingSawToothGenerator implements Generator {
    private int frequency;
    private int state;
    private double acc;

    public AcceleratingSawToothGenerator(int frequency, double acc) {
        state = 0;
        this.frequency = frequency;
        this.acc = acc;
    }

    @Override
    public double next() {
        state = state + 1;
        int n = state % frequency;
        if (n == 1 || acc == 1) {
            return (double) 2 / frequency * (state % frequency) - 1;
        } else {
            double k = 2 / (frequency * Math.pow(acc, n));
            double b = - (Math.pow(acc, n + 1) + Math.pow(acc, n) - 2)
                    / (Math.pow(acc, n) * n - 1);
            return k * state + b;
        }
        
    }
}
