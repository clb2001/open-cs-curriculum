package lab14;

import lab14lib.Generator;

public class AcceleratingSawToothGenerator implements Generator {
    private int period;
    private int state;
    private double acc;
    private int n;

    public AcceleratingSawToothGenerator(int period, double acc) {
        state = 0;
        n = 0;
        this.period = period;
        this.acc = acc;
    }

    @Override
    public double next() {
        state = state + 1;
        if (acc == 1) {
            return (double) 2 / period * (state % period) - 1;
        } else {
            n = (state >= period * (Math.pow(acc, n + 1) - 1) / (acc - 1)
                    ? n + 1 : n);
            double k = 2 / (period * Math.pow(acc, n));
            double b = - (Math.pow(acc, n + 1) + Math.pow(acc, n) - 2)
                    / (Math.pow(acc, n) * (acc - 1));
            return k * state + b;
        }
    }
}
