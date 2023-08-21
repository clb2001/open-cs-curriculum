package lab14;

import lab14lib.Generator;

public class SawToothGenerator implements Generator {
    private int frequency;
    private int state;

    public SawToothGenerator(int frequency) {
        state = 0;
        this.frequency = frequency;
    }

    @Override
    public double next() {
        state = state + 1;
        double period = (double) 2 / frequency;
        return period * (state % frequency) - 1;
    }
}
